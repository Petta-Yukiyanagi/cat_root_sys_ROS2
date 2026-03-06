from launch import LaunchDescription
from launch_ros.actions import Node
from ament_index_python.packages import get_package_share_directory
import os

def generate_launch_description():
    pkg_share = get_package_share_directory('cat_robot_bringup')
    
    # YAMLファイルのパスを取得
    slam_config_path = os.path.join(pkg_share, 'config', 'slam_params.yaml')

    slam_node = Node(
        package='slam_toolbox',
        executable='sync_slam_toolbox_node',
        name='slam_toolbox',
        output='screen',
        parameters=[slam_config_path] # 直接ファイルを指定
    )

    return LaunchDescription([slam_node])