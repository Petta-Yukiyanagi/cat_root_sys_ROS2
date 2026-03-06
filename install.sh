#!/usr/bin/env bash
set -euo pipefail

echo "================================="
echo " CAT ROBOT SYSTEM INSTALLER"
echo "================================="

VERSION="1.0.0"
echo "CAT ROBOT INSTALLER v$VERSION"

INSTALL_DIR=/opt/cat_robot
REPO_URL="https://github.com/Petta-Yukiyanagi/cat_root_sys_ROS2"

# --- 最初の方に追加（cloneより前） ---
echo "[INFO] pre-install: ensure git is installed..."
sudo apt update
sudo apt install -y git

# --- ROS2セットアップとビルド（Ubuntu 24.04対応版） ---

ROS_ROOT=""

if [ -f /opt/ros/humble/setup.bash ]; then
    echo "[INFO] ROS2 Humble found in apt. Using system install."
    ROS_ROOT="/opt/ros/humble"
else
    echo "[INFO] ROS2 Humble not found in apt. Starting Source Build for Ubuntu 24.04..."
    
    # [1] 事前準備
    sudo apt update && sudo apt install -y locales curl gnupg lsb-release software-properties-common
    sudo locale-gen en_US en_US.UTF-8
    export LANG=en_US.UTF-8
    
    # [2] リポジトリ登録（念のため）
    sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
    
    # [3] 依存関係とビルドツールのインストール
    sudo apt update && sudo apt install -y python3-flake8-docstrings python3-pip python3-pytest-cov ros-dev-tools python3-flake8-blind-except python3-flake8-builtins python3-flake8-class-newline python3-flake8-comprehensions python3-flake8-deprecated python3-flake8-import-order python3-flake8-quotes python3-pytest-repeat python3-pytest-rerunfailures
    
    # [4] ソースダウンロード
    mkdir -p ~/ros2_humble/src
    cd ~/ros2_humble
    vcs import --input https://raw.githubusercontent.com/ros2/ros2/humble/ros2.repos src
    
    # [5] 無限ビルド前のHack (重要！)
    # rosdepが24.04で失敗しないようにジャミング(jammy)と誤認させる
    export ROS_OS_OVERRIDE=ubuntu:jammy
    sudo rosdep init 2>/dev/null || true
    rosdep update
    rosdep install --from-paths src --ignore-src -r -y --skip-keys "fastcdr rti-connext-dds-6.0.1 urdfdom_headers"
    
    echo "[INFO] Temporarily increasing swap size to 4GB..."
    sudo sed -i 's/CONF_SWAPSIZE=100/CONF_SWAPSIZE=4096/' /etc/dphys-swapfile && sudo systemctl restart dphys-swapfile || true

    echo "[INFO] Starting build... grab a coffee, this will take time."
    # --parallel-workers 2 を指定して、同時に動くビルド作業を2つに絞ります
    colcon build --symlink-install --cmake-args -DBUILD_TESTING=OFF --parallel-workers 2
    
    ROS_ROOT="$HOME/ros2_humble/install"
fi

# 最後に、以降の処理で $ROS_ROOT を使うように書き換える
source $ROS_ROOT/setup.bash

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
  openjdk-17-jre \
  wget \
  unzip \
  x11-apps \
  fonts-noto-cjk \
  build-essential \
  cmake \
  python3-colcon-common-extensions \
  python3-rosdep \
  ros-humble-slam-toolbox \
  libusb-1.0-0-dev



# =========================================================
# rosdep setup
# =========================================================

echo "[INFO] rosdep setup..."

sudo rosdep init 2>/dev/null || true
rosdep update

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
  cd sdk/YDLidar-SDK
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

rosdep install --from-paths src --ignore-src -r -y

colcon build --symlink-install --parallel-workers $(nproc)

# =========================================================
# Roomba baud fix
# =========================================================

echo "[INFO] applying roomba baud fix..."

sudo sed -i 's/# baud: 115200/baud: 115200/' \
$ROS_ROOT/share/create_bringup/config/default.yaml

# =========================================================
# CAT UI setup
# =========================================================

echo "[INFO] configuring CAT UI..."

cd $INSTALL_DIR/src/ui/CAT-UI-ROS2node

chmod +x CAT-UI

mkdir -p data/ipc
chmod 1777 data/ipc

# =========================================================
# ROS environment (.bashrc)
# =========================================================

echo "[INFO] updating bashrc..."

grep -qxF "source $ROS_ROOT/setup.bash" ~/.bashrc || \
echo "source $ROS_ROOT/setup.bash" >> ~/.bashrc

grep -qxF "source $INSTALL_DIR/src/ros2_ws/install/setup.bash" ~/.bashrc || \
echo "source $INSTALL_DIR/src/ros2_ws/install/setup.bash" >> ~/.bashrc

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

mkdir -p ~/Desktop

cp $INSTALL_DIR/src/cat-ui-system.desktop ~/Desktop/

chmod +x ~/Desktop/cat-ui-system.desktop

gio set ~/Desktop/cat-ui-system.desktop metadata::trusted true || true

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