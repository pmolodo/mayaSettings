#########################################################
###									
###				Open Maya Tool header	
###
###  FILENAME:	OMT_to_toggleCulling.py	
###  AUTHOR: 	Jakob Welner (jakob@welner.dk)
###									
###  UDTATE LOG:
###  14th of march: 1.00 by Jakob Welner
###  - Created
###				
###  DEPENDENCIES:
###   	None	
###				
###  PURPOSE & USE:
###	Toggles backface culling on an off on selected polygons
###

import maya.cmds as mc

def toggleCulling():
	counter = 0
	objList = []
	sel = mc.ls(sl=True)
	
	if sel != None:
		for s in sel:
			if s.count('.') > 0:
				objList.append(s.split('.')[0])
				
			else:
				objList.append(s)

			#	Remove duplicates
			objSet = set(objList)

		for obj in objSet:
			if mc.objExists(obj + '.backfaceCulling'):
				counter += 1
				
				if mc.getAttr(obj + '.backfaceCulling') == 0:
					mc.setAttr(obj + ".backfaceCulling", 3)
					
				else:
					mc.setAttr(obj + ".backfaceCulling", 0)
					
		if counter == 0:
			print 'No backface culling available for selected objects'
			
	else:
		print 'need to select some objects',
