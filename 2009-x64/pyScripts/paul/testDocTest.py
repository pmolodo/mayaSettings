import sys, doctest

def myFunc():
    """
    >>> a = 1
    >>> a
    1
    >>>
    """
    pass

def doTest(setStdout, cleanup=None):
    save_stdout = sys.stdout
    
    try:
        setStdout()
        try:
            result = doctest.testmod(sys.modules[__name__])
        finally:
            sys.stdout = save_stdout
        if result[0]:
            print "%s Failed!!!" % setStdout.__name__
        else:
            print "%s Succeeded!!!" % setStdout.__name__
    finally:
        if cleanup:
            cleanup()

def paul():
    sys.stdout = sys.__stdout__

def olivier():
    reload(sys)
    
def chad():
    fout = open('templog', 'w')
    
fout = None
def chad():
    global fout
    fout = open('templog', 'w')
    sys.stdout = fout

def chadClean():
    global fout
    fout.close()

def testPaul():
    doTest(paul)
    
def testOlivier():
    doTest(olivier)

def testChad():
    doTest(chad, chadClean)
        
testPaul()
testOlivier()
testChad()