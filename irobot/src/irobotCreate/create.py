"""This module provides a class wrapping an iRobot Create."""

from serial import Serial
from struct import pack
from struct import unpack
from time import sleep
from threading import Thread
from threading import Lock
from datetime import datetime

class Monitor(Thread):
	def __init__(self, watchdog, packetRef, create, read, sendAll, addDistance, addAngle, update):
		Thread.__init__(self)
		self.watchdog = watchdog
		self.packetRef = packetRef
		self.create = create
		self.read = read
		self.sendAll = sendAll
		self.addDistance = addDistance
		self.addAngle = addAngle
		self.update = update

		def mask(num):
			return (
				num >> 7 & 1,
				num >> 6 & 1,
				num >> 5 & 1,
				num >> 4 & 1,
				num >> 3 & 1,
				num >> 2 & 1,
				num >> 1 & 1,
				num & 1
				)

		def unsigned(num):
			return (num,)

		def signed(num):
			if (num >> 15):
				return (-1*(2**16-num),)
			return (num,)

		def signed8(num):
			if (num >> 7):
				return (-1*(2**8-num),)
			return (num,)

		self.packets = (
			(7,1,mask,("na","na","na","wheeldropCaster","wheeldropLeft","wheeldropRight","bumpLeft","bumpRight")),
			(8,1,unsigned,("wall",)),
			(9,1,unsigned,("cliffLeft",)),
			(10,1,unsigned,("cliffFronLeft",)),
			(11,1,unsigned,("cliffFrontRight",)),
			(12,1,unsigned,("cliffRight",)),
			(13,1,unsigned,("virtualWall",)),
			(17,1,unsigned,("infraredByte",)),
			(18,1,mask,("na","na","na","na","na","advance","na","play")),
			(19,2,signed,("distance",)),
			(20,2,signed,("angle",)),
			(21,1,unsigned,("chargingState",)),
			(22,2,unsigned,("voltage",)),
			(23,2,signed,("current",)),
			(24,1,signed8,("batteryTemperature",)),
			(25,2,unsigned,("batteryCharge",)),
			(26,2,unsigned,("batteryCapacity",)),
			(27,2,unsigned,("wallSignal",)),
			(28,2,unsigned,("cliffLeftSignal",)),
			(29,2,unsigned,("cliffFrontLeftSignal",)),
			(30,2,unsigned,("cliffFrontRightSignal",)),
			(31,2,unsigned,("cliffRightSignal",)),
			(34,1,mask,("na","na","na","na","na","na","homeBase","internalCharger")),
			(36,1,unsigned,("songNumber",)),
			(37,1,unsigned,("songPlaying",)),
			)

	def run(self):
		while(len(self.watchdog) == 0):
			then = datetime.now()
			self.sendAll() #send queued commands

			self.create.send(149,len(self.packets),*[i[0] for i in self.packets]) #read sensor packets
			self.sendAll() 

			bytes = self.read(sum([i[1] for i in self.packets]))

			try:
				bytes = unpack('B'*sum([i[1] for i in self.packets]),bytes)
				data = {}

				offset = 0
				for packet in self.packets:
					if (packet[1] == 1):
						results = packet[2](bytes[offset])
					else:
						results = packet[2]((bytes[offset] << 8) | (bytes[offset+1]))

					index = 0
					for result in results:
						data[packet[3][index]] = result
						if (packet[3][index] == "distance"):
							data['d_distance'] = result
							data[packet[3][index]] = self.addDistance(result)
						if (packet[3][index] == "angle"):
							data['d_angle'] = result
							data[packet[3][index]] = self.addAngle(result)
						index = index + 1

					offset = offset + packet[1]

				if (len(self.packetRef)):
					self.packetRef[0] = data #atomic
				else:
					self.packetRef.append(data) #atomic
			except:
				print "bad data"

			self.update()

			now = datetime.now()
			elapsed = now - then
			elapsed = elapsed.seconds*1000. + elapsed.microseconds/1000.
			if (elapsed < self.create.period*1000.):
				sleep((self.create.period*1000. - elapsed)/1000.)

class Create:
	"""Wrapper class for the iRobot Create"""

	def __init__(self, tty="/dev/ttyUSB0"):
		"""constructor for the Create, takes in a single argument: the serial port"""

		self.timeout = 5
		self.period = .07
		self.runRef = []
		self.packetRef = []
		self.queueLock = Lock()
		self.queue = []
		self.distanceLock = Lock()
		self.__distance = 0
		self.angleLock = Lock()
		self.__angle = 0
		self.port = Serial(tty, 57600, timeout= self.timeout)
		self.portLock = Lock()
		self.update = lambda : ''
		self.reset()

	def start(self):
		"""Start the iCreate after initialization or reset."""
		
		self.__sendNow(128,128,132,140,1,5,64,16,69,16,74,16,72,40,69,60,141,1)
		sleep(1)
		self.send(139,10,0,255)

		monitor = Monitor(self.runRef, self.packetRef, self, self.__read, self.__sendAll, self.__addDistance, self.__addAngle, self.update)
		monitor.start()
		sleep(1.5)

	def stop(self):
		"""Stop the iCreate. Must be called before deletion of the iCreate object."""
		self.runRef.append('quit')
		sleep(1)
		rh,rl = self.__convert(0)
		lh,ll = self.__convert(0)
		self.__sendNow(145,rh,rl,lh,ll) #emergency brake
		self.__sendNow(139,0,0,255)

	def reset(self):
		"""Reset the iCreate."""
		self.runRef.append('quit')
		self.runRef = []
		sleep(1)

		self.port.flushOutput()
		self.port.flushInput()
		self.__sendNow(128,7)
		self.__read(128,True)
		#should have processed initialization
		self.port.flushInput() #ignore rest of input

	def __convert(self, num):
		return self.__highLow(self.__twos(num))

	def __highLow(self, num):
		return num >> 8, num & 0xFF

	def __twos(self, num, bits=16):
		if (num >=0):
			return num
		return 2**bits+num

	def send(self, *opcodes):
		self.queueLock.acquire()

		def lmbda():
			self.__sendNow(*opcodes)

		self.queue.append(lmbda)

		self.queueLock.release()

	def __sendNow(self, *opcodes):
		self.portLock.acquire()
		format = "B"*len(opcodes)	
		data = pack(format, *opcodes)
		self.port.write(data)
		self.portLock.release()

	def __sendAll(self):
		self.queueLock.acquire()
		
		self.__read(self.port.inWaiting())
		for send in self.queue:
			send()
		self.queue = []

		self.queueLock.release()
	
	def __read(self,num,block=False):
		self.portLock.acquire()
		if (block):
			self.port.timeout = None
		bytes = self.port.read(num)
		if (block):
			self.port.timeout = self.timeout
		self.portLock.release()
		return bytes

	def __getattr__(self,name):
		if (len(self.packetRef)):
			if (name in self.packetRef[0]):
				return self.packetRef[0][name]
		raise AttributeError, "no %s attribute" % (name)

	def __addDistance(self,num):
		self.distanceLock.acquire()
		self.__distance = self.__distance + num
		dis = self.__distance
		self.distanceLock.release()
		return dis

	def __addAngle(self,num):
		self.angleLock.acquire()
		self.__angle = self.__angle + num
		ang = self.__angle
		self.angleLock.release()
		return ang

	def clearDistance(self):
		self.distanceLock.acquire()
		self.__distance = 0
		self.distanceLock.release()

	def clearAngle(self):
		self.angleLock.acquire()
		self.__angle = 0
		self.angleLock.release()

	def clear(self):
		self.clearDistance()
		self.clearAngle()

	def __del__(self):
		self.port.close()

	def brake(self):
		"""Stops the iCreate, takes no parameters"""
		self.tank(0,0)

	def demo(self, num):
		"""Takes a single parameter, the number of the demo to begin. "Running" demo -1 will stop the demo. After using this function the iCreate must be reset.""" 
		if (num == -1):
			num = 255
		self.send(136,num)

	def leds(self,play,advance,color,intensity):
		"""Controls the LEDs. Parameters are play: boolean (play on/off), advance: boolean (advance on/off), color: 0-255 (how much red in the power light), and intensity: 0-255 (how bright should the power light be."""
		if (play):
			play = 1
		else:
			play = 0
		if (advance):
			advance = 1
		else:
			advance = 0
		bits = play << 1 | advance << 3
		self.send(139,bits,color,intensity)

	def storeSong(self, num, *song):
		"""Store a song. First parameter is the song number, the remaming arguments are taken to be of the form: note, duration, note, duration, etc. See page 12 of the iRobot Create Open Interface Manual for numerical note definitions. Duration is interpreted as duration*1/64th of a second."""
		if (len(song) > 32):
			song = song[:31]
		self.send(140,num,len(song)/2,*song)

	def playSong(self,num):
		"""Plays a song. Takes one parameter, the song number."""
		if (not  self.songPlaying):
			self.send(141,num)

	def tank(self,left,right):
		"""Drive the iCreate like a tank (i.e. left throttle, right throttle). Takes two parameters: left and right throttle. Each can be between -500 and 500 representing mm/s."""
		if (left < -500): 
			left = -500
		if (right < -500):
			right = -500
		if (left > 500):
			left = 500
		if (right > 500):
			right = 500

		lh,ll = self.__convert(left)
		rh,rl = self.__convert(right)
		self.send(145,rh,rl,lh,ll)

	def forwardTurn(self,speed,radius):
		"""Takes two parameters: speed and radius. Drives the iCreate at speed with enough of an angle that the iCreate will carve a circle with the given radius. Speed is in mm/s and can vary between -500 and 500. The radius can vary between -2000 and 2000 mm (with negative mm turning left)."""
		if (speed > 500):
			speed = 500
		if (speed < -500):
			speed = -500
		if (not (radius == 0x8000 
			or radius == 0x7FF 
			or radius == 0xFFFF 
			or radius == 0x001) 
			and 
			(radius > 2000 or radius < -2000)):
			if (radius > 2000):
				radius = 2000
			if (radius < -2000):
				radius = -2000

		vh,vl = self.__convert(speed)
		rh,rl = self.__convert(radius)
		self.send(137,vh,vl,rh,rl)

	def turn(self,speed):
		self.right(speed)

	def right(self,speed):
		"""Takes in a parameter: speed and turns clockwise in place at speed mm/s."""
		self.forwardTurn(speed,0xFFFF)

	def left(self,speed):
		"""Takes in a parameter: speed and turns counter-clockwise in place at speed mm/s."""
		self.forwardTurn(speed,0x0001)
