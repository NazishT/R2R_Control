for example for case 1: 

 # To launch all files for case1 
`roslaunch bilateral_teleop case1.launch`

# Publishing goal 
`rostopic pub /move_base_simple/goal geometry_msgs/PoseStamped Tab Tab Tab` 
use frame: 'map' 
always set the orientation w as 1.0

# setting up network_analysis files
`rosrun network_analysis link_utilization.py'
both files should be on master
`rosrun network_analysis network_delay.cpp`
on labor:
`rosrun network_analysis pingactionserver.cpp`

# recording rosbags
`rosbag record -O subset1.bag /odometry/filtered /husky_velocity_controller/cmd_vel /h2/odometry/filtered /h2/husky_velocity_controller/cmd_vel /network_analysis/link_utilization /network_analysis/network_delay`

# converting rosbags to .csv files one topic at a time
`rostopic echo -b subset1.bah -p /odometry/filtered > odom1.csv` 

