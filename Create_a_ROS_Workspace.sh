#!/bin/bash
echo "Please input your path:"
read path
echo "Please enter a name for a new workspace:"
read name
mkdir -p /$path/$name/src
cd /$path/$name/
source /opt/ros/<distro>/setup.bash
source devel/setup.bash
catkin_make
echo "I have make a workspace named $name for you!"
echo "It's under the path you define."

