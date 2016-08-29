#!/usr/bin/env python
import roslib
from numpy import random
import Queue
roslib.load_manifest('mdp_tg')
import rospy
from mdp_tg.msg import raw_pose, status, cell_pose
from math import sqrt, cos, sin, radians

import sys

import matplotlib.patches
import matplotlib
from matplotlib import pyplot
from matplotlib.patches import Polygon

# import workspace and robot model
from load_model import motion_mdp_edges, WS_d, WS_node_dict




def raw_pose_callback(data):
    global raw_pose_data
    x = data.x      #m
    y = data.y      #m
    theta = data.theta  #rad
    raw_pose_data = [x, y, theta]
    # print 'Robot raw pose received: %s' %str(raw_pose_data)

    
def cell_pose_callback(data):
    global cell_pose_data
    cell_x = data.x      #m
    cell_y = data.y      #m
    orientation = data.orientation  #'N','S','E','W'
    cell_pose_data = [cell_x, cell_y, orientation]
    # print 'Robot cell pose received: %s' %str(cell_pose_data)    

    
def status_callback(data):
    global status_data
    l = data.label
    u = data.action
    m = data.segment
    status_data = [l, u, m]
    # print 'Robot status received: %s' %str(status_data)


def visualize_workspace(figure, motion_mdp_edges, WS_d, WS_node_dict, raw_pose, cell_pose, status):
    pyplot.cla()
    fig = figure
    ax = fig.add_subplot(111)
    [l, u, m] = status
    #----- draw the robot cell_pose
    print 'robot cell pose', cell_pose
    xl = cell_pose[0]
    yl = cell_pose[1]
    dl = cell_pose[2]
    if m == 0:
        Ecolor = 'green'
    elif m == 1:
        Ecolor = 'magenta'
    elif m == 2:
        Ecolor = 'black'
    elif m > 2:
        Ecolor = 'magenta'
    if dl == 'N':
        car=[(xl-0.1,yl-0.1), (xl-0.1,yl+0.1), (xl, yl+0.2), (xl+0.1, yl+0.1), (xl+0.1,yl-0.1)]
    elif dl == 'E':
        car=[(xl-0.1,yl+0.1), (xl+0.1,yl+0.1), (xl+0.2, yl), (xl+0.1, yl-0.1), (xl-0.1,yl-0.1)]
    elif dl == 'S':
        car=[(xl+0.1,yl+0.1), (xl+0.1,yl-0.1), (xl, yl-0.2), (xl-0.1, yl-0.1), (xl-0.1,yl+0.1)]
    elif dl == 'W':
        car=[(xl+0.1,yl-0.1), (xl-0.1,yl-0.1), (xl-0.2, yl), (xl-0.1, yl+0.1), (xl+0.1,yl+0.1)]
    polygon = Polygon(car, fill = False, facecolor='grey', edgecolor='black', linestyle='dashed', lw=1.5, zorder = 2)
    ax.add_patch(polygon)
    #----- draw the robot raw_pose
    print 'robot raw pose', raw_pose
    xl = raw_pose[0]
    yl = raw_pose[1]
    dl = raw_pose[2]
    Ecolor = 'green'
    if m == 0:
        Ecolor = 'green'
    elif m == 1:
        Ecolor = 'magenta'
    elif m == 2:
        Ecolor = 'black'
    elif m > 2:
        Ecolor = 'magenta'
    car=[(xl-0.1,yl-0.1), (xl-0.1,yl+0.1), (xl, yl+0.2), (xl+0.1, yl+0.1), (xl+0.1,yl-0.1)]
    polygon2 = Polygon(car, fill = True, facecolor=Ecolor, edgecolor=Ecolor, lw=5, zorder = 2)
    ts = ax.transData
    coords = ts.transform([xl, yl])
    tr = matplotlib.transforms.Affine2D().rotate_deg_around(coords[0], coords[1], dl*180/3.14 -90)
    t= ts + tr
    polygon2.set_transform(t)
    ax.add_patch(polygon2)    
    #
    u = tuple(u)
    actstr = r''
    for s in u:
        actstr += s
    ax.text(xl, yl+0.15, r'$%s$' %str(actstr), fontsize = 16, fontweight = 'bold', color='red')
    # plot shadow
    x = cell_pose[:]
    t_x_list = []
    for (f_x, t_x) in motion_mdp_edges.iterkeys():
        if f_x == tuple(x):
            prop = motion_mdp_edges[(f_x, t_x)]
            if u in prop.keys():
                t_x_list.append((t_x, prop[u][0]))
    #
    for new_x in t_x_list:
        xl = new_x[0][0]
        yl = new_x[0][1]
        dl = new_x[0][2]
        if dl == 'N':
            car=[(xl-0.1,yl-0.1), (xl-0.1,yl+0.1), (xl, yl+0.2), (xl+0.1, yl+0.1), (xl+0.1,yl-0.1)]
        elif dl == 'E':
            car=[(xl-0.1,yl+0.1), (xl+0.1,yl+0.1), (xl+0.2, yl), (xl+0.1, yl-0.1), (xl-0.1,yl-0.1)]
        elif dl == 'S':
            car=[(xl+0.1,yl+0.1), (xl+0.1,yl-0.1), (xl, yl-0.2), (xl-0.1, yl-0.1), (xl-0.1,yl+0.1)]
        elif dl == 'W':
            car=[(xl+0.1,yl-0.1), (xl-0.1,yl-0.1), (xl-0.2, yl), (xl-0.1, yl+0.1), (xl+0.1,yl+0.1)]
        polygon = Polygon(car, fill = False, hatch = 'x', edgecolor='grey', lw=5, zorder = 1, alpha=0.5)
        ax.add_patch(polygon)
        prob = new_x[1]
        ax.text(xl, yl, r'$%s$' %str(prob), fontsize = 15, fontweight = 'bold', color='red')                
    #---------------- draw the workspace
    for node, prop in WS_node_dict.iteritems():
        if node != (x[0], x[1]):
            S = []
            P = []
            for s, p in prop.iteritems():
                S.append(s)
                P.append(p)
            rdn = random.random()
            pc = 0
            for k, p in enumerate(P):
                pc += p
                if pc> rdn:
                    break
            current_s = S[k]
        if node == (x[0], x[1]):
            current_s = set([l,])
        #------
        if current_s == set(['base1','base']):
            text = '$base1$'
            color = 'yellow'
        elif current_s == set(['base2','base']):
            text = '$base2$'
            color = 'yellow'
        elif current_s == set(['base3', 'base']):
            text = '$base3$'
            color = 'yellow'
        elif current_s == set(['obstacle','low']):
            text = '$Obs$'
            color = 'red'
        elif current_s == set(['supply',]):
            text = '$Sply$'
            color = '#0000ff'
        else:
            text = None
            color = 'white'
        rec = matplotlib.patches.Rectangle((node[0]-WS_d, node[1]-WS_d), WS_d*2, WS_d*2, fill = True, facecolor = color, edgecolor = 'black', linewidth = 1,  alpha =0.8)
        ax.add_patch(rec)
        if text:
            ax.text(node[0]-0.15, node[1], r'%s' %text, fontsize = 13, fontweight = 'bold')        
    ax.set_aspect('equal')
    ax.set_xlim(-0.2, 2.6)
    ax.set_ylim(-0.2, 1.7)
    ax.set_xlabel(r'$x(m)$')
    ax.set_ylabel(r'$y(m)$')
    #fig.subplots_adjust(0.003,0.062,0.97,0.94)
    pyplot.pause(0.5)
    return fig
    
    
def plot_workspace():
    global raw_pose_data
    global status_data
    global cell_pose_data
    rospy.init_node('plot_workspace')
    print 'Plot workspace node started!'
    ##### initilzation
    raw_pose_data = [0.25, 0.25, 0.0]
    cell_pose_data = [0.25, 0.25, 'E']
    status_data = ['None', 'None', 0]    
    ###### subscribe to
    rospy.Subscriber('robot_raw_pose', raw_pose, raw_pose_callback)
    rospy.Subscriber('robot_status', status, status_callback)
    rospy.Subscriber('robot_cell_pose', cell_pose, cell_pose_callback)
    ##### plot workspace
    figure = pyplot.figure()
    pyplot.ion()
    pyplot.draw()
    rospy.sleep(2)
    while not rospy.is_shutdown():
        try:
           figure = visualize_workspace(figure, motion_mdp_edges, WS_d, WS_node_dict, raw_pose_data, cell_pose_data, status_data)
        except rospy.ROSInterruptException:
            print 'Visualization workspace stopped'



if __name__ == '__main__':
    ###############
    try:
        plot_workspace()
    except rospy.ROSInterruptException:
        pass
