import maya.OpenMaya as OpenMaya
import maya.OpenMayaMPx as MPx
import sys

pluginName = "testTransform"
testTransformNodeName = pluginName + "TransformNode"
testTransformNodeID = OpenMaya.MTypeId(0x8)

class TestTransformNode(MPx.MPxTransform):
	def createTransformationMatrix(self): 
		return MPx.asMPxPtr( TestTransformMatrix() )
	
	def applyTranslationLocks(self, newTrans, savedTrans):
		print "Hey, translation is locked!"
		return savedTrans

	
testTransformMatrixID = OpenMaya.MTypeId(0x9)
class TestTransformMatrix(MPx.MPxTransformationMatrix):
	pass

class TestTransformNode2(TestTransformNode):
        pass
testTransform2NodeName = pluginName + "TransformNode2"
testTransformNode2ID = OpenMaya.MTypeId(0xA)


# plugin initialization funcs
def matrixCreator():
	return MPx.asMPxPtr( TestTransformMatrix() )

def nodeCreator():
	return MPx.asMPxPtr( TestTransformNode() )

def node2Creator():
	return MPx.asMPxPtr( TestTransformNode2() )

def nodeInitializer():
	return

def nodeInitializer2():
	return


def initializePlugin(mobject):
	mplugin = MPx.MFnPlugin(mobject)
	try:
		mplugin.registerTransform( testTransformNodeName, testTransformNodeID, \
								nodeCreator, nodeInitializer, matrixCreator, testTransformMatrixID)
		mplugin.registerTransform( testTransform2NodeName, testTransformNode2ID, \
								node2Creator, nodeInitializer2, matrixCreator, testTransformMatrixID)
	except:
		sys.stderr.write( "Error while registering transform: %s\n" % testTransformNodeName )
		raise

def uninitializePlugin(mobject):
	mplugin = MPx.MFnPlugin(mobject)
	try:
		mplugin.deregisterNode( testTransformNodeID )
                mplugin.deregisterNode( testTransformNode2ID )
	except:
		sys.stderr.write( "Error while unregistering transform: %s\n" % testTransformNodeName )
		raise	
