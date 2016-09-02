#!/usr/bin/env python
import roslib, rospy
roslib.load_manifest('mdp_tg')
import sys
from math import pi as PI
from math import atan2, sin, cos, sqrt

import matplotlib.patches
from matplotlib import pyplot

import geometry_msgs.msg
from optitrack_driver.msg import OptiTrackData
import time

import matplotlib
from matplotlib.patches import Polygon

def norm(pose1, pose2):
    return sqrt((pose1[0]-pose2[0])**2+(pose1[1]-pose2[1])**2)

def reach_event(x, wp, bound):
    if (norm(x, wp) < bound):
        return True
    return False

def neighbor(grid_pose1, grid_pose2, HD):
    if norm([abs(grid_pose1[0]-grid_pose2[0]),
             abs(grid_pose1[1]-grid_pose2[1])], [0, 0]) < HD:
        return True
    else:
        return False

def transform(car, center, dl):
    new_car = []
    for node in car:
        vec = [node[0]-center[0], node[1]-center[1]]
        new_x = vec[0]*cos(dl) - vec[1]*sin(dl)
        new_y = vec[0]*sin(dl) + vec[1]*cos(dl)
        new_car.append([new_x+center[0], new_y+center[1]])
    return new_car

# plot agents in real time
def visualize_agents(figure, position, HD):
    pyplot.cla()
    fig = figure
    ax = fig.add_subplot(111)
    for a,p in position.iteritems():
        if p:
            xl = p[0]
            yl = p[1]
            dl = p[2]
            ax.plot(xl, yl, 'ro', markersize=8)
            L1 = 0.05
            L2 = 0.1
            car=[(xl-L1,yl-L1), (xl-L1,yl+ L1), (xl, yl+L2), (xl+L1, yl+L1), (xl+L1,yl-L1)]
            Ecolor = 'Grey'            
            polygon2 = Polygon(transform(car, [xl,yl], dl), fill = True, facecolor=Ecolor, edgecolor='black', lw=4, zorder=2)
            ax.add_patch(polygon2)    
            for b,l in position.iteritems():
                if ((a != b) and (l)):
                    if neighbor(p, l, HD):
                        ax.plot([p[0], l[0]],
                                [p[1], l[1]],'g-',linewidth=2)
    ax.grid()
    ax.set_xlabel('x(m)')
    ax.set_ylabel('y(m)')
    ax.set_aspect('equal')
    ax.set_xlim(-0.5, 2.7)
    ax.set_ylim(-0.5, 1.7)
    #fig.subplots_adjust(0.003,0.062,0.97,0.94)
    #pyplot.show()
    pyplot.pause(0.01)
    return fig

def OptiTrackCallback(optidata):
    # you may have to tune x,y,z,theta here to overcome
    # initialization and origin in OptiTrack
    global position
    x = -optidata.position.x
    y = -optidata.position.y
    z = optidata.position.z
    theta = atan2(sin(optidata.orientation.z-0.5*PI),cos(optidata.orientation.z-0.5*PI));
    Id = optidata.id
    position[Id] = [x, y, theta]
    # print 'position data of %d received as %s' %(Id, str(position[Id]))


def SendControl(ContPublisher, control):
    ContMsg = geometry_msgs.msg.Twist()
    ContMsg.linear.x = control[0]
    ContMsg.angular.z = control[1]
    ContPublisher.publish(ContMsg)

def SimpleControl(pose, goal):
    # to test
    # rostopic pub /Brain2/cmd_vel geometry_msgs/Twist -r 1 -- '[2.0, 0.0, 0.0]' '[0.0, 0.0, -1.8]
    global LINEAR_VEL, ANGULAR_VEL, BOUND
    if reach_event(pose, goal, BOUND):
        angular_vel = 0
        linear_vel = 0
    else:
        goal_theta = atan2(goal[1]-pose[1], goal[0]-pose[0])
        theta_bound = 0.1*PI
        dist_bound =  0.1
        if (abs(pose[2]-goal_theta)>theta_bound):
            print 'Turn first'
            theta_dif = goal_theta-pose[2]
            if theta_dif > 0:
                angular_vel = ANGULAR_VEL
            else:
                angular_vel = -ANGULAR_VEL
            linear_vel =  0 # LINEAR_VEL
        elif (norm(pose,goal)>dist_bound):
            print 'forward now'
            linear_vel = LINEAR_VEL
            angular_vel = 0
        elif (abs(pose[2]-goal[2])>theta_bound):
            print 'orient last'
            theta_dif = goal[2]-pose[2]
            if theta_dif > 0:
                angular_vel = ANGULAR_VEL
            else:
                angular_vel = -ANGULAR_VEL
            linear_vel =  0 # LINEAR_VEL
    return [linear_vel, angular_vel]


#========================================
figure = pyplot.figure()
pyplot.ion()
pyplot.draw()
time.sleep(1)
## RO_ID and RO_NAME should be inline with the "numeric_id" from "optitrack.launch" and "robotname" from "irobot.launch".
RO_ID = [5, 2, 1, 6]
RO_NAME = ['Brain5', 'Brain2', 'Brain1', 'Brain6']
NO_RS = len(RO_ID)
## agent goals ordered by RO_ID
GOAL = [(1.0, 1.0, PI*0.5), (0.5, 0.6, PI*0.2), (1.5, 0.9, PI*0.8), (1.2, 0.2, -PI*0.5)]
# limit v \in [-0.3148,0.3148] and w \in [-2.2763,2.2763]
LINEAR_VEL = 0.15
ANGULAR_VEL = 0.3
BOUND = 0.1
# communication rage
HD = 1.5

position = dict()
goal = dict()
mControlPublisher = dict()
for i,a in enumerate(RO_ID):
    position[a] = None #x,y,theta
    goal[a] = GOAL[i]
    mControlPublisher[a] = None
rospy.init_node('simple_control')
#----------
#publish to
#----------
for i,a in enumerate(RO_ID):
    msg_name = '%s/cmd_vel' %RO_NAME[i]
    mControlPublisher[a] = rospy.Publisher(msg_name, geometry_msgs.msg.Twist, queue_size = 100)
#----------
#subscribe to
#----------
rospy.Subscriber('/optitrack/data', OptiTrackData, OptiTrackCallback)
#----------
#main loop
#----------
t0 = rospy.Time.now()
while not rospy.is_shutdown():
    try:
        t = rospy.Time.now()-t0
        print '----------Time: %.2f----------' %t.to_sec()
        for i,a in enumerate(RO_ID):
            if position[a]:
                cont = SimpleControl(position[a], goal[a])
                cp = mControlPublisher[a]
                SendControl(cp, cont)
                print 'Control %s sent to %s' %(str(cont), RO_NAME[i])
        rospy.sleep(1)
        figure = visualize_agents(figure, position, HD)
    except rospy.ROSInterruptException:
        pass
      
