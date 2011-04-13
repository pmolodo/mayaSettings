from maya.cmds import *
from __builtin__ import *

global proc PMP_replaceShape(string $newShape, string $oldShape)
{
    string $shortShapeName = _realShortNameOf($newShape);

    //print("Called: PMP_replaceShape(" + $newShape + ", " + $oldShape + ")\n\n");
    $oldShape = _getShapeFromShapeOrTransform($oldShape);
    $newShape = _getShapeFromShapeOrTransform($newShape);

    // First check to see if the two already are the same shape
    if(_isSameInstance($newShape, $oldShape)) return;
    
    // If there is an instancing hierarchy, (ie, an instance of an instance),
    // multiple instances may be replaced with each go, so we need to
    // store a reference to the actual node (not just a string), and continue
    // until it is no longer in the scene.
    string $attrName = "PMP_replaceShape_toReplace";
    _addAttrIfNeeded($newShape, $attrName, " -at message ");
    connectAttr -force ($oldShape + ".msg") ($newShape + "." + $attrName);

    string $oldShapeInstances[];
    string $parent;
    string $tempArray[];

    while(`connectionInfo -isDestination ($newShape + "." + $attrName)`)
    {
        $oldShape = plugNode(`connectionInfo -sourceFromDestination ($newShape + "." + $attrName)`);
        // print("Calling:\n" +
        //     "$oldShapeInstances = `ls -long -allPaths " + $oldShape + "\n\n");
        $oldShapeInstances = `ls -long -allPaths $oldShape`;

        // print("Calling:\n" +
        //     "$parent = `firstParentOf(" + $oldShapeInstances[0] + ")`\n\n");
        $parent = `firstParentOf($oldShapeInstances[0])`;

        // print("Calling:\n" +
        //       "parent -add -r -shape " + $newShape + " " + $parent + "\n\n");
        $tempArray = `parent -add -r -shape $newShape $parent`;
        $newShape = $tempArray[0];
            
        parent -shape -removeObject ($oldShapeInstances[0]);

        $newShape = `rename $newShape $shortShapeName`;
    }
   
    deleteAttr ($newShape + "." + $attrName);
}

def getChildren(obj, **kwargs ):
    """
    see also `childAtIndex`
    
    :rtype: `DagNode` list
    """
    kwargs['children'] = True
    kwargs.pop('c',None)

    return listRelatives( obj, **kwargs)

def getShape(obj, **kwargs ):
    """
    :rtype: `DagNode`
    """
    kwargs['shapes'] = True
    try:
        return getChildren(obj, **kwargs )[0]            
    except IndexError:
        pass

def PM_replaceShapes(nodes=None):
    if nodes is None:
        nodes = ls(sl=1)
    
    if not nodes or len(nodes) < 2:
        raise ValueError("Error - select the NEW shape you wish to use, then select at least one shape you wish to replace.")
    
    newShape = getShape(nodes[0])
    toReplace = [getShape(x) for x in nodes[1:]
    
// First select the NEW shape, then select any shapes you wish to replace
global proc PMP_replaceShapes()
{
    string $selection[] = `ls -long -sl`;

    if(size($selection) < 2) error();

    string $newShape = _getShapeFromShapeOrTransform($selection[0]);
    stringArrayRemoveAtIndex(0, $selection);

    string $toReplace[] = _getUniqueShapes($selection);
    int $numToReplace = size($toReplace);
    progressWindow -title "Setting new weights..." -isInterruptable true -max $numToReplace;
    string $oldShape;
    int $i;
    for($i = 0; $i < $numToReplace; ++$i)
    {
        $oldShape = $toReplace[$i];
        if(`progressWindow -query -isCancelled`) break;
        progressWindow -edit -progress $i
            -status ("Setting Vert: (" + $i + " of " + $numToReplace + ")");
        PMP_replaceShape($newShape, $oldShape);
    }
    progressWindow -endProgress;
}
