from MDP_TG.mdp import Motion_MDP
from MDP_TG.dra import Dra, Product_Dra
from MDP_TG.lp import syn_full_plan
from MDP_TG.vis import visualize_traj, visualize_world_paths, visualize_world, run_movie

import time

t0 = time.time()

#-------- real example -------
WS_d = 1
WS_node_dict = {
    # base stations
    (9.0, 1.0): {frozenset(['base1',]): 1.0,
           frozenset(): 0.0,},
    (9.0, 9.0): {frozenset(['base2',]): 1.0,
           frozenset(): 0.0,},
    (1.0, 9.0): {frozenset(['base3',]): 1.0,
           frozenset(): 0.0,},
    (3.0, 3.0): {frozenset(): 1.0,},
    (3.0, 5.0): {frozenset(): 1.0,},
    (7.0, 5.0): {frozenset(): 1.0,},
    (3.0, 9.0): {frozenset(): 1.0,},
    (3.0, 7.0): {frozenset(): 1.0,},    
    (1.0, 5.0): {frozenset(['supply',]): 0.8,
           frozenset(): 0.2,},
    (5.0, 3.0): {frozenset(['supply',]): 0.2,
           frozenset(): 0.8,},
    (9.0, 5.0): {frozenset(['supply',]): 0.5,
           frozenset(): 0.5,},
    (5.0, 9.0): {frozenset(['supply',]): 0.5,
           frozenset(): 0.5,},
    (1.0, 3.0): {frozenset(): 1.0,},
    (1.0, 1.0): {frozenset(): 1.0,},
    (1.0, 7.0): {frozenset(): 1.0,},
    (3.0, 1.0): {frozenset(): 1.0,},
    (5.0, 1.0): {frozenset(): 1.0,},
    (7.0, 1.0): {frozenset(): 1.0,},
    (5.0, 1.0): {frozenset(['obstacleH',]): 0.99,
                 frozenset(): 0.01,},
    (7.0, 3.0): {frozenset(): 1.0,},
    (5.0, 5.0): {frozenset(): 1.0,},
    (5.0, 7.0): {frozenset(): 1.0,},
    (7.0, 7.0): {frozenset(): 1.0,},
    (7.0, 9.0): {frozenset(): 1.0,},
    (9.0, 3.0): {frozenset(): 1.0,},
    (9.0, 7.0): {frozenset(): 1.0,},                        
}

#----
#------------------------------------
robot_nodes = dict()
for loc, prop in WS_node_dict.iteritems():
    for d in ['N', 'S', 'E', 'W']:
        robot_nodes[(loc[0], loc[1], d)] = prop
#------------------------------------        
initial_node = (5.0, 5.0, 'N')
initial_label = frozenset()

U = [tuple('FR'), tuple('BK'), tuple('TR'), tuple('TL'), tuple('ST')]
C = [2, 4, 3, 3, 1]
P_FR = [0.1, 0.8, 0.1]
P_BK = [0.15, 0.7, 0.15]
P_TR = [0.05, 0.9, 0.05]
P_TL = [0.05, 0.9, 0.05]
P_ST = [0.005, 0.99, 0.005]
#-------------
robot_edges = dict()
for fnode in robot_nodes.iterkeys():
    fx = fnode[0]
    fy = fnode[1]
    fd = fnode[2]
    # action FR
    u = U[0]
    c = C[0]
    if fd == 'N':
        t_nodes = [(fx-2, fy+2, fd), (fx, fy+2, fd), (fx+2, fy+2, fd)]
    if fd == 'S':
        t_nodes = [(fx-2, fy-2, fd), (fx, fy-2, fd), (fx+2, fy-2, fd)]
    if fd == 'E':
        t_nodes = [(fx+2, fy-2, fd), (fx+2, fy, fd), (fx+2, fy+2, fd)]
    if fd == 'W':
        t_nodes = [(fx-2, fy-2, fd), (fx-2, fy, fd), (fx-2, fy+2, fd)]
    for k, tnode in enumerate(t_nodes):
        if tnode in robot_nodes.keys():
            robot_edges[(fnode, u, tnode)] = (P_FR[k], c)
    # action BK
    u = U[1]
    c = C[1]
    if fd == 'N':
        t_nodes = [(fx-2, fy-2, fd), (fx, fy-2, fd), (fx+2, fy-2, fd)]
    if fd == 'S':
        t_nodes = [(fx-2, fy+2, fd), (fx, fy+2, fd), (fx+2, fy+2, fd)]
    if fd == 'E':
        t_nodes = [(fx-2, fy-2, fd), (fx-2, fy, fd), (fx-2, fy+2, fd)]
    if fd == 'W':
        t_nodes = [(fx+2, fy-2, fd), (fx+2, fy, fd), (fx+2, fy+2, fd)]                
    for k, tnode in enumerate(t_nodes):
        if tnode in robot_nodes.keys():
            robot_edges[(fnode, u, tnode)] = (P_BK[k], c)
    # action TR
    u = U[2]
    c = C[2]
    if fd == 'N':
        t_nodes = [(fx, fy, 'N'), (fx, fy, 'E'), (fx, fy, 'S')]
    if fd == 'S':
        t_nodes = [(fx, fy, 'S'), (fx, fy, 'W'), (fx, fy, 'N')]
    if fd == 'E':
        t_nodes = [(fx, fy, 'E'), (fx, fy, 'S'), (fx, fy, 'W')]
    if fd == 'W':
        t_nodes = [(fx, fy, 'W'), (fx, fy, 'N'), (fx, fy, 'E')]
    for k, tnode in enumerate(t_nodes):
        if tnode in robot_nodes.keys():
            robot_edges[(fnode, u, tnode)] = (P_TR[k], c)
    # action TL
    u = U[3]
    c = C[3]
    if fd == 'S':
        t_nodes = [(fx, fy, 'S'), (fx, fy, 'E'), (fx, fy, 'N')]
    if fd == 'N':
        t_nodes = [(fx, fy, 'N'), (fx, fy, 'W'), (fx, fy, 'S')]
    if fd == 'W':
        t_nodes = [(fx, fy, 'W'), (fx, fy, 'S'), (fx, fy, 'E')]
    if fd == 'E':
        t_nodes = [(fx, fy, 'E'), (fx, fy, 'N'), (fx, fy, 'W')]
    for k, tnode in enumerate(t_nodes):
        if tnode in robot_nodes.keys():
            robot_edges[(fnode, u, tnode)] = (P_TL[k], c)
    # action ST
    u = U[4]
    c = C[4]
    if fd == 'S':
        t_nodes = [(fx, fy, 'W'), (fx, fy, 'S'), (fx, fy, 'E')]
    if fd == 'N':
        t_nodes = [(fx, fy, 'W'), (fx, fy, 'N'), (fx, fy, 'E')]
    if fd == 'W':
        t_nodes = [(fx, fy, 'S'), (fx, fy, 'W'), (fx, fy, 'N')]
    if fd == 'E':
        t_nodes = [(fx, fy, 'N'), (fx, fy, 'E'), (fx, fy, 'S')]   
    for k, tnode in enumerate(t_nodes):
        if tnode in robot_nodes.keys():
            robot_edges[(fnode, u, tnode)] = (P_ST[k], c)                    
#----
motion_mdp = Motion_MDP(robot_nodes, robot_edges, U, initial_node, initial_label)
t2 = time.time()
print 'MDP done, time: %s' %str(t2-t0)

#----
all_base = '& G F base1 & G F base2 G F base3'
base = '| base1 | base2 base3'
order1 = 'G i supply X U ! supply %s' %base 
order2 = 'G i %s X U ! %s supply' %(base, base)
order = '& %s %s' %(order1, order2)
obstacle = '| obstacleH obstacleL'
task1 = '& %s & G ! %s %s' %(all_base, obstacle, order2)
task2 = '& %s G F supply' %all_base
task3 = '& %s %s' %(all_base, order2)
dra = Dra(task1)
t3 = time.time()
print 'DRA done, time: %s' %str(t3-t2)

#----
prod_dra = Product_Dra(motion_mdp, dra)
#prod_dra.dotify()
t41 = time.time()
print 'Product DRA done, time: %s' %str(t41-t3)
#----
prod_dra.compute_S_f()
t42 = time.time()
print 'Compute MEC done, time: %s' %str(t42-t41)

#------
gamma1 = 0.0 # 0.3
gamma2 = 0.0 # 0.6
best_all_plan = syn_full_plan(prod_dra, gamma1, gamma2)
t5 = time.time()
print 'Plan synthesis done, time: %s' %str(t5-t42)
