#!/usr/bin/env python
import rospy
from sensor_msgs.msg import LaserScan
from geometry_msgs.msg import Twist
from bilateral_teleop.msg import Goal

def goal_callback(msg):
        global goal_angle
        goal_angle = msg.goal_points[2]
        print(goal_angle)

def callback(msg):
        move = Twist()

	for i in [60,120]:
            if min(msg.ranges)> 0.1 and min(msg.ranges)<0.5:
               move.linear.x=0.0
               move.angular.z= goal_angle
               pub1.publish(move)
               

rospy.init_node('force_feedback')
sub=rospy.Subscriber('h2/scan', LaserScan, callback)
sub2= rospy.Subscriber('goal_vector', Goal, goal_callback)
pub1= rospy.Publisher('h2/joy_teleop/cmd_vel',Twist, queue_size=10)

rate=rospy.Rate(10)

while not rospy.is_shutdown():
     	rate.sleep()
