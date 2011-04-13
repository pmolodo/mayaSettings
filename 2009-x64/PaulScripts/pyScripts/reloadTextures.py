import string
import os
import os.path
import re
import sys

import maya.cmds as cmds
import maya.mel as mel

shadingEngineMaterialPorts = ("surfaceShader",
                        "volumeShader",
                        "displacementShader",
                        "miMaterialShader",
                        "miVolumeShader",
                        "miPhotonShader",
                        "miPhotonVolumeShader",
                        "miContourShader",
                        "miDisplacementShader",
                        "miEnvironmentShader",
                        "miLightMapShader",
                        "miShadowShader",
                        "imageShader")


def ensureIterable_nonMaya(argument, validSingleElementClasses = basestring, default=None):
    """Returns argument in a form that is guaranteed to be iterable.

    Intended for standard processing on an argument which can either be fed in
    as a single element or as a sequence.

    If argument is "None" we return an empty list, unless the 'default' argument
    is given, in which case the given default is returned (after being fed
    through ensureIterable, of course).

    If argument is not None, check to see if argument's class is a member of
    validSingleElementClasses (which should be None, a class or a tuple of
    classes), and if so, return a list with argument as it's only member; if it
    is not a valid single element, check to see if it is iterable; if so, return
    it, otherwise, raise an exception.

    Note that the use of validSingleElementClasses is needed in the case of
    strings - ie, where we want to accept as an argument either a string OR a
    collection of strings - because a string is itself iterable.  Also note that
    this means the check for isSequenceType MUST be done after checking the
    valid single element classes."""

    import operator
    
    if argument is None:
        if default is None:
            return []
        else:
            return ensureIterable_nonMaya(default, validSingleElementClasses)

    if validSingleElementClasses is not None:
        if isinstance(validSingleElementClasses, type):
            validSingleElementClasses = (validSingleElementClasses,)
            
        for validClass in validSingleElementClasses:
            if isinstance(argument, validClass):
                #print "%s: single instance" % repr(argument)
                return [argument]

    if(operator.isSequenceType(argument)):
        #print "%s: iterable" % repr(argument)
        return argument

    else:
        # found no valid classes, and wasn't iterable
        raise TypeError("argument %r, of class %s, is neither a sequence, nor a single element of class %s" % (argument, argument.__class__, validSingleElementClasses))

def ensureIterable(argument, validSingleElementClasses = basestring, default=None):
    validSingleElementClasses = ensureIterable_nonMaya(validSingleElementClasses, validSingleElementClasses=type)
    
    if 'pymel' in sys.modules:
        import pymel
        
        for validSingle in validSingleElementClasses:
            if issubclass(validSingle, basestring):
                validSingleElementClasses.append(pymel.PyNode)
                break
    return ensureIterable_nonMaya(argument, validSingleElementClasses=validSingleElementClasses, default=default)

def ensureIterable_defaultToSelection(argument, validSingleElementClasses = basestring):
    """Returns an argument that is guaranteed to be iterable (unless
    validSingleElementClasses is given - see PMP.pyUtils.ensureIterable) - if
    the argument is None, return the current selection."""
    return ensureIterable(argument, validSingleElementClasses, default=cmds.ls( selection=True, long=True))

def ensureIterableType(argument, type, validSingleElementClasses=basestring, default=None):
    """Like ensureIterable, with the additional caveat that it ensures that all
    elements returned are strings naming nodes of the given type."""
    return [element for element in ensureIterable(argument, validSingleElementClasses, default) if isATypeOf(element, type)]

def isATypeOf(node, type):
    """Returns true if node is of the given type, or inherits from it."""
    if isinstance(node, basestring) and cmds.objExists(node):
        return type in cmds.nodeType(node, inherited=True)
    else:
        return False

def getShapes(shapesOrTransforms):
    """Given a list of names (or a single name) of shapes and transforms,
    returns a list of all the shapes given or children of the given
    transforms."""
    shapesOrTransforms = ensureIterable(shapesOrTransforms, basestring)

    shapes = []
    for item in shapesOrTransforms:
        if isATypeOf(item, "surfaceShape"):
            shapes.append(item)
        elif isATypeOf(item, "transform"):
            shapes.extend(cmds.listRelatives(item, shapes=True, fullPath=True, noIntermediate=True))

    return shapes

def plugNode(plug):
    """
    Wrapper for the mel command plugNode
    Given a string 'plug', such as 'sphere.translateX', returns the portion
    before the '.' - the node (in this example, 'sphere')"""
    return mel.eval("plugNode %s" % plug)

def makePathArray(inputPath):
    """Given a path, returns an array where each element is a directory (or
    possibly a file, for the last element in the array, or possibly a drive, for
    the first element).

    If on a platform that support unc paths (or, more exactly, implements
    os.path.splitunc), and inputPath is a uncpath, the first element will be the
    "\\host\mount" portion.

    This is basically implemented by repeatedly calling os.path.split...

    In general, the goal is to make it such that
        os.path.join(*makePathArray(myPath)) == myPath
    with the exception of paths where there are 'unneeded' doubled path
    seperators - ie, in os.path.join(*makePathArray("\\Host\mount\dir1\\dir2"))
    will not equal the original, as the second doubled backslash will be
    converted to a single backslash - see the last example

    Examples (assuming os.path.sep is '\'):

    makePathArray(r"dir1\dir2")
        ["dir1", "dir2"]

    makePathArray(r"\dir1\dir2")
        ["\\", "dir1", "dir2"]

    makePathArray(r"C:\Fred\Games")
        ["C:\\", "Fred", "Games"]

    makePathArray(r"\\ComfyComputer\ChairMount\TerryDrive\Gilliam.file")
        ["\\\\ComfyComputer\\ChairMount", "TerryDrive", "Gilliam.file"]

    makePathArray(r"\\Host\mount\dir1\\dir2")
        ["\\\\Host\\mount", "dir1", "dir2"
    """

    reversedPathArray = []
    pathArray = []
    currentDir = inputPath

    # Check if we're on a platform that supports unc paths, and if passed a unc
    # path, make the "\\host\mount" portion the first element of the returned
    # path array
    if "splitunc" in dir(os.path):
        hostMount, uncRest = os.path.splitunc(currentDir)
        if hostMount != '':
            pathArray.append(hostMount)
            while uncRest[0] == os.path.sep:
                uncRest = uncRest[1:]
            currentDir = uncRest

    while True:
        oldDir = currentDir
        currentDir, basename = os.path.split(oldDir)
        if currentDir == oldDir:
            if currentDir != "":
                reversedPathArray.append(currentDir)
            break
        else:
            reversedPathArray.append(basename)

    # reverse() and extend operate in place - no return value!
    reversedPathArray.reverse()
    
    pathArray.extend(reversedPathArray)
    return pathArray

def findInPath(oldPath, newPath=".", fileOnly=False, dirOnly=False):
    """Given an oldPath, attempts to find it the final file / directory of
    oldPath within the directory tree rooted at newPath.

    Will return the path to the found file/dir relative to newPath if it is
    found, or None if it isn't.

    If fileOnly is True, then the result must be a file - similarly, if dirOnly
    is True, the result must be a directory. Note that if both dirOnly and
    fileOnly are True, no matches will be found (except, perhaps, for a symbolic
    directory link - not sure, but it's possible that may return True for both
    os.path.isfile and os.path.isdir...)

    The function is guaranteed to find basename(oldPath) if such an item exists
    in newPath or a folder within the directory tree rooted at newPath; however,
    it attempts to find the "best match" between oldPath and newPath - the exact
    determination of what the "best match" between the two is, however, should
    be treated as undetermined.

    At present, the algorithm for finding the "best match" is as follows (though
    this behavior should NOT be relied upon):

    Will first check if newPath exists; if not, we clearly can't find the file.

    Then, attempt to find the file given by oldPath by first matching as
    many directories at the start of oldPath and newPath as it can, then tacking
    the remainder of oldPath onto newPath, and seeing if that exists. If not, it
    will knock off one more path from the start of old path, tack the remainder
    onto newPath, etc.

    For example, if oldPath = A\B\G\Q\R, and newPath=A\B\C, then it will first try
    to find A\B\C\G\Q\R, then A\B\C\Q\R, and finally A\B\C\R

    If this method of finding the file fails, it will append successively
    shorter versions of oldPath onto newPath - using the previous example, it
    would then try A\B\C\A\B\G\Q\R, then A\B\C\B\G\Q\R.  (Note that it won't try
    A\B\C\G\Q\R, A\B\C\Q\R, etc, as these have already been tried.)

    Next, it will recursively search through the directory tree rooted at
    newPath.  Continuing our previous example, if there exist directories
    A\B\C\D, A\B\C\E, we will next try calling findInPath(r"A\B\G\Q\R",
    r"A\B\C\D"), then findInPath(r"A\B\G\Q\R", r"A\B\C\E").

    """

    # Will first check if newPath exists; if not, we clearly can't find the file.
    if not os.path.exists(newPath):
        return None

    # Then, attempt to find the file given by oldPath by first matching as many
    # directories at the start of oldPath and newPath as it can, then tacking
    # the remainder of oldPath onto newPath, and seeing if that exists. If not,
    # it will knock off one more path from the start of old path, tack the
    # remainder onto newPath, etc.

    # For example, if oldPath = A\B\G\Q\R, and newPath=A\B\C, then it will first
    # try to find A\B\C\G\Q\R, then A\B\C\Q\R, and finally A\B\C\R

    # If this method of finding the file fails, it will append successively
    # shorter versions of oldPath onto newPath - using the previous example, it
    # would then try A\B\C\A\B\G\Q\R, then A\B\C\B\G\Q\R.  (Note that it won't
    # try A\B\C\G\Q\R, A\B\C\Q\R, etc, as these have already been tried.)

    # Implementation explantation:
    # the implementation of these two parts is basically, the same, the only
    # difference is how many elements we take from the tail of oldPathArray.  We
    # will eventually end up testing all possible 'tails' of oldPathArray, but
    # since we first want to try the ones AFTER numEqualDirs, we can't just
    # iterate i over range(len(oldPathArray))
    normOldPath = _findInPath_normPath(oldPath)
    normNewPath = _findInPath_normPath(newPath)

    oldPathArray = makePathArray(normOldPath)
    newPathArray = makePathArray(normNewPath)

    numEqualDirs = 0
    while numEqualDirs < len(oldPathArray) and \
           numEqualDirs < len(newPathArray) and \
           oldPathArray[numEqualDirs] == newPathArray[numEqualDirs]:
        numEqualDirs += 1

    testIndices = range(numEqualDirs, len(oldPathArray))
    testIndices.extend(range(numEqualDirs))
    for i in testIndices:
        testSubPath = os.path.join(*oldPathArray[i:])
        #print "testing: " + os.path.join(newPath, testSubPath)
        if os.path.exists(os.path.join(newPath, testSubPath)):
            if (fileOnly and not os.path.isfile(testSubPath)) or \
               (dirOnly and not os.path.isdir(testSubPath)):
                break
            else:
                return testSubPath
        
    # Next, it will recursively search through the directory tree rooted at
    # newPath.  Continuing our previous example, if there exist directories
    # A\B\C\D, A\B\C\E, we will next try calling findInPath(r"A\B\G\Q\R",
    # r"A\B\C\D"), then findInPath(r"A\B\G\Q\R", r"A\B\C\E").
    for direntry in os.listdir(newPath):
        joinedPath = os.path.join(newPath, direntry)
        if os.path.isdir(joinedPath):
            # print
            # print "Recursing: findInPath(%s, %s)" % (oldPath, joinedPath)
            foundPath = findInPath(oldPath, joinedPath)
            if foundPath is not None:
                return os.path.join(direntry, foundPath)
    else:
        return None

def _findInPath_normPath(inputPath):
    normPath = os.path.normcase(os.path.normpath(inputPath))
    hostMount, normPath = os.path.splitunc(normPath)
    drive, normPath = os.path.splitdrive(normPath)
    i = 0
    while normPath[i] == os.path.sep:
        i += 1

    return normPath[i:]

def getShadingGroups(items=None):
    """Returns a list of shadingGroups associated with the given items."""

    from PMP.maya import getShapes
    
    items = ensureIterable_defaultToSelection(items, basestring)

    shadingGroups = set()

    shapes = []
    for item in items:
        if isAShadingGroup(item):
            shadingGroups.add(item)
        else:
            shapes.extend(getShapes(item))

    for shape in shapes:
        containingSets = cmds.listSets(type=1, object=shape)
        if containingSets is not None:
            shadingGroups.update([mayaSet for mayaSet in containingSets if isAShadingGroup(mayaSet)])
        
    return [group for group in shadingGroups]

def getMats(items=None):
    """Returns the materials asssociated with the given item."""

    items = ensureIterable_defaultToSelection(items, basestring)

    materials = set()
    
    shadingGroups = set()
    for item in items:
        if isAMaterial(item):
            materials.add(item)
        else:
            shadingGroups.update(getShadingGroups(item))

    for shadingGroup in shadingGroups:
        for port in shadingEngineMaterialPorts:
            source = cmds.connectionInfo(shadingGroup + "." + port, sourceFromDestination=True)
            if source != "":
                materials.add(plugNode(source))

    return [mat for mat in materials]


def getTextures(items=None):
    """Returns the textures associated with the given item."""

    items = ensureIterable_defaultToSelection(items, basestring)

    textures = set()
    materials = set()
    for item in items:
        if isATexture(item):
            textures.add(item)
        else:
            materials.update(getMats(item))

    for material in materials:
        textures.update([node for node in cmds.listHistory(material, breadthFirst=True) if isATexture(node)])
        
    return [tex for tex in textures]

def getFileTextures(items=None):
    return [tex for tex in getTextures(items) if isATypeOf(tex, "file")]

def isAMaterial(node):
    """Returns true if the given node is a type of material node"""
    return cmds.nodeType(node) in cmds.listNodeTypes("shader")

def isAShadingGroup(node):
    """Returns true if the given node inherits from the shadingEngine node type (or is of type shadingEngine)"""
    return isATypeOf(node, "shadingEngine")

def isATexture(node):
    """Returns true if the given node is a type of texture node"""
    return cmds.nodeType(node) in cmds.listNodeTypes("texture")

def reloadFileTextures(textures, findNonExistantImages=True, fixDataToSourceImages=True):
    """Will reload the given list of strings (or single string) naming file textures.

    If findNonExistantImages is True (the default), if it encounters any file
    nodes that reference nonexistant files, it will try to find them in the
    sourceimages folder (or a subfolder), and correct the reference if it does.

    If fixDataToSourceImages is True (the default), it will also attempt to
    correct paths that have been made to point to 'data' to point back to
    'sourceimages', if it can find a matching file in sourceimages.  This is
    done because maya (or perhaps just mental ray) has a rather annoying habit
    of copying textures to the data directory, and then changing the file
    reference for the node to the new location... leaving you wondering why the
    texture isn't updating even though you've reloaded it."""

    textures = ensureIterableType(textures, "file", validSingleElementClasses=basestring)

    if len(textures) > 0:
        try:
            cmds.progressWindow(title="Reloading textures...",
                                isInterruptable=True,
                                max=len(textures))

            numProcessed = 0
            for texture in textures:
                if cmds.progressWindow( query=True, isCancelled=True ) :
                        break

                cmds.progressWindow(edit=True,
                                    progress=numProcessed,
                                    status="Reloading Texture: %s (%i of %i)" % (texture, numProcessed + 1, len(textures)))
                imagePath = cmds.getAttr(texture + ".fileTextureName")
                imagePath = cmds.workspace(projectPath=imagePath)
                if isinstance(imagePath, basestring) and imagePath != "":
                    needToFindTexture = False
                    mustBeInSourceImages = False

                    workspaceEntryTypes = ("renderTypeEntry", "fileRuleEntry", "variableEntry", "objectTypeEntry")
                    sourceImagesDir = ""
                    for entryType in workspaceEntryTypes:
                        sourceImagesDir = cmds.workspace("sourceImages", query=True, **{entryType:True})
                        if sourceImagesDir != "":
                            break
                         
                    if findNonExistantImages:
                        if not cmds.file(imagePath, q=True, exists=True):
                            print "Nonexistant path '%s' for texture '%s'... will try to find copy in %s" % (imagePath, texture, sourceImagesDir)
                            needToFindTexture = True

                    # Maya has a bug where sometimes texture images will be copied to the "data" folder, and relinked there -
                    # ie, sometimes a file that originally referred to "sourceImage\subFolder\myImage.jpg" will be copied to
                    # "data\myImage.jpg", and then linked to from there
                    if fixDataToSourceImages and not needToFindTexture:
                        badImageRootDir = "data"
                        pathArray = makePathArray(imagePath)
                        if (len(pathArray) is 2) and (pathArray[0] == badImageRootDir):
                            print "Image path '%s' for texture '%s' in %s directory... will try to find copy in project dir" % (imagePath, texture, badImageRootDir)
                            needToFindTexture = True
                            mustBeInSourceImages = True

                    if needToFindTexture:
                        workspacePath = cmds.workspace(q=True, rootDirectory=True)
                        findRootDirs = [os.path.join(workspacePath, sourceImagesDir)]
                        if not mustBeInSourceImages:
                            findRootDirs.append(workspacePath)

                        for rootDir in findRootDirs:
                            print "Looking in '%s':" % rootDir
                            foundTexture = findInPath(imagePath, rootDir)
                            if foundTexture:
                                foundTexture = os.path.join(rootDir, foundTexture)
                                foundTexture = cmds.workspace(expandName=foundTexture)
                                foundTexture = cmds.workspace(projectPath=foundTexture)
                                print "Found texture at %s!" % foundTexture
                                cmds.setAttr(texture + ".fileTextureName", foundTexture, type="string")
                                print "\tReloaded %s..." % foundTexture
                                break
                numProcessed += 1
        finally:
            cmds.progressWindow(endProgress=True)

        print "Textures reloaded"

def reloadAllFileTextures(findNonExistantImages=True, fixDataToSourceImages=True):
    reloadFileTextures(textures=cmds.ls(long=True, type="file"),
                       findNonExistantImages=findNonExistantImages,
                       fixDataToSourceImages=fixDataToSourceImages)

def reloadFileTexturesOnSelected(findNonExistantImages=True, fixDataToSourceImages=True):
    reloadFileTextures(textures=getFileTextures(),
                       findNonExistantImages=findNonExistantImages,
                       fixDataToSourceImages=fixDataToSourceImages)
