#!/usr/bin/env bash
set -eo pipefail

# --- 【ここから】24.04対策・環境設定 ---
export ROS_OS_OVERRIDE=ubuntu:jammy
export ROS_DISTRO=humble
export PYTHONWARNINGS="ignore"
export PIP_BREAK_SYSTEM_PACKAGES=1

echo "================================="
echo " CAT ROBOT SYSTEM INSTALLER"
echo "================================="

VERSION="1.1.0"
echo "CAT ROBOT INSTALLER v$VERSION"

INSTALL_DIR=/opt/cat_robot
REPO_URL="https://github.com/Petta-Yukiyanagi/cat_root_sys_ROS2"

# =========================================================
# detect ubuntu version
# =========================================================

UBUNTU_VER=$(grep VERSION_ID /etc/os-release | cut -d '"' -f2)
echo "[INFO] Ubuntu version: $UBUNTU_VER"

# 事前準備
echo "[INFO] pre-install: updating tools..."
sudo apt update

# =========================================================
# setup time synchronization (chrony)
# =========================================================
echo "[INFO] configuring time synchronization..."
sudo apt update
sudo apt install -y chrony
sudo systemctl enable chrony
sudo systemctl start chrony
# 強制的に即時同期を実行
sudo chronyc makestep

sudo apt install -y \
 git \
 python3-pip \
 python3-colcon-common-extensions \
 python3-rosdep \
 python3-vcstool \
 ros-dev-tools

# rosdep global setup
if [ ! -f /etc/ros/rosdep/sources.list.d/20-default.list ]; then
    sudo rosdep init
fi

rosdep update
# ROS2 Humble セットアップ
ROS_ROOT=""

if [ -f /opt/ros/humble/setup.bash ]; then
    echo "[INFO] ROS2 Humble found (apt)"
    ROS_ROOT="/opt/ros/humble"

elif [ -f "$HOME/ros2_humble/install/setup.bash" ]; then
    echo "[INFO] ROS2 Humble found (source)"
    ROS_ROOT="$HOME/ros2_humble/install"
else
    echo "[INFO] ROS2 Humble not found. Starting Source Build for 24.04..."
    
    mkdir -p ~/ros2_humble/src
    cd ~/ros2_humble || exit 1
    # 前回の権限トラブルをリセット
    sudo chown -R $USER:$USER ~/ros2_humble 2>/dev/null || true

    # ソース取得（未取得の場合のみ）
    mkdir -p src
    if [ -z "$(ls -A src 2>/dev/null)" ]; then
        echo "[INFO] importing ROS2 source..."
        vcs import src < https://raw.githubusercontent.com/ros2/ros2/humble/ros2.repos
    fi
    
 rosdep install --os=ubuntu:jammy --from-paths src --ignore-src -r -y \
      --skip-keys "fastcdr rti-connext-dds-6.0.1 urdfdom_headers" \
      2>&1 | tee ~/ros2_humble/rosdep.log || true
    # スワップ設定
    echo "[INFO] Ensuring 4GB swap..."
    if [ -f /etc/dphys-swapfile ]; then
        sudo sed -i 's/CONF_SWAPSIZE=100/CONF_SWAPSIZE=4096/' /etc/dphys-swapfile
        sudo systemctl restart dphys-swapfile
    fi

    echo "[INFO] Starting build... (24.04 Optimized)"
    # 24.04でコケやすいrviz関連をスキップしつつ、エラーが出ても最後まで強行する設定
    colcon build \
        --symlink-install \
        --cmake-args -DBUILD_TESTING=OFF \
        --parallel-workers 2 \
        --continue-on-error \
        --packages-skip rviz_ogre_vendor rviz_common rviz_default_plugins rviz_rendering rviz2 \
        2>&1 | tee -a ~/ros2_humble/install_final.log \
    || true    
    ROS_ROOT="$HOME/ros2_humble/install"
fi

# 環境反映
source "$ROS_ROOT/setup.bash" || true

# =========================================================
# build Cyclone DDS from source
# =========================================================
echo "[INFO] checking Cyclone DDS..."

# 既にapt等でROS_ROOTが/opt/ros/humbleになっている場合は、ワークスペースを作成
if [ "$ROS_ROOT" = "/opt/ros/humble" ]; then
    DDS_WS="$HOME/ros2_humble"
    mkdir -p "$DDS_WS/src"
else
    DDS_WS="$HOME/ros2_humble"
fi

cd "$DDS_WS" || exit 1

if [ ! -d "src/cyclonedds" ]; then
    echo "[INFO] cloning cyclonedds..."
    git clone https://github.com/eclipse-cyclonedds/cyclonedds.git -b releases/0.10.x src/cyclonedds
fi

if [ ! -d "src/rmw_cyclonedds" ]; then
    echo "[INFO] cloning rmw_cyclonedds..."
    git clone https://github.com/ros2/rmw_cyclonedds.git -b humble src/rmw_cyclonedds
fi

# インストールディレクトリにrmw_cyclonedds_cppがなければビルド
if [ ! -d "install/rmw_cyclonedds_cpp" ]; then
    echo "[INFO] building Cyclone DDS..."
    source "$ROS_ROOT/setup.bash" || true
    colcon build --symlink-install --packages-select cyclonedds rmw_cyclonedds_cpp
fi

# Cyclone DDSを含めた環境を再度読み込み
source "$DDS_WS/install/setup.bash" || true
ROS_ROOT="$DDS_WS/install"

# =========================================================
# install directory
# =========================================================

sudo mkdir -p $INSTALL_DIR
sudo chown $USER:$USER $INSTALL_DIR

cd $INSTALL_DIR

# =========================================================
# clone repository
# =========================================================

if [ ! -d "src" ]; then
    echo "[INFO] cloning repository..."
    git clone $REPO_URL src
else
    echo "[INFO] repository exists, pulling..."
    cd src
    git pull
    cd ..
fi

cd src

# =========================================================
# install packages
# =========================================================

echo "[INFO] installing packages..."

sudo apt update

sudo apt install -y \
  setserial \
  python3-serial \
  openjdk-17-jre \
  wget \
  unzip \
  x11-apps \
  fonts-noto-cjk \
  build-essential \
  cmake \
  python3-colcon-common-extensions \
  python3-rosdep \
  libusb-1.0-0-dev \
  libopencv-dev

# slam_toolbox only available via apt on 22.04
if [ "$UBUNTU_VER" = "22.04" ]; then
    sudo apt install -y ros-humble-slam-toolbox
else
    echo "[INFO] Ubuntu 24.04 detected: slam_toolbox will be built via rosdep"
fi




# =========================================================
# USB / serial stable naming (udev) + permission
# =========================================================

echo "[INFO] configuring serial permissions & stable device names..."

# dialout group (for /dev/tty* access)
sudo usermod -aG dialout "$USER" || true

# (recommended) prevent ModemManager from grabbing USB-serial
sudo systemctl stop ModemManager 2>/dev/null || true
sudo systemctl disable ModemManager 2>/dev/null || true
sudo systemctl mask ModemManager 2>/dev/null || true

# Create udev rule:
# - Make stable symlinks: /dev/roomba and /dev/lidar
# - Set group dialout + mode 0660 (safer than 0666)
# - Tell ModemManager to ignore (extra safety)
sudo tee /etc/udev/rules.d/99-cat-robot.rules >/dev/null <<'EOF'
# Roomba (FT232R) vendor 0403
SUBSYSTEM=="tty", ATTRS{idVendor}=="0403", SYMLINK+="roomba", MODE="0660", GROUP="dialout", ENV{ID_MM_DEVICE_IGNORE}="1"

# LiDAR (CP2102) vendor 10c4
SUBSYSTEM=="tty", ATTRS{idVendor}=="10c4", SYMLINK+="lidar", MODE="0660", GROUP="dialout", ENV{ID_MM_DEVICE_IGNORE}="1"
EOF

# Apply rules now
sudo udevadm control --reload-rules
sudo udevadm trigger --action=add

echo "[INFO] udev rules installed. If devices are plugged in, /dev/roomba and /dev/lidar should appear."

# =========================================================
# build YDLidar SDK
# =========================================================

echo "[INFO] building YDLidar SDK..."

if [ -d "sdk/YDLidar-SDK" ]; then
  cd sdk/YDLidar-SDK || exit 1
else
  echo "[ERROR] YDLidar-SDK directory not found"
  exit 1
fi

mkdir -p build
cd build

cmake ..
make -j$(nproc)

sudo make install
sudo ldconfig

cd $INSTALL_DIR/src

# =========================================================
# build ROS2 workspace
# =========================================================

echo "[INFO] building ros2_ws..."

cd $INSTALL_DIR/src/ros2_ws

source $ROS_ROOT/setup.bash

rosdep install --os=ubuntu:jammy --from-paths src --ignore-src -r -y \
  --skip-keys "fastcdr rti-connext-dds-6.0.1 urdfdom_headers" \
  2>&1 | tee ~/ros2_ws_rosdep.log || true

colcon build \
  --symlink-install \
  --parallel-workers $(nproc) \
  --packages-skip slam_toolbox
if [ -f ~/ros2_humble/install/setup.bash ]; then
    ROS_ROOT="$HOME/ros2_humble/install"
fi

# =========================================================
# Roomba baud fix
# =========================================================

echo "[INFO] applying roomba baud fix..."

BAUD_FILE="$ROS_ROOT/share/create_bringup/config/default.yaml"

if [ -f "$BAUD_FILE" ]; then
    sudo sed -i 's/# baud: 115200/baud: 115200/' "$BAUD_FILE"
    echo "[INFO] Roomba baud fixed"
else
    echo "[WARN] create_bringup config not found, skipping baud fix"
fi

# =========================================================
# CAT UI setup
# =========================================================

echo "[INFO] configuring CAT UI..."

cd $INSTALL_DIR/src

if [ -d "ui/CAT-UI-ROS2node" ]; then
    cd ui/CAT-UI-ROS2node
elif [ -d "ui/catui/CAT-UI-ROS2node" ]; then
    cd ui/catui/CAT-UI-ROS2node
elif [ -d "CAT-UI-ROS2node" ]; then
    cd CAT-UI-ROS2node
else
    echo "[ERROR] CAT-UI-ROS2node not found"
    exit 1
fi

chmod +x CAT-UI

mkdir -p data/ipc
chmod 1777 data/ipc

# =========================================================
# ROS environment (.bashrc)
# =========================================================

echo "[INFO] updating bashrc..."

grep -qxF "source ~/ros2_humble/install/setup.bash" ~/.bashrc || \
echo "source ~/ros2_humble/install/setup.bash" >> ~/.bashrc

grep -qxF "source $INSTALL_DIR/src/ros2_ws/install/setup.bash" ~/.bashrc || \
echo "source $INSTALL_DIR/src/ros2_ws/install/setup.bash" >> ~/.bashrc

# RMWをCyclone DDSに変更
grep -qxF "export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp" ~/.bashrc || \
echo "export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp" >> ~/.bashrc

# =========================================================
# install run script
# =========================================================

echo "[INFO] installing run.sh..."

cp $INSTALL_DIR/src/run.sh $INSTALL_DIR/run.sh
chmod +x $INSTALL_DIR/run.sh

# =========================================================
# desktop launcher
# =========================================================

echo "[INFO] installing desktop launcher..."

DESKTOP_DIR=$(xdg-user-dir DESKTOP)

mkdir -p "$DESKTOP_DIR"
cp $INSTALL_DIR/src/cat-ui-system.desktop "$DESKTOP_DIR/"
chmod +x "$DESKTOP_DIR/cat-ui-system.desktop"

gio set "$DESKTOP_DIR/cat-ui-system.desktop" metadata::trusted true || true

# =========================================================

echo ""
echo "================================="
echo " INSTALL COMPLETE"
echo "================================="
echo ""
echo "Desktop icon:"
echo "  Cat Robot System"
echo ""
echo "Re-login recommended for dialout group."
echo ""
echo "After reboot, double click:"
echo "  Cat Robot System"
echo ""

echo ""
echo "================================="
echo " DEVICE CHECK"
echo "================================="

ls -l /dev/roomba 2>/dev/null || echo "Roomba device not found"
ls -l /dev/lidar 2>/dev/null || echo "LiDAR device not found"

echo ""
echo "If devices are missing:"
echo "  unplug and reconnect USB"
echo "  or reboot the system"

echo ""
echo "================================="
echo " ROS2 CHECK"
echo "================================="

source $ROS_ROOT/setup.bash
ros2 doctor || true

echo "[IMPORTANT] You must log out / log in (or reboot) for dialout group to take effect."