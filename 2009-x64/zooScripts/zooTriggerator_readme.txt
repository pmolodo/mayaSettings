triggerator uses the shape files located in the presets/.zooTriggerator/ directory to build the shapes.  for triggerator to work properly, it must be able to find these shape nodes.  the easiest way to make this happen is to move the presets directory located in the same place as this readme file, into your home/maya directory.

so on windows, it would be here:

c:/documents and settings/username/my documents/maya/presets/

on linux, here:

/home/username/maya/presets/

and I have no idea about mac...  i'm sure you can figure it out from the above.  once you have put the preset directory in the right place, the triggerator tool should be able to find them.  triggerator uses the zooPresetManager script to determine the location of the preset files - so if you need to modify the location that it looks for shape files, look to this file.