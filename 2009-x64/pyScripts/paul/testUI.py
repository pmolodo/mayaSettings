myModVar = "Hi there, from test.py"

def testUiFunc_module(*args, **kwargs):
    print myModVar

def makeTestUiFunc_func():
    localVar = "More stuff"
    def testUiFunc_func(*args, **kwargs):
        print myModVar
        print localVar
    return testUiFunc

def makeTestUiFunc_loop():
    for i in [1]:
        loopVar = "defined in a loop!"
        def testUiFunc_loop(*args, **kwargs):
            print myModVar
            print loopVar
    return testUiFunc

class TestUiFuncMaker(object):
    classVar = "defined in a class"
    def testUiFunc_class(*args, **kwargs):
        print myModVar
        print classVar

class TestUiFuncMakerLoop(object):
    for i in [1]:
        classLoopVar = "defined in a loop in a class!"
        def testUiFunc_classLoop(*args, **kwargs):
            print myModVar
            print classVar
    
class TestUiFuncMaker3(object):
    def __init__(self, instStr):
        self.string = instStr
    def maker(self, string):
        def myUiFunc(*args, **kwargs):
            print self.string
            print string
        return myUiFunc
