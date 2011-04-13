////////////////////////////////////////////////////////////////////////////////////////////
// author: David Johnson
// contact: david@djx.com.au
// website: www.djx.com.au
// last rev: 28 Aug 2007
// version: 1.5.5
//
// ©2007 David Johnson 
////////////////////////////////////////////////////////////////////////////////////////////

ZIP file contents:

djRivet - README.txt		You are reading it :)
djRivet.bmp					A windows bmp image shelf icon (put it in your icons or bitmaps folder)
djRivet_makeShelfButton.mel	Creates a shelf button that you can use to run djRivet

djRivet.mel					The mel script (for maya 7,8,8.5)

extras (required for maya 7)/
	AEclosestPointOnMeshTemplate.mel	Maya 7 Plugin template for attribute editor
	closestPointOnMesh.mll				Required maya 7 plugin

Open the mel files in a text editor and you will find usage instructions at the head of the file.



NOTE: The closestPointOnMesh plugin which is used by djRivet.mel is part of the default maya 8 & 8.5 install.
	If you are using maya 8 or 8.5 you dont need to worry about this.
	
	In maya 7 this plugin was part of the optional bonus tools.
	If you are using maya 7 you must install the plugin by putting it in your plugins folder,
	and loading it using the plugin manager.
	AEclosestPointOnMeshTemplate.mel goes in your scripts folder.
