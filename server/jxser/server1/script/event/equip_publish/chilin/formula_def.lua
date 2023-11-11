
Include("\\script\\event\\equip_publish\\chilin\\item_def.lua")

tbFormulaList = {}

tbFormulaList[ITEMPART.helm] = 
{
	nHeight = 2,
	nWidth = 2,
	tbMaterial = 
	{
		tbCommonMaterial = COMMON_MATERIAL,
		tbAdditivelMaterial = ADDITIVE_MATERIAL,
		tbFragment = {{szName = EQUIP_FRAGMENT.szName, tbProp = EQUIP_FRAGMENT.tbProp, nCount = 40}},
		tbEquip = {szName = "Trang bÞ B¹ch Hæ Kh«i", tbEqIndex = BAIHU_EQUIP_INDEX[ITEMPART.helm],  nCount = 1}
	},
	tbProduct = 
	{
		szName = "XÝch L©n Kh«i",
		[1] = {szDesc = "QuyÒn ThiÕu L©m", szName="XÝch L©n Di LÆc T¨ng M¹o",tbProp={0,2516},nQuality=1,},
		[2] = {szDesc = "C«n ThiÕu L©m", szName="XÝch L©n Gi¸ng Ma T¨ng M¹o",tbProp={0,2526},nQuality=1,},
		[3] = {szDesc = "ThiÕu L©m ®ao", szName="XÝch L©n YÕt §Õ T¨ng M¹o",tbProp={0,2536},nQuality=1,},
		[4] = {szDesc = "Chïy Thiªn V­¬ng", szName="XÝch L©n Th­êng Th¾ng Kh«i",tbProp={0,2546},nQuality=1,},
		[5] = {szDesc = "Th­¬ng Thiªn V­¬ng", szName="XÝch L©n V« §Þch Kh«i",tbProp={0,2556},nQuality=1,},
		[6] = {szDesc = "§ao Thiªn V­¬ng", szName="XÝch L©n L«i §×nh Kh«i",tbProp={0,2566},nQuality=1,},
		[7] = {szDesc = "Nga My KiÕm", szName="XÝch L©n TuyÕt ¶nh Ph¸t §¸i",tbProp={0,2576},nQuality=1,},
		[8] = {szDesc = "Nga My Ch­ëng", szName="XÝch L©n V©n Anh Ph¸t §¸i",tbProp={0,2586},nQuality=1,},
		[9] = {szDesc = "Thóy Yªn §¬n §ao", szName="XÝch L©n Minh NguyÖt Tr©m",tbProp={0,2596},nQuality=1,},
		[10] = {szDesc = "Thóy Yªn néi", szName="XÝch L©n Phï Dung Tr©m",tbProp={0,2606},nQuality=1,},
		[11] = {szDesc = "Ngò §éc ch­ëng", szName="XÝch L©n La S¸t §Çu Hoµn",tbProp={0,2616},nQuality=1,},
		[12] = {szDesc = "Ngò §éc ®ao", szName="XÝch L©n Tu La §Çu Hoµn",tbProp={0,2626},nQuality=1,},
		[13] = {szDesc = "§­êng M«n phi ®ao", szName="XÝch L©n C« Tinh Qu¸n",tbProp={0,2636},nQuality=1,},
		[14] = {szDesc = "§­êng M«n Ná", szName="XÝch L©n Th­¬ng Lan Qu¸n",tbProp={0,2646},nQuality=1,},
		[15] = {szDesc = "§­êng M«n Phi Tiªu", szName="XÝch L©n Tô ThÇn Ph¸t Qu¸n",tbProp={0,2656},nQuality=1,},
		[16] = {szDesc = "C¸i Bang ch­ëng", szName="XÝch L©n Thõa Long §Çu Hoµn",tbProp={0,2666},nQuality=1,},
		[17] = {szDesc = "C¸i Bang c«n", szName="XÝch L©n Gi¸ng Long §Çu Hoµn",tbProp={0,2676},nQuality=1,},
		[18] = {szDesc = "Thiªn NhÉn chiÕn", szName="XÝch L©n Nhiªn Kh«n Kh«i",tbProp={0,2686},nQuality=1,},
		[19] = {szDesc = "Thiªn NhÉn ma", szName="XÝch L©n To¹i Tinh Qu¸n MiÖn",tbProp={0,2696},nQuality=1,},
		[20] = {szDesc = "Vâ §ang khÝ", szName="XÝch L©n Tr­êng Sinh Qu¸n",tbProp={0,2706},nQuality=1,},
		[21] = {szDesc = "Vâ §ang kiÕm", szName="XÝch L©n NhÞ Cæ Qu¸n",tbProp={0,2716},nQuality=1,},
		[22] = {szDesc = "§ao C«n L«n", szName="XÝch L©n Cµn Viªn §¹o Qu¸n",tbProp={0,2726},nQuality=1,},
		[23] = {szDesc = "KiÕm C«n L«n", szName="XÝch L©n Tr­êng Kh«ng §¹o Qu¸n",tbProp={0,2736},nQuality=1,},
	},
}
tbFormulaList[ITEMPART.armor] = 
{
	nHeight = 3,
	nWidth = 2,
	tbMaterial = 
	{
		tbCommonMaterial = COMMON_MATERIAL,
		tbAdditivelMaterial = ADDITIVE_MATERIAL,
		tbFragment = {{szName = EQUIP_FRAGMENT.szName, tbProp = EQUIP_FRAGMENT.tbProp, nCount = 100}},
		tbEquip = {szName = "Trang bÞ B¹ch Hæ Y", tbEqIndex = BAIHU_EQUIP_INDEX[ITEMPART.armor],  nCount = 1}
	},
	tbProduct = 
	{
		szName = "Trang BÞ XÝch L©n Y",
		[1] = {szDesc = "QuyÒn ThiÕu L©m", szName="XÝch L©n Di LÆc Cµ Sa",tbProp={0,2520},nQuality=1,},
		[2] = {szDesc = "C«n ThiÕu L©m", szName="XÝch L©n Gi¸ng Ma Cµ Sa",tbProp={0,2530},nQuality=1,},
		[3] = {szDesc = "ThiÕu L©m ®ao", szName="XÝch L©n YÕt §Õ Cµ Sa",tbProp={0,2540},nQuality=1,},
		[4] = {szDesc = "Chïy Thiªn V­¬ng", szName="XÝch L©n Th­êng Th¾ng Kh¶i",tbProp={0,2550},nQuality=1,},
		[5] = {szDesc = "Th­¬ng Thiªn V­¬ng", szName="XÝch L©n V« §Þch Kh¶i",tbProp={0,2560},nQuality=1,},
		[6] = {szDesc = "§ao Thiªn V­¬ng", szName="XÝch L©n L«i §×nh Kh¶i",tbProp={0,2570},nQuality=1,},
		[7] = {szDesc = "Nga My KiÕm", szName="XÝch L©n TuyÕt ¶nh Sa Y",tbProp={0,2580},nQuality=1,},
		[8] = {szDesc = "Nga My Ch­ëng", szName="XÝch L©n V©n Anh Sam",tbProp={0,2590},nQuality=1,},
		[9] = {szDesc = "Thóy Yªn §¬n §ao", szName="XÝch L©n Minh NguyÖt Sam",tbProp={0,2600},nQuality=1,},
		[10] = {szDesc = "Thóy Yªn néi", szName="XÝch L©n Phï Dung Sam",tbProp={0,2610},nQuality=1,},
		[11] = {szDesc = "Ngò §éc ch­ëng", szName="XÝch L©n La S¸t BÝ Trang",tbProp={0,2620},nQuality=1,},
		[12] = {szDesc = "Ngò §éc ®ao", szName="XÝch L©n Tu La Hé Gi¸p",tbProp={0,2630},nQuality=1,},
		[13] = {szDesc = "§­êng M«n phi ®ao", szName="XÝch L©n C« Tinh Gi¸p",tbProp={0,2640},nQuality=1,},
		[14] = {szDesc = "§­êng M«n Ná", szName="XÝch L©n Th­¬ng Lan Gi¸p",tbProp={0,2650},nQuality=1,},
		[15] = {szDesc = "§­êng M«n Phi Tiªu", szName="XÝch L©n Tô ThÇn Gi¸p Y",tbProp={0,2660},nQuality=1,},
		[16] = {szDesc = "C¸i Bang ch­ëng", szName="XÝch L©n Thõa Long C¸i Y",tbProp={0,2670},nQuality=1,},
		[17] = {szDesc = "C¸i Bang c«n", szName="XÝch L©n Gi¸ng Long C¸i Y",tbProp={0,2680},nQuality=1,},
		[18] = {szDesc = "Thiªn NhÉn chiÕn", szName="XÝch L©n Nhiªn Kh«n Gi¸p Y",tbProp={0,2690},nQuality=1,},
		[19] = {szDesc = "Thiªn NhÉn ma", szName="XÝch L©n To¹i Tinh Gi¸p Y",tbProp={0,2700},nQuality=1,},
		[20] = {szDesc = "Vâ §ang khÝ", szName="XÝch L©n Tr­êng Sinh §¹o Bµo",tbProp={0,2710},nQuality=1,},
		[21] = {szDesc = "Vâ §ang kiÕm", szName="XÝch L©n NhÞ Cæ §¹o Bµo",tbProp={0,2720},nQuality=1,},
		[22] = {szDesc = "§ao C«n L«n", szName="XÝch L©n Cµn Viªn §¹o Bµo",tbProp={0,2730},nQuality=1,},
		[23] = {szDesc = "KiÕm C«n L«n", szName="XÝch L©n Tr­êng Kh«ng §¹o Bµo",tbProp={0,2740},nQuality=1,},
	},
}
tbFormulaList[ITEMPART.boots] = 
{
	nHeight = 2,
	nWidth = 2,
	tbMaterial = 
	{
		tbCommonMaterial = COMMON_MATERIAL,
		tbAdditivelMaterial = ADDITIVE_MATERIAL,
		tbFragment = {{szName = EQUIP_FRAGMENT.szName, tbProp = EQUIP_FRAGMENT.tbProp, nCount = 50}},
		tbEquip = {szName = "Trang bÞ B¹ch Hæ Hµi", tbEqIndex = BAIHU_EQUIP_INDEX[ITEMPART.boots],  nCount = 1}
	},
	tbProduct = 
	{
		szName = "Trang BÞ XÝch L©n Hµi",
		[1] = {szDesc = "QuyÒn ThiÕu L©m", szName="XÝch L©n Di LÆc T¨ng Hµi",tbProp={0,2522},nQuality=1,},
		[2] = {szDesc = "C«n ThiÕu L©m", szName="XÝch L©n Gi¸ng Ma T¨ng Hµi",tbProp={0,2532},nQuality=1,},
		[3] = {szDesc = "ThiÕu L©m ®ao", szName="XÝch L©n YÕt §Õ T¨ng Hµi",tbProp={0,2542},nQuality=1,},
		[4] = {szDesc = "Chïy Thiªn V­¬ng", szName="XÝch L©n Th­êng Th¾ng Ngoa",tbProp={0,2552},nQuality=1,},
		[5] = {szDesc = "Th­¬ng Thiªn V­¬ng", szName="XÝch L©n V« §Þch Ngoa",tbProp={0,2562},nQuality=1,},
		[6] = {szDesc = "§ao Thiªn V­¬ng", szName="XÝch L©n L«i §×nh Ngoa",tbProp={0,2572},nQuality=1,},
		[7] = {szDesc = "Nga My KiÕm", szName="XÝch L©n TuyÕt ¶nh Ngoa",tbProp={0,2582},nQuality=1,},
		[8] = {szDesc = "Nga My Ch­ëng", szName="XÝch L©n V©n Anh Ngoa",tbProp={0,2592},nQuality=1,},
		[9] = {szDesc = "Thóy Yªn §¬n §ao", szName="XÝch L©n Minh NguyÖt Ngoa",tbProp={0,2602},nQuality=1,},
		[10] = {szDesc = "Thóy Yªn néi", szName="XÝch L©n Phï Dung Ngoa",tbProp={0,2612},nQuality=1,},
		[11] = {szDesc = "Ngò §éc ch­ëng", szName="XÝch L©n La S¸t Ngoa",tbProp={0,2622},nQuality=1,},
		[12] = {szDesc = "Ngò §éc ®ao", szName="XÝch L©n Tu La Ngoa",tbProp={0,2632},nQuality=1,},
		[13] = {szDesc = "§­êng M«n phi ®ao", szName="XÝch L©n C« Tinh Lý",tbProp={0,2642},nQuality=1,},
		[14] = {szDesc = "§­êng M«n Ná", szName="XÝch L©n Th­¬ng Lan Lý",tbProp={0,2652},nQuality=1,},
		[15] = {szDesc = "§­êng M«n Phi Tiªu", szName="XÝch L©n Tô ThÇn Lý",tbProp={0,2662},nQuality=1,},
		[16] = {szDesc = "C¸i Bang ch­ëng", szName="XÝch L©n Thõa Long Ngoa",tbProp={0,2672},nQuality=1,},
		[17] = {szDesc = "C¸i Bang c«n", szName="XÝch L©n Gi¸ng Long Ngoa",tbProp={0,2682},nQuality=1,},
		[18] = {szDesc = "Thiªn NhÉn chiÕn", szName="XÝch L©n Nhiªn Kh«n Ngoa",tbProp={0,2692},nQuality=1,},
		[19] = {szDesc = "Thiªn NhÉn ma", szName="XÝch L©n To¹i Tinh Ngoa",tbProp={0,2702},nQuality=1,},
		[20] = {szDesc = "Vâ §ang khÝ", szName="XÝch L©n Tr­êng Sinh Lý",tbProp={0,2712},nQuality=1,},
		[21] = {szDesc = "Vâ §ang kiÕm", szName="XÝch L©n NhÞ Cæ Lý",tbProp={0,2722},nQuality=1,},
		[22] = {szDesc = "§ao C«n L«n", szName="XÝch L©n Cµn Viªn Ngoa",tbProp={0,2732},nQuality=1,},
		[23] = {szDesc = "KiÕm C«n L«n", szName="XÝch L©n Tr­êng Kh«ng Ngoa",tbProp={0,2742},nQuality=1,},
	},
}

tbFormulaList[ITEMPART.belt] = 
{
	nHeight = 1,
	nWidth = 2,
	tbMaterial = 
	{
		tbCommonMaterial = COMMON_MATERIAL,
		tbAdditivelMaterial = ADDITIVE_MATERIAL,
		tbFragment = {{szName = EQUIP_FRAGMENT.szName, tbProp = EQUIP_FRAGMENT.tbProp, nCount = 40}},
		tbEquip = {szName = "Trang bÞ B¹ch Hæ  Yªu §¸i", tbEqIndex = BAIHU_EQUIP_INDEX[ITEMPART.belt],  nCount = 1}
	},
	tbProduct = 
	{
		szName = "Trang BÞ XÝch L©n Yªu §¸i",
		[1] = {szDesc = "QuyÒn ThiÕu L©m", szName="XÝch L©n Di LÆc Yªu §¸i",tbProp={0,2519},nQuality=1,},
		[2] = {szDesc = "C«n ThiÕu L©m", szName="XÝch L©n Gi¸ng Ma Yªu §¸i",tbProp={0,2529},nQuality=1,},
		[3] = {szDesc = "ThiÕu L©m ®ao", szName="XÝch L©n YÕt §Õ Yªu §¸i",tbProp={0,2539},nQuality=1,},
		[4] = {szDesc = "Chïy Thiªn V­¬ng", szName="XÝch L©n Th­êng Th¾ng Yªu §¸i",tbProp={0,2549},nQuality=1,},
		[5] = {szDesc = "Th­¬ng Thiªn V­¬ng", szName="XÝch L©n V« §Þch Yªu §¸i",tbProp={0,2559},nQuality=1,},
		[6] = {szDesc = "§ao Thiªn V­¬ng", szName="XÝch L©n L«i §×nh Yªu §¸i",tbProp={0,2569},nQuality=1,},
		[7] = {szDesc = "Nga My KiÕm", szName="XÝch L©n TuyÕt ¶nh Thóc Yªu",tbProp={0,2579},nQuality=1,},
		[8] = {szDesc = "Nga My Ch­ëng", szName="XÝch L©n V©n Anh Thóc Yªu",tbProp={0,2589},nQuality=1,},
		[9] = {szDesc = "Thóy Yªn §¬n §ao", szName="XÝch L©n Minh NguyÖt Ti §¸i",tbProp={0,2599},nQuality=1,},
		[10] = {szDesc = "Thóy Yªn néi", szName="XÝch L©n Phï Dung Yªu §¸i",tbProp={0,2609},nQuality=1,},
		[11] = {szDesc = "Ngò §éc ch­ëng", szName="XÝch L©n La S¸t Yªu §¸i",tbProp={0,2619},nQuality=1,},
		[12] = {szDesc = "Ngò §éc ®ao", szName="XÝch L©n Tu La Yªu §¸i",tbProp={0,2629},nQuality=1,},
		[13] = {szDesc = "§­êng M«n phi ®ao", szName="XÝch L©n C« Tinh TriÒn Yªu",tbProp={0,2639},nQuality=1,},
		[14] = {szDesc = "§­êng M«n Ná", szName="XÝch L©n Th­¬ng Lan Thóc Yªu",tbProp={0,2649},nQuality=1,},
		[15] = {szDesc = "§­êng M«n Phi Tiªu", szName="XÝch L©n Tô ThÇn Thóc Yªu",tbProp={0,2659},nQuality=1,},
		[16] = {szDesc = "C¸i Bang ch­ëng", szName="XÝch L©n Thõa Long Thóc Yªu",tbProp={0,2669},nQuality=1,},
		[17] = {szDesc = "C¸i Bang c«n", szName="XÝch L©n Gi¸ng Long Thóc Yªu",tbProp={0,2679},nQuality=1,},
		[18] = {szDesc = "Thiªn NhÉn chiÕn", szName="XÝch L©n Nhiªn Kh«n Yªu §¸i",tbProp={0,2689},nQuality=1,},
		[19] = {szDesc = "Thiªn NhÉn ma", szName="XÝch L©n To¹i Tinh Yªu §¸i",tbProp={0,2699},nQuality=1,},
		[20] = {szDesc = "Vâ §ang khÝ", szName="XÝch L©n Tr­êng Sinh Ph¸p §¸i",tbProp={0,2709},nQuality=1,},
		[21] = {szDesc = "Vâ §ang kiÕm", szName="XÝch L©n NhÞ Cæ Ph¸p §¸i",tbProp={0,2719},nQuality=1,},
		[22] = {szDesc = "§ao C«n L«n", szName="XÝch L©n Cµn Viªn Yªu §¸i",tbProp={0,2729},nQuality=1,},
		[23] = {szDesc = "KiÕm C«n L«n", szName="XÝch L©n Tr­êng Kh«ng Yªu §¸i",tbProp={0,2739},nQuality=1,},
	}
}
tbFormulaList[ITEMPART.cuff] = 
{
	nHeight = 2,
	nWidth = 1,
	tbMaterial = 
	{
		tbCommonMaterial = COMMON_MATERIAL,
		tbAdditivelMaterial = ADDITIVE_MATERIAL,
		tbFragment = {{szName = EQUIP_FRAGMENT.szName, tbProp = EQUIP_FRAGMENT.tbProp, nCount = 50}},
		tbEquip = {szName = "Trang bÞ B¹ch Hé UyÓn", tbEqIndex = BAIHU_EQUIP_INDEX[ITEMPART.cuff],  nCount = 1}
	},
	tbProduct = 
	{
		szName = "Trang BÞ XÝch L©n Hé UyÓn",
		[1] = {szDesc = "QuyÒn ThiÕu L©m", szName="XÝch L©n Di LÆc Hé UyÓn",tbProp={0,2518},nQuality=1,},
		[2] = {szDesc = "C«n ThiÕu L©m", szName="XÝch L©n Gi¸ng Ma Hé UyÓn",tbProp={0,2528},nQuality=1,},
		[3] = {szDesc = "ThiÕu L©m ®ao", szName="XÝch L©n YÕt §Õ Hé UyÓn",tbProp={0,2538},nQuality=1,},
		[4] = {szDesc = "Chïy Thiªn V­¬ng", szName="XÝch L©n Th­êng Th¾ng Thóc UyÓn",tbProp={0,2548},nQuality=1,},
		[5] = {szDesc = "Th­¬ng Thiªn V­¬ng", szName="XÝch L©n V« §Þch Thóc UyÓn",tbProp={0,2558},nQuality=1,},
		[6] = {szDesc = "§ao Thiªn V­¬ng", szName="XÝch L©n L«i §×nh Thóc UyÓn",tbProp={0,2568},nQuality=1,},
		[7] = {szDesc = "Nga My KiÕm", szName="XÝch L©n TuyÕt ¶nh Hé UyÓn",tbProp={0,2578},nQuality=1,},
		[8] = {szDesc = "Nga My Ch­ëng", szName="XÝch L©n V©n Anh Hé UyÓn",tbProp={0,2588},nQuality=1,},
		[9] = {szDesc = "Thóy Yªn §¬n §ao", szName="XÝch L©n Minh NguyÖt Tô",tbProp={0,2598},nQuality=1,},
		[10] = {szDesc = "Thóy Yªn néi", szName="XÝch L©n Phï Dung Tô",tbProp={0,2608},nQuality=1,},
		[11] = {szDesc = "Ngò §éc ch­ëng", szName="XÝch L©n La S¸t Hé UyÓn",tbProp={0,2618},nQuality=1,},
		[12] = {szDesc = "Ngò §éc ®ao", szName="XÝch L©n Tu La Hé UyÓn",tbProp={0,2628},nQuality=1,},
		[13] = {szDesc = "§­êng M«n phi ®ao", szName="XÝch L©n C« Tinh Hé UyÓn",tbProp={0,2638},nQuality=1,},
		[14] = {szDesc = "§­êng M«n Ná", szName="XÝch L©n Th­¬ng Lan Hé UyÓn",tbProp={0,2648},nQuality=1,},
		[15] = {szDesc = "§­êng M«n Phi Tiªu", szName="XÝch L©n Tô ThÇn Hé UyÓn",tbProp={0,2658},nQuality=1,},
		[16] = {szDesc = "C¸i Bang ch­ëng", szName="XÝch L©n Thõa Long Hé UyÓn",tbProp={0,2668},nQuality=1,},
		[17] = {szDesc = "C¸i Bang c«n", szName="XÝch L©n Gi¸ng Long Hé UyÓn",tbProp={0,2678},nQuality=1,},
		[18] = {szDesc = "Thiªn NhÉn chiÕn", szName="XÝch L©n Nhiªn Kh«n Hé UyÓn",tbProp={0,2688},nQuality=1,},
		[19] = {szDesc = "Thiªn NhÉn ma", szName="XÝch L©n To¹i Tinh Hé UyÓn",tbProp={0,2698},nQuality=1,},
		[20] = {szDesc = "Vâ §ang khÝ", szName="XÝch L©n Tr­êng Sinh Tô",tbProp={0,2708},nQuality=1,},
		[21] = {szDesc = "Vâ §ang kiÕm", szName="XÝch L©n NhÞ Cæ Tô",tbProp={0,2718},nQuality=1,},
		[22] = {szDesc = "§ao C«n L«n", szName="XÝch L©n Cµn Viªn Hé UyÓn",tbProp={0,2728},nQuality=1,},
		[23] = {szDesc = "KiÕm C«n L«n", szName="XÝch L©n Tr­êng Kh«ng Hé UyÓn",tbProp={0,2738},nQuality=1,},
	}
}
tbFormulaList[ITEMPART.amulet] = 
{
	nHeight = 1,
	nWidth = 2,
	tbMaterial = 
	{
		tbCommonMaterial = COMMON_MATERIAL,
		tbAdditivelMaterial = ADDITIVE_MATERIAL,
		tbFragment = {{szName = EQUIP_FRAGMENT.szName, tbProp = EQUIP_FRAGMENT.tbProp, nCount = 40}},
		tbEquip = {szName = "Trang bÞ B¹ch H¹ng Liªn", tbEqIndex = BAIHU_EQUIP_INDEX[ITEMPART.amulet],  nCount = 1}
	},
	tbProduct = 
	{
		szName = "Trang BÞ XÝch L©n H¹ng Liªn",
		[1] = {szDesc = "QuyÒn ThiÕu L©m", szName="XÝch L©n Di LÆc Ch©u Liªn",tbProp={0,2515},nQuality=1,},
		[2] = {szDesc = "C«n ThiÕu L©m", szName="XÝch L©n Gi¸ng Ma PhËt Ch©u",tbProp={0,2525},nQuality=1,},
		[3] = {szDesc = "ThiÕu L©m ®ao", szName="XÝch L©n YÕt §Õ H¹ng Liªn",tbProp={0,2535},nQuality=1,},
		[4] = {szDesc = "Chïy Thiªn V­¬ng", szName="XÝch L©n Th­êng Th¾ng Liªn",tbProp={0,2545},nQuality=1,},
		[5] = {szDesc = "Th­¬ng Thiªn V­¬ng", szName="XÝch L©n V« §Þch H¹ng Liªn",tbProp={0,2555},nQuality=1,},
		[6] = {szDesc = "§ao Thiªn V­¬ng", szName="XÝch L©n L«i §×nh H¹ng Liªn",tbProp={0,2565},nQuality=1,},
		[7] = {szDesc = "Nga My KiÕm", szName="XÝch L©n TuyÕt ¶nh Ch©u Liªn",tbProp={0,2575},nQuality=1,},
		[8] = {szDesc = "Nga My Ch­ëng", szName="XÝch L©n V©n Anh Ch©u Liªn",tbProp={0,2585},nQuality=1,},
		[9] = {szDesc = "Thóy Yªn §¬n §ao", szName="XÝch L©n Minh NguyÖt Ch©u Liªn",tbProp={0,2595},nQuality=1,},
		[10] = {szDesc = "Thóy Yªn néi", szName="XÝch L©n Phï Dung Ch©u Liªn",tbProp={0,2605},nQuality=1,},
		[11] = {szDesc = "Ngò §éc ch­ëng", szName="XÝch L©n La S¸t H¹ng Liªn",tbProp={0,2615},nQuality=1,},
		[12] = {szDesc = "Ngò §éc ®ao", szName="XÝch L©n Tu La H¹ng Liªn",tbProp={0,2625},nQuality=1,},
		[13] = {szDesc = "§­êng M«n phi ®ao", szName="XÝch L©n C« Tinh H¹ng Liªn",tbProp={0,2635},nQuality=1,},
		[14] = {szDesc = "§­êng M«n Ná", szName="XÝch L©n Th­¬ng Lan H¹ng Liªn",tbProp={0,2645},nQuality=1,},
		[15] = {szDesc = "§­êng M«n Phi Tiªu", szName="XÝch L©n Tô ThÇn Liªn",tbProp={0,2655},nQuality=1,},
		[16] = {szDesc = "C¸i Bang ch­ëng", szName="XÝch L©n Thõa Long H¹ng Liªn",tbProp={0,2665},nQuality=1,},
		[17] = {szDesc = "C¸i Bang c«n", szName="XÝch L©n Gi¸ng Long H¹ng Liªn",tbProp={0,2675},nQuality=1,},
		[18] = {szDesc = "Thiªn NhÉn chiÕn", szName="XÝch L©n Nhiªn Kh«n H¹ng Khuyªn",tbProp={0,2685},nQuality=1,},
		[19] = {szDesc = "Thiªn NhÉn ma", szName="XÝch L©n To¹i Tinh H¹ng Liªn",tbProp={0,2695},nQuality=1,},
		[20] = {szDesc = "Vâ §ang khÝ", szName="XÝch L©n Tr­êng Sinh Phï",tbProp={0,2705},nQuality=1,},
		[21] = {szDesc = "Vâ §ang kiÕm", szName="XÝch L©n NhÞ Cæ Phï",tbProp={0,2715},nQuality=1,},
		[22] = {szDesc = "§ao C«n L«n", szName="XÝch L©n Cµn Viªn H¹ng Liªn",tbProp={0,2725},nQuality=1,},
		[23] = {szDesc = "KiÕm C«n L«n", szName="XÝch L©n Tr­êng Kh«ng Phï",tbProp={0,2735},nQuality=1,},
	}
}
tbFormulaList[ITEMPART.pendant] = 
{
	nHeight = 2,
	nWidth = 1,
	tbMaterial = 
	{
		tbCommonMaterial = COMMON_MATERIAL,
		tbAdditivelMaterial = ADDITIVE_MATERIAL,
		tbFragment = {{szName = EQUIP_FRAGMENT.szName, tbProp = EQUIP_FRAGMENT.tbProp, nCount = 40}},
		tbEquip = {szName = "Trang bÞ B¹ch Hæ Béi", tbEqIndex = BAIHU_EQUIP_INDEX[ITEMPART.pendant],  nCount = 1}
	},
	tbProduct = 
	{
		szName = "Trang BÞ XÝch L©n Béi",
		[1] = {szDesc = "QuyÒn ThiÕu L©m", szName="XÝch L©n Di LÆc Yªu Trôy",tbProp={0,2523},nQuality=1,},
		[2] = {szDesc = "C«n ThiÕu L©m", szName="XÝch L©n Gi¸ng Ma Yªu Trôy",tbProp={0,2533},nQuality=1,},
		[3] = {szDesc = "ThiÕu L©m ®ao", szName="XÝch L©n YÕt §Õ Yªu Trôy",tbProp={0,2543},nQuality=1,},
		[4] = {szDesc = "Chïy Thiªn V­¬ng", szName="XÝch L©n Th­êng Th¾ng Béi",tbProp={0,2553},nQuality=1,},
		[5] = {szDesc = "Th­¬ng Thiªn V­¬ng", szName="XÝch L©n V« §Þch Yªu Trôy",tbProp={0,2563},nQuality=1,},
		[6] = {szDesc = "§ao Thiªn V­¬ng", szName="XÝch L©n L«i §×nh Yªu Trôy",tbProp={0,2573},nQuality=1,},
		[7] = {szDesc = "Nga My KiÕm", szName="XÝch L©n TuyÕt ¶nh H­¬ng Nang",tbProp={0,2583},nQuality=1,},
		[8] = {szDesc = "Nga My Ch­ëng", szName="XÝch L©n V©n Anh H­¬ng Nang",tbProp={0,2593},nQuality=1,},
		[9] = {szDesc = "Thóy Yªn §¬n §ao", szName="XÝch L©n Minh NguyÖt H­¬ng Nang",tbProp={0,2603},nQuality=1,},
		[10] = {szDesc = "Thóy Yªn néi", szName="XÝch L©n Phï Dung H­¬ng Nang",tbProp={0,2613},nQuality=1,},
		[11] = {szDesc = "Ngò §éc ch­ëng", szName="XÝch L©n La S¸t Yªu Trôy",tbProp={0,2623},nQuality=1,},
		[12] = {szDesc = "Ngò §éc ®ao", szName="XÝch L©n Tu La Yªu Trôy",tbProp={0,2633},nQuality=1,},
		[13] = {szDesc = "§­êng M«n phi ®ao", szName="XÝch L©n C« Tinh Trôy",tbProp={0,2643},nQuality=1,},
		[14] = {szDesc = "§­êng M«n Ná", szName="XÝch L©n Th­¬ng Lan Yªu Trôy",tbProp={0,2653},nQuality=1,},
		[15] = {szDesc = "§­êng M«n Phi Tiªu", szName="XÝch L©n Tô ThÇn Yªu Trôy",tbProp={0,2663},nQuality=1,},
		[16] = {szDesc = "C¸i Bang ch­ëng", szName="XÝch L©n Thõa Long Yªu Trôy",tbProp={0,2673},nQuality=1,},
		[17] = {szDesc = "C¸i Bang c«n", szName="XÝch L©n Gi¸ng Long Yªu Trôy",tbProp={0,2683},nQuality=1,},
		[18] = {szDesc = "Thiªn NhÉn chiÕn", szName="XÝch L©n Nhiªn Kh«n Béi",tbProp={0,2693},nQuality=1,},
		[19] = {szDesc = "Thiªn NhÉn ma", szName="XÝch L©n To¹i Tinh Béi",tbProp={0,2703},nQuality=1,},
		[20] = {szDesc = "Vâ §ang khÝ", szName="XÝch L©n Tr­êng Sinh Ngäc Béi",tbProp={0,2713},nQuality=1,},
		[21] = {szDesc = "Vâ §ang kiÕm", szName="XÝch L©n NhÞ Cæ Ngäc Béi",tbProp={0,2723},nQuality=1,},
		[22] = {szDesc = "§ao C«n L«n", szName="XÝch L©n Cµn Viªn Béi",tbProp={0,2733},nQuality=1,},
		[23] = {szDesc = "KiÕm C«n L«n", szName="XÝch L©n Tr­êng Kh«ng Béi",tbProp={0,2743},nQuality=1,},
	}
}
tbFormulaList[ITEMPART.ring1] = 
{
	nHeight = 1,
	nWidth = 1,
	tbMaterial = 
	{
		tbCommonMaterial = COMMON_MATERIAL,
		tbAdditivelMaterial = ADDITIVE_MATERIAL,
		tbFragment = {{szName = EQUIP_FRAGMENT.szName, tbProp = EQUIP_FRAGMENT.tbProp, nCount = 100}},
		tbEquip = {szName = "Trang bÞ B¹ch Hæ Th­îng Giíi", tbEqIndex = BAIHU_EQUIP_INDEX[ITEMPART.ring1],  nCount = 1}
	},
	tbProduct = 
	{
		szName = "Trang BÞ XÝch L©n Th­îng Giíi",
		[1] = {szDesc = "QuyÒn ThiÕu L©m", szName="XÝch L©n Di LÆc Th­îng Giíi",tbProp={0,2517},nQuality=1,},
		[2] = {szDesc = "C«n ThiÕu L©m", szName="XÝch L©n Gi¸ng Ma Th­îng Giíi",tbProp={0,2527},nQuality=1,},
		[3] = {szDesc = "ThiÕu L©m ®ao", szName="XÝch L©n YÕt §Õ Th­îng Giíi",tbProp={0,2537},nQuality=1,},
		[4] = {szDesc = "Chïy Thiªn V­¬ng", szName="XÝch L©n Th­êng Th¾ng Th­îng Giíi",tbProp={0,2547},nQuality=1,},
		[5] = {szDesc = "Th­¬ng Thiªn V­¬ng", szName="XÝch L©n V« §Þch Th­îng Giíi",tbProp={0,2557},nQuality=1,},
		[6] = {szDesc = "§ao Thiªn V­¬ng", szName="XÝch L©n L«i §×nh Th­îng Giíi",tbProp={0,2567},nQuality=1,},
		[7] = {szDesc = "Nga My KiÕm", szName="XÝch L©n TuyÕt ¶nh Th­îng Giíi",tbProp={0,2577},nQuality=1,},
		[8] = {szDesc = "Nga My Ch­ëng", szName="XÝch L©n V©n Anh Th­îng Giíi",tbProp={0,2587},nQuality=1,},
		[9] = {szDesc = "Thóy Yªn §¬n §ao", szName="XÝch L©n Minh NguyÖt Th­îng Giíi",tbProp={0,2597},nQuality=1,},
		[10] = {szDesc = "Thóy Yªn néi", szName="XÝch L©n Phï Dung Th­îng Giíi",tbProp={0,2607},nQuality=1,},
		[11] = {szDesc = "Ngò §éc ch­ëng", szName="XÝch L©n La S¸t Th­îng Giíi",tbProp={0,2617},nQuality=1,},
		[12] = {szDesc = "Ngò §éc ®ao", szName="XÝch L©n Tu La Th­îng Giíi",tbProp={0,2627},nQuality=1,},
		[13] = {szDesc = "§­êng M«n phi ®ao", szName="XÝch L©n C« Tinh Th­îng Giíi",tbProp={0,2637},nQuality=1,},
		[14] = {szDesc = "§­êng M«n Ná", szName="XÝch L©n Th­¬ng Lan Th­îng Giíi",tbProp={0,2647},nQuality=1,},
		[15] = {szDesc = "§­êng M«n Phi Tiªu", szName="XÝch L©n Tô ThÇn Th­îng Giíi",tbProp={0,2657},nQuality=1,},
		[16] = {szDesc = "C¸i Bang ch­ëng", szName="XÝch L©n Thõa Long Th­îng Giíi",tbProp={0,2667},nQuality=1,},
		[17] = {szDesc = "C¸i Bang c«n", szName="XÝch L©n Gi¸ng Long Th­îng Giíi",tbProp={0,2677},nQuality=1,},
		[18] = {szDesc = "Thiªn NhÉn chiÕn", szName="XÝch L©n Nhiªn Kh«n Th­îng Giíi",tbProp={0,2687},nQuality=1,},
		[19] = {szDesc = "Thiªn NhÉn ma", szName="XÝch L©n To¹i Tinh Th­îng Giíi",tbProp={0,2697},nQuality=1,},
		[20] = {szDesc = "Vâ §ang khÝ", szName="XÝch L©n Tr­êng Sinh Th­îng Giíi",tbProp={0,2707},nQuality=1,},
		[21] = {szDesc = "Vâ §ang kiÕm", szName="XÝch L©n NhÞ Cæ Th­îng Giíi",tbProp={0,2717},nQuality=1,},
		[22] = {szDesc = "§ao C«n L«n", szName="XÝch L©n Cµn Viªn Th­îng Giíi",tbProp={0,2727},nQuality=1,},
		[23] = {szDesc = "KiÕm C«n L«n", szName="XÝch L©n Tr­êng Kh«ng Th­îng Giíi",tbProp={0,2737},nQuality=1,},
	}
}
tbFormulaList[ITEMPART.ring2] = 
{
	nHeight = 1,
	nWidth = 1,
	tbMaterial = 
	{
		tbCommonMaterial = COMMON_MATERIAL,
		tbAdditivelMaterial = ADDITIVE_MATERIAL,
		tbFragment = {{szName = EQUIP_FRAGMENT.szName, tbProp = EQUIP_FRAGMENT.tbProp, nCount = 100}},
		tbEquip = {szName = "Trang bÞ B¹ch Hæ H¹ Giíi", tbEqIndex = BAIHU_EQUIP_INDEX[ITEMPART.ring2],  nCount = 1}
	},
	tbProduct = 
	{
		szName = "Trang BÞ XÝch L©n H¹ Giíi",
		[1] = {szDesc = "QuyÒn ThiÕu L©m", szName="XÝch L©n Di LÆc H¹ Giíi",tbProp={0,2524},nQuality=1,},
		[2] = {szDesc = "C«n ThiÕu L©m", szName="XÝch L©n Gi¸ng Ma H¹ Giíi",tbProp={0,2534},nQuality=1,},
		[3] = {szDesc = "ThiÕu L©m ®ao", szName="XÝch L©n YÕt §Õ H¹ Giíi",tbProp={0,2544},nQuality=1,},
		[4] = {szDesc = "Chïy Thiªn V­¬ng", szName="XÝch L©n Th­êng Th¾ng H¹ Giíi",tbProp={0,2554},nQuality=1,},
		[5] = {szDesc = "Th­¬ng Thiªn V­¬ng", szName="XÝch L©n V« §Þch H¹ Giíi",tbProp={0,2564},nQuality=1,},
		[6] = {szDesc = "§ao Thiªn V­¬ng", szName="XÝch L©n L«i §×nh H¹ Giíi",tbProp={0,2574},nQuality=1,},
		[7] = {szDesc = "Nga My KiÕm", szName="XÝch L©n TuyÕt ¶nh H¹ Giíi",tbProp={0,2584},nQuality=1,},
		[8] = {szDesc = "Nga My Ch­ëng", szName="XÝch L©n V©n Anh H¹ Giíi",tbProp={0,2594},nQuality=1,},
		[9] = {szDesc = "Thóy Yªn §¬n §ao", szName="XÝch L©n Minh NguyÖt H¹ Giíi",tbProp={0,2604},nQuality=1,},
		[10] = {szDesc = "Thóy Yªn néi", szName="XÝch L©n Phï Dung H¹ Giíi",tbProp={0,2614},nQuality=1,},
		[11] = {szDesc = "Ngò §éc ch­ëng", szName="XÝch L©n La S¸t H¹ Giíi",tbProp={0,2624},nQuality=1,},
		[12] = {szDesc = "Ngò §éc ®ao", szName="XÝch L©n Tu La H¹ Giíi",tbProp={0,2634},nQuality=1,},
		[13] = {szDesc = "§­êng M«n phi ®ao", szName="XÝch L©n C« Tinh H¹ Giíi",tbProp={0,2644},nQuality=1,},
		[14] = {szDesc = "§­êng M«n Ná", szName="XÝch L©n Th­¬ng Lan H¹ Giíi",tbProp={0,2654},nQuality=1,},
		[15] = {szDesc = "§­êng M«n Phi Tiªu", szName="XÝch L©n Tô ThÇn H¹ Giíi",tbProp={0,2664},nQuality=1,},
		[16] = {szDesc = "C¸i Bang ch­ëng", szName="XÝch L©n Thõa Long H¹ Giíi",tbProp={0,2674},nQuality=1,},
		[17] = {szDesc = "C¸i Bang c«n", szName="XÝch L©n Gi¸ng Long H¹ Giíi",tbProp={0,2684},nQuality=1,},
		[18] = {szDesc = "Thiªn NhÉn chiÕn", szName="XÝch L©n Nhiªn Kh«n H¹ Giíi",tbProp={0,2694},nQuality=1,},
		[19] = {szDesc = "Thiªn NhÉn ma", szName="XÝch L©n To¹i Tinh H¹ Giíi",tbProp={0,2704},nQuality=1,},
		[20] = {szDesc = "Vâ §ang khÝ", szName="XÝch L©n Tr­êng Sinh H¹ Giíi",tbProp={0,2714},nQuality=1,},
		[21] = {szDesc = "Vâ §ang kiÕm", szName="XÝch L©n NhÞ Cæ H¹ Giíi",tbProp={0,2724},nQuality=1,},
		[22] = {szDesc = "§ao C«n L«n", szName="XÝch L©n Cµn Viªn H¹ Giíi",tbProp={0,2734},nQuality=1,},
		[23] = {szDesc = "KiÕm C«n L«n", szName="XÝch L©n Tr­êng Kh«ng H¹ Giíi",tbProp={0,2744},nQuality=1,},
	}
}
tbFormulaList[ITEMPART.weapon] = 
{
	nHeight = 4,
	nWidth = 2,
	tbMaterial = 
	{
		tbCommonMaterial = COMMON_MATERIAL,
		tbAdditivelMaterial = ADDITIVE_MATERIAL,
		tbFragment = {{szName = EQUIP_FRAGMENT.szName, tbProp = EQUIP_FRAGMENT.tbProp, nCount = 200}},
		tbEquip = {szName = "Trang bÞ B¹ch Hæ Vò KhÝ", tbEqIndex = BAIHU_EQUIP_INDEX[ITEMPART.weapon], nCount = 1}
	},
	tbProduct = 
	{
		szName = "Trang BÞ XÝch L©n Vò KhÝ",
		[1] = {szDesc = "QuyÒn ThiÕu L©m", szName="XÝch L©n Di LÆc TriÒn Thñ",tbProp={0,2521},nQuality=1,},
		[2] = {szDesc = "C«n ThiÕu L©m", szName="XÝch L©n Gi¸ng Ma T¨ng C«n",tbProp={0,2531},nQuality=1,},
		[3] = {szDesc = "ThiÕu L©m ®ao", szName="XÝch L©n YÕt §Õ Giíi §ao",tbProp={0,2541},nQuality=1,},
		[4] = {szDesc = "Chïy Thiªn V­¬ng", szName="XÝch L©n Th­êng Th¾ng Chïy",tbProp={0,2551},nQuality=1,},
		[5] = {szDesc = "Th­¬ng Thiªn V­¬ng", szName="XÝch L©n V« §Þch Th­¬ng",tbProp={0,2561},nQuality=1,},
		[6] = {szDesc = "§ao Thiªn V­¬ng", szName="XÝch L©n L«i §×nh B¶o §ao",tbProp={0,2571},nQuality=1,},
		[7] = {szDesc = "Nga My KiÕm", szName="XÝch L©n TuyÕt ¶nh Tr­êng KiÕm",tbProp={0,2581},nQuality=1,},
		[8] = {szDesc = "Nga My Ch­ëng", szName="XÝch L©n V©n Anh TriÒn Thñ",tbProp={0,2591},nQuality=1,},
		[9] = {szDesc = "Thóy Yªn §¬n §ao", szName="XÝch L©n Minh NguyÖt §ao",tbProp={0,2601},nQuality=1,},
		[10] = {szDesc = "Thóy Yªn néi", szName="XÝch L©n Phï Dung Song NhÉn",tbProp={0,2611},nQuality=1,},
		[11] = {szDesc = "Ngò §éc ch­ëng", szName="XÝch L©n La S¸t TriÒn Thñ",tbProp={0,2621},nQuality=1,},
		[12] = {szDesc = "Ngò §éc ®ao", szName="XÝch L©n Tu La B¶o §ao",tbProp={0,2631},nQuality=1,},
		[13] = {szDesc = "§­êng M«n phi ®ao", szName="XÝch L©n C« Tinh Phi §ao",tbProp={0,2641},nQuality=1,},
		[14] = {szDesc = "§­êng M«n Ná", szName="XÝch L©n Th­¬ng Lan Tô TiÔn",tbProp={0,2651},nQuality=1,},
		[15] = {szDesc = "§­êng M«n Phi Tiªu", szName="XÝch L©n Tô ThÇn Phi Tiªu",tbProp={0,2661},nQuality=1,},
		[16] = {szDesc = "C¸i Bang ch­ëng", szName="XÝch L©n Thõa Long TriÒn Thñ",tbProp={0,2671},nQuality=1,},
		[17] = {szDesc = "C¸i Bang c«n", szName="XÝch L©n Gi¸ng Long Bæng",tbProp={0,2681},nQuality=1,},
		[18] = {szDesc = "Thiªn NhÉn chiÕn", szName="XÝch L©n Nhiªn Kh«n Th­¬ng",tbProp={0,2691},nQuality=1,},
		[19] = {szDesc = "Thiªn NhÉn ma", szName="XÝch L©n To¹i Tinh §ao",tbProp={0,2701},nQuality=1,},
		[20] = {szDesc = "Vâ §ang khÝ", szName="XÝch L©n Tr­êng Sinh KiÕm",tbProp={0,2711},nQuality=1,},
		[21] = {szDesc = "Vâ §ang kiÕm", szName="XÝch L©n NhÞ Cæ KiÕm",tbProp={0,2721},nQuality=1,},
		[22] = {szDesc = "§ao C«n L«n", szName="XÝch L©n Cµn Viªn §ao",tbProp={0,2731},nQuality=1,},
		[23] = {szDesc = "KiÕm C«n L«n", szName="XÝch L©n Tr­êng Kh«ng KiÕm",tbProp={0,2741},nQuality=1,},
	}
}