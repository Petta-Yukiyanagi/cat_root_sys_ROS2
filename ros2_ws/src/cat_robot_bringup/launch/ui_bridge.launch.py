from launch import LaunchDescription
from launch_ros.actions import Node

def generate_launch_description():

    bridge = Node(
        package='catui_bridge',
        executable='catui_bridge',
        name='catui_bridge',
        output='screen',
        parameters=[{
            'ipc_root': '/opt/cat_robot/src/ui/catui/CAT-UI-ROS2node/data/ipc'
        }]
    )

    return LaunchDescription([
        bridge
    ])
