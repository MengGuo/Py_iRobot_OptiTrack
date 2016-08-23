#!/usr/bin/env python
import roslib
import Queue
roslib.load_manifest('mdp_tg')
import rospy
from mdp_tg.msg import action, confirmation, cell_pose, raw_pose, UnicycleControl
from math import sqrt, cos, sin, radians
from math import pi as PI
from numpy import floor

import sys

# import workspace and robot model
from model import WS_d, initial_state

def distance(pose1, pose2):
    return sqrt((pose1[0]-pose2[0])**2+(pose1[1]-pose2[1])**2)


def next_action_callback(data):
    global next_action   
    header = data.header
    name = data.name
    done = data.done
    next_action = [header, name]
    print 'Next action received: %s' %str(next_action)

    
def raw_pose_callback(data):
    global raw_pose
    x = data.x      #m
    y = data.y      #m
    theta = data.theta  #rad
    raw_pose = [x, y, theta]
    print 'Robot position received: %s' %str(raw_pose)      

    
def action_execution():
    global next_action
    global raw_pose
    rospy.init_node('action_execution')
    print 'Action execution node started!'
    ###### publish to
    confirmation_pub = rospy.Publisher('action_done', confirmation, queue_size=100)
    cell_pose_pub = rospy.Publisher('robot_cell_pose', cell_pose, queue_size=100)
    control_pub = rospy.Publisher('cmd_vel', UnicycleControl, queue_size=100)
    ###### subscribe to
    rospy.Subscriber('next_action', action, next_action_callback)
    rospy.Subscriber('robot_raw_pose', raw_pose, raw_pose_callback)
    ##### action execution
    t = 0
    grid = WS_d*2    # grid size
    cell_pose = initial_state[0]
    #### 
    while not rospy.is_shutdown():
        if next_action[0] == t:
            print 'Next action %s received at time %s' %(next_action[1], next_action[0])
            action_name = next_action[1]
            start_pose = raw_pose[:]
            goal_pose = Find_Goal(cell_pose, grid, action_name)
            while ((distance(raw_pose[0:2], goal_pose[0:2]) > 0.01) or (abs(raw_pose[2]-goal_pose[2]) > 0.1*PI)):
                # send control msg
                linearVelo, angularVelo = Find_Control(raw_pose, goal_pose)
                control_msg = UnicycleControl()
                control_msg.linearV = linearVelo
                control_msg.angularV = angularVelo
                control_pub.publish(control_msg)
                print 'Control cmds published: %s' %str((linearVelo, angularVelo))
                rospy.sleep(0.5) # TODO: check how fast the input can change
            print 'Goal pose reached: %s' %(str(goal_pose))
            # send confirmation msg 
            confirmation_msg = confirmation()
            confirmation_msg.header = t
            confirmation_msg.name = action_name
            confirmation_msg.done = 1
            count_t = 0 
            while count_t < 1: # publish for 1s
                confirmation_pub.publish(confirmation_msg)
                rospy.sleep(0.05)
                count_t += 0.05
            print 'Confirmation for action %s at time %s sent' %(str(action_name), str(t))
            # send cell_pose msg
            cell_pose_msg = cell_pose()
            [cell_x, cell_y, orientation] = Raw_To_Cell_Pose(raw_pose, grid)
            cell_pose_msg.x = cell_x
            cell_pose_msg.y = cell_y
            cell_pose_msg.orientation = orientation
            count_t = 0 
            while count_t < 1: # publish for 1s
                cell_pose_pub.publish(cell_pose_msg)
                rospy.sleep(0.05)
                count_t += 0.05
            print 'Robot cell pose published: (%s, %s, %s)' %(str(cell_x), str(cell_y), str(orientation)) 
            t += 1
        else:
            rospy.sleep(0.05)



def Find_Goal(cell_pose, grid, action_name):
    # decide goal state and control input
    [x, y, orientation] = cell_pose
    P =[]
    G = []
    if action_name == 'FR':
        # create uncertainty in the FR action
        P = [0.1, 0.8, 0.1]
        #if -0.25*PI <= theta <= 0.25*PI:
        if orientation == 'E':
            G = [(grid, -grid, 0), (grid, 0, 0), (grid, grid, 0)]
        #elif 0.25*PI <= theta <= 0.75*PI:
        elif orientation == 'N':
            G = [(-grid, grid, 0), (0, grid, 0), (grid, grid, 0)]
        #elif (0.75*PI <= theta <= 1.0*PI) or (-1.0*PI <= theta <= -0.75*PI):
        elif orientation == 'W':
            G = [(-grid, -grid, 0), (-grid, 0, 0), (-grid, grid, 0)]
        #elif -0.75*PI <= theta <= -0.25*PI:
        elif orientation == 'S':
            G = [(-grid, -grid, 0), (0, -grid, 0), (grid, -grid, 0)]
    elif action_name == 'BK':
        # create uncertainty in the BK action
        P = [0.15, 0.7, 0.15]
        #if -0.25*PI <= theta <= 0.25*PI:
        if orientation == 'E':
            G = [(-grid, -grid, 0), (-grid, 0, 0), (-grid, grid, 0)]
        #elif 0.25*PI <= theta <= 0.75*PI:
        elif orientation == 'N':
            G = [(-grid, -grid, 0), (0, -grid, 0), (grid, -grid, 0)]
        #elif (0.75*PI <= theta <= 1.0*PI) or (-1.0*PI <= theta <= -0.75*PI):
        elif orientation == 'W':
            G = [(grid, -grid, 0), (grid, 0, 0), (grid, grid, 0)]
        #elif -0.75*PI <= theta <= -0.25*PI:
        elif orientation == 'S':
            G = [(-grid, grid, 0), (0, grid, 0), (grid, grid, 0)]
    elif action_name == 'TR':
        # create uncertainty in the TR action
        P = [0.05, 0.9, 0.05]
        G = [(0, 0, 0), (0, 0, -0.5*PI), (0, 0, -1.0*PI)]
    elif action_name == 'TL':
        # create uncertainty in the TL action        
        P = [0.05, 0.9, 0.05]
        G = [(0, 0, 0), (0, 0, 0.5*PI), (0, 0, 1.0*PI)]
    elif action_name == 'ST':
        # create uncertainty in the ST action        
        P = [1.0]
        U = [(0, 0, 0)]
    # find possible goal
    rdn = random.random()
    pc = 0
    for k, p in enumerate(P):
        pc += p
        if pc > rdn:
            break
    G_pose = G[k]
    if orientation == 'E':
        start_pose = [x, y, 0]
    elif orientation == 'N':
        start_pose = [x, y, 0.5*PI]
    elif orientation == 'S':
        start_pose = [x, y, -0.5*PI]
    elif orientation == 'W':
        start_pose = [x, y, 0.95*PI]        
    goal_pose = [start_pose[i]+G_pose[i] for i in xrange(0,3)]
    if goal_pose[2] > 1.0*PI:
        goal_pose[2] -= 2.0*PI
    if goal_pose[2] < -1.0*PI:
        goal_pose[2] += 2.0*PI        
    return goal_pose



def  Find_Control(raw_pose, goal_pose):
    # turn-and-forward-turn controller
    LINEAR_V = 0.1     #m/s
    ANGULAR_V = 0.2   #rad/s
    angular_V = 0.0
    linear_V = 0.0
    [s_x, s_y, s_theta] = raw_pose
    [g_x, g_y, g_theta] = goal_pose
    face = atan(g_y-s_y, g_x-s_x)
    theta_dif = s_theta-face
    orientation_dif = g_theta-s_theta
    if ((distance((s_x,s_y), (g_x,g_y)) > 0.1) and (abs(theta_dif) > 0.1*PI)):
        print 'Turn to face the goal'
        if ((0 < theta_dif < 1.0*PI) or (-2.0*PI < theta_dif < -1.0*PI)):
            angular_V = -ANGULAR_V 
        else:
            angular_V = ANGULAR_V 
    elif ((distance((s_x,s_y), (g_x,g_y)) > 0.1) and (abs(theta_dif) < 0.1*PI)):
        print 'Forward to the goal'
        linear_V = LINEAR_V
    elif ((distance((s_x,s_y), (g_x,g_y)) < 0.1) and (abs(orientation_dif) > 0.1*PI))::
        print 'Turn to right orientation'
        if ((0 < orientation_dif < 1.0*PI) or (-2.0*PI < orientation_dif < -1.0*PI)):
            angular_V = -ANGULAR_V 
        else:
            angular_V = ANGULAR_V 
    return linear_V, angular_V



def Raw_To_Cell_Pose(raw_pose, grid):
    [raw_x, raw_y, raw_theta] = raw_pose
    cell_x = floor(raw_x/grid)*grid + grid*0.5
    cell_y = floor(raw_y/grid)*grid + grid*0.5
    if -0.25*PI <= raw_theta <= 0.25*PI:
        orientation = 'E'
    elif 0.25*PI <= raw_theta <= 0.75*PI:
        orientation = 'N'
    elif (0.75*PI <= raw_theta <= 1.0*PI) or (-1.0*PI <= raw_theta <= -0.75*PI):
        orientation = 'W'    
    elif -0.75*PI <= raw_theta <= -0.25*PI:
        orientation = 'S'    
    return cell_x, cell_y, orientation



if __name__ == '__main__':
    ###############
    try:
        action_execution()
    except rospy.ROSInterruptException:
        pass
