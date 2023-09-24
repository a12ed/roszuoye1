#include <ros/ros.h>
#include "topic/time.h"
#include <ros/time.h>

int main(int argc, char **argv)
{
    // ROS节点初始化
    ros::init(argc, argv, "talker");

    // 创建节点句柄
    ros::NodeHandle n;

    // 创建一个Publisher，发布名为/person_info的topic，消息类型为learning_topic::Person，队列长度10
    ros::Publisher time_info_pub = n.advertise<topic::time>("/time_info", 20);

    //创建时间
    ros::Time begin=ros::Time::now();
    
    // 初始化learning_topic::Person类型的消息
    topic::time time_msg;
    time_msg.time = begin.toSec();
    time_msg.sign  = 0;
    // 设置循环的频率
    ros::Rate loop_rate(1);


    while (ros::ok())
    {

        // 发布消息
		time_info_pub.publish(time_msg);
       	ROS_INFO("Publish Time Info: time:%16f  sign:%d  ", 
				  time_msg.time, time_msg.sign);

        // 按照循环频率延时
        ros::Duration du(1);
        loop_rate.sleep();
        du.sleep();
        //读数
        ros::Time begin1=ros::Time::now();
        time_msg.time=begin1.toSec();
        time_msg.sign =time_msg.sign +1;
    }
    return 0;
}
