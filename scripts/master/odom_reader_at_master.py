#!/usr/bin/env python


import rospy
from nav_msgs.msg import Odometry
from geometry_msgs.msg import Twist

v_x = 0
w= 0

def callback(msg):
 	
        vel_msg = Twist()
        global v_x, w
       
        v_x = msg.linear.x
        w = msg.angular.z


        vel_msg.linear.x = v_x
        vel_msg.angular.z = w
        pub.publish(vel_msg)

        print "Taking over teleop control at master ... "
        #print "velocity linear x=" +str(v_x)
        #print "velocity angular z=" +str(w)


if __name__=='__main__':
        rospy.init_node('odom_reader_at_master', anonymous=True)
        sub = rospy.Subscriber('h2/twist_marker_server/cmd_vel', Twist, callback)
        pub = rospy.Publisher('/twist_marker_server/cmd_vel', Twist, queue_size=10)
        rate=rospy.Rate(10)
       

        while not rospy.is_shutdown():
           rate.sleep()
