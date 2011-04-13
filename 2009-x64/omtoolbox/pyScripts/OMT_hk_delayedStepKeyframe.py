'''
Header:
	Toolname:	delayedStepKeyframe
	Part:    	Main Scripts
	Made by: 	Jakob Welner
	Owner:		Jakob Welner
	
______________________________________________
Description:
	Use as a press/release hotkey with following name and commands:
		
	On press: step to next/previous key
	On hold: playback animation as "pley every frame"
		
	How to set up:
	Hotkey for forward step/playback
	
		nextKeyPress_delayed:
			python("import extras_delayedStepKeyframe");
			python("extras_delayedStepKeyframe.onPress(True)");
			
		nextKeyRelease_delayed: 
			python("extras_delayedStepKeyframe.onRelease(True)");
			
	Hotkey for backwards step/playback
	
		prevKeyPress_delayed:
			python("import extras_delayedStepKeyframe");
			python("extras_delayedStepKeyframe.onPress(False)");
			
		prevKeyRelease_delayed:
			python("extras_delayedStepKeyframe.onRelease(False)");
			
______________________________________________
Update log:
  xx-xx-xxxx: beta 0.2 by Jakob Welner
  	- Plays back animation with "Play Every Frame" on keyhold
	- New description
	
  04-06-2007: beta 0.1 by Jakob Welner
  	- Initial release
'''



import maya.cmds as mc
import time

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
	
	global initPlaybackSpeed
	initPlaybackSpeed = mc.playbackOptions(q=True, playbackSpeed=True)
	
	
	if userInput  == True:
		mc.currentTime(mc.findKeyframe(timeSlider=True, which="next"), edit=True)
	elif userInput == False:
		mc.currentTime(mc.findKeyframe(timeSlider=True, which="previous"), edit=True)
	else:
		raise QuitException, "# pressProcedure >> Wrong input: " + `userInput`
	

		
def holdProcedure(userInput):
	
	global initPlaybackSpeed
	mc.playbackOptions(playbackSpeed = 0)
	
	
	if userInput == True:
		mc.play( forward = True )
	elif userInput == False:
		mc.play( forward = False )
		
		
		
def releaseProcedure(userInput):
	
	global initPlaybackSpeed
	
	mc.play( state = False)
	
	mc.playbackOptions(playbackSpeed = initPlaybackSpeed)
	
	
