#include <ros/ros.h>
#include "topic/time.h"


void getDate(long long time,int Time[]) 
{
    int seconds = time / 1000000000 + 8 * 3600;// time zone +8
    int days = seconds / 86400;
    int year = 1970 + (int) (days / 1461) * 4; // recycled in 4 years = 1461 days
    int month = 0;
    int day = days % 1461;
    day = day > 730 ? day - 1 : day;
    year += (int) (day / 365);
    day = day % 365;
    int monthday[]{0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334, 365};
    for (int i = 0; i < 13; i++) {
        if (day < monthday[i + 1]) {
            month = i + 1;
            day = day - monthday[i] + 1;
            break;
        }
    }
    int sec = seconds % 86400;
    int hour = (int) (sec / 3600);
    int minute = (int) (sec % 3600 / 60);
    int second = sec % 60;
    int nanoseconds = time % 1000000000;
    int millisecond = nanoseconds / 1000;
    Time[0]=year;
    Time[1]=month;
    Time[2]=day;
    Time[3]=hour;
    Time[4]=minute;
    Time[5]=second;
}

// 接收到订阅的消息后，会进入消息回调函数
void timeInfoCallback(const topic::time::ConstPtr& msg)
{
    // 将接收到的消息打印出来
    ROS_INFO("Subcribe time Info: time:%16f  sign:%d  ", 
			 msg->time, msg->sign);
}

int main(int argc, char **argv)
{
    // 初始化ROS节点
    ros::init(argc, argv, "listener");

    // 创建节点句柄
    ros::NodeHandle n;

    // 创建一个Subscriber，订阅名为/time_info的topic，注册回调函数personInfoCallback
    ros::Subscriber time_info_sub = n.subscribe("/time_info", 20, timeInfoCallback);

    // 循环等待回调函数
    ros::spin();

    return 0;
}
