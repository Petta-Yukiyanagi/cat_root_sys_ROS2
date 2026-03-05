#!/usr/bin/env python3
import json
import os
import rclpy
from rclpy.node import Node
# 修正箇所：catui_bridge -> catui_msgs に変更
from catui_msgs.msg import CatUICommand 

class CatUIBridge(Node):
    def __init__(self):
        super().__init__('catui_bridge')

        self.declare_parameter(
            'ipc_root',
            '/opt/catui/CAT-UI-ROS2node/data/ipc'
        )
        self.ipc_root = self.get_parameter(
            'ipc_root'
        ).get_parameter_value().string_value

        os.makedirs(self.ipc_root, exist_ok=True)

        self.sub = self.create_subscription(
            CatUICommand,
            'catui/command',
            self.on_command,
            10
        )

        self.get_logger().info(
            f'CatUIBridge started. ipc_root={self.ipc_root}'
        )

    def on_command(self, msg: CatUICommand):
        # broadcast ディレクトリを使う
        broadcast_dir = os.path.join(self.ipc_root, 'broadcast')
        os.makedirs(broadcast_dir, exist_ok=True)

        tmp = os.path.join(broadcast_dir, 'ui_command.json.tmp')
        dst = os.path.join(broadcast_dir, 'ui_command.json')

        data = {
            'face': int(msg.face_id),
            'text': msg.text,
            'reset_after': int(msg.reset_after)
        }

        # アトミックに書き込むことで CAT-UI 側の読み取りエラーを防止
        with open(tmp, 'w', encoding='utf-8') as f:
            json.dump(data, f, ensure_ascii=False)

        os.replace(tmp, dst)

def main():
    rclpy.init()
    node = CatUIBridge()
    try:
        rclpy.spin(node)
    except KeyboardInterrupt:
        pass
    finally:
        node.destroy_node()
        rclpy.shutdown()

if __name__ == '__main__':
    main()