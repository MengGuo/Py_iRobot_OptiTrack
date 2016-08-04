#!/usr/bin/env python
import roslib
import numpy
import Queue
roslib.load_manifest('mdp_tg')
import rospy
from mdp_tg.msg import raw_pose
from math import sqrt, cos, sin, radians
import numpy

import sys

import optitrack_driver.msg


def OptiTrackCallback(optidata):
    global position
    x = -optidata.position.x
    y = -optidata.position.y
    z = optidata.position.z
    theta = atan2(sin(optidata.orientation.z+PI),cos(optidata.orientation.z+PI));
    Id = optidata.id
    position[Id] = [x, y, theta]

    
def read_optitrack(robot_id):
    global position
    rospy.init_node('Read_Optitrack')
    print 'Read optitrack node started!'
    ###### publish to
    raw_pose_pub = rospy.Publisher('robot_raw_pose', raw_pose, queue_size=100)
    ###### subscribe to
    rospy.Subscriber('/optitrack/data', optitrack_driver.msg.OptiTrackData, OptiTrackCallback)
    ##### convert from optitrack data to raw pose
    while not rospy.is_shutdown():
        if robot_id in position:
            raw_pose_msg = khepera3_driver.msg.UnicycleControlInput()
            # modify according to the actual message type and units
            raw_pose_msg.x = position[robot_id][0] #meter to meter
            raw_pose_msg.y = position[robot_id][1] #meter to meter
            raw_pose_msg.theta = position[robot_id][2] #rad to rad
            raw_pose_pub.publish(raw_pose_msg)
            rospy.sleep(0.1)
        else:
            print 'Error: robot_id not in optitrack publish list'
    print 'Read Optitrack node shut down'



if __name__ == '__main__':
    if len(sys.argv) == 2:
        robot_id = str(sys.argv[1])
        # to run: python read_optitrack.py 1
    ###############
    try:
        read_optitrack(robot_id)
    except rospy.ROSInterruptException:
        pass
