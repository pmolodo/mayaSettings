//Maya ASCII 4.0 scene
//Name: GI.ma
//Last modified: Sun, May 26, 2002 04:03:42 AM
requires maya "4.0";
currentUnit -l centimeter -a degree -t pal;
createNode transform -s -n "persp";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 65.847762053791214 47.701833943663729 28.737661309238156 ;
	setAttr ".r" -type "double3" -35.138352729603476 422.99999999975415 -7.0057736522271077e-015 ;
createNode camera -s -n "perspShape" -p "persp";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 85.171629667575161;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 100 0 ;
	setAttr ".r" -type "double3" -89.999999999999986 0 0 ;
createNode camera -s -n "topShape" -p "top";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 100 ;
createNode camera -s -n "frontShape" -p "front";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 100 0.089107039985592884 9.0928910038803892 ;
	setAttr ".r" -type "double3" 0 89.999999999999986 0 ;
createNode camera -s -n "sideShape" -p "side";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100;
	setAttr ".ow" 69.670354053450708;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode transform -n "GI";
createNode transform -n "dome" -p "GI";
createNode nurbsSurface -n "domeShape" -p "dome";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ovs" no;
	setAttr ".ovt" no;
	setAttr ".ovp" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".mb" no;
	setAttr ".csh" no;
	setAttr ".rcsh" no;
	setAttr ".vis" no;
	setAttr ".ds" no;
	setAttr ".smo" no;
	setAttr ".dvu" 0;
	setAttr ".dvv" 0;
	setAttr ".cpr" 3;
	setAttr ".cps" 1;
	setAttr ".cc" -type "nurbsSurface" 
		3 3 0 2 no 
		9 0 0 0 1 2 3 4 4 4
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		
		77
		1.9192315495417408e-015 -20 -5.0630694529058596e-015
		1.9192315495417408e-015 -20 -5.0630694529058596e-015
		1.9192315495417408e-015 -20 -5.0630694529058596e-015
		1.9192315495417408e-015 -20 -5.0630694529058596e-015
		1.9192315495417408e-015 -20 -5.0630694529058596e-015
		1.9192315495417408e-015 -20 -5.0630694529058596e-015
		1.9192315495417408e-015 -20 -5.0630694529058596e-015
		1.9192315495417408e-015 -20 -5.0630694529058596e-015
		1.9192315495417408e-015 -20 -5.0630694529058596e-015
		1.9192315495417408e-015 -20 -5.0630694529058596e-015
		1.9192315495417408e-015 -20 -5.0630694529058596e-015
		3.9983358167274523 -20 -3.9983358167274572
		5.6545007389380721 -20 -1.8106171627863568e-015
		3.9983358167274554 -20 3.9983358167274519
		1.0108747667182863e-015 -20 5.6545007389380704
		-3.9983358167274519 -20 3.9983358167274541
		-5.6545007389380739 -20 3.5275368990165152e-016
		-3.9983358167274536 -20 -3.9983358167274554
		-1.5773600437240282e-015 -20 -5.654500738938073
		3.9983358167274523 -20 -3.9983358167274572
		5.6545007389380721 -20 -1.8106171627863568e-015
		3.9983358167274554 -20 3.9983358167274519
		12.328599593811786 -15.672232497824485 -12.328599593811793
		17.435272750636063 -15.672232497824485 3.5455033157494616e-016
		12.328599593811788 -15.672232497824485 12.328599593811786
		-4.1266656661747565e-018 -15.672232497824485 17.435272750636063
		-12.328599593811784 -15.672232497824485 12.328599593811788
		-17.43527275063607 -15.672232497824485 7.8297681380247763e-016
		-12.328599593811786 -15.672232497824485 -12.328599593811788
		-1.7425925885733481e-015 -15.672232497824485 -17.435272750636063
		12.328599593811786 -15.672232497824485 -12.328599593811793
		17.435272750636063 -15.672232497824485 3.5455033157494616e-016
		12.328599593811788 -15.672232497824485 12.328599593811786
		17.344048949830835 2.9723328954744026e-015 -17.344048949830839
		24.528189251313606 1.9103512682259435e-015 3.3448509053126005e-015
		17.344048949830835 8.4836964097748512e-016 17.344048949830835
		-1.501868820245819e-015 4.084824479801247e-016 24.528189251313606
		-17.344048949830832 8.4836964097748532e-016 17.344048949830835
		-24.528189251313613 1.9103512682259439e-015 9.5544062650988913e-016
		-17.344048949830832 2.9723328954744026e-015 -17.344048949830839
		-9.5544062650988893e-016 3.4122200884717631e-015 -24.528189251313606
		17.344048949830835 2.9723328954744026e-015 -17.344048949830839
		24.528189251313606 1.9103512682259435e-015 3.3448509053126005e-015
		17.344048949830835 8.4836964097748512e-016 17.344048949830835
		12.328599593811791 15.67223249782449 -12.328599593811793
		17.435272750636067 15.67223249782449 4.4006631288898473e-015
		12.328599593811791 15.67223249782449 12.328599593811793
		-2.1310079134393336e-015 15.67223249782449 17.435272750636067
		-12.328599593811788 15.67223249782449 12.328599593811791
		-17.435272750636074 15.67223249782449 5.7532711557105932e-016
		-12.328599593811786 15.67223249782449 -12.328599593811795
		3.8428865919981048e-016 15.67223249782449 -17.435272750636067
		12.328599593811791 15.67223249782449 -12.328599593811793
		17.435272750636067 15.67223249782449 4.4006631288898473e-015
		12.328599593811791 15.67223249782449 12.328599593811793
		3.9983358167274541 19.999999999999996 -3.9983358167274519
		5.6545007389380704 19.999999999999996 3.3527988315546585e-015
		3.9983358167274519 19.999999999999996 3.9983358167274559
		-1.7033285199779747e-015 19.999999999999996 5.6545007389380721
		-3.9983358167274536 19.999999999999996 3.9983358167274528
		-5.654500738938073 19.999999999999996 8.7763110850143419e-017
		-3.998335816727451 19.999999999999996 -3.9983358167274541
		1.1368432429722326e-015 19.999999999999996 -5.6545007389380695
		3.9983358167274541 19.999999999999996 -3.9983358167274519
		5.6545007389380704 19.999999999999996 3.3527988315546585e-015
		3.9983358167274519 19.999999999999996 3.9983358167274559
		8.6998366831816898e-016 20 2.2738542350459501e-015
		8.6998366831816898e-016 20 2.2738542350459501e-015
		8.6998366831816898e-016 20 2.2738542350459501e-015
		8.6998366831816898e-016 20 2.2738542350459501e-015
		8.6998366831816898e-016 20 2.2738542350459501e-015
		8.6998366831816898e-016 20 2.2738542350459501e-015
		8.6998366831816898e-016 20 2.2738542350459501e-015
		8.6998366831816898e-016 20 2.2738542350459501e-015
		8.6998366831816898e-016 20 2.2738542350459501e-015
		8.6998366831816898e-016 20 2.2738542350459501e-015
		8.6998366831816898e-016 20 2.2738542350459501e-015
		
		;
	setAttr ".nufa" 4.5;
	setAttr ".nvfa" 4.5;
createNode transform -n "Key_Light" -p "GI";
	setAttr ".t" -type "double3" 3.3931909814406214 17.806366185323473 8.3373967386745491 ;
	setAttr ".s" -type "double3" 2 2 2 ;
	setAttr ".rp" -type "double3" 3.9378222904673521e-016 6.3219828677629764e-016 
		-2.2417506219396532e-015 ;
	setAttr ".rpt" -type "double3" -7.3404290952499486e-016 -2.1502214480598757e-015 
		4.6410799199126945e-016 ;
	setAttr ".sp" -type "double3" 1.9689111452336761e-016 3.1609914338814882e-016 
		-1.1208753109698266e-015 ;
	setAttr ".spt" -type "double3" 1.9689111452336761e-016 3.1609914338814882e-016 
		-1.1208753109698266e-015 ;
createNode directionalLight -n "Key_LightShape" -p "Key_Light";
	setAttr -k off ".v";
	setAttr ".col" 20.024984394500787;
	setAttr ".dms" yes;
	setAttr ".fs" 5;
createNode geometryConstraint -n "Key_Light_geometryConstraint1" -p "Key_Light";
	addAttr -ci true -sn "w0" -ln "domeW0" -bt "W000" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr -k on ".w0";
createNode aimConstraint -n "Key_Light_aimConstraint1" -p "Key_Light";
	addAttr -ci true -sn "w0" -ln "locator1W0" -bt "W000" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".a" -type "double3" 0 0 -1 ;
	setAttr -k on ".w0";
createNode transform -n "Key_Locator" -p "GI";
	setAttr ".v" no;
createNode locator -n "Key_LocatorShape" -p "Key_Locator";
	setAttr -k off ".v";
createNode transform -n "up_Light_grp" -p "GI";
	addAttr -ci true -uac -sn "up_Color" -ln "up_Color" -at "float3" -nc 3;
	addAttr -ci true -sn "up_ColorR" -ln "up_ColorR" -dv 0.865 -at "float" -p "up_Color";
	addAttr -ci true -sn "up_ColorG" -ln "up_ColorG" -dv 0.945 -at "float" -p "up_Color";
	addAttr -ci true -sn "up_ColorB" -ln "up_ColorB" -dv 1 -at "float" -p "up_Color";
	addAttr -ci true -sn "up_int" -ln "up_int" -dv 0.10000000000000001 -min 
		0 -max 6 -at "double";
	addAttr -ci true -sn "up_shadow" -ln "up_shadow" -min 0 -max 1 -at "bool";
	addAttr -ci true -uac -sn "up_ShadowColor" -ln "up_ShadowColor" -at "float3" 
		-nc 3;
	addAttr -ci true -sn "up_ShadowColorR" -ln "up_ShadowColorR" -at "float" 
		-p "up_ShadowColor";
	addAttr -ci true -sn "up_ShadowColorG" -ln "up_ShadowColorG" -at "float" 
		-p "up_ShadowColor";
	addAttr -ci true -sn "up_ShadowColorB" -ln "up_ShadowColorB" -at "float" 
		-p "up_ShadowColor";
	addAttr -ci true -sn "up_reuse_shadow" -ln "up_reuse_shadow" -min 0 -max 
		1 -at "bool";
	addAttr -ci true -sn "up_shadow_Res" -ln "up_shadow_Res" -dv 256 -min 128 
		-max 2048 -at "long";
	addAttr -ci true -sn "up_Filter_Size" -ln "up_Filter_Size" -dv 2 -min 0 
		-max 8 -at "long";
	setAttr ".ovdt" 2;
	setAttr ".up_Color" -type "float3" 0.86500001 0.94499999 1 ;
	setAttr -k on ".up_int";
	setAttr -k on ".up_shadow";
	setAttr -k on ".up_reuse_shadow";
	setAttr -k on ".up_shadow_Res" 128;
	setAttr -k on ".up_Filter_Size" 3;
createNode transform -n "up_LightA_1" -p "up_Light_grp";
	setAttr ".t" -type "double3" 0 2 20 ;
	setAttr ".r" -type "double3" -5.7105931374996342 0 0 ;
	setAttr ".rp" -type "double3" 0 0 -1.5265566588595902e-015 ;
	setAttr ".rpt" -type "double3" 0 -1.5189806485279936e-016 7.5760103315945847e-018 ;
	setAttr ".sp" -type "double3" 0 0 -1.5265566588595902e-015 ;
createNode directionalLight -n "up_LightA_1Shape" -p "up_LightA_1";
	setAttr -k off ".v";
	setAttr ".col" 20.099751242241783;
createNode transform -n "up_LightA_2" -p "up_Light_grp";
	setAttr ".t" -type "double3" 14.142135623730951 2 14.142135623730949 ;
	setAttr ".r" -type "double3" -5.7105931374994876 45.000000000000028 0 ;
	setAttr ".rp" -type "double3" 0 1.1102230246251565e-016 1.7763568394002505e-015 ;
	setAttr ".rpt" -type "double3" 1.2420288088245856e-015 1.762031292591369e-016 
		-5.3432803057566563e-016 ;
	setAttr ".sp" -type "double3" 0 1.1102230246251565e-016 1.7763568394002505e-015 ;
createNode directionalLight -n "up_LightA_2Shape" -p "up_LightA_2";
	setAttr -k off ".v";
	setAttr ".col" 20.09975124224178;
createNode transform -n "up_LightA_3" -p "up_Light_grp";
	setAttr ".t" -type "double3" 20 2 4.4408920985006262e-015 ;
	setAttr ".r" -type "double3" -5.7105931374996421 90 0 ;
	setAttr ".rp" -type "double3" 7.8886090522101181e-031 0 0 ;
	setAttr ".rpt" -type "double3" -7.8886090522101181e-031 -5.4738221262688167e-048 
		-7.8886090522101181e-031 ;
	setAttr ".sp" -type "double3" 7.8886090522101181e-031 0 0 ;
createNode directionalLight -n "up_LightA_3Shape" -p "up_LightA_3";
	setAttr -k off ".v";
	setAttr ".col" 20.099751242241783;
createNode transform -n "up_LightA_4" -p "up_Light_grp";
	setAttr ".t" -type "double3" 14.14213562373096 2 -14.142135623730949 ;
	setAttr ".r" -type "double3" 174.28940686250036 45.000000000000028 180 ;
	setAttr ".s" -type "double3" 1.0000000000000002 1 1.0000000000000002 ;
	setAttr ".rp" -type "double3" 0 -2.2204460492503131e-016 0 ;
	setAttr ".rpt" -type "double3" 1.5623003884585944e-017 1.1019651391410384e-018 
		-1.5623003884585957e-017 ;
	setAttr ".sp" -type "double3" 0 -2.2204460492503131e-016 0 ;
createNode directionalLight -n "up_LightA_4Shape" -p "up_LightA_4";
	setAttr -k off ".v";
	setAttr ".col" 20.099751242241783;
createNode transform -n "up_LightA_5" -p "up_Light_grp";
	setAttr ".t" -type "double3" 1.1330996904646013e-014 2 -20.000000000000007 ;
	setAttr ".r" -type "double3" 174.28940686250033 -5.649800061504203e-030 
		179.99999999999937 ;
	setAttr ".s" -type "double3" 1.0000000000000004 1 1.0000000000000004 ;
	setAttr ".rp" -type "double3" 0 1.2655573305614249e-028 -2.3037127760971884e-015 ;
	setAttr ".rpt" -type "double3" -2.5730133154487205e-030 -2.292279887778636e-016 
		4.5959926638758009e-015 ;
	setAttr ".sp" -type "double3" 0 1.2655573305614249e-028 -2.3037127760971872e-015 ;
	setAttr ".spt" -type "double3" 0 0 -1.1832913578315182e-030 ;
createNode directionalLight -n "up_LightA_5Shape" -p "up_LightA_5";
	setAttr -k off ".v";
	setAttr ".col" 20.099751242241787;
createNode transform -n "up_LightA_6" -p "up_Light_grp";
	setAttr ".t" -type "double3" -14.142135623730942 2 -14.142135623730974 ;
	setAttr ".r" -type "double3" 174.28940686250036 -44.999999999999936 180 ;
	setAttr ".s" -type "double3" 1.0000000000000004 1 1.0000000000000004 ;
	setAttr ".rp" -type "double3" 1.7763568394002513e-015 2.2204460492503131e-016 
		-1.7763568394002513e-015 ;
	setAttr ".rpt" -type "double3" -1.7669674916958106e-015 -1.7785607696785325e-016 
		4.2978941209987359e-015 ;
	setAttr ".sp" -type "double3" 1.7763568394002505e-015 2.2204460492503131e-016 
		-1.7763568394002505e-015 ;
	setAttr ".spt" -type "double3" 7.8886090522101216e-031 0 -7.8886090522101216e-031 ;
createNode directionalLight -n "up_LightA_6Shape" -p "up_LightA_6";
	setAttr -k off ".v";
	setAttr ".col" 20.099751242241791;
createNode transform -n "up_LightA_7" -p "up_Light_grp";
	setAttr ".t" -type "double3" -20.000000000000007 2 2.2204460492503137e-014 ;
	setAttr ".r" -type "double3" -5.7105931374996404 -89.999999999999858 0 ;
	setAttr ".s" -type "double3" 1.0000000000000004 1 1.0000000000000002 ;
	setAttr ".rp" -type "double3" -6.3108872417680972e-030 0 0 ;
	setAttr ".rpt" -type "double3" 6.3108872417680804e-030 1.313717310304515e-046 
		-6.3108872417680972e-030 ;
	setAttr ".sp" -type "double3" -6.3108872417680944e-030 0 0 ;
	setAttr ".spt" -type "double3" -2.8025969286496354e-045 0 0 ;
createNode directionalLight -n "up_LightA_7Shape" -p "up_LightA_7";
	setAttr -k off ".v";
	setAttr ".col" 20.099751242241794;
createNode transform -n "up_LightA_8" -p "up_Light_grp";
	setAttr ".t" -type "double3" -14.142135623730944 2 14.142135623730969 ;
	setAttr ".r" -type "double3" -5.7105931374994841 -44.999999999999972 0 ;
	setAttr ".s" -type "double3" 1.0000000000000004 0.99999999999999989 1.0000000000000004 ;
	setAttr ".rp" -type "double3" -1.7763568394002513e-015 5.5511151231257817e-016 
		1.7763568394002513e-015 ;
	setAttr ".rpt" -type "double3" -6.9049992860218373e-016 1.7399919898085488e-016 
		-1.8216480052918563e-015 ;
	setAttr ".sp" -type "double3" -1.7763568394002505e-015 5.5511151231257827e-016 
		1.7763568394002505e-015 ;
	setAttr ".spt" -type "double3" -7.8886090522101216e-031 -9.8607613152626465e-032 
		7.8886090522101216e-031 ;
createNode directionalLight -n "up_LightA_8Shape" -p "up_LightA_8";
	setAttr -k off ".v";
	setAttr ".col" 20.099751242241787;
createNode transform -n "up_LightB_1" -p "up_Light_grp";
	setAttr ".t" -type "double3" 7.6604444311897799 8.452365234813989 16.42787609686539 ;
	setAttr ".r" -type "double3" -25 25 0 ;
	setAttr ".s" -type "double3" 1 0.99999999999999989 0.99999999999999989 ;
	setAttr ".rp" -type "double3" 0 0 4.4408920985006252e-016 ;
	setAttr ".rpt" -type "double3" 1.7009603572736907e-016 1.8768020992463411e-016 
		-7.9317084081478398e-017 ;
	setAttr ".sp" -type "double3" 0 0 4.4408920985006262e-016 ;
	setAttr ".spt" -type "double3" 0 0 -9.8607613152626465e-032 ;
createNode directionalLight -n "up_LightB_1Shape" -p "up_LightB_1";
	setAttr -k off ".v";
	setAttr ".col" 20;
createNode transform -n "up_LightB_2" -p "up_Light_grp";
	setAttr ".t" -type "double3" 17.033014792782925 8.4523652348139873 6.1995103843888906 ;
	setAttr ".r" -type "double3" -25.000000000000004 70.000000000000014 0 ;
	setAttr ".s" -type "double3" 1 0.99999999999999989 0.99999999999999967 ;
	setAttr ".rp" -type "double3" 0 1.3322676295501875e-015 3.5527136788004994e-015 ;
	setAttr ".rpt" -type "double3" 2.496586107275372e-015 1.3766185769250791e-015 
		-2.6440306484697356e-015 ;
	setAttr ".sp" -type "double3" 0 1.3322676295501878e-015 3.5527136788005009e-015 ;
	setAttr ".spt" -type "double3" 0 -3.9443045261050586e-031 -1.5777218104420231e-030 ;
createNode directionalLight -n "up_LightB_2Shape" -p "up_LightB_2";
	setAttr -k off ".v";
	setAttr ".col" 20;
createNode transform -n "up_LightB_3" -p "up_Light_grp";
	setAttr ".t" -type "double3" 16.427876096865397 8.452365234813989 -7.6604444311897808 ;
	setAttr ".r" -type "double3" 155.00000000000003 65 180 ;
	setAttr ".s" -type "double3" 1.0000000000000004 1 1.0000000000000004 ;
	setAttr ".rp" -type "double3" 3.9443045261050608e-031 -8.8817841970012523e-016 
		-3.5527136788005025e-015 ;
	setAttr ".rpt" -type "double3" -2.5779849346939382e-015 -1.4182262777490772e-015 
		4.7548477964565007e-015 ;
	setAttr ".sp" -type "double3" 3.944304526105059e-031 -8.8817841970012523e-016 
		-3.5527136788005009e-015 ;
	setAttr ".spt" -type "double3" 1.7516230804060221e-046 0 -1.5777218104420243e-030 ;
createNode directionalLight -n "up_LightB_3Shape" -p "up_LightB_3";
	setAttr -k off ".v";
	setAttr ".col" 20;
createNode transform -n "up_LightB_4" -p "up_Light_grp";
	setAttr ".t" -type "double3" 6.1995103843889012 8.452365234813989 -17.033014792782929 ;
	setAttr ".r" -type "double3" 155 20.000000000000043 180 ;
	setAttr ".s" -type "double3" 0.99999999999999978 0.99999999999999989 0.99999999999999989 ;
	setAttr ".rp" -type "double3" 0 8.8817841970012504e-016 1.7763568394002501e-015 ;
	setAttr ".rpt" -type "double3" 4.2224630901647503e-016 6.675054380505411e-016 
		-2.9364690388710718e-015 ;
	setAttr ".sp" -type "double3" 0 8.8817841970012523e-016 1.7763568394002505e-015 ;
	setAttr ".spt" -type "double3" 0 -1.9721522630525293e-031 -3.9443045261050586e-031 ;
createNode directionalLight -n "up_LightB_4Shape" -p "up_LightB_4";
	setAttr -k off ".v";
	setAttr ".col" 20;
createNode transform -n "up_LightB_5" -p "up_Light_grp";
	setAttr ".t" -type "double3" -7.6604444311897817 8.4523652348139944 -16.427876096865397 ;
	setAttr ".r" -type "double3" 155 -25 180 ;
	setAttr ".s" -type "double3" 1.0000000000000004 1 1.0000000000000002 ;
	setAttr ".rp" -type "double3" 0 8.8817841970012543e-016 -3.1086244689504391e-015 ;
	setAttr ".rpt" -type "double3" 1.3493064182545404e-015 -1.3969768711204344e-015 
		6.002221420785265e-015 ;
	setAttr ".sp" -type "double3" 0 8.8817841970012543e-016 -3.1086244689504383e-015 ;
	setAttr ".spt" -type "double3" 0 0 -7.8886090522101198e-031 ;
createNode directionalLight -n "up_LightB_5Shape" -p "up_LightB_5";
	setAttr -k off ".v";
	setAttr ".col" 20;
createNode transform -n "up_LightB_6" -p "up_Light_grp";
	setAttr ".t" -type "double3" -17.033014792782929 8.4523652348139944 -6.1995103843889172 ;
	setAttr ".r" -type "double3" 155.00000000000003 -69.999999999999929 180 ;
	setAttr ".s" -type "double3" 1.0000000000000004 1 1.0000000000000002 ;
	setAttr ".rp" -type "double3" 0 0 -1.7763568394002509e-015 ;
	setAttr ".rpt" -type "double3" 1.5128356161382801e-015 -7.5072083969853626e-016 
		2.3269839730123571e-015 ;
	setAttr ".sp" -type "double3" 0 0 -1.7763568394002505e-015 ;
	setAttr ".spt" -type "double3" 0 0 -3.9443045261050599e-031 ;
createNode directionalLight -n "up_LightB_6Shape" -p "up_LightB_6";
	setAttr -k off ".v";
	setAttr ".col" 20;
createNode transform -n "up_LightB_7" -p "up_Light_grp";
	setAttr ".t" -type "double3" -16.427876096865393 8.4523652348139926 7.6604444311897968 ;
	setAttr ".r" -type "double3" -25.000000000000007 -64.999999999999957 3.7629167612910259e-015 ;
	setAttr ".s" -type "double3" 1.0000000000000004 0.99999999999999989 1.0000000000000004 ;
	setAttr ".rp" -type "double3" -1.5777218104420243e-030 -1.7763568394002501e-015 
		0 ;
	setAttr ".rpt" -type "double3" -6.8038414290947508e-016 1.6643080329599164e-016 
		3.172683363259129e-016 ;
	setAttr ".sp" -type "double3" -1.5777218104420236e-030 -1.7763568394002505e-015 
		0 ;
	setAttr ".spt" -type "double3" -7.0064923216240885e-046 3.9443045261050586e-031 
		0 ;
createNode directionalLight -n "up_LightB_7Shape" -p "up_LightB_7";
	setAttr -k off ".v";
	setAttr ".col" 20;
createNode transform -n "up_LightB_8" -p "up_Light_grp";
	setAttr ".t" -type "double3" -6.1995103843888799 8.4523652348139962 17.033014792782943 ;
	setAttr ".r" -type "double3" -25.000000000000007 -19.99999999999995 0 ;
	setAttr ".s" -type "double3" 1.0000000000000004 1 1.0000000000000004 ;
	setAttr ".rp" -type "double3" 0 4.4408920985006262e-016 0 ;
	setAttr ".rpt" -type "double3" 6.4190412297814828e-017 -4.1607700823997929e-017 
		-1.76361708333729e-016 ;
	setAttr ".sp" -type "double3" 0 4.4408920985006262e-016 0 ;
createNode directionalLight -n "up_LightB_8Shape" -p "up_LightB_8";
	setAttr -k off ".v";
	setAttr ".col" 20;
createNode transform -n "up_LightC_1" -p "up_Light_grp";
	setAttr ".t" -type "double3" 0 17.320508075688771 10.000000000000002 ;
	setAttr ".r" -type "double3" -59.999999999999993 0 0 ;
createNode directionalLight -n "up_LightC_1Shape" -p "up_LightC_1";
	setAttr -k off ".v";
	setAttr ".col" 20;
createNode transform -n "up_LightC_2" -p "up_Light_grp";
	setAttr ".t" -type "double3" 7.0710678118654782 17.320508075688778 7.0710678118654746 ;
	setAttr ".r" -type "double3" -60.000000000000007 45.000000000000014 0 ;
	setAttr ".s" -type "double3" 1 1 1.0000000000000002 ;
	setAttr ".rp" -type "double3" 0 -8.8817841970012523e-016 -4.4408920985006271e-016 ;
	setAttr ".rpt" -type "double3" 3.8688673633582985e-016 5.9496672573349656e-017 
		8.3097594618589251e-016 ;
	setAttr ".sp" -type "double3" 0 -8.8817841970012523e-016 -4.4408920985006262e-016 ;
	setAttr ".spt" -type "double3" 0 0 -9.8607613152626498e-032 ;
createNode directionalLight -n "up_LightC_2Shape" -p "up_LightC_2";
	setAttr -k off ".v";
	setAttr ".col" 20;
createNode transform -n "up_LightC_3" -p "up_Light_grp";
	setAttr ".t" -type "double3" 10.000000000000002 17.320508075688771 4.4408920985006262e-015 ;
	setAttr ".r" -type "double3" -59.999999999999993 90 0 ;
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999989 0.99999999999999989 ;
	setAttr ".rp" -type "double3" 7.8886090522101163e-031 0 8.8817841970012504e-016 ;
	setAttr ".rpt" -type "double3" 4.4408920985006183e-016 7.6918507455342513e-016 
		-8.8817841970012523e-016 ;
	setAttr ".sp" -type "double3" 7.8886090522101181e-031 0 8.8817841970012523e-016 ;
	setAttr ".spt" -type "double3" -1.7516230804060211e-046 0 -1.9721522630525293e-031 ;
createNode directionalLight -n "up_LightC_3Shape" -p "up_LightC_3";
	setAttr -k off ".v";
	setAttr ".col" 20;
createNode transform -n "up_LightC_4" -p "up_Light_grp";
	setAttr ".t" -type "double3" -7.0710678118654782 17.320508075688778 7.0710678118654746 ;
	setAttr ".r" -type "double3" -60.000000000000007 -45.000000000000014 0 ;
	setAttr ".s" -type "double3" 1.0000000000000004 1.0000000000000002 1.0000000000000002 ;
	setAttr ".rp" -type "double3" 8.8817841970012563e-016 0 -8.8817841970012543e-016 ;
	setAttr ".rpt" -type "double3" 5.3877055510139818e-017 -7.6918507455342572e-016 
		1.2021969114368808e-015 ;
	setAttr ".sp" -type "double3" 8.8817841970012523e-016 0 -8.8817841970012523e-016 ;
	setAttr ".spt" -type "double3" 3.9443045261050608e-031 0 -1.97215226305253e-031 ;
createNode directionalLight -n "up_LightC_4Shape" -p "up_LightC_4";
	setAttr -k off ".v";
	setAttr ".col" 20;
createNode transform -n "up_LightC_5" -p "up_Light_grp";
	setAttr ".t" -type "double3" -10.000000000000004 17.320508075688771 8.8817841970012523e-015 ;
	setAttr ".r" -type "double3" -59.999999999999993 -89.999999999999943 0 ;
	setAttr ".s" -type "double3" 1.0000000000000004 1.0000000000000002 0.99999999999999989 ;
	setAttr ".rp" -type "double3" 0 0 -1.7763568394002501e-015 ;
	setAttr ".rpt" -type "double3" 8.8817841970012523e-016 -1.5383701491068505e-015 
		1.7763568394002493e-015 ;
	setAttr ".sp" -type "double3" 0 0 -1.7763568394002505e-015 ;
	setAttr ".spt" -type "double3" 0 0 3.9443045261050586e-031 ;
createNode directionalLight -n "up_LightC_5Shape" -p "up_LightC_5";
	setAttr -k off ".v";
	setAttr ".col" 20;
createNode transform -n "up_LightC_6" -p "up_Light_grp";
	setAttr ".t" -type "double3" -7.0710678118654684 17.320508075688771 -7.0710678118654879 ;
	setAttr ".r" -type "double3" 120.00000000000001 -44.999999999999936 180 ;
	setAttr ".s" -type "double3" 1.0000000000000004 1.0000000000000004 1 ;
	setAttr ".rp" -type "double3" 0 8.8817841970012563e-016 2.2204460492503131e-015 ;
	setAttr ".rpt" -type "double3" -2.4115024713768007e-016 1.4788734765335013e-015 
		-2.4615962963879939e-015 ;
	setAttr ".sp" -type "double3" 0 8.8817841970012523e-016 2.2204460492503131e-015 ;
	setAttr ".spt" -type "double3" 0 3.9443045261050608e-031 0 ;
createNode directionalLight -n "up_LightC_6Shape" -p "up_LightC_6";
	setAttr -k off ".v";
	setAttr ".col" 20;
createNode transform -n "up_LightC_7" -p "up_Light_grp";
	setAttr ".t" -type "double3" 2.1210804240920263e-015 17.320508075688771 
		-10.000000000000004 ;
	setAttr ".r" -type "double3" 120.00000000000001 0 180 ;
	setAttr ".s" -type "double3" 1.0000000000000004 1.0000000000000002 0.99999999999999978 ;
	setAttr ".rp" -type "double3" 3.9443045261050608e-031 1.2987442821556796e-031 
		-5.3290705182007498e-015 ;
	setAttr ".rpt" -type "double3" -1.3540302629590901e-030 -4.6151104473205504e-015 
		7.9936057773011255e-015 ;
	setAttr ".sp" -type "double3" 3.944304526105059e-031 1.2987442821556794e-031 
		-5.3290705182007514e-015 ;
	setAttr ".spt" -type "double3" 1.7516230804060221e-046 2.1895288505075272e-047 
		1.5777218104420233e-030 ;
createNode directionalLight -n "up_LightC_7Shape" -p "up_LightC_7";
	setAttr -k off ".v";
	setAttr ".col" 20;
createNode transform -n "up_LightC_8" -p "up_Light_grp";
	setAttr ".t" -type "double3" 7.0710678118654844 17.320508075688771 -7.0710678118654746 ;
	setAttr ".r" -type "double3" 120.00000000000001 45.000000000000014 180 ;
	setAttr ".s" -type "double3" 1.0000000000000002 1 1 ;
createNode directionalLight -n "up_LightC_8Shape" -p "up_LightC_8";
	setAttr -k off ".v";
	setAttr ".col" 20;
createNode transform -n "down_Light_grp" -p "GI";
	addAttr -ci true -uac -sn "down_Color" -ln "down_Color" -at "float3" -nc 
		3;
	addAttr -ci true -sn "down_ColorR" -ln "down_ColorR" -dv 0.78500000000000003 
		-at "float" -p "down_Color";
	addAttr -ci true -sn "down_ColorG" -ln "down_ColorG" -dv 0.7 -at "float" 
		-p "down_Color";
	addAttr -ci true -sn "down_ColorB" -ln "down_ColorB" -dv 0.61 -at "float" 
		-p "down_Color";
	addAttr -ci true -sn "down_int" -ln "down_int" -dv 0.10000000000000001 -min 
		0 -max 6 -at "double";
	addAttr -ci true -sn "down_shadow" -ln "down_shadow" -min 0 -max 1 -at "bool";
	addAttr -ci true -uac -sn "down_ShadowColor" -ln "down_ShadowColor" -at "float3" 
		-nc 3;
	addAttr -ci true -sn "down_ShadowColorR" -ln "down_ShadowColorR" -at "float" 
		-p "down_ShadowColor";
	addAttr -ci true -sn "down_ShadowColorG" -ln "down_ShadowColorG" -at "float" 
		-p "down_ShadowColor";
	addAttr -ci true -sn "down_ShadowColorB" -ln "down_ShadowColorB" -at "float" 
		-p "down_ShadowColor";
	addAttr -ci true -sn "down_reuse_shadow" -ln "down_reuse_shadow" -min 0 
		-max 1 -at "bool";
	addAttr -ci true -sn "down_shadow_Res" -ln "down_shadow_Res" -dv 256 -min 
		128 -max 2048 -at "long";
	addAttr -ci true -sn "down_Filter_Size" -ln "down_Filter_Size" -dv 2 -min 
		0 -max 8 -at "long";
	setAttr ".ovdt" 2;
	setAttr ".down_Color" -type "float3" 0.73500001 0.64770627 0.46599001 ;
	setAttr -k on ".down_int";
	setAttr -k on ".down_shadow";
	setAttr -k on ".down_reuse_shadow";
	setAttr -k on ".down_shadow_Res" 128;
	setAttr -k on ".down_Filter_Size" 3;
createNode transform -n "down_LightA_1" -p "down_Light_grp";
	setAttr ".t" -type "double3" 7.3199630154133368 -9.9999999999999982 15.697711344427917 ;
	setAttr ".r" -type "double3" 29.999999999999996 25 0 ;
	setAttr ".rp" -type "double3" 0 0 -1.5265566588595902e-015 ;
	setAttr ".rpt" -type "double3" -5.5871691418925767e-016 7.6327832942979512e-016 
		3.2838436977498189e-016 ;
	setAttr ".sp" -type "double3" 0 0 -1.5265566588595902e-015 ;
createNode directionalLight -n "down_LightA_1Shape" -p "down_LightA_1";
	setAttr -k off ".v";
	setAttr ".col" 20;
createNode transform -n "down_LightA_2" -p "down_Light_grp";
	setAttr ".t" -type "double3" 16.275953626987476 -9.9999999999999982 5.9239626545204773 ;
	setAttr ".r" -type "double3" 29.999999999999993 70.000000000000014 0 ;
	setAttr ".s" -type "double3" 1 1 0.99999999999999989 ;
	setAttr ".rp" -type "double3" 0 0 -1.5265566588595898e-015 ;
	setAttr ".rpt" -type "double3" -1.2423082694283813e-015 7.6327832942979502e-016 
		1.0743934270049017e-015 ;
	setAttr ".sp" -type "double3" 0 0 -1.5265566588595902e-015 ;
	setAttr ".spt" -type "double3" 0 0 3.9443045261050586e-031 ;
createNode directionalLight -n "down_LightA_2Shape" -p "down_LightA_2";
	setAttr -k off ".v";
	setAttr ".col" 20;
createNode transform -n "down_LightA_3" -p "down_Light_grp";
	setAttr ".t" -type "double3" 15.697711344427915 -9.9999999999999982 -7.3199630154133306 ;
	setAttr ".r" -type "double3" 29.999999999999993 114.99999999999997 0 ;
	setAttr ".s" -type "double3" 0.99999999999999944 1 0.99999999999999956 ;
	setAttr ".rp" -type "double3" 0 0 -1.5265566588595897e-015 ;
	setAttr ".rpt" -type "double3" -1.1981722890846085e-015 7.6327832942979473e-016 
		2.085273573048847e-015 ;
	setAttr ".sp" -type "double3" 0 0 -1.5265566588595902e-015 ;
	setAttr ".spt" -type "double3" 0 0 5.9164567891575859e-031 ;
createNode directionalLight -n "down_LightA_3Shape" -p "down_LightA_3";
	setAttr -k off ".v";
	setAttr ".col" 20;
createNode transform -n "down_LightA_4" -p "down_Light_grp";
	setAttr ".t" -type "double3" 5.9239626545204773 -9.9999999999999982 -16.27595362698748 ;
	setAttr ".r" -type "double3" 29.999999999999979 160 0 ;
	setAttr ".s" -type "double3" 1 1 1.0000000000000002 ;
	setAttr ".rp" -type "double3" 0 0 -1.5265566588595906e-015 ;
	setAttr ".rpt" -type "double3" -4.5216323185468875e-016 7.6327832942979483e-016 
		2.7688649282879727e-015 ;
	setAttr ".sp" -type "double3" 0 0 -1.5265566588595902e-015 ;
	setAttr ".spt" -type "double3" 0 0 -3.9443045261050599e-031 ;
createNode directionalLight -n "down_LightA_4Shape" -p "down_LightA_4";
	setAttr -k off ".v";
	setAttr ".col" 20;
createNode transform -n "down_LightA_5" -p "down_Light_grp";
	setAttr ".t" -type "double3" -7.3199630154133351 -9.9999999999999982 -15.697711344427919 ;
	setAttr ".r" -type "double3" 29.999999999999972 205 0 ;
	setAttr ".s" -type "double3" 0.99999999999999989 1 0.99999999999999989 ;
	setAttr ".rp" -type "double3" 0 0 -1.5265566588595898e-015 ;
	setAttr ".rpt" -type "double3" 5.5871691418925757e-016 7.6327832942979463e-016 
		2.7247289479441995e-015 ;
	setAttr ".sp" -type "double3" 0 0 -1.5265566588595902e-015 ;
	setAttr ".spt" -type "double3" 0 0 3.9443045261050586e-031 ;
createNode directionalLight -n "down_LightA_5Shape" -p "down_LightA_5";
	setAttr -k off ".v";
	setAttr ".col" 20;
createNode transform -n "down_LightA_6" -p "down_Light_grp";
	setAttr ".t" -type "double3" -16.275953626987473 -9.9999999999999947 -5.9239626545204809 ;
	setAttr ".r" -type "double3" 29.999999999999972 250.00000000000003 0 ;
	setAttr ".s" -type "double3" 0.99999999999999967 1 0.99999999999999978 ;
	setAttr ".rp" -type "double3" 0 0 -1.5265566588595898e-015 ;
	setAttr ".rpt" -type "double3" 1.2423082694283817e-015 7.6327832942979423e-016 
		1.9787198907142776e-015 ;
	setAttr ".sp" -type "double3" 0 0 -1.5265566588595902e-015 ;
	setAttr ".spt" -type "double3" 0 0 3.9443045261050582e-031 ;
createNode directionalLight -n "down_LightA_6Shape" -p "down_LightA_6";
	setAttr -k off ".v";
	setAttr ".col" 20;
createNode transform -n "down_LightA_7" -p "down_Light_grp";
	setAttr ".t" -type "double3" -15.697711344427908 -9.9999999999999964 7.3199630154133386 ;
	setAttr ".r" -type "double3" 29.999999999999993 -64.999999999999986 0 ;
	setAttr ".s" -type "double3" 0.99999999999999933 1 0.99999999999999944 ;
	setAttr ".rp" -type "double3" 0 0 -1.5265566588595893e-015 ;
	setAttr ".rpt" -type "double3" 1.1981722890846077e-015 7.6327832942979453e-016 
		9.6783974467033228e-016 ;
	setAttr ".sp" -type "double3" 0 0 -1.5265566588595902e-015 ;
	setAttr ".spt" -type "double3" 0 0 9.8607613152626423e-031 ;
createNode directionalLight -n "down_LightA_7Shape" -p "down_LightA_7";
	setAttr -k off ".v";
	setAttr ".col" 20;
createNode transform -n "down_LightA_8" -p "down_Light_grp";
	setAttr ".t" -type "double3" -5.9239626545204764 -9.9999999999999982 16.275953626987473 ;
	setAttr ".r" -type "double3" 29.999999999999996 -19.999999999999996 0 ;
	setAttr ".s" -type "double3" 0.99999999999999978 0.99999999999999989 0.99999999999999978 ;
	setAttr ".rp" -type "double3" 0 0 -1.5265566588595898e-015 ;
	setAttr ".rpt" -type "double3" 4.5216323185468816e-016 7.6327832942979483e-016 
		2.8424838943120873e-016 ;
	setAttr ".sp" -type "double3" 0 0 -1.5265566588595902e-015 ;
	setAttr ".spt" -type "double3" 0 0 3.9443045261050582e-031 ;
createNode directionalLight -n "down_LightA_8Shape" -p "down_LightA_8";
	setAttr -k off ".v";
	setAttr ".col" 20;
createNode transform -n "down_LightB_1" -p "down_Light_grp";
	setAttr ".t" -type "double3" 0 -17.320508075688771 10.000000000000002 ;
	setAttr ".r" -type "double3" 59.999999999999993 0 0 ;
	setAttr ".rp" -type "double3" 0 0 -1.5265566588595902e-015 ;
	setAttr ".rpt" -type "double3" 0 1.3220368468887001e-015 7.6327832942979492e-016 ;
	setAttr ".sp" -type "double3" 0 0 -1.5265566588595902e-015 ;
createNode directionalLight -n "down_LightB_1Shape" -p "down_LightB_1";
	setAttr -k off ".v";
	setAttr ".col" 20;
createNode transform -n "down_LightB_2" -p "down_Light_grp";
	setAttr ".t" -type "double3" 7.0710678118654782 -17.320508075688778 7.0710678118654746 ;
	setAttr ".r" -type "double3" 60.000000000000007 45.000000000000014 0 ;
	setAttr ".s" -type "double3" 1 1 1.0000000000000002 ;
	setAttr ".rp" -type "double3" 0 0 -1.5265566588595906e-015 ;
	setAttr ".rpt" -type "double3" -5.3971928267254789e-016 1.3220368468887005e-015 
		9.8683737618704294e-016 ;
	setAttr ".sp" -type "double3" 0 0 -1.5265566588595902e-015 ;
	setAttr ".spt" -type "double3" 0 0 -3.9443045261050599e-031 ;
createNode directionalLight -n "down_LightB_2Shape" -p "down_LightB_2";
	setAttr -k off ".v";
	setAttr ".col" 20;
createNode transform -n "down_LightB_3" -p "down_Light_grp";
	setAttr ".t" -type "double3" 10.000000000000002 -17.320508075688771 4.4408920985006262e-015 ;
	setAttr ".r" -type "double3" 59.999999999999986 89.999999999999986 0 ;
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999989 0.99999999999999989 ;
	setAttr ".rp" -type "double3" 0 0 -1.5265566588595898e-015 ;
	setAttr ".rpt" -type "double3" -7.6327832942979552e-016 1.3220368468886997e-015 
		1.5265566588595898e-015 ;
	setAttr ".sp" -type "double3" 0 0 -1.5265566588595902e-015 ;
	setAttr ".spt" -type "double3" 0 0 3.9443045261050586e-031 ;
createNode directionalLight -n "down_LightB_3Shape" -p "down_LightB_3";
	setAttr -k off ".v";
	setAttr ".col" 20;
createNode transform -n "down_LightB_4" -p "down_Light_grp";
	setAttr ".t" -type "double3" 7.0710678118654791 -17.320508075688771 -7.0710678118654746 ;
	setAttr ".r" -type "double3" 59.999999999999993 135 0 ;
	setAttr ".rp" -type "double3" 0 0 -1.5265566588595902e-015 ;
	setAttr ".rpt" -type "double3" -5.3971928267254799e-016 1.3220368468887001e-015 
		2.0662759415321383e-015 ;
	setAttr ".sp" -type "double3" 0 0 -1.5265566588595902e-015 ;
createNode directionalLight -n "down_LightB_4Shape" -p "down_LightB_4";
	setAttr -k off ".v";
	setAttr ".col" 20;
createNode transform -n "down_LightB_5" -p "down_Light_grp";
	setAttr ".t" -type "double3" 1.224606353822378e-015 -17.320508075688767 
		-10.000000000000004 ;
	setAttr ".r" -type "double3" 59.999999999999986 180 0 ;
	setAttr ".s" -type "double3" 1 0.99999999999999989 0.99999999999999989 ;
	setAttr ".rp" -type "double3" 0 0 -1.5265566588595898e-015 ;
	setAttr ".rpt" -type "double3" -9.3471549195465671e-032 1.3220368468886989e-015 
		2.2898349882893846e-015 ;
	setAttr ".sp" -type "double3" 0 0 -1.5265566588595902e-015 ;
	setAttr ".spt" -type "double3" 0 0 3.9443045261050586e-031 ;
createNode directionalLight -n "down_LightB_5Shape" -p "down_LightB_5";
	setAttr -k off ".v";
	setAttr ".col" 20;
createNode transform -n "down_LightB_6" -p "down_Light_grp";
	setAttr ".t" -type "double3" -7.0710678118654791 -17.320508075688771 -7.0710678118654782 ;
	setAttr ".r" -type "double3" 59.999999999999972 225 0 ;
	setAttr ".s" -type "double3" 1 1 0.99999999999999989 ;
	setAttr ".rp" -type "double3" 0 0 -1.5265566588595898e-015 ;
	setAttr ".rpt" -type "double3" 5.397192826725478e-016 1.3220368468886997e-015 
		2.0662759415321379e-015 ;
	setAttr ".sp" -type "double3" 0 0 -1.5265566588595902e-015 ;
	setAttr ".spt" -type "double3" 0 0 3.9443045261050586e-031 ;
createNode directionalLight -n "down_LightB_6Shape" -p "down_LightB_6";
	setAttr -k off ".v";
	setAttr ".col" 20;
createNode transform -n "down_LightB_7" -p "down_Light_grp";
	setAttr ".t" -type "double3" -10 -17.320508075688767 4.4408920985006254e-015 ;
	setAttr ".r" -type "double3" 59.999999999999993 -89.999999999999986 0 ;
	setAttr ".s" -type "double3" 0.99999999999999978 0.99999999999999978 0.99999999999999978 ;
	setAttr ".rp" -type "double3" 0 0 -1.5265566588595898e-015 ;
	setAttr ".rpt" -type "double3" 7.6327832942979512e-016 1.3220368468886993e-015 
		1.5265566588595891e-015 ;
	setAttr ".sp" -type "double3" 0 0 -1.5265566588595902e-015 ;
	setAttr ".spt" -type "double3" 0 0 3.9443045261050582e-031 ;
createNode directionalLight -n "down_LightB_7Shape" -p "down_LightB_7";
	setAttr -k off ".v";
	setAttr ".col" 20;
createNode transform -n "down_LightB_8" -p "down_Light_grp";
	setAttr ".t" -type "double3" -7.0710678118654773 -17.320508075688775 7.0710678118654737 ;
	setAttr ".r" -type "double3" 60.000000000000007 -45.000000000000014 0 ;
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999989 1 ;
	setAttr ".rp" -type "double3" 0 0 -1.5265566588595902e-015 ;
	setAttr ".rpt" -type "double3" 5.397192826725477e-016 1.3220368468887001e-015 
		9.8683737618704294e-016 ;
	setAttr ".sp" -type "double3" 0 0 -1.5265566588595902e-015 ;
createNode directionalLight -n "down_LightB_8Shape" -p "down_LightB_8";
	setAttr -k off ".v";
	setAttr ".col" 20;
createNode lightLinker -n "lightLinker1";
createNode displayLayerManager -n "layerManager";
createNode displayLayer -n "defaultLayer";
createNode renderLayerManager -n "renderLayerManager";
createNode renderLayer -n "defaultRenderLayer";
createNode renderLayer -s -n "globalRender";
createNode script -n "sceneConfigurationScriptNode";
	setAttr ".b" -type "string" "playbackOptions -min 0 -max 140 -ast 0 -aet 140 ";
	setAttr ".st" 6;
select -ne :time1;
	setAttr ".o" 0;
select -ne :renderPartition;
	setAttr -s 2 ".st";
select -ne :renderGlobalsList1;
select -ne :defaultShaderList1;
	setAttr -s 2 ".s";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :lightList1;
	setAttr -s 41 ".l";
select -ne :initialShadingGroup;
	setAttr ".ro" yes;
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :defaultRenderGlobals;
	setAttr ".fs" 1;
	setAttr ".ef" 10;
select -ne :defaultLightSet;
	setAttr -s 41 ".dsm";
select -ne :hyperGraphLayout;
	setAttr ".cch" no;
	setAttr ".ihi" 2;
	setAttr ".nds" 0;
	setAttr ".img" -type "string" "";
	setAttr ".ims" 1;
connectAttr "GI.sx" "GI.sy";
connectAttr "GI.sx" "GI.sz";
connectAttr "Key_Light_geometryConstraint1.cgm" "Key_Light.g";
connectAttr "Key_Light_aimConstraint1.crx" "Key_Light.rx";
connectAttr "Key_Light_aimConstraint1.cry" "Key_Light.ry";
connectAttr "Key_Light_aimConstraint1.crz" "Key_Light.rz";
connectAttr "Key_Light.pim" "Key_Light_geometryConstraint1.cpim";
connectAttr "domeShape.ws" "Key_Light_geometryConstraint1.tg[0].tgm";
connectAttr "Key_Light_geometryConstraint1.w0" "Key_Light_geometryConstraint1.tg[0].tw"
		;
connectAttr "Key_Light.pim" "Key_Light_aimConstraint1.cpim";
connectAttr "Key_Light.t" "Key_Light_aimConstraint1.ct";
connectAttr "Key_Light.rp" "Key_Light_aimConstraint1.crp";
connectAttr "Key_Light.rpt" "Key_Light_aimConstraint1.crt";
connectAttr "Key_Light.ro" "Key_Light_aimConstraint1.cro";
connectAttr "Key_Locator.t" "Key_Light_aimConstraint1.tg[0].tt";
connectAttr "Key_Locator.rp" "Key_Light_aimConstraint1.tg[0].trp";
connectAttr "Key_Locator.rpt" "Key_Light_aimConstraint1.tg[0].trt";
connectAttr "Key_Locator.pm" "Key_Light_aimConstraint1.tg[0].tpm";
connectAttr "Key_Light_aimConstraint1.w0" "Key_Light_aimConstraint1.tg[0].tw"
		;
connectAttr "up_Light_grp.up_int" "up_LightA_1Shape.in";
connectAttr "up_Light_grp.up_Color" "up_LightA_1Shape.cl";
connectAttr "up_Light_grp.up_ShadowColor" "up_LightA_1Shape.sc";
connectAttr "up_Light_grp.up_shadow" "up_LightA_1Shape.dms";
connectAttr "up_Light_grp.up_reuse_shadow" "up_LightA_1Shape.du";
connectAttr "up_Light_grp.up_shadow_Res" "up_LightA_1Shape.dr";
connectAttr "up_Light_grp.up_Filter_Size" "up_LightA_1Shape.fs";
connectAttr "up_Light_grp.up_int" "up_LightA_2Shape.in";
connectAttr "up_Light_grp.up_Color" "up_LightA_2Shape.cl";
connectAttr "up_Light_grp.up_ShadowColor" "up_LightA_2Shape.sc";
connectAttr "up_Light_grp.up_shadow" "up_LightA_2Shape.dms";
connectAttr "up_Light_grp.up_reuse_shadow" "up_LightA_2Shape.du";
connectAttr "up_Light_grp.up_shadow_Res" "up_LightA_2Shape.dr";
connectAttr "up_Light_grp.up_Filter_Size" "up_LightA_2Shape.fs";
connectAttr "up_Light_grp.up_int" "up_LightA_3Shape.in";
connectAttr "up_Light_grp.up_Color" "up_LightA_3Shape.cl";
connectAttr "up_Light_grp.up_ShadowColor" "up_LightA_3Shape.sc";
connectAttr "up_Light_grp.up_shadow" "up_LightA_3Shape.dms";
connectAttr "up_Light_grp.up_reuse_shadow" "up_LightA_3Shape.du";
connectAttr "up_Light_grp.up_shadow_Res" "up_LightA_3Shape.dr";
connectAttr "up_Light_grp.up_Filter_Size" "up_LightA_3Shape.fs";
connectAttr "up_Light_grp.up_int" "up_LightA_4Shape.in";
connectAttr "up_Light_grp.up_Color" "up_LightA_4Shape.cl";
connectAttr "up_Light_grp.up_ShadowColor" "up_LightA_4Shape.sc";
connectAttr "up_Light_grp.up_shadow" "up_LightA_4Shape.dms";
connectAttr "up_Light_grp.up_reuse_shadow" "up_LightA_4Shape.du";
connectAttr "up_Light_grp.up_shadow_Res" "up_LightA_4Shape.dr";
connectAttr "up_Light_grp.up_Filter_Size" "up_LightA_4Shape.fs";
connectAttr "up_Light_grp.up_int" "up_LightA_5Shape.in";
connectAttr "up_Light_grp.up_Color" "up_LightA_5Shape.cl";
connectAttr "up_Light_grp.up_ShadowColor" "up_LightA_5Shape.sc";
connectAttr "up_Light_grp.up_shadow" "up_LightA_5Shape.dms";
connectAttr "up_Light_grp.up_reuse_shadow" "up_LightA_5Shape.du";
connectAttr "up_Light_grp.up_shadow_Res" "up_LightA_5Shape.dr";
connectAttr "up_Light_grp.up_Filter_Size" "up_LightA_5Shape.fs";
connectAttr "up_Light_grp.up_int" "up_LightA_6Shape.in";
connectAttr "up_Light_grp.up_Color" "up_LightA_6Shape.cl";
connectAttr "up_Light_grp.up_ShadowColor" "up_LightA_6Shape.sc";
connectAttr "up_Light_grp.up_shadow" "up_LightA_6Shape.dms";
connectAttr "up_Light_grp.up_reuse_shadow" "up_LightA_6Shape.du";
connectAttr "up_Light_grp.up_shadow_Res" "up_LightA_6Shape.dr";
connectAttr "up_Light_grp.up_Filter_Size" "up_LightA_6Shape.fs";
connectAttr "up_Light_grp.up_int" "up_LightA_7Shape.in";
connectAttr "up_Light_grp.up_Color" "up_LightA_7Shape.cl";
connectAttr "up_Light_grp.up_ShadowColor" "up_LightA_7Shape.sc";
connectAttr "up_Light_grp.up_shadow" "up_LightA_7Shape.dms";
connectAttr "up_Light_grp.up_reuse_shadow" "up_LightA_7Shape.du";
connectAttr "up_Light_grp.up_shadow_Res" "up_LightA_7Shape.dr";
connectAttr "up_Light_grp.up_Filter_Size" "up_LightA_7Shape.fs";
connectAttr "up_Light_grp.up_int" "up_LightA_8Shape.in";
connectAttr "up_Light_grp.up_Color" "up_LightA_8Shape.cl";
connectAttr "up_Light_grp.up_ShadowColor" "up_LightA_8Shape.sc";
connectAttr "up_Light_grp.up_shadow" "up_LightA_8Shape.dms";
connectAttr "up_Light_grp.up_reuse_shadow" "up_LightA_8Shape.du";
connectAttr "up_Light_grp.up_shadow_Res" "up_LightA_8Shape.dr";
connectAttr "up_Light_grp.up_Filter_Size" "up_LightA_8Shape.fs";
connectAttr "up_Light_grp.up_int" "up_LightB_1Shape.in";
connectAttr "up_Light_grp.up_Color" "up_LightB_1Shape.cl";
connectAttr "up_Light_grp.up_ShadowColor" "up_LightB_1Shape.sc";
connectAttr "up_Light_grp.up_shadow" "up_LightB_1Shape.dms";
connectAttr "up_Light_grp.up_reuse_shadow" "up_LightB_1Shape.du";
connectAttr "up_Light_grp.up_shadow_Res" "up_LightB_1Shape.dr";
connectAttr "up_Light_grp.up_Filter_Size" "up_LightB_1Shape.fs";
connectAttr "up_Light_grp.up_int" "up_LightB_2Shape.in";
connectAttr "up_Light_grp.up_Color" "up_LightB_2Shape.cl";
connectAttr "up_Light_grp.up_ShadowColor" "up_LightB_2Shape.sc";
connectAttr "up_Light_grp.up_shadow" "up_LightB_2Shape.dms";
connectAttr "up_Light_grp.up_reuse_shadow" "up_LightB_2Shape.du";
connectAttr "up_Light_grp.up_shadow_Res" "up_LightB_2Shape.dr";
connectAttr "up_Light_grp.up_Filter_Size" "up_LightB_2Shape.fs";
connectAttr "up_Light_grp.up_int" "up_LightB_3Shape.in";
connectAttr "up_Light_grp.up_Color" "up_LightB_3Shape.cl";
connectAttr "up_Light_grp.up_ShadowColor" "up_LightB_3Shape.sc";
connectAttr "up_Light_grp.up_shadow" "up_LightB_3Shape.dms";
connectAttr "up_Light_grp.up_reuse_shadow" "up_LightB_3Shape.du";
connectAttr "up_Light_grp.up_shadow_Res" "up_LightB_3Shape.dr";
connectAttr "up_Light_grp.up_Filter_Size" "up_LightB_3Shape.fs";
connectAttr "up_Light_grp.up_int" "up_LightB_4Shape.in";
connectAttr "up_Light_grp.up_Color" "up_LightB_4Shape.cl";
connectAttr "up_Light_grp.up_ShadowColor" "up_LightB_4Shape.sc";
connectAttr "up_Light_grp.up_shadow" "up_LightB_4Shape.dms";
connectAttr "up_Light_grp.up_reuse_shadow" "up_LightB_4Shape.du";
connectAttr "up_Light_grp.up_shadow_Res" "up_LightB_4Shape.dr";
connectAttr "up_Light_grp.up_Filter_Size" "up_LightB_4Shape.fs";
connectAttr "up_Light_grp.up_int" "up_LightB_5Shape.in";
connectAttr "up_Light_grp.up_Color" "up_LightB_5Shape.cl";
connectAttr "up_Light_grp.up_ShadowColor" "up_LightB_5Shape.sc";
connectAttr "up_Light_grp.up_shadow" "up_LightB_5Shape.dms";
connectAttr "up_Light_grp.up_reuse_shadow" "up_LightB_5Shape.du";
connectAttr "up_Light_grp.up_shadow_Res" "up_LightB_5Shape.dr";
connectAttr "up_Light_grp.up_Filter_Size" "up_LightB_5Shape.fs";
connectAttr "up_Light_grp.up_int" "up_LightB_6Shape.in";
connectAttr "up_Light_grp.up_Color" "up_LightB_6Shape.cl";
connectAttr "up_Light_grp.up_ShadowColor" "up_LightB_6Shape.sc";
connectAttr "up_Light_grp.up_shadow" "up_LightB_6Shape.dms";
connectAttr "up_Light_grp.up_reuse_shadow" "up_LightB_6Shape.du";
connectAttr "up_Light_grp.up_shadow_Res" "up_LightB_6Shape.dr";
connectAttr "up_Light_grp.up_Filter_Size" "up_LightB_6Shape.fs";
connectAttr "up_Light_grp.up_int" "up_LightB_7Shape.in";
connectAttr "up_Light_grp.up_Color" "up_LightB_7Shape.cl";
connectAttr "up_Light_grp.up_ShadowColor" "up_LightB_7Shape.sc";
connectAttr "up_Light_grp.up_shadow" "up_LightB_7Shape.dms";
connectAttr "up_Light_grp.up_reuse_shadow" "up_LightB_7Shape.du";
connectAttr "up_Light_grp.up_shadow_Res" "up_LightB_7Shape.dr";
connectAttr "up_Light_grp.up_Filter_Size" "up_LightB_7Shape.fs";
connectAttr "up_Light_grp.up_int" "up_LightB_8Shape.in";
connectAttr "up_Light_grp.up_Color" "up_LightB_8Shape.cl";
connectAttr "up_Light_grp.up_ShadowColor" "up_LightB_8Shape.sc";
connectAttr "up_Light_grp.up_shadow" "up_LightB_8Shape.dms";
connectAttr "up_Light_grp.up_reuse_shadow" "up_LightB_8Shape.du";
connectAttr "up_Light_grp.up_shadow_Res" "up_LightB_8Shape.dr";
connectAttr "up_Light_grp.up_Filter_Size" "up_LightB_8Shape.fs";
connectAttr "up_Light_grp.up_int" "up_LightC_1Shape.in";
connectAttr "up_Light_grp.up_Color" "up_LightC_1Shape.cl";
connectAttr "up_Light_grp.up_ShadowColor" "up_LightC_1Shape.sc";
connectAttr "up_Light_grp.up_shadow" "up_LightC_1Shape.dms";
connectAttr "up_Light_grp.up_reuse_shadow" "up_LightC_1Shape.du";
connectAttr "up_Light_grp.up_shadow_Res" "up_LightC_1Shape.dr";
connectAttr "up_Light_grp.up_Filter_Size" "up_LightC_1Shape.fs";
connectAttr "up_Light_grp.up_int" "up_LightC_2Shape.in";
connectAttr "up_Light_grp.up_Color" "up_LightC_2Shape.cl";
connectAttr "up_Light_grp.up_ShadowColor" "up_LightC_2Shape.sc";
connectAttr "up_Light_grp.up_shadow" "up_LightC_2Shape.dms";
connectAttr "up_Light_grp.up_reuse_shadow" "up_LightC_2Shape.du";
connectAttr "up_Light_grp.up_shadow_Res" "up_LightC_2Shape.dr";
connectAttr "up_Light_grp.up_Filter_Size" "up_LightC_2Shape.fs";
connectAttr "up_Light_grp.up_int" "up_LightC_3Shape.in";
connectAttr "up_Light_grp.up_Color" "up_LightC_3Shape.cl";
connectAttr "up_Light_grp.up_ShadowColor" "up_LightC_3Shape.sc";
connectAttr "up_Light_grp.up_shadow" "up_LightC_3Shape.dms";
connectAttr "up_Light_grp.up_reuse_shadow" "up_LightC_3Shape.du";
connectAttr "up_Light_grp.up_shadow_Res" "up_LightC_3Shape.dr";
connectAttr "up_Light_grp.up_Filter_Size" "up_LightC_3Shape.fs";
connectAttr "up_Light_grp.up_int" "up_LightC_4Shape.in";
connectAttr "up_Light_grp.up_Color" "up_LightC_4Shape.cl";
connectAttr "up_Light_grp.up_ShadowColor" "up_LightC_4Shape.sc";
connectAttr "up_Light_grp.up_shadow" "up_LightC_4Shape.dms";
connectAttr "up_Light_grp.up_reuse_shadow" "up_LightC_4Shape.du";
connectAttr "up_Light_grp.up_shadow_Res" "up_LightC_4Shape.dr";
connectAttr "up_Light_grp.up_Filter_Size" "up_LightC_4Shape.fs";
connectAttr "up_Light_grp.up_int" "up_LightC_5Shape.in";
connectAttr "up_Light_grp.up_Color" "up_LightC_5Shape.cl";
connectAttr "up_Light_grp.up_ShadowColor" "up_LightC_5Shape.sc";
connectAttr "up_Light_grp.up_shadow" "up_LightC_5Shape.dms";
connectAttr "up_Light_grp.up_reuse_shadow" "up_LightC_5Shape.du";
connectAttr "up_Light_grp.up_shadow_Res" "up_LightC_5Shape.dr";
connectAttr "up_Light_grp.up_Filter_Size" "up_LightC_5Shape.fs";
connectAttr "up_Light_grp.up_int" "up_LightC_6Shape.in";
connectAttr "up_Light_grp.up_Color" "up_LightC_6Shape.cl";
connectAttr "up_Light_grp.up_ShadowColor" "up_LightC_6Shape.sc";
connectAttr "up_Light_grp.up_shadow" "up_LightC_6Shape.dms";
connectAttr "up_Light_grp.up_reuse_shadow" "up_LightC_6Shape.du";
connectAttr "up_Light_grp.up_shadow_Res" "up_LightC_6Shape.dr";
connectAttr "up_Light_grp.up_Filter_Size" "up_LightC_6Shape.fs";
connectAttr "up_Light_grp.up_int" "up_LightC_7Shape.in";
connectAttr "up_Light_grp.up_Color" "up_LightC_7Shape.cl";
connectAttr "up_Light_grp.up_ShadowColor" "up_LightC_7Shape.sc";
connectAttr "up_Light_grp.up_shadow" "up_LightC_7Shape.dms";
connectAttr "up_Light_grp.up_reuse_shadow" "up_LightC_7Shape.du";
connectAttr "up_Light_grp.up_shadow_Res" "up_LightC_7Shape.dr";
connectAttr "up_Light_grp.up_Filter_Size" "up_LightC_7Shape.fs";
connectAttr "up_Light_grp.up_int" "up_LightC_8Shape.in";
connectAttr "up_Light_grp.up_Color" "up_LightC_8Shape.cl";
connectAttr "up_Light_grp.up_ShadowColor" "up_LightC_8Shape.sc";
connectAttr "up_Light_grp.up_shadow" "up_LightC_8Shape.dms";
connectAttr "up_Light_grp.up_reuse_shadow" "up_LightC_8Shape.du";
connectAttr "up_Light_grp.up_shadow_Res" "up_LightC_8Shape.dr";
connectAttr "up_Light_grp.up_Filter_Size" "up_LightC_8Shape.fs";
connectAttr "down_Light_grp.down_int" "down_LightA_1Shape.in";
connectAttr "down_Light_grp.down_Color" "down_LightA_1Shape.cl";
connectAttr "down_Light_grp.down_ShadowColor" "down_LightA_1Shape.sc";
connectAttr "down_Light_grp.down_shadow" "down_LightA_1Shape.dms";
connectAttr "down_Light_grp.down_reuse_shadow" "down_LightA_1Shape.du";
connectAttr "down_Light_grp.down_shadow_Res" "down_LightA_1Shape.dr";
connectAttr "down_Light_grp.down_Filter_Size" "down_LightA_1Shape.fs";
connectAttr "down_Light_grp.down_int" "down_LightA_2Shape.in";
connectAttr "down_Light_grp.down_Color" "down_LightA_2Shape.cl";
connectAttr "down_Light_grp.down_ShadowColor" "down_LightA_2Shape.sc";
connectAttr "down_Light_grp.down_shadow" "down_LightA_2Shape.dms";
connectAttr "down_Light_grp.down_reuse_shadow" "down_LightA_2Shape.du";
connectAttr "down_Light_grp.down_shadow_Res" "down_LightA_2Shape.dr";
connectAttr "down_Light_grp.down_Filter_Size" "down_LightA_2Shape.fs";
connectAttr "down_Light_grp.down_int" "down_LightA_3Shape.in";
connectAttr "down_Light_grp.down_Color" "down_LightA_3Shape.cl";
connectAttr "down_Light_grp.down_ShadowColor" "down_LightA_3Shape.sc";
connectAttr "down_Light_grp.down_shadow" "down_LightA_3Shape.dms";
connectAttr "down_Light_grp.down_reuse_shadow" "down_LightA_3Shape.du";
connectAttr "down_Light_grp.down_shadow_Res" "down_LightA_3Shape.dr";
connectAttr "down_Light_grp.down_Filter_Size" "down_LightA_3Shape.fs";
connectAttr "down_Light_grp.down_int" "down_LightA_4Shape.in";
connectAttr "down_Light_grp.down_Color" "down_LightA_4Shape.cl";
connectAttr "down_Light_grp.down_ShadowColor" "down_LightA_4Shape.sc";
connectAttr "down_Light_grp.down_shadow" "down_LightA_4Shape.dms";
connectAttr "down_Light_grp.down_reuse_shadow" "down_LightA_4Shape.du";
connectAttr "down_Light_grp.down_shadow_Res" "down_LightA_4Shape.dr";
connectAttr "down_Light_grp.down_Filter_Size" "down_LightA_4Shape.fs";
connectAttr "down_Light_grp.down_int" "down_LightA_5Shape.in";
connectAttr "down_Light_grp.down_Color" "down_LightA_5Shape.cl";
connectAttr "down_Light_grp.down_ShadowColor" "down_LightA_5Shape.sc";
connectAttr "down_Light_grp.down_shadow" "down_LightA_5Shape.dms";
connectAttr "down_Light_grp.down_reuse_shadow" "down_LightA_5Shape.du";
connectAttr "down_Light_grp.down_shadow_Res" "down_LightA_5Shape.dr";
connectAttr "down_Light_grp.down_Filter_Size" "down_LightA_5Shape.fs";
connectAttr "down_Light_grp.down_int" "down_LightA_6Shape.in";
connectAttr "down_Light_grp.down_Color" "down_LightA_6Shape.cl";
connectAttr "down_Light_grp.down_ShadowColor" "down_LightA_6Shape.sc";
connectAttr "down_Light_grp.down_shadow" "down_LightA_6Shape.dms";
connectAttr "down_Light_grp.down_reuse_shadow" "down_LightA_6Shape.du";
connectAttr "down_Light_grp.down_shadow_Res" "down_LightA_6Shape.dr";
connectAttr "down_Light_grp.down_Filter_Size" "down_LightA_6Shape.fs";
connectAttr "down_Light_grp.down_int" "down_LightA_7Shape.in";
connectAttr "down_Light_grp.down_Color" "down_LightA_7Shape.cl";
connectAttr "down_Light_grp.down_ShadowColor" "down_LightA_7Shape.sc";
connectAttr "down_Light_grp.down_shadow" "down_LightA_7Shape.dms";
connectAttr "down_Light_grp.down_reuse_shadow" "down_LightA_7Shape.du";
connectAttr "down_Light_grp.down_shadow_Res" "down_LightA_7Shape.dr";
connectAttr "down_Light_grp.down_Filter_Size" "down_LightA_7Shape.fs";
connectAttr "down_Light_grp.down_int" "down_LightA_8Shape.in";
connectAttr "down_Light_grp.down_Color" "down_LightA_8Shape.cl";
connectAttr "down_Light_grp.down_ShadowColor" "down_LightA_8Shape.sc";
connectAttr "down_Light_grp.down_shadow" "down_LightA_8Shape.dms";
connectAttr "down_Light_grp.down_reuse_shadow" "down_LightA_8Shape.du";
connectAttr "down_Light_grp.down_shadow_Res" "down_LightA_8Shape.dr";
connectAttr "down_Light_grp.down_Filter_Size" "down_LightA_8Shape.fs";
connectAttr "down_Light_grp.down_int" "down_LightB_1Shape.in";
connectAttr "down_Light_grp.down_Color" "down_LightB_1Shape.cl";
connectAttr "down_Light_grp.down_ShadowColor" "down_LightB_1Shape.sc";
connectAttr "down_Light_grp.down_shadow" "down_LightB_1Shape.dms";
connectAttr "down_Light_grp.down_reuse_shadow" "down_LightB_1Shape.du";
connectAttr "down_Light_grp.down_shadow_Res" "down_LightB_1Shape.dr";
connectAttr "down_Light_grp.down_Filter_Size" "down_LightB_1Shape.fs";
connectAttr "down_Light_grp.down_int" "down_LightB_2Shape.in";
connectAttr "down_Light_grp.down_Color" "down_LightB_2Shape.cl";
connectAttr "down_Light_grp.down_ShadowColor" "down_LightB_2Shape.sc";
connectAttr "down_Light_grp.down_shadow" "down_LightB_2Shape.dms";
connectAttr "down_Light_grp.down_reuse_shadow" "down_LightB_2Shape.du";
connectAttr "down_Light_grp.down_shadow_Res" "down_LightB_2Shape.dr";
connectAttr "down_Light_grp.down_Filter_Size" "down_LightB_2Shape.fs";
connectAttr "down_Light_grp.down_int" "down_LightB_3Shape.in";
connectAttr "down_Light_grp.down_Color" "down_LightB_3Shape.cl";
connectAttr "down_Light_grp.down_ShadowColor" "down_LightB_3Shape.sc";
connectAttr "down_Light_grp.down_shadow" "down_LightB_3Shape.dms";
connectAttr "down_Light_grp.down_reuse_shadow" "down_LightB_3Shape.du";
connectAttr "down_Light_grp.down_shadow_Res" "down_LightB_3Shape.dr";
connectAttr "down_Light_grp.down_Filter_Size" "down_LightB_3Shape.fs";
connectAttr "down_Light_grp.down_int" "down_LightB_4Shape.in";
connectAttr "down_Light_grp.down_Color" "down_LightB_4Shape.cl";
connectAttr "down_Light_grp.down_ShadowColor" "down_LightB_4Shape.sc";
connectAttr "down_Light_grp.down_shadow" "down_LightB_4Shape.dms";
connectAttr "down_Light_grp.down_reuse_shadow" "down_LightB_4Shape.du";
connectAttr "down_Light_grp.down_shadow_Res" "down_LightB_4Shape.dr";
connectAttr "down_Light_grp.down_Filter_Size" "down_LightB_4Shape.fs";
connectAttr "down_Light_grp.down_int" "down_LightB_5Shape.in";
connectAttr "down_Light_grp.down_Color" "down_LightB_5Shape.cl";
connectAttr "down_Light_grp.down_ShadowColor" "down_LightB_5Shape.sc";
connectAttr "down_Light_grp.down_shadow" "down_LightB_5Shape.dms";
connectAttr "down_Light_grp.down_reuse_shadow" "down_LightB_5Shape.du";
connectAttr "down_Light_grp.down_shadow_Res" "down_LightB_5Shape.dr";
connectAttr "down_Light_grp.down_Filter_Size" "down_LightB_5Shape.fs";
connectAttr "down_Light_grp.down_int" "down_LightB_6Shape.in";
connectAttr "down_Light_grp.down_Color" "down_LightB_6Shape.cl";
connectAttr "down_Light_grp.down_ShadowColor" "down_LightB_6Shape.sc";
connectAttr "down_Light_grp.down_shadow" "down_LightB_6Shape.dms";
connectAttr "down_Light_grp.down_reuse_shadow" "down_LightB_6Shape.du";
connectAttr "down_Light_grp.down_shadow_Res" "down_LightB_6Shape.dr";
connectAttr "down_Light_grp.down_Filter_Size" "down_LightB_6Shape.fs";
connectAttr "down_Light_grp.down_int" "down_LightB_7Shape.in";
connectAttr "down_Light_grp.down_Color" "down_LightB_7Shape.cl";
connectAttr "down_Light_grp.down_ShadowColor" "down_LightB_7Shape.sc";
connectAttr "down_Light_grp.down_shadow" "down_LightB_7Shape.dms";
connectAttr "down_Light_grp.down_reuse_shadow" "down_LightB_7Shape.du";
connectAttr "down_Light_grp.down_shadow_Res" "down_LightB_7Shape.dr";
connectAttr "down_Light_grp.down_Filter_Size" "down_LightB_7Shape.fs";
connectAttr "down_Light_grp.down_int" "down_LightB_8Shape.in";
connectAttr "down_Light_grp.down_Color" "down_LightB_8Shape.cl";
connectAttr "down_Light_grp.down_ShadowColor" "down_LightB_8Shape.sc";
connectAttr "down_Light_grp.down_shadow" "down_LightB_8Shape.dms";
connectAttr "down_Light_grp.down_reuse_shadow" "down_LightB_8Shape.du";
connectAttr "down_Light_grp.down_shadow_Res" "down_LightB_8Shape.dr";
connectAttr "down_Light_grp.down_Filter_Size" "down_LightB_8Shape.fs";
connectAttr ":defaultLightSet.msg" "lightLinker1.lnk[0].llnk";
connectAttr ":initialShadingGroup.msg" "lightLinker1.lnk[0].olnk";
connectAttr ":defaultLightSet.msg" "lightLinker1.lnk[1].llnk";
connectAttr ":initialParticleSE.msg" "lightLinker1.lnk[1].olnk";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "lightLinker1.msg" ":lightList1.ln" -na;
connectAttr "up_LightA_1Shape.ltd" ":lightList1.l" -na;
connectAttr "up_LightA_2Shape.ltd" ":lightList1.l" -na;
connectAttr "up_LightA_3Shape.ltd" ":lightList1.l" -na;
connectAttr "up_LightA_4Shape.ltd" ":lightList1.l" -na;
connectAttr "up_LightA_5Shape.ltd" ":lightList1.l" -na;
connectAttr "up_LightA_6Shape.ltd" ":lightList1.l" -na;
connectAttr "up_LightA_7Shape.ltd" ":lightList1.l" -na;
connectAttr "up_LightA_8Shape.ltd" ":lightList1.l" -na;
connectAttr "up_LightB_1Shape.ltd" ":lightList1.l" -na;
connectAttr "up_LightB_2Shape.ltd" ":lightList1.l" -na;
connectAttr "up_LightB_3Shape.ltd" ":lightList1.l" -na;
connectAttr "up_LightB_4Shape.ltd" ":lightList1.l" -na;
connectAttr "up_LightB_5Shape.ltd" ":lightList1.l" -na;
connectAttr "up_LightB_6Shape.ltd" ":lightList1.l" -na;
connectAttr "up_LightB_7Shape.ltd" ":lightList1.l" -na;
connectAttr "up_LightB_8Shape.ltd" ":lightList1.l" -na;
connectAttr "up_LightC_1Shape.ltd" ":lightList1.l" -na;
connectAttr "up_LightC_2Shape.ltd" ":lightList1.l" -na;
connectAttr "up_LightC_3Shape.ltd" ":lightList1.l" -na;
connectAttr "up_LightC_8Shape.ltd" ":lightList1.l" -na;
connectAttr "up_LightC_7Shape.ltd" ":lightList1.l" -na;
connectAttr "up_LightC_6Shape.ltd" ":lightList1.l" -na;
connectAttr "up_LightC_5Shape.ltd" ":lightList1.l" -na;
connectAttr "up_LightC_4Shape.ltd" ":lightList1.l" -na;
connectAttr "down_LightA_1Shape.ltd" ":lightList1.l" -na;
connectAttr "down_LightB_1Shape.ltd" ":lightList1.l" -na;
connectAttr "down_LightA_2Shape.ltd" ":lightList1.l" -na;
connectAttr "down_LightA_3Shape.ltd" ":lightList1.l" -na;
connectAttr "down_LightA_4Shape.ltd" ":lightList1.l" -na;
connectAttr "down_LightA_5Shape.ltd" ":lightList1.l" -na;
connectAttr "down_LightA_6Shape.ltd" ":lightList1.l" -na;
connectAttr "down_LightA_7Shape.ltd" ":lightList1.l" -na;
connectAttr "down_LightA_8Shape.ltd" ":lightList1.l" -na;
connectAttr "down_LightB_2Shape.ltd" ":lightList1.l" -na;
connectAttr "down_LightB_3Shape.ltd" ":lightList1.l" -na;
connectAttr "down_LightB_4Shape.ltd" ":lightList1.l" -na;
connectAttr "down_LightB_5Shape.ltd" ":lightList1.l" -na;
connectAttr "down_LightB_6Shape.ltd" ":lightList1.l" -na;
connectAttr "down_LightB_7Shape.ltd" ":lightList1.l" -na;
connectAttr "down_LightB_8Shape.ltd" ":lightList1.l" -na;
connectAttr "Key_LightShape.ltd" ":lightList1.l" -na;
connectAttr "domeShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "up_LightA_1.iog" ":defaultLightSet.dsm" -na;
connectAttr "up_LightA_2.iog" ":defaultLightSet.dsm" -na;
connectAttr "up_LightA_3.iog" ":defaultLightSet.dsm" -na;
connectAttr "up_LightA_4.iog" ":defaultLightSet.dsm" -na;
connectAttr "up_LightA_5.iog" ":defaultLightSet.dsm" -na;
connectAttr "up_LightA_6.iog" ":defaultLightSet.dsm" -na;
connectAttr "up_LightA_7.iog" ":defaultLightSet.dsm" -na;
connectAttr "up_LightA_8.iog" ":defaultLightSet.dsm" -na;
connectAttr "up_LightB_1.iog" ":defaultLightSet.dsm" -na;
connectAttr "up_LightB_2.iog" ":defaultLightSet.dsm" -na;
connectAttr "up_LightB_3.iog" ":defaultLightSet.dsm" -na;
connectAttr "up_LightB_4.iog" ":defaultLightSet.dsm" -na;
connectAttr "up_LightB_5.iog" ":defaultLightSet.dsm" -na;
connectAttr "up_LightB_6.iog" ":defaultLightSet.dsm" -na;
connectAttr "up_LightB_7.iog" ":defaultLightSet.dsm" -na;
connectAttr "up_LightB_8.iog" ":defaultLightSet.dsm" -na;
connectAttr "up_LightC_1.iog" ":defaultLightSet.dsm" -na;
connectAttr "up_LightC_2.iog" ":defaultLightSet.dsm" -na;
connectAttr "up_LightC_3.iog" ":defaultLightSet.dsm" -na;
connectAttr "up_LightC_8.iog" ":defaultLightSet.dsm" -na;
connectAttr "up_LightC_7.iog" ":defaultLightSet.dsm" -na;
connectAttr "up_LightC_6.iog" ":defaultLightSet.dsm" -na;
connectAttr "up_LightC_5.iog" ":defaultLightSet.dsm" -na;
connectAttr "up_LightC_4.iog" ":defaultLightSet.dsm" -na;
connectAttr "down_LightA_1.iog" ":defaultLightSet.dsm" -na;
connectAttr "down_LightB_1.iog" ":defaultLightSet.dsm" -na;
connectAttr "down_LightA_2.iog" ":defaultLightSet.dsm" -na;
connectAttr "down_LightA_3.iog" ":defaultLightSet.dsm" -na;
connectAttr "down_LightA_4.iog" ":defaultLightSet.dsm" -na;
connectAttr "down_LightA_5.iog" ":defaultLightSet.dsm" -na;
connectAttr "down_LightA_6.iog" ":defaultLightSet.dsm" -na;
connectAttr "down_LightA_7.iog" ":defaultLightSet.dsm" -na;
connectAttr "down_LightA_8.iog" ":defaultLightSet.dsm" -na;
connectAttr "down_LightB_2.iog" ":defaultLightSet.dsm" -na;
connectAttr "down_LightB_3.iog" ":defaultLightSet.dsm" -na;
connectAttr "down_LightB_4.iog" ":defaultLightSet.dsm" -na;
connectAttr "down_LightB_5.iog" ":defaultLightSet.dsm" -na;
connectAttr "down_LightB_6.iog" ":defaultLightSet.dsm" -na;
connectAttr "down_LightB_7.iog" ":defaultLightSet.dsm" -na;
connectAttr "down_LightB_8.iog" ":defaultLightSet.dsm" -na;
connectAttr "Key_Light.iog" ":defaultLightSet.dsm" -na;
// End of GI.ma
