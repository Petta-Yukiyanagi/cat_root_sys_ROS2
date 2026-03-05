from launch import LaunchDescription
from launch.actions import DeclareLaunchArgument, TimerAction # TimerAction を追加
from launch.conditions import IfCondition
from launch.substitutions import LaunchConfiguration
from launch_ros.actions import Node
from launch.actions import IncludeLaunchDescription
from launch.launch_description_sources import PythonLaunchDescriptionSource
from ament_index_python.packages import get_package_share_directory
import os

def generate_launch_description():

    # Launch configurations
    use_ui = LaunchConfiguration('use_ui')
    use_roomba = LaunchConfiguration('use_roomba')
    use_lidar = LaunchConfiguration('use_lidar')
    use_localization = LaunchConfiguration('use_localization')
    use_nav2_controller = LaunchConfiguration('use_nav2_controller')
    nav2_params = LaunchConfiguration('nav2_params')

    # 1. Roomba Driver Node (先に起動)
    roomba_node = Node(
        package='create_driver',
        executable='create_driver',
        name='roomba_driver',
        output='screen',
        condition=IfCondition(use_roomba),
        parameters=[{
            'port': '/dev/roomba',
            'baud': 115200
        }]
    )

    # 2. LiDAR Launch (公式launch使用)
    lidar_launch = IncludeLaunchDescription(
        PythonLaunchDescriptionSource(
            os.path.join(
                get_package_share_directory('ydlidar_ros2_driver'),
                'launch',
                'ydlidar_launch.py'
            )
        ),
        condition=IfCondition(use_lidar)
    )

    # LiDAR の起動を 5.0秒 遅らせる (電力ピークの分散)
    delayed_lidar_node = TimerAction(
        period=5.0,
        actions=[lidar_launch]
    )

    # TF: base_link → laser_frame
    delayed_laser_tf = TimerAction(
        period=5.2,
        actions=[
            Node(
                package='tf2_ros',
                executable='static_transform_publisher',
                arguments=['0', '0', '0.02', '0', '0', '0', 'base_link', 'laser_frame'],
                condition=IfCondition(use_lidar)
            )
        ]
    )

    return LaunchDescription([
        # Arguments
        DeclareLaunchArgument('use_ui', default_value='true'),
        DeclareLaunchArgument('use_roomba', default_value='true'),
        DeclareLaunchArgument('use_lidar', default_value='true'),
        DeclareLaunchArgument('use_localization', default_value='true'),
        DeclareLaunchArgument('use_nav2_controller', default_value='true'),
        DeclareLaunchArgument(
            'nav2_params',
            default_value='/opt/ros2_ws/install/cat_robot_bringup/share/cat_robot_bringup/config/nav2_controller_only.yaml',
        ),

        # Nodes
         TimerAction(
            period=0.2,
            actions=[
                Node(
                    package='catui_bridge',
                    executable='catui_bridge',
                    name='catui_bridge',
                    output='screen',
                    condition=IfCondition(use_ui),
                    parameters=[{'ipc_root': '/opt/catui/CAT-UI-ROS2node/data/ipc'}]
                )
            ]
        ),

        TimerAction(
            period=0.5,
            actions=[roomba_node]
        ),
        delayed_lidar_node,
        delayed_laser_tf,

        TimerAction(
            period=6.0,
            actions=[
                Node(
                    package='slam_toolbox',
                    executable='sync_slam_toolbox_node',
                    name='slam_toolbox',
                    output='screen',
                    condition=IfCondition(use_localization),
                    parameters=[{'use_sim_time': False}]
                )
            ]
        ),

        TimerAction(
            period=8.0,
            actions=[
                IncludeLaunchDescription(
                    PythonLaunchDescriptionSource(
                        os.path.join(get_package_share_directory('nav2_bringup'), 'launch', 'navigation_launch.py')
                    ),
                    condition=IfCondition(use_nav2_controller),
                    launch_arguments={
                        'use_sim_time': 'false',
                        'autostart': 'true',
                        'params_file': nav2_params,
                    }.items()
                )
            ]
        ),
    ])