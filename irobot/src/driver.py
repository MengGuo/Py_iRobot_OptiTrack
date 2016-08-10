#!/usr/bin/python
import roslib
roslib.load_manifest('irobot')
import rospy
from time import sleep
from irobotCreate import Create

from math import sin,cos,pi

from irobot.msg import UnicycleControl
from nav_msgs.msg import Odometry
from tf.broadcaster import TransformBroadcaster

class CreateDriver:
	def __init__(self, port):
		self.create = Create(port)
		self.th = datetime.now() 
		self.x = 0
		self.y = 0
		self.th = 0

	def start(self):
		self.create.start()
		self.then = datetime.now() 

	def stop(self):
		self.create.stop()

	def twist(self, control):
		x = control.linearV*1000
		th = control.angularV
		if (x == 0):
			th = th*180/pi
			speed = (8*pi*th)/9
			self.create.left(int(speed))
		elif (th == 0):
			x = int(x)
			self.create.tank(x,x)
		else:
			self.create.forwardTurn(int(x),int(x/th))

                        
if __name__ == '__main__':
	node = rospy.init_node('irobot_control')
        
        port = rospy.get_param('/brown/irobot_create_2_1/port', "/dev/ttyUSB0")        
	driver = CreateDriver(port)

	rospy.Subscriber("cmd_vel", UnicycleControl, driver.twist)

	sleep(1)
	driver.start()
	sleep(1)

	rospy.spin()
	driver.stop()
