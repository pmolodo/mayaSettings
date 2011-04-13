import maya.cmds as mc
#import maya.utils as mu

def zenStringArrayRemove( removeList, stringList ):
		
	for string in removeList:
		for i in range( 0, len(stringList)-1 ):
			if(stringList[i]==string):
				stringList.pop(i)
	
	return stringList

def zenVertDistanceList( vert, stopVert ):
	
	obj = mc.ls( vert, o=True )[0]
	vertCount = mc.polyEvaluate( obj, v=True )
	vertices = [ vert ]
	estimate = 25
	returnStrings=[]
		
	mc.progressWindow( ii=1, title="Working", status="Sorting", max=estimate, progress=0 )

	for i in range( 0, vertCount ):
		
		tempArray = mc.ls( vertices,fl=True )
		vertices = mc.polyListComponentConversion( vertices, te=True )
		vertices = mc.polyListComponentConversion( vertices, tv=True )
		flattenedListVerts=mc.ls( vertices, fl=True )
		tempArray=zenStringArrayRemove( tempArray,flattenedListVerts )
		tempArray=mc.polyListComponentConversion( tempArray, fv=True, tv=True )
		returnStrings.append( tempArray )
		
		if( stopVert in flattenedListVerts ): break
		
		mc.progressWindow( e=True, s=1 );
		
		if( mc.progressWindow( q=True, ic=True) ):
			
			mc.progressWindow(ep=True)
			mc.error("User Interupt.")				
		
		if( mc.progressWindow( q=True, progress=True ) >= mc.progressWindow( q=True, max=True ) ):

			mc.progressWindow( ep=True )
			mc.progressWindow( progress=0 )
	
	mc.progressWindow( endProgress=True )
					
	return	returnStrings

def zenShortestVertexPath( vertA, vertB ):
	
	obj = mc.ls( vertA, o=True )
	vertCount = mc.polyEvaluate( obj, v=True  )
	vertPath = [vertA]
	vert = vertA
	distanceList = zenVertDistanceList( vertB,vertA )
	sizeList = len( distanceList )
	
	intersector = mc.stringArrayIntersector()
	
	for i in range( 1, sizeList ):
	
		tempArray = distanceList[ sizeList-i-1 ]
		tempArray=mc.ls( tempArray, fl=True )
		vertices= mc.polyListComponentConversion( vert, te=True )
		vertices=mc.polyListComponentConversion( vertices, tv=True )
		vertices=mc.ls( vertices, fl=True )
		tempA=[vert]
		vertices=zenStringArrayRemove( tempA , vertices )
		
		mc.stringArrayIntersector( intersector, e=True, r=True )
		mc.stringArrayIntersector( intersector, e=True, i=vertices )
		mc.stringArrayIntersector( intersector, e=True, i=tempArray )
		
		vertTempArray=mc.stringArrayIntersector( intersector, q=True )
		
		vert=vertTempArray[0]
		
		vertPath.append( vert )
					
	mc.deleteUI( intersector )
		
	vertPath.append( vertB )
		
	return	vertPath
