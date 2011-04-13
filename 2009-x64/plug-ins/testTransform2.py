import maya.OpenMaya as OpenMaya
import maya.OpenMayaMPx as MPx
import sys

pluginName = "testTransform"
testTransformNodeName = pluginName + "TransformNode"
testTransformNodeID = OpenMaya.MTypeId(0x8)


class TestTransformNode(MPx.MPxTransform):
	def compute(self, plug, data):
		import maya.OpenMaya as OpenMaya
		print "In compute func for: %s" % plug.name()
		return super(TestTransformNode, self).compute(plug, data)
	
	def createTransformationMatrix(self): 
		return MPx.asMPxPtr( TestTransformMatrix() )
	
	def applyTranslationLocks(self, newTrans, savedTrans):
		print "Hey, translation is locked!"
		return savedTrans
	
testTransformMatrixID = OpenMaya.MTypeId(0x9)
class TestTransformMatrix(MPx.MPxTransformationMatrix):
	pass
		
# plugin initialization funcs
def matrixCreator():
	return MPx.asMPxPtr( TestTransformMatrix() )

def nodeCreator():
	return MPx.asMPxPtr( TestTransformNode() )

def nodeInitializer():
	return
	
def initializePlugin(mobject):
	mplugin = MPx.MFnPlugin(mobject)
	try:
		mplugin.registerTransform( testTransformNodeName, testTransformNodeID, \
								nodeCreator, nodeInitializer, matrixCreator, testTransformMatrixID)
	except:
		sys.stderr.write( "Error while registering transform: %s\n" % testTransformNodeName )
		raise

def uninitializePlugin(mobject):
	mplugin = MPx.MFnPlugin(mobject)
	try:
		mplugin.deregisterNode( testTransformNodeID )
	except:
		sys.stderr.write( "Error while unregistering transform: %s\n" % testTransformNodeName )
		raise	
