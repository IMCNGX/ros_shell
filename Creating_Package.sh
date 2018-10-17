#!/bin/bash
echo "Please enter your workspace path:"
read path
echo "Please enter a name for a new package:"
read name
cd $path
source /opt/ros/kinetic/setup.bash
source devel/setup.bash
cd $path/src
catkin_create_pkg $name std_msgs rospy roscpp
echo "I have make a package named $name for you!"
