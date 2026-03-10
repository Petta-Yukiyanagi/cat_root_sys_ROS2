from launch import LaunchDescription
from launch_ros.actions import Node
from launch.actions import IncludeLaunchDescription
from launch.launch_description_sources import PythonLaunchDescriptionSource
from ament_index_python.packages import get_package_share_directory
import os

def generate_launch_description():
    pkg_share = get_package_share_directory('ydlidar_ros2_driver')

    lidar_launch = IncludeLaunchDescription(
        PythonLaunchDescriptionSource(
            os.path.join(pkg_share, 'launch', 'ydlidar_launch.py')
        ),
        # T-mini Plus マニュアル推奨パラメータを適用
        launch_arguments={
            'port': '/dev/lidar',
            'baudrate': '230400',       # 
            'lidar_type': '1',          # 1: TYPE_TRIANGLE [cite: 367]
            'device_type': '0',         # 0: YDLIDAR_TYPE_SERIAL [cite: 369]
            'sample_rate': '4',         # [cite: 371]
            'intensity': 'true',
            'auto_reconnect': 'true',
            'frame_id': 'laser_frame'
        }.items()
    )

    laser_tf = Node(
        package='tf2_ros',
        executable='static_transform_publisher',
        arguments=['0', '0', '0.02', '0', '0', '0', 'base_link', 'laser_frame']
    )

    return LaunchDescription([lidar_launch, laser_tf])