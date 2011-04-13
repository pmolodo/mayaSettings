import sys

import maya.cmds as cmds

# doing a hasattr(obj, '__iter__') test will fail for objects that implement
# __getitem__, but not __iter__, so try iter(obj)
def isIterable(obj, excludedClasses=basestring):
    if isinstance(obj,excludedClasses): return False
    try:
        iter(obj)
    except TypeError: return False
    else: return True

def ensureIterable(argument, validSingleElementClasses=basestring, default=None):
    """Returns argument in a form that is guaranteed to be iterable.

    Intended for standard processing on an argument which can either be fed in
    as a single element or as a sequence.

    If argument is a member of validSingleElementClasses (which should be None,
    a class or a tuple of classes), returns a list with argument as it's only
    member.

    If argument is not a member of validSingleElementClasses and evaluates to
    False, we return an empty list, unless the 'default' argument is given,
    in which case the given default is returned (after being fed through
    ensureIterable).

    If it is not a valid single element, but iterable, return it; otherwise,
    raise an exception.

    Note that the use of validSingleElementClasses is needed in the case of
    strings - ie, where we want to accept as an argument either a string OR a
    collection of strings - because a string is itself iterable.  Also note that
    this means the check for isIterable MUST be done after checking the
    valid single element classes."""

    import operator
    
    if validSingleElementClasses is not None:
        if isinstance(validSingleElementClasses, type):
            validSingleElementClasses = (validSingleElementClasses,)
            
        for validClass in validSingleElementClasses:
            if isinstance(argument, validClass):
                #print "%s: single instance" % repr(argument)
                return [argument]
        
    if not argument:
        if default is None:
            return []
        else:
            return ensureIterable(default, validSingleElementClasses)

    if isIterable(argument):
        #print "%s: iterable" % repr(argument)
        return argument
    else:
        # found no valid classes, and wasn't iterable
        raise TypeError("argument %r, of class %s, is neither a sequence, nor a single element of class %s" % (argument, argument.__class__, validSingleElementClasses))


def freezeAndZeroPivots(objects=None, moveToPivot=True, t=True, r=True, s=True):
    if not objects:
        objects = cmds.ls(sl=1, dependencyNodes=1)
        
    validSingleElements = [basestring]
    if 'pymel' in sys.modules:
        import pymel
        validSingleElements.append(pymel.PyNode)
    
    objects = ensureIterable(objects, validSingleElements)
#    elif isinstance(objects, basestring):
#        print "A string!", objects
#        objects = [objects]
#    else:
#        print "not a string!", objects
#        print type(objects)
    if 'pymel' in sys.modules:
        import pymel
        for i, obj in enumerate(objects):
            if isinstance(obj, pymel.PyNode):
                objects[i] = str(obj)
    
    #print objects
    for object in objects:
        #print repr(object)
        if ( cmds.objectType(object, isAType='transform')
             and not cmds.objectType(object, isAType='joint')):
                if moveToPivot:
                    pivot = cmds.getAttr(object + ".transMinusRotatePivot")[0]
                    translation = cmds.xform(object, q=1, translation=1)
    
                    cmds.xform(object, translation=pivot)
    
                cmds.makeIdentity(object, apply=True, t=t, r=r, s=s)
                
                if moveToPivot:
                    cmds.xform(object, translation=(translation[0]-pivot[0], translation[1]-pivot[1], translation[2]-pivot[2]))
                cmds.xform(object, zeroTransformPivots=1)
