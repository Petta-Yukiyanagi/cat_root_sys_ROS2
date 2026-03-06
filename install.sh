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

# --- ROS2チェック（rosdepやbuildの前でOK） ---
if [ ! -f /opt/ros/humble/setup.bash ]; then
  echo "[ERROR] ROS2 Humble not found: /opt/ros/humble/setup.bash"
  echo "Install ROS2 Humble first, then re-run this installer."
  exit 1
fi

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

source /opt/ros/humble/setup.bash

rosdep install --from-paths src --ignore-src -r -y

colcon build --symlink-install --parallel-workers $(nproc)

# =========================================================
# Roomba baud fix
# =========================================================

echo "[INFO] applying roomba baud fix..."

sudo sed -i 's/# baud: 115200/baud: 115200/' \
/opt/ros/humble/share/create_bringup/config/default.yaml

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

grep -qxF "source /opt/ros/humble/setup.bash" ~/.bashrc || \
echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc

grep -qxF "source /opt/cat_robot/src/ros2_ws/install/setup.bash" ~/.bashrc || \
echo "source /opt/cat_robot/src/ros2_ws/install/setup.bash" >> ~/.bashrc

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

source /opt/ros/humble/setup.bash
ros2 doctor || true

echo "[IMPORTANT] You must log out / log in (or reboot) for dialout group to take effect."