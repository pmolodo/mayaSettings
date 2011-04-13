//Maya ASCII 5.0 scene
//Name: skin1.1.ma
//Last modified: Fri, Jun 25, 2004 06:16:33 PM
requires maya "5.0";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya Unlimited 5.0";
fileInfo "version" "5.0.1";
fileInfo "cutIdentifier" "200309220008";
fileInfo "osv" "Microsoft Windows XP Service Pack 1 (Build 2600)\n";
createNode blinn -n "skinHighlights";
	setAttr ".dc" 0.80342000722885132;
	setAttr ".c" -type "float3" 0 0 0 ;
	setAttr ".it" -type "float3" 1 1 1 ;
	setAttr ".rfl" 0;
	setAttr ".ec" 0.44442000985145569;
createNode multiplyDivide -n "multiplyDivide3";
	setAttr ".i2" -type "float3" 0.40000001 0.5 0.60000002 ;
createNode file -n "specularMapFile";
	addAttr -ci true -sn "nts" -ln "notes" -dt "string";
	setAttr ".cg" -type "float3" 0.49599999 0.63871604 1 ;
	setAttr ".nts" -type "string" (
		"Color Gain has been tinted blue to counteract the tendency of yellow highlights on the skin. Specular highlights should appear white.");
createNode place2dTexture -n "place2dTexture25";
createNode luminance -n "luminance1";
createNode contrast -n "contrast2";
	setAttr ".c" -type "float3" 0.5 0.5 0.5 ;
	setAttr ".b" -type "float3" 0.60000002 0.60000002 0.60000002 ;
createNode bump2d -n "skinBump";
	setAttr ".bd" 0.05000000074505806;
	setAttr ".vt1" -type "float2" 0 9.9999997e-006 ;
	setAttr ".vt2" -type "float2" 9.9999997e-006 9.9999997e-006 ;
	setAttr ".vc2" -type "float3" 9.9999997e-006 9.9999997e-006 0 ;
createNode file -n "bumpMapFile";
	setAttr ".ail" yes;
createNode place2dTexture -n "place2dTexture26";
createNode blinn -n "skinShader";
	addAttr -ci true -sn "rC_softness_min" -ln "rC_softness_min" -dv -1 -min 
		-5 -max 0 -at "double";
	addAttr -ci true -sn "rC_softness_max" -ln "rC_softness_max" -dv 1 -min 
		0.01 -max 5 -at "double";
	setAttr ".c" -type "float3" 0.85799998 0.71485698 0.59373599 ;
	setAttr ".tcf" 0.83758002519607544;
	setAttr ".rfl" 0;
	setAttr ".ec" 0.55549997091293335;
	setAttr ".sro" 0.23931999504566193;
	setAttr ".rC_softness_min" -0.55551999999999957;
	setAttr ".rC_softness_max" 0.52176;
createNode ramp -n "translucneceRamp";
	addAttr -ci true -sn "nts" -ln "notes" -dt "string";
	setAttr ".cg" -type "float3" 0.75213999 0.75213999 0.75213999 ;
	setAttr ".in" 5;
	setAttr -s 3 ".cel";
	setAttr ".cel[0].ep" 0.35499998927116394;
	setAttr ".cel[0].ec" -type "float3" 0.221 0.043718513 0.021657998 ;
	setAttr ".cel[1].ep" 0.76499998569488525;
	setAttr ".cel[1].ec" -type "float3" 0 0 0 ;
	setAttr ".cel[2].ep" 0;
	setAttr ".cel[2].ec" -type "float3" 0 -0.084350005 -0.1 ;
	setAttr ".nts" -type "string" (
		"This ramp controls the translucence fake and is channeled into the ambient colour of the skin shader. This is an adoption of a method by Steven Stahlberg (www.optidigit.com/stevens). This gives the same effect of translucence as the fist version of this shader but is now mental ray compatible.\r\n"
		+ "\r\n"
		+ "The top colour is black.\r\n"
		+ "\r\n"
		+ "The middle colour is a dark orangey-red and defines the translucent colour it also brings more luminance into the dark side. \r\n"
		+ "\r\n"
		+ "The bottom colour is the opposite to the middle colour with a negative value of -0.1. This means the shader will not be illuminated in shadowed areas.\r\n"
		+ "\r\n"
		+ "Take care when using Final Gather as this translucence fake will change the luminance of the surface.\r\n");
createNode clamp -n "translucenceClamp";
	setAttr ".mx" -type "float3" 1 1 1 ;
createNode lambert -n "translucenceLambert";
	addAttr -ci true -sn "nts" -ln "notes" -dt "string";
	setAttr ".nts" -type "string" (
		"This is a default Lambert used as a shading model for the translucence fake.");
createNode multiplyDivide -n "multiplyDivide2";
	setAttr ".i2" -type "float3" 0.083999999 0.2212 0.3906 ;
createNode blendColors -n "peachFuzzControl";
	addAttr -ci true -sn "nts" -ln "notes" -dt "string";
	setAttr ".b" 0.60000002384185791;
	setAttr ".nts" -type "string" (
		"This blendColors node is a convienient way to control how much \"Peach Fuzz\" is seen in the dark side of the shader.\r\n"
		+ "\r\n"
		+ "If Blender is set to 0 the \"Peach Fuzz\" will be visible only in light (more realistic).\r\n"
		+ "\r\n"
		+ "If Blender is set to 1 the \"Peach Fuzz\" will be visible in light and shade (same as the previous version of this shader).");
createNode ramp -n "peachFuzzRamp";
	addAttr -ci true -sn "nts" -ln "notes" -dt "string";
	setAttr ".in" 4;
	setAttr -s 2 ".cel";
	setAttr ".cel[0].ep" 0;
	setAttr ".cel[0].ec" -type "float3" 0.2735 0.2735 0.2735 ;
	setAttr ".cel[2].ep" 0.46500000357627869;
	setAttr ".cel[2].ec" -type "float3" 0 0 0 ;
	setAttr ".nts" -type "string" (
		"This ramp controls the intensity of the \"Peach Fuzz\", the effect of the tiny hairs on the surface of the skin, making the skin lighter towards the edges.\r\n"
		+ "\r\n"
		+ "Take care when using Final Gather as this changes the luminance of the surface.\r\n");
createNode samplerInfo -n "samplerInfo3";
createNode multiplyDivide -n "multiplyDivide4";
	addAttr -ci true -sn "nts" -ln "notes" -dt "string";
	setAttr ".nts" -type "string" (
		"Multiplies the \"Peach Fuzz\" by the surface luminance so it is only visible in light.");
createNode surfaceLuminance -n "surfaceLuminance2";
createNode layeredShader -n "skinWithHighlightsShader";
	setAttr -s 2 ".cs";
createNode lightLinker -n "lightLinker1";
select -ne :time1;
	setAttr ".o" 70;
select -ne :renderPartition;
	setAttr -s 2 ".st";
select -ne :renderGlobalsList1;
select -ne :defaultShaderList1;
	setAttr -s 6 ".s";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :defaultRenderUtilityList1;
	setAttr -s 12 ".u";
select -ne :lightList1;
select -ne :defaultTextureList1;
	setAttr -s 4 ".tx";
select -ne :initialShadingGroup;
	setAttr ".ro" yes;
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :defaultRenderGlobals;
	addAttr -ci true -sn "currentRenderer" -ln "currentRenderer" -dt "string";
	setAttr ".currentRenderer" -type "string" "mayaSoftware";
select -ne :hardwareRenderGlobals;
	addAttr -ci true -sn "tcov" -ln "textureCompression" -bt "TCOV" -min 0 
		-max 1 -en "Disabled:Enabled" -at "enum";
	addAttr -ci true -sn "ehql" -ln "enableHighQualityLighting" -bt "EHQL" -min 
		0 -max 1 -at "bool";
	addAttr -ci true -sn "eams" -ln "enableAcceleratedMultiSampling" -bt "EAMS" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "tshc" -ln "transparentShadowCasting" -bt "TSHC" -min 
		0 -max 1 -at "bool";
	addAttr -ci true -sn "lith" -ln "lightIntensityThreshold" -bt "LITH" -at "float";
	addAttr -ci true -sn "ani" -ln "animation" -bt "ANIM" -min 0 -max 1 -at "bool";
	setAttr ".fn" -type "string" "%s.%e";
	setAttr ".ctrs" 256;
	setAttr ".btrs" 512;
	setAttr -k on ".tcov" 1;
	setAttr -k on ".ehql" yes;
	setAttr -k on ".eams" yes;
	setAttr -k on ".tshc" yes;
	setAttr -k on ".lith" 0.0010000000474974513;
	setAttr -k on ".ani";
select -ne :defaultHardwareRenderGlobals;
	setAttr ".fn" -type "string" "im";
	setAttr ".res" -type "string" "ntsc_4d 646 485 1.333";
connectAttr "multiplyDivide3.o" "skinHighlights.sc";
connectAttr "luminance1.o" "skinHighlights.sro";
connectAttr "skinBump.o" "skinHighlights.n";
connectAttr "specularMapFile.oc" "multiplyDivide3.i1";
connectAttr "place2dTexture25.c" "specularMapFile.c";
connectAttr "place2dTexture25.tf" "specularMapFile.tf";
connectAttr "place2dTexture25.rf" "specularMapFile.rf";
connectAttr "place2dTexture25.mu" "specularMapFile.mu";
connectAttr "place2dTexture25.s" "specularMapFile.s";
connectAttr "place2dTexture25.wu" "specularMapFile.wu";
connectAttr "place2dTexture25.wv" "specularMapFile.wv";
connectAttr "place2dTexture25.re" "specularMapFile.re";
connectAttr "place2dTexture25.of" "specularMapFile.of";
connectAttr "place2dTexture25.r" "specularMapFile.ro";
connectAttr "place2dTexture25.n" "specularMapFile.n";
connectAttr "place2dTexture25.o" "specularMapFile.uv";
connectAttr "place2dTexture25.ofs" "specularMapFile.fs";
connectAttr "place2dTexture25.mv" "specularMapFile.mv";
connectAttr "place2dTexture25.vt1" "specularMapFile.vt1";
connectAttr "place2dTexture25.vt2" "specularMapFile.vt2";
connectAttr "place2dTexture25.vt3" "specularMapFile.vt3";
connectAttr "place2dTexture25.vc1" "specularMapFile.vc1";
connectAttr "contrast2.o" "luminance1.v";
connectAttr "specularMapFile.oc" "contrast2.v";
connectAttr "bumpMapFile.oa" "skinBump.bv";
connectAttr "place2dTexture26.c" "bumpMapFile.c";
connectAttr "place2dTexture26.tf" "bumpMapFile.tf";
connectAttr "place2dTexture26.rf" "bumpMapFile.rf";
connectAttr "place2dTexture26.mu" "bumpMapFile.mu";
connectAttr "place2dTexture26.s" "bumpMapFile.s";
connectAttr "place2dTexture26.wu" "bumpMapFile.wu";
connectAttr "place2dTexture26.wv" "bumpMapFile.wv";
connectAttr "place2dTexture26.re" "bumpMapFile.re";
connectAttr "place2dTexture26.of" "bumpMapFile.of";
connectAttr "place2dTexture26.r" "bumpMapFile.ro";
connectAttr "place2dTexture26.n" "bumpMapFile.n";
connectAttr "place2dTexture26.o" "bumpMapFile.uv";
connectAttr "place2dTexture26.ofs" "bumpMapFile.fs";
connectAttr "place2dTexture26.mv" "bumpMapFile.mv";
connectAttr "place2dTexture26.vt1" "bumpMapFile.vt1";
connectAttr "place2dTexture26.vt2" "bumpMapFile.vt2";
connectAttr "place2dTexture26.vt3" "bumpMapFile.vt3";
connectAttr "place2dTexture26.vc1" "bumpMapFile.vc1";
connectAttr "translucneceRamp.oc" "skinShader.ambc";
connectAttr "multiplyDivide2.o" "skinShader.sc";
connectAttr "peachFuzzControl.op" "skinShader.ic";
connectAttr "translucenceClamp.opr" "translucneceRamp.v";
connectAttr "translucenceLambert.oc" "translucenceClamp.ip";
connectAttr "specularMapFile.oc" "multiplyDivide2.i1";
connectAttr "peachFuzzRamp.oc" "peachFuzzControl.c1";
connectAttr "multiplyDivide4.o" "peachFuzzControl.c2";
connectAttr "samplerInfo3.fr" "peachFuzzRamp.v";
connectAttr "peachFuzzRamp.oc" "multiplyDivide4.i1";
connectAttr "surfaceLuminance2.o" "multiplyDivide4.i2x";
connectAttr "surfaceLuminance2.o" "multiplyDivide4.i2y";
connectAttr "surfaceLuminance2.o" "multiplyDivide4.i2z";
connectAttr "skinHighlights.oc" "skinWithHighlightsShader.cs[4].c";
connectAttr "skinHighlights.ot" "skinWithHighlightsShader.cs[4].t";
connectAttr "skinHighlights.ogc" "skinWithHighlightsShader.cs[4].g";
connectAttr "skinShader.oc" "skinWithHighlightsShader.cs[6].c";
connectAttr "skinShader.ot" "skinWithHighlightsShader.cs[6].t";
connectAttr "skinShader.ogc" "skinWithHighlightsShader.cs[6].g";
connectAttr ":defaultLightSet.msg" "lightLinker1.lnk[0].llnk";
connectAttr ":initialShadingGroup.msg" "lightLinker1.lnk[0].olnk";
connectAttr ":defaultLightSet.msg" "lightLinker1.lnk[1].llnk";
connectAttr ":initialParticleSE.msg" "lightLinker1.lnk[1].olnk";
connectAttr "skinShader.msg" ":defaultShaderList1.s" -na;
connectAttr "skinWithHighlightsShader.msg" ":defaultShaderList1.s" -na;
connectAttr "skinHighlights.msg" ":defaultShaderList1.s" -na;
connectAttr "translucenceLambert.msg" ":defaultShaderList1.s" -na;
connectAttr "multiplyDivide2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture25.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture26.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "skinBump.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "luminance1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "contrast2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "samplerInfo3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "surfaceLuminance2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "translucenceClamp.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide4.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "peachFuzzControl.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "lightLinker1.msg" ":lightList1.ln" -na;
connectAttr "translucneceRamp.msg" ":defaultTextureList1.tx" -na;
connectAttr "specularMapFile.msg" ":defaultTextureList1.tx" -na;
connectAttr "bumpMapFile.msg" ":defaultTextureList1.tx" -na;
connectAttr "peachFuzzRamp.msg" ":defaultTextureList1.tx" -na;
// End of skin1.1.ma
