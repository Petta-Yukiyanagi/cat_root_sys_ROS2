#!/usr/bin/env bash
set -e

echo "================================="
echo " CAT ROBOT SYSTEM INSTALLER"
echo "================================="

INSTALL_DIR=/opt/cat_robot
REPO_URL="https://github.com/Petta-Yukiyanagi/cat_root_sys_ROS2"

# =========================================================

# install directory

# =========================================================

sudo mkdir -p $INSTALL_DIR
sudo chown $USER:$USER $INSTALL_DIR

cd $INSTALL_DIR

# =========================================================

# GitHub clone

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

# packages

# =========================================================

echo "[INFO] installing packages..."

sudo apt update

sudo apt install -y 
openjdk-17-jre 
git 
wget 
unzip 
x11-apps 
fonts-noto-cjk 
build-essential 
cmake 
python3-colcon-common-extensions 
python3-rosdep 
ros-humble-navigation2 
ros-humble-nav2-bringup

# =========================================================

# rosdep

# =========================================================

echo "[INFO] rosdep setup..."

sudo rosdep init 2>/dev/null || true
rosdep update

# =========================================================

# USB rule (Roomba / LiDAR stability)

# =========================================================

echo "[INFO] installing udev rules..."

sudo tee /etc/udev/rules.d/99-cat-robot.rules <<EOF
SUBSYSTEM=="tty", ATTRS{idVendor}=="0403", MODE="0666"
SUBSYSTEM=="tty", ATTRS{idVendor}=="10c4", MODE="0666"
EOF

sudo udevadm control --reload-rules
sudo udevadm trigger

# =========================================================

# YDLidar SDK

# =========================================================

echo "[INFO] building YDLidar SDK..."

cd YDLidar-SDK

mkdir -p build
cd build

cmake ..
make -j$(nproc)

sudo make install
sudo ldconfig

cd $INSTALL_DIR/src

# =========================================================

# Roomba workspace

# =========================================================

echo "[INFO] building roomba_ws..."

cd $INSTALL_DIR/src/roomba_ws

source /opt/ros/humble/setup.bash

rosdep install --from-paths src --ignore-src -r -y
colcon build --symlink-install --parallel-workers $(nproc)

# =========================================================

# YDLidar workspace

# =========================================================

echo "[INFO] building ydlidar_ws..."

cd $INSTALL_DIR/src/ydlidar_ws

source /opt/ros/humble/setup.bash

rosdep install --from-paths src --ignore-src -r -y
colcon build --symlink-install --parallel-workers $(nproc)

# =========================================================

# ros2_ws

# =========================================================

echo "[INFO] building ros2_ws..."

cd $INSTALL_DIR/src/ros2_ws

source /opt/ros/humble/setup.bash
source $INSTALL_DIR/src/roomba_ws/install/setup.bash
source $INSTALL_DIR/src/ydlidar_ws/install/setup.bash

rosdep install --from-paths src --ignore-src -r -y
colcon build --symlink-install --parallel-workers $(nproc)

# =========================================================

# Roomba baud fix

# =========================================================

echo "[INFO] applying roomba baud fix..."

sudo sed -i 's/# baud: 115200/baud: 115200/' 
/opt/ros/humble/share/create_bringup/config/default.yaml

# =========================================================

# CAT UI

# =========================================================

echo "[INFO] configuring CAT UI..."

cd $INSTALL_DIR/src/catui/CAT-UI-ROS2node

chmod +x CAT-UI

mkdir -p data/ipc
chmod 1777 data/ipc

# =========================================================

# ROS environment (.bashrc)

# =========================================================

echo "[INFO] updating bashrc..."

grep -qxF "source /opt/ros/humble/setup.bash" ~/.bashrc || 
echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc

grep -qxF "source /opt/cat_robot/src/roomba_ws/install/setup.bash" ~/.bashrc || 
echo "source /opt/cat_robot/src/roomba_ws/install/setup.bash" >> ~/.bashrc

grep -qxF "source /opt/cat_robot/src/ydlidar_ws/install/setup.bash" ~/.bashrc || 
echo "source /opt/cat_robot/src/ydlidar_ws/install/setup.bash" >> ~/.bashrc

grep -qxF "source /opt/cat_robot/src/ros2_ws/install/setup.bash" ~/.bashrc || 
echo "source /opt/cat_robot/src/ros2_ws/install/setup.bash" >> ~/.bashrc

# =========================================================

# run.sh install

# =========================================================

echo "[INFO] installing run.sh..."

cp $INSTALL_DIR/src/run.sh $INSTALL_DIR/run.sh
chmod +x $INSTALL_DIR/run.sh

# =========================================================

# desktop install

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
echo "Double click to start."
echo ""
