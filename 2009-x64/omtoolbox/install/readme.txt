Case 1: You have an older version of OMT installed

    Copy Maya.env into your "../[username]/maya/x.x" dir 

    Open Maya.env in your favorite text editor (fx. notepad) and change the paths to point to your omtoolbox directory 

    Delete ../[username]/maya/x.x/modules/OMToolbox.module 

    Restart Maya 


Case 2: You have both a Maya.env and userSetup.mel file, both containing stuff.

    Open op the attached Maya.env with your favorite text editor (fx. notepad) and change the paths to point to your omtoolbox directory 

    Now copy the paths one at a time and paste them into your already existing Maya.env at the end of the lines starting with "MAYA_SCRIPT_PATH" and "PYTHONPATH" accordingly. Remember to seperate the new paths with a ";" on windows and a ":" on linux/mac 

    Copy the content of the attached userSetup.mel into the buttom of your existing userSetup.mel 

    Restart Maya 


Case 3: You have a clean Maya install with nonexisting userSetup.mel and an empty Maya.env file

    Copy Maya.env into your "../[username]/maya/x.x" dir 

    Open Maya.env in your favorite text editor (fx. notepad) and change the paths to point to your omtoolbox directory 

    Copy userSetup.mel into your "../[username]/maya/x.x/scripts" dir 

    Restart Maya 

