#!/bin/bash
echo "Please enter your workspace path:"
read path
source /opt/ros/kinetic/setup.bash
cd $path
source devel/setup.bash
cd $path/src
echo "Please enter your package name:"
read package_name
cd $path/src/$package_name
mkdir msg
echo "Please enter your message name:"
read message_name
cd $path/src/$package_name/msg
touch $message_name.msg
echo "Please enter your message number:"
read number
for((i=1;i<=number;i++))
do 
echo "Please enter your message:"
read message 
echo $message >>$message_name.msg
done
cd ../src
echo "Please enter your cpp name:"
read name
touch $name.cpp
echo -e "#include \"ros/ros.h\"\n
#include \"$package_name/$message_name.h\"\n 
int main(int argc, char **argv)\n
{\n
	/***Please define your variables.***/

	

	/*****************End**************/
	ros::init(argc, argv, "$name");\n
	ros::NodeHandle n;\n
	ros::Publisher publisher_pub = n.advertise<$package_name::$message_name>("$message_name", 1000);\n
	ros::Rate loop_rate(10);\n
	while (ros::ok())\n
	{\n
	/***Please write to your program..***/



	
	/*****************End**************/
	$package_name::$message_name msg;\n
	publisher_pub.publish(msg);\n
	ros::spinOnce();\n
	loop_rate.sleep();\n
	}\n
	return 0;\n
} ">> $name.cpp




                                      
