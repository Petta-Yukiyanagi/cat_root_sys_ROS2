#!/usr/bin/env bash
set -euo pipefail

function pause_exit(){
echo -e "\n=======================================\n 終了しました。Enterで閉じます。\n======================================="
read -r
}
trap pause_exit EXIT

# --------------------------------------------------

# ROS環境

# --------------------------------------------------

source /opt/ros/humble/setup.bash
source /opt/cat_robot/roomba_ws/install/setup.bash
source /opt/cat_robot/ydlidar_ws/install/setup.bash
source /opt/cat_robot/ros2_ws/install/setup.bash

# --------------------------------------------------

# USB検出

# --------------------------------------------------

echo "[INFO] USBデバイス検出"

ROOMBA_TTY=$(ls /dev/serial/by-id/*FT232R* 2>/dev/null | head -n 1 || true)
LIDAR_TTY=$(ls /dev/serial/by-id/*CP2102* 2>/dev/null | head -n 1 || true)

if [ -z "$ROOMBA_TTY" ]; then
echo "[WARN] Roombaが見つかりません"
fi

if [ -z "$LIDAR_TTY" ]; then
echo "[WARN] LiDARが見つかりません"
fi

echo "Roomba: $ROOMBA_TTY"
echo "LiDAR : $LIDAR_TTY"

# --------------------------------------------------

# 権限

# --------------------------------------------------

sudo chmod 666 "$ROOMBA_TTY" "$LIDAR_TTY" 2>/dev/null || true

# --------------------------------------------------

# ROS起動

# --------------------------------------------------

echo "[INFO] cat_robot_bringup 起動"

ros2 launch cat_robot_bringup system.launch.py &
BRINGUP_PID=$!

sleep 2

# --------------------------------------------------

# UI

# --------------------------------------------------

echo "[INFO] CAT-UI 起動"

cd /opt/cat_robot/catui/CAT-UI-ROS2node
exec ./CAT-UI
