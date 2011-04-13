import sys, inspect

if globals().get('version', False):
    version += 1
else:
    version = 1

def isCurrentModule():
    """
    Because reloading the module can leave "outdated" scriptJobs,
    this allows a mechanism to check if a reload has been done
    """
    # Get the code object of calling function...
    callerCode = sys._getframe(1).f_code
    # ... and it's name...
    callerName = callerCode.co_name
    # ... and module...
    callerModule = inspect.getmodule(callerCode)
    
    funcFromModule = getattr(callerModule, callerName)
    codeFromModule = funcFromModule.func_code
    
    #TODO: remp
    print __name__
    print "isCurrentModule determined name:", callerName
    print "in globals:", globals()[callerName]
    print "callerModule:", callerModule
    print "globals()[callerName.func_code == callerCode", globals()[callerName].func_code == callerCode
    print "globals()[callerName.func_code is callerCode", globals()[callerName].func_code is callerCode
    print "codeFromModule == callerCode", codeFromModule == callerCode
    print "codeFromModule is callerCode", codeFromModule is callerCode

def foo(fooVersion=version):
    blah = "altered shit"
    print "module version:", version
    print "foo version:", fooVersion
    current = isCurrentModule()
    print "currentModule?", current 
