import unittest
from PMP.maya.rigging.IKFK import *

from pymel import *

def reloadPlugin(pluginName):
        unloadPlugin(pluginName)
        loadPlugin(pluginIname)

def unloadPlugin(pluginName):
	if not cmds.pluginInfo(pluginName, q=True, loaded=True): return
	for nodeType in pluginInfo(pluginName, dependNode=True, q=True):
		nodes = ls(type=nodeType) 
		if nodes:
			cmds.delete(nodes)
	cmds.flushUndo()
	cmds.unloadPlugin(pluginName)

def delIfExists(*objlist):
	for obj in objlist:
		if objExists(obj): cmds.delete(obj)

def setupIKArm():
	shoulder = joint(p=(-1, 0, 0), name='shoulderJoint')
	joint(p=(0, 1, 0), name='elbowJoint')
	joint('shoulderJoint', e=1, zso=1, oj='xyz', sao='yup')
	joint(p=(1, 0, 0), name='wristJoint')
	joint('elbowJoint', e=1, zso=1, oj='xyz', sao='yup')
	select('shoulderJoint.rotatePivot', 'wristJoint.rotatePivot', r=1)
	myIkHandle, myIkEff = ikHandle(startJoint='shoulderJoint', name='ikHandle1')
	polePos = calcPoleVector('wristJoint')
	poleVector, sphereShapeMaker = sphere(name='poleVector', radius = .1)
	poleVector.translate.set(polePos)
	poleVectorConstraint(poleVector, myIkHandle) 

	cubeTransform, cubeShapeMaker = polyCube(name='controllerCube')
	sphereTransform, sphereShapeMaker = sphere(name = 'controlledSphere', radius = .25)
	
	controller = createNode('mouseDeltaTranslationOutputNode', name='controller')
	controlled = createNode('mouseDeltaTranslationInputNode', name='controlled')
	parent(cubeTransform, controller)
	parent(sphereTransform, controlled)
	select(controller, controlled, r=True)
	newGroup = group(name='controlGroup')
	parent(newGroup, myIkHandle, r=True)
	parent(controlled, world=True)
	parent(controller, "wristJoint")
	parent(myIkHandle, controlled)
	connectAttr('controller.deltaTranslateOutputX', 'controlled.deltaTranslateInputX')
	connectAttr('controller.deltaTranslateOutputY', 'controlled.deltaTranslateInputY')
	connectAttr('controller.deltaTranslateOutputZ', 'controlled.deltaTranslateInputZ')
#	connectAttr('controllerCube.translateX', 'controlled.deltaTranslateInputX')
#	connectAttr('controllerCube.translateY', 'controlled.deltaTranslateInputY')
#	connectAttr('controllerCube.translateZ', 'controlled.deltaTranslateInputZ')
	select(controller)
	viewFit()

def createRockingTransform():
	rocker = createNode('spRockingTransform', name='rocker')
	rockedCube, cubeShapeMaker = polyCube(name='rockedCube')
	parent(rockedCube, rocker)
	rockerDriver, sphereShapeMaker = sphere(name='rockerDriver')
	connectAttr(rockerDriver + '.translateX', rocker + '.RockInX')
	

def getPlugsAttrs():
	global  transAttr,  transPlug,  transXAttr,  transXPlug, \
	       dtransAttr, dtransPlug, dtransXAttr, dtransXPlug, \
	       testdist
	
	def _getPlugAndAttr(attrName):
		plug = Attribute(attrName).__apimplug__()
		return (plug, plug.attribute())
	
	node = 'controller'
	transPlug, transAttr  = _getPlugAndAttr(node + ".translate")
	transXPlug, transXAttr = _getPlugAndAttr(node + ".translateX")
	#dtransPlug, dtransAttr  = _getPlugAndAttr(node + ".deltaTranslateOutput")
	dtransXPlug, dtransXAttr = _getPlugAndAttr(node + ".deltaTranslateOutputX")
	
	testdist = api.MDistance()
	testdist.setUnit(api.MDistance.internalUnit())
	testdist.setValue(3)

def testIsIkWithFkControl():
	attrName = "isFkWithIkControl"
	cube1, shapeMaker = polyCube()
	
	cube2 = duplicate(cube1)[0]
	cmds.move(2, 0, 0, cube2, relative=True)
	addAttr(cube2, ln=attrName, at='double')
	cube3 = duplicate(cube2)[0]
	cmds.move(2, 0, 0, cube3, relative=True)
	cube3.attr(attrName).set(3)
	
	cube4 = duplicate(cube1)[0]
	cmds.move(6, 0, 0, cube4, relative=True)
	addAttr(cube4, ln=attrName, at='bool')
	cube5 = duplicate(cube4)[0]
	cmds.move(2, 0, 0, cube5, relative=True)
	cube5.attr(attrName).set(1)
	
	cube6 = duplicate(cube1)[0]
	cmds.move(10, 0, 0, cube6, relative=True)
	addAttr(cube6, ln=attrName, dt='string')
	cube7 = duplicate(cube6)[0]
	cmds.move(2, 0, 0, cube7, relative=True)
	cube7.attr(attrName).set("foo")
	
	for x in cmds.ls(type='transform'):
		print "%s is FkWithIk: %s" % (x, isFkWithIkControl(x))

cmds.file(f=True,new=True)	
#testIsIkWithFkControl()
#unload('pmpFkWithIk_plugin')
#unload('rockingTransform')
##loadPlugin("rockingTransform.py")
##createRockingTransform()
#loadPlugin("pmpFkWithIk_plugin.py")
setupIKArm()
#getPlugsAttrs()

