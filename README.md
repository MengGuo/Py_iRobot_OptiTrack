Py_iRobot_OptiTrack
========

Python Interface for Controlling iRobots with OptiTrack

-----
Description
-----
this package contains the Python interface used at the RAMA lab of [Prof. Zavlanos](http://people.duke.edu/~mz61/), Duke University. The hardware structure consists of
* one Windows PC (W), which connects to all OptiTrack cameras and runs program Motive to calibrate and retrieve data from OptiTrack.

* one Ubuntu machine (U), which runs ROS and does the algorithmic computation to compute the control signals for each iRobot.

* several iRobots (I), which runs iRobot driver locally, receives control commands from (U) and sends sensory data back to (U).

-----
Features
-----
* Retrieve multiple rigid-body data.
* Plot real-time positions of all rigid bodies.
* Can be easily extended to more complicate motion and task planning scenarios.

Multi-robot layout         |  Visualization Panel
:-------------------------:|:-------------------------:
![](https://github.com/MengGuo/Py_iRobot_OptiTrack/blob/master/figures/layout.jpg)  |  ![](https://github.com/MengGuo/Py_iRobot_OptiTrack/blob/master/figures/plot.png)


-----
Content
-----
* [irobot_create_2_1], which contains iRobot drivers, can be directly loaded to (I).

  Modified based on [irobot_create_2_1 from Brown University](http://wiki.ros.org/irobot_create_2_1)
  
* [ros_vrpn_client], which is the vrpn client that listens to Motive at (W) that broadcasts rigid body positions over vrpn. It can be directly loaded into the catkin workspace of (U). It requires the installation of vrpn (using "install_vrpn.sh" inside).

  Modified based on [ros_vrpn_client from GaTech](https://github.com/gt-ros-pkg/hrl/tree/master/ros_vrpn_client)
  
* [optitrack], which retrieves rigid-body positions using [ros_vrpn_client], and transforms quaternions to Euler angles for easy usage later. It can be directly loaded into the catkin workspace of (U).

  Modified based on [optitrack from GaTech](https://github.com/gritslab/grits-ros-pkg/tree/master/optitrack)
 
* [mdp_tg], which contains your control algorithms. It can be directly loaded into the catkin workspace of (U).

----
To Run
----
* Define the rigid bodies in Motive of (W), with unique names.

* Since we are running ROS across multiple machines, follow [this tutorial](http://wiki.ros.org/ROS/Tutorials/MultipleMachines). We recommend running ROS core at (U).

* In [optitrack/optitrack.launch], specify the name of the rigid bodies and the chosen unique *numeric_id* for EACH rigid body you want to track. Then  ```roslaunch optitrack.launch``` at (U). 

* SSH into the compute of (I), make sure the package [irobot_create_2_1] is compiled at (I) using ```catkin_make```. Then ```roslaunch irobot.launch robotname:='Brain2'```, where *'Brain2'* is the name of the iRobot (which can be different from the rigid-body name).

  Test by trying to control the iRobot manually at (U), e.g., ```rostopic pub /Brain2/cmd_vel geometry_msgs/Twist -r 1 -- '[2.0, 0.0, 0.0]' '[0.0, 0.0, -1.8]'```

* In [mdp_tg/src/simple_irobot_control_optitrack.py], specify the sequence of *RO_ID* and *RO_NAME* according to the *numeric_id* and *robotname* you have specified.

  The control algorithm now is simply "rotate-forward-rotate", which can be changed to your favoriate. Also change the sequence of goal regions as you like.
  
  Then run with ```python simple_irobot_control_optitrack.py```

* For other python files in [mdp_tg], it serves as an example of the structure when you have more complicate control algorithm.

  In this case, an offline discrete plan is loaded and the control action of iRobot is chosen based on the plan.

  * [read_optitrack.py] reads a particular irobot position and transform to required format. 

  * [plan_execution.py] decides the next action to perform, according to the offline plan. 

  * [action_execution.py] executes the chosen action.

  * [plot_workspace.py] visualizes the workspace, robot motion and the plan execution in real-time.

![Experiment snapshot](https://github.com/MengGuo/Py_iRobot_OptiTrack/blob/master/figures/mdp_tg.png)
----
Trouble Shooting
----
* When installing vrpn, if errors about "Could NOT find Bullet...." show up, try ```rosdep install --from-paths ~/catkin_ws --ignore-src --rosdistro=indigo```

* Remember to change the *vrpn_server_ip* in [optitrack/optitrack.launch].


* Don't forget to export *ROS_IP* at ALL machines! check [this tutorial](http://answers.ros.org/question/163556/how-to-solve-couldnt-find-an-af_inet-address-for-problem/)


* Should hear a melody from iRobot after you successfully launched *irobot.launch*.

----
Experiment videos
----
Some experiment videos can be found [Video1](https://vimeo.com/180983006), [Video2](https://vimeo.com/180985419), [Video3](https://vimeo.com/180987471).



