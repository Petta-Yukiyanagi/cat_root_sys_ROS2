from setuptools import find_packages, setup
import os
from glob import glob

package_name = 'cat_robot_bringup'

setup(
    name=package_name,
    version='0.0.0',
    packages=find_packages(exclude=['test']),
    data_files=[
        ('share/ament_index/resource_index/packages',
            ['resource/' + package_name]),
        ('share/' + package_name, ['package.xml']),

        # 🔥 これを追加
        (os.path.join('share', package_name, 'launch'),
            glob('launch/*.py')),

        (os.path.join('share', package_name, 'config'),
            glob('config/*.yaml')),
    ],
    install_requires=['setuptools'],
    zip_safe=True,
    maintainer='root',
    maintainer_email='tomoharusak@gmail.com',
    description='Cat Robot bringup package',
    license='Apache-2.0',
    tests_require=['pytest'],
    entry_points={
        'console_scripts': [],
    },
)