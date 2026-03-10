#!/usr/bin/env bash
set -eo pipefail

ROS_ROOT="/home/user/ros2_humble/install"
INSTALL_DIR="/opt/cat_robot"

function pause_exit(){
  echo -e "\n=======================================\n 終了しました。Enterで閉じます。\n======================================="
  # バックグラウンドで動いているROSを確実に止める
  kill $(jobs -p) 2>/dev/null || true
  read -r
}
trap pause_exit EXIT

# --------------------------------------------------
# ROS環境
# --------------------------------------------------
source $ROS_ROOT/setup.bash
source $INSTALL_DIR/src/ros2_ws/install/setup.bash

# --------------------------------------------------
# デバイス接続確認
# --------------------------------------------------
echo "[INFO] デバイス接続確認"

# udevで設定したシンボリックリンクがあるかチェック
if [ ! -e /dev/roomba ]; then
  echo "[WARN] Roomba (/dev/roomba) が見つかりません。USBを確認してください。"
fi

if [ ! -e /dev/lidar ]; then
  echo "[WARN] LiDAR (/dev/lidar) が見つかりません。USBを確認してください。"
fi

# --------------------------------------------------
# ROS起動
# --------------------------------------------------
echo "[INFO] cat_robot_bringup 起動"

# ログが混ざらないよう、少し出力を抑えるかスクリーンに流す
ros2 launch cat_robot_bringup system.launch.py &
ROS_PID=$!

# ROSのノードが立ち上がるまで少し待機
sleep 3

# --------------------------------------------------
# UI起動
# --------------------------------------------------
echo "[INFO] CAT-UI 起動"

<<<<<<< HEAD
cd $INSTALL_DIR/src/ui/CAT-UI-ROS2node
=======
cd $INSTALL_DIR/src/ui/catui/CAT-UI-ROS2node
>>>>>>> ubuntu24.04

# UIをメインプロセスとして実行
if [ -f "./CAT-UI" ]; then
  ./CAT-UI
else
  echo "[ERROR] CAT-UI 実行ファイルが見つかりません。"
  exit 1
fi