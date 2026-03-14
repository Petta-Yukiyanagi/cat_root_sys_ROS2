from setuptools import find_packages
from setuptools import setup

setup(
    name='catui_msgs',
    version='0.0.1',
    packages=find_packages(
        include=('catui_msgs', 'catui_msgs.*')),
)
