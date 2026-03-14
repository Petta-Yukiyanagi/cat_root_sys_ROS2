import os
from ament_index_python.packages import get_package_share_directory
from launch import LaunchDescription
from launch_ros.actions import Node

def generate_launch_description():
    # パッケージの共有ディレクトリを取得
    pkg_share = get_package_share_directory('cat_robot_bringup')
    
    # さきほど作成・修正したURDFファイルのパスを指定
    urdf_file = os.path.join(pkg_share, 'urdf', 'robot.urdf')

    # URDFファイルの中身をテキストとして読み込む
    with open(urdf_file, 'r') as infp:
        robot_desc = infp.read()

    # robot_state_publisherノードを定義
    rsp_node = Node(
        package='robot_state_publisher',
        executable='robot_state_publisher',
        output='screen',
        parameters=[{'robot_description': robot_desc}]
    )

    return LaunchDescription([
        rsp_node
    ])