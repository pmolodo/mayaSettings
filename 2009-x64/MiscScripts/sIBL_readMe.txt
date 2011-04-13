sIBL 0.17a
Installation instructions:

1.Copy all mel files into your maya - script folder.
2.Copy sIBL.xpm into your maya - icons folder.
3.Copy sIBLmaya.jpg in the root of your sIBL-collection folder.
4.Enter sIBL_setup.mel at the command line to install a shelf button for this sIBL.
5.Enter sIBL at the command line to run the script.
6.Create an environment variable called sIBL pointing to your sIBL-collection. If you
don«t know how to do this check out this tutorial: 
http://www.renderwahnsinn.de/sIBL-environment/Site/How_to_create_environment_variables_for_sIBL_4_Maya.html

News:
Thanks to Zap Andersons Production Shaders for Mental Ray this release allows you to use
background, reflection and environment lighting in one render pass with a correct result. 
I was finally able to pass on the final gather rays thanks to a cg-talk thread by Filip Orrby. This requires
that users download and install the puppet shaders from http://www.puppet.tfdv.com/download/shaders_p_e.shtml 
but enables Maya 8.5 users to render everything in one pass!
For anyone who is running Maya 2008 or above I recommend turning on the "use rayswitch" - parameter!

For more details about sIBL visit http://www.smartibl.com!

If you have any ideas how to improve this script send me an email or join us at the forum!

Volker Heisterberg (volk@renderwahnsinn.de)

