#!/usr/bin/env python
import roslib
import numpy
import Queue
roslib.load_manifest('mdp_tg')
import rospy
from mdp_tg.msg import action, confirmation, cell_pose, status
from math import sqrt, cos, sin, radians
import numpy
import random

import sys


from model import best_plan, prod_dra_edges, initial_state


def confirm_callback(data):
    global confirm    
    header = data.header
    name = data.name
    done = data.done
    confirm = [header, name, done]
    print 'Confirmation received: %s' %str(confirm)

    
def cell_pose_callback(data):
    global cell_pose
    x = data.x
    y = data.y
    orientation = data.orientation
    cell_pose = [x, y, orientation]
    print 'Robot position received: %s' %str(cell_pose)      

    
def plan_execution():
    global confirm
    global cell_pose
    rospy.init_node('plan_execution')
    print 'Plan execution node started!'
    ###### publish to
    action_pub = rospy.Publisher('next_action', action, queue_size=100)
    status_pub = rospy.Publisher('robot_status', status, queue_size=100)
    ###### subscribe to
    rospy.Subscriber('action_done', confirmation, confirm_callback)
    rospy.Subscriber('robot_cell_pose', cell_pose, cell_pose_callback)
    ##### plan execution
    current_state = initial_state[:]
    t = 0
    X = []
    U = []
    while not rospy.is_shutdown():
        try:
            X.append(current_state)
            #
            next_action_msg = action()
            next_action_name, next_segment = Find_Action(best_plan,current_state)
            next_action_msg.header = t
            next_action_msg.name = next_action_name
            print 'Next action: %s' %next_action_name
            U.append(next_action_name)
            #
            status_msg = status()
            labelset = set(current_state[1])
            status_msg.label = labelset.pop()
            status_msg.action = next_action_name
            status_msg.segment = next_segment
            while not ((confirm[0] == t) and (confirm[1]==next_action_name) and (confirm[2]>0)):
                action_pub.publish(next_action_msg)
                status_pub.publish(status_msg)
                rospy.sleep(0.05)
            #
            rospy.sleep(1)
            t += 1
            print 'Action %s done!' %next_action_name
            print 'Robot cell pose: %s' %str(cell_pose)
            next_state = Find_Next_State(prod_dra_edges, current_state, next_action_name, cell_pose)
            current_state = next_state[:]
        except rospy.ROSInterruptException:
            print 'System trajectory:', X
            print 'Control actions:', U


def Find_Action(best_plan, current_state):
    # choose action according to the optimal policy
    # best_plan = [plan_prefix, prefix_cost, prefix_risk, y_in_sf], [plan_suffix, suffix_cost, suffix_risk], [MEC[0], MEC[1], Sr, Sd], plan_bad]
    print '------Choose action according to the optimal policy------'
    plan_prefix = best_plan[0][0]
    plan_suffix = best_plan[1][0]
    plan_bad = best_plan[3]
    if (prod_state in plan_prefix):
        print 'In prefix'
        U = plan_prefix[prod_state][0]
        P = plan_prefix[prod_state][1]
        next_segment = 0
    elif (prod_state in plan_suffix):
        print 'In suffix'
        U = plan_suffix[prod_state][0]
        P = plan_suffix[prod_state][1]
        next_segment = 1        
    elif (prod_state in plan_bad):
        print 'In bad states'        
        U = plan_bad[prod_state][0]
        P = plan_bad[prod_state][1]
        next_segment = 2        
    rdn = random.random()
    pc = 0
    for k, p in enumerate(P):
        pc += p
        if pc>rdn:
            break
    print 'Action Chosen: %s' %str(U[k])
    next_action_name = U[k]        
    return next_action_name, next_segment


def Find_Next_State(prod_dra_edges, current_state, next_action_name, cell_pose):
    S = []
    P = []
    for (f_state, t_state) in prod_dra_edges.iterkeys():
        if f_state == current_state:
            prop = prod_dra_edges[(f_state, t_state)]
            if ((next_action_name in prop.keys()) and (next_state[0] == cell_pose)):
                S.append(next_state)
                P.append(prop[next_action_name][0])
    rdn = random.random()
    pc = 0
    for k, p in enumerate(P):
        pc += p
        if pc > rdn:
            break
    next_state = tuple(S[k])
    return next_state

    

if __name__ == '__main__':
    ###############
    try:
        plan_execution()
    except rospy.ROSInterruptException:
        pass
