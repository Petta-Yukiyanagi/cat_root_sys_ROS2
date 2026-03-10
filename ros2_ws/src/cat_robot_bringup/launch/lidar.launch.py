from launch import LaunchDescription
from launch_ros.actions import Node

def generate_launch_description():
    # 引用をやめて、Nodeを直接定義して確実にパラメータを渡す
    lidar_node = Node(
        package='ydlidar_ros2_driver',
        executable='ydlidar_ros2_driver_node',
        name='ydlidar_ros2_driver_node',
        output='screen',
        emulate_tty=True,
        parameters=[{
            'port': '/dev/lidar',
            'baudrate': 230400,        # 
            'lidar_type': 1,           # 1: TYPE_TRIANGLE [cite: 367]
            'device_type': 0,          # 0: YDLIDAR_TYPE_SERIAL [cite: 369]
            'sample_rate': 4,          # [cite: 371]
            'auto_reconnect': True,    # [cite: 379]
            'frame_id': 'laser_frame',
            'intensity': True,         # [cite: 387, 388]
            'angle_min': -180.0,       # [cite: 402]
            'angle_max': 180.0,        # [cite: 402]
            'range_min': 0.02,         # [cite: 402]
            'range_max': 12.0          # [cite: 402]
        }]
    )

    laser_tf = Node(
        package='tf2_ros',
        executable='static_transform_publisher',
        arguments=['0', '0', '0.02', '0', '0', '0', 'base_link', 'laser_frame']
    )

    return LaunchDescription([lidar_node, laser_tf])