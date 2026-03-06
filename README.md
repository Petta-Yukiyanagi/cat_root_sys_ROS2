# Cat Robot ROS2 System

Roomba + YDLidar + ROS2 + Java UI による猫型ロボット制御システム。

## ⚙️ 動作環境 (Prerequisites)

本システムは以下の環境で動作します。

### OS
- Ubuntu 22.04 LTS
- Ubuntu 24.04 LTS

### ROS
- ROS2 Humble

### ハードウェア
- iRobot Roomba (Create2互換)
- YDLidar (CP2102 USB-Serial)
- USB接続可能なPCまたはRaspberry Pi

### 必須ソフトウェア
以下は `install.sh` が自動でインストールします。

- git
- colcon
- rosdep
- Java Runtime (OpenJDK17)
- YDLidar SDK
## 🌟 特徴
- **爆速セットアップ**: 依存関係、udevルール、SDKビルドをすべて自動化するインストーラーを同梱。
- **安定したデバイス認識**: udevルールにより、USBの抜き差しでシリアルポートが入れ替わる問題を解消。
- **クリーンな構造**: 機能を4つのLaunchファイルに分割し、メンテナンス性を向上。
- **専用UI**: Javaベースの直感的なUIで、ROS2ノードとIPC通信を行い操作可能。

## 🛠 システム構成
- **ベース**: iRobot Roomba (Create2準拠)
- **センサー**: YDLidar (CP2102 USB-Serial)
- **OS**: Ubuntu 24.04 LTS
- **Middleware**: ROS2 Humble
- **主な使用パッケージ**: slam_toolbox, create_driver, ydlidar_ros2_driver

## 🚀 インストール方法
まず、ROS2 Humbleがインストールされていることを確認してください。

```bash
git clone https://github.com/Petta-Yukiyanagi/cat_root_sys_ROS2.git
cd cat_root_sys_ROS2
chmod +x install.sh
./install.sh
```
※インストール後、dialoutグループを反映させるために再起動または再ログインが必要です。

## 🎮 使い方
デスクトップに作成された「Cat Robot System」アイコンをダブルクリックするか、以下のコマンドを実行します。

```bash
/opt/cat_robot/run.sh
```
## 📂 ディレクトリ構造

```
.
├── install.sh              # システム一括インストーラー
├── run.sh                  # システム起動用スクリプト
├── cat-ui-system.desktop   # デスクトップショートカット
├── README.md               # プロジェクト説明書
├── .gitignore              # Git管理除外設定
├── icon/                   # デスクトップアイコン用画像
├── ros2_ws/src/            # ROS2 ワークスペース
│   ├── cat_robot_bringup/  # メイン起動・設定パッケージ
│   │   ├── config/         # SLAM等のパラメータ (slam_params.yaml)
│   │   └── launch/         # 分割されたLaunchファイル群
│   ├── catui_bridge/       # UIとROS2の仲介ノード
│   ├── catui_msgs/         # カスタムメッセージ定義
│   ├── create_robot/       # Roomba用ドライバ
│   └── ydlidar_ros2_driver/# LiDAR用ドライバ
├── sdk/                    # 外部デバイス用SDK
│   └── YDLidar-SDK/        # YDLidar C++ SDK
└── ui/                     # 操作用GUIアプリ
    └── catui/CAT-UI-ROS2node/ # Java GUI 本体
```
## システム図

![システム図](./icon/catrobot_Ubuntsu24.04ver.png)
---

