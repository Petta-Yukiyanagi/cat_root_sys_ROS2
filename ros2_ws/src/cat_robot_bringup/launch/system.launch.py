from launch import LaunchDescription
from launch.actions import IncludeLaunchDescription
from launch.launch_description_sources import PythonLaunchDescriptionSource
from ament_index_python.packages import get_package_share_directory
import os

def generate_launch_description():
    # 自分のパッケージの共有ディレクトリを取得
    pkg_share = get_package_share_directory('cat_robot_bringup')

    # 各子launchファイルのパスを生成
    def get_launch_file(name):
        return IncludeLaunchDescription(
            PythonLaunchDescriptionSource(
                os.path.join(pkg_share, 'launch', name)
            )
        )

    # 各コンポーネントの定義
    ui = get_launch_file('ui_bridge.launch.py')
    roomba = get_launch_file('roomba.launch.py')
    lidar = get_launch_file('lidar.launch.py')
    robot_state = get_launch_file('robot_state.launch.py')
    #slam = get_launch_file('slam.launch.py')

    return LaunchDescription([
        ui,
        roomba,
        lidar,
        robot_state,
        #slam
    ])