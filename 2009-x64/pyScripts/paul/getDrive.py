import subprocess

MAXTOR_SERIAL = 0x00586720; # Maxtor 7Y250M0 250GB #2
IAUDIO_SERIAL = 0x437E07ED; # 1132333037 decimal

def getVol():
    return shellOutput("vol")

############################################################
# from pymel.mayahook.mayautils
############################################################

def executableOutput(exeAndArgs, convertNewlines=True, stripTrailingNewline=True, **kwargs):
    """Will return the text output of running the given executable with the given arguments.
    
    This is just a convenience wrapper for subprocess.Popen, so the exeAndArgs argment
    should have the same format as the first argument to Popen: ie, either a single string
    giving the executable, or a list where the first element is the executable and the rest
    are arguments. 
    
    convertNewlines: if True, will replace os-specific newlines (ie, '\r\n' on Windows) with
        the standard '\n' newline
        
    stripTrailingNewline: if True, and the output from the executable contains a final newline,
        it is removed from the return value
        Note: the newline that is stripped is the one given by os.linesep, not '\n'
    
    kwargs are passed onto subprocess.Popen
    
    Note that if the keyword arg 'stdout' is supplied (and is something other than subprocess.PIPE),
    then the return will be empty - you must check the file object supplied as the stdout yourself.
    
    Also, 'stderr' is given the default value of subprocess.STDOUT, so that the return will be
    the combined output of stdout and stderr.
    
    Finally, since maya's python build doesn't support universal_newlines, this is always set to False - 
    however, set convertNewlines to True for an equivalent result."""
    
    kwargs.setdefault('stdout', subprocess.PIPE)
    kwargs.setdefault('stderr', subprocess.STDOUT)

    cmdProcess = subprocess.Popen(exeAndArgs, **kwargs)
    cmdOutput = cmdProcess.communicate()[0]

    if stripTrailingNewline and cmdOutput.endswith(os.linesep):
        cmdOutput = cmdOutput[:-len(os.linesep)]

    if convertNewlines:
        cmdOutput = cmdOutput.replace(os.linesep, '\n')
    return cmdOutput

def shellOutput(shellCommand, convertNewlines=True, stripTrailingNewline=True, **kwargs):
    """Will return the text output of running a given shell command.
    
    convertNewlines: if True, will replace os-specific newlines (ie, '\r\n' on Windows) with
        the standard '\n' newline
        
    stripTrailingNewline: if True, and the output from the shell contains a final newline,
        it is removed from the return value
        Note: the newline that is stripped is the one given by os.linesep, not '\n'
    
    With default arguments, behaves like commands.getoutput(shellCommand),
    except it works on windows as well.
    
    kwargs are passed onto subprocess.Popen
    
    Note that if the keyword arg 'stdout' is supplied (and is something other than subprocess.PIPE),
    then the return will be empty - you must check the file object supplied as the stdout yourself.
    
    Also, 'stderr' is given the default value of subprocess.STDOUT, so that the return will be
    the combined output of stdout and stderr.
    
    Finally, since maya's python build doesn't support universal_newlines, this is always set to False - 
    however, set convertNewlines to True for an equivalent result."""
    
    # commands module not supported on windows... use subprocess
    kwargs['shell'] = True
    kwargs['convertNewlines'] = convertNewlines
    kwargs['stripTrailingNewline'] = stripTrailingNewline
    return executableOutput(shellCommand, **kwargs)


############################################################
# end from pymel.mayahook.mayautils
############################################################
