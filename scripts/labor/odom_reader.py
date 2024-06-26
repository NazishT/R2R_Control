#!/usr/bin/env python
import rospy
from geometry_msgs.msg import Twist
from nav_msgs.msg import Odometry
v_x = 0
w = 0

def odom_callback(msg):

 
    vel_msg = Twist()

    global v_x, w

    v_x=msg.twist.twist.linear.x
    w = msg.twist.twist.angular.z


    vel_msg.linear.x = v_x 
    vel_msg.angular.z = w
    pub.publish(vel_msg)

    print "------------------------------------------------"
    print "velocity linear x = " + str(v_x)
    print "velocity angular z = " + str (w)
 

if __name__=='__main__':
     rospy.init_node('odom_reader', anonymous=True)     
     sub = rospy.Subscriber('odometry/filtered', Odometry, odom_callback) 
     #pub = rospy.Publisher('robot2/mobile_base/commands/velocity', Twist, queue_size=100)
     pub = rospy.Publisher('/h2/cmd_vel', Twist, queue_size=10)
     rate = rospy.Rate(10)
     while not rospy.is_shutdown():
     	rate.sleep()
