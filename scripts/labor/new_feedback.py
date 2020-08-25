#! /usr/bin/env python


import rospy
import decimal
from nav_msgs.msg import Odometry
from tf.transformations import euler_from_quaternion
from geometry_msgs.msg import PoseStamped
from math import atan2
from bilateral_teleop.msg import Goal

x = 0.00
y = 0.00
theta = 0.00
init_x = 0.0
init_y = 0.0
msg = Goal()
goal_x = 0.0
goal_y = 0.0


def odom_callback(msg):
    global x
    global y
    global theta

    x = msg.pose.pose.position.x + init_x
    y = msg.pose.pose.position.y + init_y

    rot_q = msg.pose.pose.orientation
    (roll, pitch, theta) = euler_from_quaternion([rot_q.x, rot_q.y, rot_q.z, rot_q.w])


def goal_callback(msg):
    global goal_x, goal_y
    # Take only x,y,z of goal position
    goal_x = msg.pose.position.x
    goal_y = msg.pose.position.y
    print "goal_x " + str(goal_x)
    print "goal_y" + str(goal_y)

rospy.init_node("move_to_goal")
odom_sub = rospy.Subscriber("h2/odometry/filtered", Odometry, odom_callback)
goal_sub = rospy.Subscriber("move_base_simple/goal", PoseStamped, goal_callback)
pub2 = rospy.Publisher("goal_vector", Goal, queue_size=10)
r = rospy.Rate(10)


while not rospy.is_shutdown():
    inc_x = decimal.Decimal(goal_x - x)
    inc_y = decimal.Decimal(goal_y - y)
    angle_to_goal = atan2(inc_y, inc_x)
    goal_angle = abs(angle_to_goal - theta)
    msg.goal_points = [inc_x, inc_y, goal_angle]
    # pub.publish(speed)
    pub2.publish(msg)
    r.sleep()
