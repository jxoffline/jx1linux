Include("\\vng_script\\activitysys\\config\\1022\\head.lua")
Include("\\vng_script\\activitysys\\config\\1022\\variables.lua")
Include("\\vng_script\\activitysys\\config\\1022\\awardlist.lua")
Include("\\vng_script\\activitysys\\config\\1022\\extend.lua")
Include("\\vng_script\\vng_lib\\bittask_lib.lua")
tbConfig = {}

tbConfig[1] = 
{
	nId = 1,
	szMessageType = "ClickNpc",
	szName = "click TQSK",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"B¸ch HiÓu Sinh"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },		
	},
	tbActition = 
	{			
		{"SetDialogTitle",	{"<npc>Tõ 16/01/2016 ®Õn 31/01/2016 h·y ®Õn gÆp <npc> ë D­¬ng Ch©u ®Ó tham gia: <color=yellow>sù kiÖn ®ua top Tinh Th¹ch<color>"} },	
		{"AddDialogOpt",	{"Nép Tinh Th¹ch",2} },		
		{"AddDialogOpt",	{"Xem B¶ng XÕp H¹ng",3} },
		{"AddDialogOpt",	{"NhËn PhÇn Th­ëng XÕp H¹ng",4} },			
	},
}

tbConfig[2] = --nép Hoa Hång
{
	nId = 2,
	szMessageType = "CreateCompose",
	szName = "Nép Tinh Th¹ch",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Nép vËt phÈm",1,1,1,0},
	tbCondition = 
	{	
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },
		{"AddOneMaterial",	{ITEM_TINH_THACH.szName, ITEM_TINH_THACH, 1} },				
		{"ThisActivity:GiveItemCheckTime",	{nil} },
	},
	tbActition = 
	{			
		{"ThisActivity:GiveItem",	{nil} },		
	},
}

tbConfig[3] =
{
	nId = 3,
	szMessageType = "nil",
	szName = "xem b¶ng xÕp h¹ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{				
	},
	tbActition = 
	{
		{"ThisActivity:ShowTopList",	{nil} },
	},
}
tbConfig[4] =
{
	nId = 4,
	szMessageType = "CreateDialog",
	szName = "§èi tho¹i sù kiÖn",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Xin chän phÇn th­ëng:",0},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },
		{"ThisActivity:TopListAwardCheckTime",	{nil} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"PhÇn th­ëng xÕp h¹ng 1",5} },
		{"AddDialogOpt",	{"PhÇn th­ëng xÕp h¹ng 2",6} },	
		{"AddDialogOpt",	{"PhÇn th­ëng xÕp h¹ng 3",7} },		
		{"AddDialogOpt",	{"PhÇn th­ëng xÕp h¹ng 4",8} },		
		{"AddDialogOpt",	{"PhÇn th­ëng xÕp h¹ng 5",9} },		
	},
}
tbConfig[5] =
{
	nId = 5,
	szMessageType = "nil",
	szName = "nhËn phÇn th­ëng h¹ng 1",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{	
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCellWH",	{2,10,1,"default"} },			
	},
	tbActition = 
	{
		{"ThisActivity:GetTopListAward",	{1} },
	},
}
tbConfig[6] =
{
	nId = 6,
	szMessageType = "nil",
	szName = "nhËn phÇn th­ëng h¹ng 2",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{	
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCellWH",	{2,4,1,"default"} },			
	},
	tbActition = 
	{
		{"ThisActivity:GetTopListAward",	{2} },
	},
}
tbConfig[7] =
{
	nId = 7,
	szMessageType = "nil",
	szName = "nhËn phÇn th­ëng h¹ng 3",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },			
	},
	tbActition = 
	{
		{"ThisActivity:GetTopListAward",	{3} },
	},
}
tbConfig[8] =
{
	nId = 8,
	szMessageType = "nil",
	szName = "nhËn phÇn th­ëng h¹ng 4",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{50,"CÇn Ph¶i cã 50 ¤ trèng hµnh trang"} },			
	},
	tbActition = 
	{
		{"ThisActivity:GetTopListAward",	{4} },
	},
}
tbConfig[9] =
{
	nId = 9,
	szMessageType = "nil",
	szName = "nhËn phÇn th­ëng h¹ng 5",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{		
		{"PlayerFunLib:CheckFreeBagCell",	{50,"CÇn Ph¶i cã 50 ¤ trèng hµnh trang"} },			
	},
	tbActition = 
	{
		{"ThisActivity:GetTopListAward",	{5} },
	},
}
