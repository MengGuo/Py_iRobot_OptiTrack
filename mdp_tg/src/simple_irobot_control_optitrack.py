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

# plot agents in real time
def visualize_agents(figure, position):
    pyplot.cla()
    fig = figure
    ax = fig.add_subplot(111)
    for a,p in position.iteritems():
        if p:
            ax.plot(p[0], p[1], 'ro', markersize=8)
            disk = matplotlib.patches.Circle(
                (p[0], p[1]),
                radius = 0.2*0.5,
                facecolor='#afeeee',
                #fill = False,
                alpha=0.6)
            ax.add_patch(disk)
            for b,l in position.iteritems():
                if ((a != b) and (l)):
                    if neighbor(p, l, 1.0):
                        ax.plot([p[0], l[0]],
                                [p[1], l[1]],'g-',linewidth=2)
    ax.grid()
    ax.set_xlabel('x(m)')
    ax.set_ylabel('y(m)')
    ax.set_aspect('equal')
    ax.set_xlim(-1.5, 1.5)
    ax.set_ylim(-1.5, 1.5)
    fig.subplots_adjust(0.003,0.062,0.97,0.94)
    #pyplot.show()
    pyplot.pause(0.01)
    return fig

def OptiTrackCallback(optidata):
    global position
    x = -optidata.position.x
    y = -optidata.position.y
    z = optidata.position.z
    theta = atan2(sin(optidata.orientation.z+PI),cos(optidata.orientation.z+PI));
    Id = optidata.id
    position[Id] = [x, y, theta]
    print 'position data of %d received as %s' %(Id, str(position[Id]))


def SendControl(ContPublisher, control):
    ContMsg = geometry_msgs.msg.Twist()
    ContMsg.linear.x = control[0]
    ContMsg.angular.z = control[1]
    ContPublisher.publish(ContMsg)

def SimpleControl(pose, goal):
    # to test
    # rostopic pub /Brain2/cmd_vel geometry_msgs/Twist -r 1 -- '[2.0, 0.0, 0.0]' '[0.0, 0.0, -1.8]'
    global LINEAR_VEL, ANGULAR_VEL, BOUND
    if reach_event(pose, goal, BOUND):
        angular_vel = 0
        linear_vel = 0
    else:
        goal_theta = atan2(goal[1]-pose[1], goal[0]-pose[0])
        if (abs(pose[2]-goal_theta)>0.1*PI):
            print 'Turn first'
            theta_dif = goal[2]-pose[2]
            if theta_dif > 0:
                angular_vel = ANGULAR_VEL
            else:
                angular_vel = -ANGULAR_VEL
            linear_vel =  0 # LINEAR_VEL
        else:
            print 'forward now'
            linear_vel = LINEAR_VEL
            angular_vel = 0
    return [linear_vel, angular_vel]


#========================================
figure = pyplot.figure()
pyplot.ion()
pyplot.draw()
time.sleep(1)
## agent ID should be in-line with the control.launch and optitrak.launch
RO_ID = [1,]
RO_NAME = ['Brain2',]
NO_RS = len(RO_ID)
## agent goals ordered by RO_ID
GOAL = [(-1, 0, PI*0.5),]
# limit v \in [-0.3148,0.3148] and w \in [-2.2763,2.2763]
LINEAR_VEL = 0.15
ANGULAR_VEL = 0.3
BOUND = 0.1

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
        for a in RO_ID:
            if position[a]:
                cont = SimpleControl(position[a], goal[a])
                cp = mControlPublisher[a]
                SendControl(cp, cont)
                print 'Control %s sent to %d' %(str(cont), a)
        rospy.sleep(1)
        figure = visualize_agents(figure, position)
    except rospy.ROSInterruptException:
        pass
      
