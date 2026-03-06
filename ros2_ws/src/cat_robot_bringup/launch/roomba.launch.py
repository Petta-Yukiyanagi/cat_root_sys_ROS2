from launch import LaunchDescription
from launch_ros.actions import Node

def generate_launch_description():

    roomba_node = Node(
        package='create_driver',
        executable='create_driver',
        name='roomba_driver',
        output='screen',
        parameters=[{
            'port': '/dev/roomba',
            'baud': 115200
        }]
    )

    return LaunchDescription([
        roomba_node
    ])