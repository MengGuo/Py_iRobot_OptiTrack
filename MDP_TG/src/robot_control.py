#!/usr/bin/env python
import roslib
import numpy
import Queue
roslib.load_manifest('mdp_tg')
import rospy
from mdp_tg.msg import action, confirmation, pose, raw_pose, control
from math import sqrt, cos, sin, radians
import numpy

import sys

import khepera3_driver.msg


def control_cmds_callback(data):
    global control_cmd   
    linear_V = data.linearV
    angular_V = data.angularV
    control_cmd = [linear_V, angular_V]
    print 'Control cmds received: %s' %str(control_cmd)

    
def robot_control():
    global control_cmd
    rospy.init_node('robot_control')
    print 'Robot control node started!'
    ###### publish to
    unicyle_control_pub = rospy.Publisher('/khepera3_send_control', khepera3_driver.msg.UnicycleControlInput, queue_size=100)
    ###### subscribe to
    rospy.Subscriber('control_cmds', control, control_cmds_callback)
    ##### set wheel speed
    while not rospy.is_shutdown():
        try:
            unicyle_control_msg = khepera3_driver.msg.UnicycleControlInput()
            # modify according to the actual message type and units
            unicyle_control_msg.linear_velocity = control_cmd[0]
            unicyle_control_msg.angular_velocity = control_cmd[1]
            unicycle_conrol_pub.publish(unicyle_control_msg)
            rospy.sleep(0.1)
        except rospy.ROSInterruptException:
            print 'Robot control node stopped'



if __name__ == '__main__':
    ###############
    try:
        robot_control()
    except rospy.ROSInterruptException:
        pass
