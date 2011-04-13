To install zooTriggered, copy all the scripts to your scripts directory, and all the icons to your icons directory.  To make the right click menus work, please rename the appropriate dagMenuProc_v*.mel script.

Ie if you're using maya version 7, rename dagMenuProc_v7.mel to dagMenuProc.mel
and if you're using maya version 8, rename dagMenuProc_v8.mel to dagMenuProc.mel
etc

To run the script, type zooTriggered.  Once the zooTriggered UI has loaded, you may install a shelf button to the script using the "Shelf" menu.  For more information about how zooTriggered works, check out the help menu.

If you want zooTriggered to load up automatically when you start maya, put the following code in your userSetup.mel script.  If you don't know what this is - go to your "my documents/maya/scripts/" directory and create a text file.  rename it to userSetup.mel and open it in wordpad.


//load the zooTriggered script
source zooTriggered;
zooTriggeredUtils;
for( $script in `zooTriggeredDependencies -scripts` ) if( catch(eval( "source "+ $script ))) warning( "You don't have "+ $script +" installed" );
zooTrigUpdateUIState; //update the shelf buttons
zooTriggeredLoad; //load the script
//end zooTriggered


If you have an trouble using this script, or just want to contribute some feedback, either check out the zoo support forums:  http://groups.google.com/group/zootoolbox/

or you can contact the author at:  zootoolbox@googlegroups.com

For tutorials on using zooTriggered, please take a look at www.animationtd.com
-zoo