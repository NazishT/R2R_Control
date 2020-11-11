#!/usr/bin/env python
import rospy
from sensor_msgs.msg import LaserScan
from geometry_msgs.msg import Twist


def callback(msg):
        move = Twist()
        #print msg.ranges[288:431]
        #move.linear.x=0.5
        if min(msg.ranges[300:420])> 0.1 and min(msg.ranges[300:420])<1:
               print min(msg.ranges[300:420])
               move.linear.x=0.0
               move.angular.z=0.6
               pub1.publish(move)


rospy.init_node('force_feedback')
sub=rospy.Subscriber('labor/scan', LaserScan, callback)
pub1= rospy.Publisher('labor/twist_marker_server/cmd_vel',Twist, queue_size=10)

rate=rospy.Rate(10)

while not rospy.is_shutdown():
     	rate.sleep()
