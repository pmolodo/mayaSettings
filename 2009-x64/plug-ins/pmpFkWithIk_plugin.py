# TODO: turn OFF inherits transform for inputnode
# TODO: check that I'm using proper contexts from MDataBlocks
# TODO: set proper readable / writable values for attribs
# TODO: make it work properly with instances (ie, get right worldMatrix)
# TODO: undo support?

# Usage:
# import maya.cmds
# maya.cmds.loadPlugin("pmpFKkWithIK_plugin.py")
# TODO: write usage
#

import maya.OpenMaya as OpenMaya
import maya.OpenMayaMPx as MPx
import sys

pluginName = "pmpFkWithIk"
dummyTransformMatrixID = OpenMaya.MTypeId(0x32000)
mouseDeltaTranslationOutputNodeID = OpenMaya.MTypeId(0x32001)
mouseDeltaTranslationInputNodeID = OpenMaya.MTypeId(0x32002)


# Due to a bug with python implementation, can't use
# default MPxTransformationMatrxi - so just make a dummy
# derived one
class DummyTransformMatrix(MPx.MPxTransformationMatrix):
	@classmethod
	def creator(cls):
		return MPx.asMPxPtr( cls() )
	nodeId = dummyTransformMatrixID

class MouseDeltaTranslationAbstractNode(MPx.MPxTransform):
	deltaTransLongName = "deltaTranslate"
	deltaTransShortName = "deltaTrans"
	deltaTrans = OpenMaya.MObject() # This will be initialized in initialize()
	nodeName = "mouseDeltaTranslationNode"
	nodeId = OpenMaya.MTypeId(0x0000) # OVERRIDE THIS!
	
	def isAbstractClass(self): return True
	
	def createTransformationMatrix(self): 
		return matrixCreator()
	
	def getDeltaTransPlug(self, child):
		#return OpenMaya.MPlug(self.thisMObject(), self.deltaTrans)
		return OpenMaya.MPlug(self.thisMObject(), self.deltaTrans[child.upper()])
	
	def getDeltaTransAttr(self, child):
		pass
	
	#def compute(self, plug, data):
		#print "in compute for plug: %s" % plug.name()
		#return MPx.MPxTransform.compute(self, plug, data)
			
	def debugPrintDeltaTrans(self):
		data = self._forceCache()
		
		# We use an output value here, even though we're reading,
		# because we don't want to trigger compute() - we just
		# want to 'peek' at it's current value for debugging...
		
		print "deltaTrans (data block):",
		for axis in "XYZ":
			print data.outputValue(self.deltaTrans[axis]).asDouble(),
		print

		# ok, so we've learned that accessing the plug triggers the compute method
		# if it's dirty...
		print "deltaTrans (from plug) :",
		#for axis in "XYZ":
		#	print self.getDeltaTransPlug(axis).asDouble(),
		print
		
	@classmethod
	def initialize(cls, readable=True, writable=True, affectsWorldSpace=False):
		print "initializing class '%s'" % cls
		
		# TODO: keep having problems with compound attributes - implement as single
		# attributes for now
		#compoundFn = OpenMaya.MFnCompoundAttribute()
		#numericFn = OpenMaya.MFnNumericAttribute()
		unitFn = OpenMaya.MFnUnitAttribute()
		keyable = True
		channelBox = True
		storable = False
		
		# TODO: comment out these lines (used for debugging, so it shows in channel box)
		readable=True
		writable=True
		
		children = {}
		#cls.deltaTrans = compoundFn.create(cls.deltaTransLongName, cls.deltaTransShortName)
		for axis in 'XYZ':
			children[axis] = unitFn.create(cls.deltaTransLongName + axis,
								cls.deltaTransShortName + axis, unitFn.kDistance, 0)
			
			unitFn.setKeyable(keyable)
			unitFn.setChannelBox(channelBox)
			unitFn.setReadable(readable)
			unitFn.setWritable(writable)
			unitFn.setStorable(storable)
			if affectsWorldSpace:
				unitFn.setAffectsWorldSpace(True)
				cls.mustCallValidateAndSet(children[axis])
			
			# make sure this and the compound attribute are not BOTH added
			cls.addAttribute(children[axis])

		cls.deltaTrans = children
		
		#cls.deltaTrans = numericFn.create(cls.deltaTransLongName, cls.deltaTransShortName,
		#								children['X'], children['Y'], children['Z'])
#		numericFn.setKeyable(keyable)
#		numericFn.setChannelBox(channelBox)
#		numericFn.setReadable(readable)
#		numericFn.setWritable(writable)
#		numericFn.setStorable(storable)
		
		# make sure this and the children attributes are not BOTH added
		# cls.addAttribute(cls.deltaTrans)
		#cls.mustCallValidateAndSet(cls.deltaTrans)
		return
		
	@classmethod
	def creator(cls):
		return MPx.asMPxPtr(cls())
		
	@classmethod
	def addSuffixToNodeName(cls, suffix):
		standardSuffix = "Node"
		if cls.nodeName.lower().endswith(standardSuffix.lower()):
			return cls.nodeName[:-len(standardSuffix)] + suffix + standardSuffix
		else:
			return cls.nodeName + suffix

	@classmethod
	def register(cls, mplugin):
		try:
			mplugin.registerTransform( cls.nodeName, cls.nodeId,
									cls.creator, cls.initialize,
									DummyTransformMatrix.creator,
									DummyTransformMatrix.nodeId)
		except:
			sys.stderr.write( "Error while registering transform: %s\n" % cls.nodeName )
			raise

	@classmethod
	def unregister(cls, mplugin):
		try:
			mplugin.deregisterNode( cls.nodeId )
		except:
			sys.stderr.write( "Error while unregistering transform: %s\n" % cls.nodeName )
			raise	

						
class MouseDeltaTranslationOutputNode(MouseDeltaTranslationAbstractNode):
	deltaTransLongName = MouseDeltaTranslationAbstractNode.deltaTransLongName + "Output"
	deltaTransShortName = MouseDeltaTranslationAbstractNode.deltaTransShortName + "Out"
	nodeName = MouseDeltaTranslationAbstractNode.addSuffixToNodeName("Output")
	nodeId = mouseDeltaTranslationOutputNodeID
	def isAbstractClass(self): return False

	
	@classmethod
	def initialize(cls):
		super(MouseDeltaTranslationOutputNode, cls).initialize(writable=False)

	def applyTranslationLocks(self, newTrans, savedTrans):
		"""Use locking to make sure object does not actually move, but the mouse delta movements are stored in deltaTrans."""
		#print "setting translation locks for %s" % self.name()
		delta = newTrans - savedTrans

#		print "old values for deltaTrans:"
#		self.debugPrintDeltaTrans()
#		print
			
		dist = OpenMaya.MDistance()
		dist.setUnit(OpenMaya.MDistance.internalUnit())
		for axis in "XYZ":
			child = self.getDeltaTransPlug(axis)
			#print child.name()
			#print "is a unit attribute?: %s" % child.attribute().hasFn(OpenMaya.MFn.kUnitAttribute)

			dist.setValue(getattr(delta, axis.lower()) + child.asDouble())
			child.setMDistance(dist)
			# child.setDouble(delta[i])
			
#		print "new values for deltaTrans:"
#		self.debugPrintDeltaTrans()
#		print
		
		return savedTrans

#	def applyTranslationLimits(self, 


class MouseDeltaTranslationInputNode(MouseDeltaTranslationAbstractNode):
	deltaTransLongName = MouseDeltaTranslationAbstractNode.deltaTransLongName + "Input"
	deltaTransShortName = MouseDeltaTranslationAbstractNode.deltaTransShortName + "In"
	nodeName = MouseDeltaTranslationAbstractNode.addSuffixToNodeName("Input")
	nodeId = mouseDeltaTranslationInputNodeID
	def isAbstractClass(self): return False

	@classmethod
	def initialize(cls):
		return super(MouseDeltaTranslationInputNode, cls).initialize(readable=False, affectsWorldSpace=True)
#		print "calling: %s.%s(%s)" % (cls.__name__, cls.mustCallValidateAndSet.__name__, cls.deltaTrans)
#		cls.mustCallValidateAndSet(cls.deltaTrans)
#		OpenMaya.MFnAttribute(cls.deltaTrans).setAffectsWorldSpace(True)
				
	def validateAndSetValue(self, plug, handle, context):
		#print "validating: %s" % plug.name()
		#if plug.isChild() and plug.parent() == self.deltaTrans:
		if plug in self.deltaTrans.values():
			#print "plug was a deltaTrans..."

			self.updateMatrixAttrs(context)
			dataBlock = self._forceCache(context)
						
			# first, update internal value, and set clean for THIS plug...
			cacheHandle = dataBlock.outputValue(plug)
			value = handle.asDouble()
			cacheHandle.setDouble(value)
			handle.setClean()
			#print "cleaned original handle..."

			# ...THEN, get values for all plugs, and translate the node
			# by updating cached value / setting clean FIRST, this ensures
			# we do not have an infinite loop...

			if value != 0:
				vector = OpenMaya.MVector(0,0,0)
				for axis in "XYZ":
					plug = self.getDeltaTransPlug(axis)
					handle = dataBlock.inputValue(plug)
					value = handle.asDouble()
					
					connections = OpenMaya.MPlugArray()
					isConnected = plug.connectedTo(connections, True, False)
					if isConnected:
						sourcePlug = connections[0]
						sourceNode = sourcePlug.node()
						try:
							dagPath = OpenMaya.MDagPath()
							dagPath.getAPathTo(sourceNode, dagPath)
						except:
							pass
						else:
							if not dagPath.isValid():
								#print "unable to get a dag path for %s" % transFn.name()
								pass
							else:
								#print "got dagPath: %s" % dagPath.fullPathName()
								transFn = OpenMaya.MFnTransform(dagPath)
								#print "trying to grab world matrix from: %s" % transFn.fullPathName()
								try:
									worldMatrixPlug = transFn.findPlug("worldMatrix")
									worldMatrixPlug.evaluateNumElements()
									#print "world matrix plug info: %s" % worldMatrixPlug.info()
									#print "isArray?: %s" % worldMatrixPlug.isArray()
									#print "numElements: %d" % worldMatrixPlug.numElements()
									worldMatrixPlug = worldMatrixPlug.elementByPhysicalIndex(0)
									#print "world matrix plug info: %s" % worldMatrixPlug.info()
									worldMatrix = worldMatrixPlug.asMObject()
								except:
									#print "no world matrix found..."
									pass
								else:
									#print "succeeded!"
									
									worldMatrix = OpenMaya.MFnMatrixData(worldMatrix)
									self.resetTransformation(worldMatrix.matrix())
									axis = plug.name()[-1]
									vector = getattr(OpenMaya.MVector, axis.lower() + "Axis") * value + vector
									#self.translateBy(OpenMaya.MVector(.1,.1,.1), OpenMaya.MSpace.kTransform)
									handle.setClean()
									sourcePlug.setDouble(0)
				#print "got vector: (%f, %f, %f)" % (vector[0], vector[1], vector[2])
				if vector != OpenMaya.MVector.zero:
					self.translateBy(vector, OpenMaya.MSpace.kTransform)
			return

		return MouseDeltaTranslationAbstractNode.validateAndSetValue(self, plug, handle, context)

def plugEqualOrParent(plugChild, plugParent):
	"""Return True if plugChild == plugParent, or if plugParent is a direct/indirect parent of plugChild."""
	if plugChild.isNull() or plugParent.isNull(): return False
	if plugChild==plugParent: return True
	elif not plugChild.isChild(): return False
	else: return plugEqualOrParent(plugChild.parent(), plugParent)

# plugin initialization funcs

#def getPlugType(plug):
#	mfnType = ""
#	attrib = child.attribute()
#	if(attrib.hasFn(OpenMaya.MFn.kNumericAttribute)):
#		mfnType = ""
#		attrib = OpenMaya.MFnNumericAttribute(attrib)
#		if attrib.unitType() == 	

def initializePlugin(mobject):
	print "initializing..."
	mplugin = MPx.MFnPlugin(mobject)
	MouseDeltaTranslationOutputNode.register(mplugin)
	MouseDeltaTranslationInputNode.register(mplugin)

def uninitializePlugin(mobject):
	mplugin = MPx.MFnPlugin(mobject)
	MouseDeltaTranslationOutputNode.unregister(mplugin)
	MouseDeltaTranslationInputNode.unregister(mplugin)
