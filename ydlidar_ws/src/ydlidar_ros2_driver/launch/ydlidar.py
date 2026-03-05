from launch import LaunchDescription
from launch_ros.actions import Node


def generate_launch_description():

    ydlidar_node = Node(
        package='ydlidar_ros2_driver',
        executable='ydlidar_ros2_driver_node',
        name='ydlidar_ros2_driver_node',
        namespace='',
        output='screen',
        parameters=[{
            'port': '/dev/lidar'
        }]
    )

    tf_node = Node(
        package='tf2_ros',
        executable='static_transform_publisher',
        name='static_tf_pub_laser',
        arguments=[
            '0','0','0.02',
            '0','0','0','1',
            'base_link','laser_frame'
        ]
    )

    return LaunchDescription([
        ydlidar_node,
        tf_node
    ])