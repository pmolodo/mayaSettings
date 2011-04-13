'''
Header:
	Toolname:	delayedSelectionDragger
	Part:    	Main Scripts
	Made by: 	Jakob Welner
	Owner:		Jakob Welner
	
______________________________________________
Dependencies:
	OMT_to_selectionDragger.mel
______________________________________________
Description:
	Use as a press/release hotkey with following name and commands:
		
		selDragPress_delayed:
			python("import extras_delayedSelectionDragger");
			python("extras_delayedSelectionDragger.onPress(False)");
			
		selDragRelease_delayed:
			python("extras_delayedSelectionDragger.onRelease(False)");
			
	Enables sticky key with the selectionDragger on keyHold
	Enables normal selectionDragger activation on simple press
______________________________________________
Update log:
    08-06-2007: beta 0.1 by Jakob Welner
  	- Initial release
'''



import maya.cmds as mc
import time
import maya.mel as mm

###	Hold button template

delay = 0.15
QuitException = 'QuitException'

	
def onPress(userInput):
	global active
	global delay
	active = 1
	

	###	Procedure to execute when 'press'-state is reached
	pressProcedure(userInput)
	
	startTime = time.time()
	endTime = time.time()
	
	while endTime < startTime + delay:
		endTime = time.time()
	
	if __name__ == '__main__':
		prefix = ''
	else:
		prefix = __name__ + '.'
		
	mc.scriptJob(runOnce = True, idleEvent = (prefix + "onHold(" + `userInput` + ")") )
	

def onHold(userInput):
	global active
	
	if active == 1:
		###	Procedure to execute when 'hold'-state is reached
		holdProcedure(userInput)

		
def onRelease(userInput):
	global active
	active = 0
	
	###	Procedure to execute when 'release'-state is reached
	releaseProcedure(userInput)
	
	
	
	
	
##########################
###	Actual Procedures
##########################

def pressProcedure(userInput):	
	
	global hold
	hold = 0
	
	mm.eval("OMT_to_selectionDragger")
	

		
def holdProcedure(userInput):
	
	global hold
	hold = 1
		
		
		
def releaseProcedure(userInput):
	
	global hold
	
	if hold == 1:
		mm.eval("OMT_to_selectionDraggerRelease")
	
	
