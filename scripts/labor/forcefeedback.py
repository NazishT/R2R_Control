#!/usr/bin/env python
import rospy
from sensor_msgs.msg import LaserScan
from geometry_msgs.msg import Twist


def callback(msg):
        move = Twist()

	for i in [60,120]:
            if min(msg.ranges)> 0.1 and min(msg.ranges)<0.5:
               print min(msg.ranges)
               move.linear.x=0.0
               move.angular.z=0.5
               pub1.publish(move)


rospy.init_node('force_feedback')
sub=rospy.Subscriber('h2/scan', LaserScan, callback)
pub1= rospy.Publisher('h2/twist_marker_server/cmd_vel',Twist, queue_size=10)

rate=rospy.Rate(10)

while not rospy.is_shutdown():
     	rate.sleep()
