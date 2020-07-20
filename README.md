# robot_to_robot

# Scenario 1: 
- Standalone husky on one laptop with hector_slam and move_base

<b> Spawn husky </b> 
```
roslaunch bilateral_teleop empty_world.launch
roslaunch bilateral_teleop husky.launch
```
<b> Visualize on rviz </b>
```
roslaunch husky_viz view_robot.launch
```
<b> Hector SLAM </b>
```
roslaunch hector_mapping mapping_default 
```
<b> move_base </b>
```
roslaunch hector_navigation move_base.launch 
```

# Scenario 2: 
- Husky (labor) on the network and SLAM and navigation running on the Master(Laptop)

<b> Spawn husky on Laptop2 </b> 
```
roslaunch bilateral_teleop empty_world.launch
roslaunch bilateral_teleop husky.launch
```
<b> Visualize on rviz on Master </b>
```
roslaunch husky_viz view_robot.launch
```
<b> Hector SLAM on Master </b>
```
roslaunch hector_mapping mapping_default 
```
<b> move_base on Master </b>
```
roslaunch hector_navigation move_base.launch 
```
% if move_base gives error set ``` <arg name="no_static_map" value="true"/> ``` or use ``` roslaunch hector_navigation move_base_mapless_demo.launch  ```

# Scenario 3: 
- Husky1 is the Master. Husky2 is the labor. Husky1 is running without nampespace. Husky2 with namespace. Husky1 is subscribing to the odom and laser data of Husky2 and simulatenously building a map through Hector SLAM and navigation through move_base. 

To set namespace on the labor side, edit ```arg name="robot_namespace" value="h2/" ``` in all three files:
```
husky_gazebo/launch/spawn_husky.launch
husky_description/launch/description.launch
husky_description/urdf/husky.urdf.xacro 
```

For building map on Master, edit ```hector_mapping/launch/mapping_default.launch``` on Master laptop. 
```
<"arg name ="pub_map_odom_transform" value ="false">
<"arg name ="scan_topic" value ="h2/scan">
```
<b> Spawn husky on Laptop1 - Master  with odom_reader_husky node</b> 
```
roslaunch bilateral_teleop empty_world.launch
roslaunch bilateral_teleop husky.launch
rosrun bilateral_teleop odom_reader_husky.py
```
Set tf_transforms from map to odom as we disabled it in mapper. And from master's base_footprint to labor's base_laser
```
rosrun tf static_transform_publisher 0 0 0 0 0 0 map odom 50
rosrun tf static_transform_publisher 0 0 0 0 0 0 base_footprint h2/base_laser 50
```

<b> Spawn husky on Laptop2 - Labor with odom_reader_husky node </b> 
```
roslaunch bilateral_teleop husky.launch
rosrun bilateral_teleop odom_reader_husky.launch
```
<b> Visualize on rviz on Master </b>
```
roslaunch husky_viz view_robot.launch
```
<b> Hector SLAM on Master </b>
```
roslaunch hector_mapping mapping_default 
```
<b> move_base on Master </b>
```
roslaunch hector_navigation move_base.launch 
```

<b> Visualize on rviz on Master </b>
```
roslaunch husky_viz view_robot.launch
```
<b> Hector SLAM on Master </b>
```
roslaunch hector_mapping mapping_default 
```
<b> move_base on Master </b>
```
roslaunch hector_navigation move_base.launch 
```


