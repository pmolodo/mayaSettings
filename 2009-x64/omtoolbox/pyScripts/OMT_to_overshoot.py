'''
Header:
	Toolname:	OMT_to_overshoot.py
	Part:		Main Script
	Made By:	Jakob Welner
	Owner:		Jakob Welner
	
______________________________________________
Update Log:
  xx-xx-xxxx: v0.1 by Jakob Welner
  	- First version
	
______________________________________________
Todo:
	Generel:	Fix names
	
______________________________________________
Description:
	Select objects (maybe also animation curves or single attributes)
	set either previous- or next key, or a specific frame number from where to base calculations
	slider will now setAttr on all active attributes according to difference between attributes values on current frame compared
	to the given frame or key.
	The difference is multiplied by the dragger delta value to either slide towards the pose on the given frame/key or exaggerate it.
______________________________________________
'''




import maya.cmds as mc
import maya.mel as mm

QuitException = "QuitException"



def overshoot_OnPress():
	global gPrevPoint
	
	mc.undoInfo( swf = 0 )
	gPrevPoint = mc.draggerContext( "overshootCtx", query=True, anchorPoint=True)
	
	


def overshoot_OnDrag():
	global gPrevPoint
	global attrDict
	global deltaX
	global lastVal
	
	dragPosition = mc.draggerContext( 'overshootCtx', query=True, dragPoint=True)
	deltaX = lastVal + dragPosition[0] - gPrevPoint[0]
	
	#print "delta: ", deltaX
	#print "lastVal: ", lastVal
	
	#button = mc.draggerContext( 'overshootCtx', query=True, button=True)
	#modifier = mc.draggerContext( 'overshootCtx', query=True, modifier=True)
	
	
	#print "setAttr on: ", selList
	for attr in attrDict:
		mc.setAttr(attr, (attrDict[attr][0] + attrDict[attr][1] * deltaX * 0.008) )
	
	mc.refresh(currentView=True)
	

	
	
def overshoot_EndDrag():
	
	global attrDict
	global deltaX
	global lastVal
	
	savedVals = {}
	
	###	saves new position of dragged objects and returns them to their last position
	for attr in attrDict:
		savedVals[attr] = mc.getAttr(attr)
	
	###	VERY important that this gets executed!
	mc.undoInfo( swf = 1)
	
	
	###	move back to new saved position
	for attr in savedVals:
		mc.setAttr( attr, savedVals[attr] )

	lastVal = deltaX
	
	
	
	
	

def overshoot(baseFrame='previous'):
	'''Input kan either be 'previous','next' or an integer'''
	
	global attrDict
	global deltaX
	global lastVal
	deltaX = 0
	lastVal = 0
	
	print "# Initializing drag"
	
	selList = mc.ls(sl=True)
	
	try:
		###	Checking userInput
		if baseFrame != 'previous' and baseFrame != 'next' and type(baseFrame) != type(123):
			raise QuitException, "# init >> Input is incorrect. Only supported inputs are 'previous', 'next' or an integer"
	
		###	Checking selection
		if selList != None:
			attrDict = calcAttrDiff(selList, baseFrame)
		else:
			raise QuitException, "# Init >> Nothing is selected"
			
		###	Initializing context
		if mc.draggerContext( 'overshootCtx', exists=True ) == 0:
			mc.draggerContext( "overshootCtx" )
			
		
		###	Checking script file name (execution namespace)
		if __name__ != '__main__':
			prefix = __name__ + '.'
		else:
			prefix = ''
			
		mc.draggerContext( 
			'overshootCtx', 
			edit=True,
			pressCommand= prefix + 'overshoot_OnPress()', 
			dragCommand= prefix + 'overshoot_OnDrag()', 
			releaseCommand= prefix + 'overshoot_EndDrag()',
			cursor='crossHair' 
			);
			
			
		mm.eval('storeLastAction( "restoreLastContext " + `currentCtx` )')
		mc.setToolTo( 'overshootCtx' )
		
	except QuitException, arg:
		print "### Tool terminated ###"
		if arg != None:
			print arg,
	
	
			
			
	
def calcAttrDiff(objList, baseFrame):
	
	currentTime = mc.currentTime(q=True)
	returnDict = {}

	###	get last key for whole object
	if baseFrame == 'previous':
		frameNr = mc.findKeyframe(objList, which="previous")
	elif baseFrame == 'next':
		frameNr = mc.findKeyframe(objList, which="next")
	elif type(baseFrame) == type(123):
		frameNr = baseFrame
	
	if frameNr == currentTime:
		#print baseFrame, " on obj ", obj, " equals currentTime. No multiplying possible. Skipping obj"
		raise QuitException, "# calcObjMult >> Frame number equels current frame. Terminating..."
	else:
		print "Basing calculations on frame ", frameNr
	
	for obj in objList:
		###	get keyable attr
		attrList = mc.listAttr(obj, unlocked=True, keyable=True, visible=True, scalar=True, multi=True)

		for attr in attrList:
			baseVal = mc.getAttr(obj + '.' + attr, time=frameNr)
			curVal = mc.getAttr(obj + '.' + attr, time=currentTime)
			
			diff = curVal - baseVal
			if diff > 0.001 or diff < -0.001:
				returnDict[obj + '.' + attr] = [curVal, diff]
			else:
				pass
				#print "Difference in base- and current value is less than 0.1: (", diff, ") Skipping attr: ", obj + '.' + attr
				
				
	return returnDict


