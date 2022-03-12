Include("\\script\\activitysys\\config\\20\\variables.lua")
tbConfig = {}
tbConfig[1] = --Ò»¸öÏ¸½Ú
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "server start",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"NpcFunLib:AddDialogNpc",	{"Thu V©n",1907,{{11,3182,4951}}} },
		{"ThisActivity:InitRule",	{nil} },
	},
}
tbConfig[2] = --Ò»¸öÏ¸½Ú
{
	nId = 2,
	szMessageType = "ClickNpc",
	szName = "click npc",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Thu V©n"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"SetDialogTitle",	{"Tõ ngµy 3 th¸ng 6 ®Õn ngµy 30 th¸ng 6 n¨m 2012, c¸c hiÖp kh¸ch cã thÓ ®Õn chç cña ta tham gia ho¹t ®éng thu nhÆt lóa n­íc, sau khi thu nhÆt lóa n­íc cã thÓ ®Õn gÆp ta ®Ó ®æi phÇn th­ëng, mçi ngµy mçi ng­êi chØ ®­îc tham gia nhiÒu nhÊt 2 vßng, thêi gian tõ 16h ®Õn 17h vµ 20h ®Õn 21h"} },
		{"AddDialogOpt",	{"Tham gia ho¹t ®éng thu nhÆt lóa n­íc",3} },		
		{"AddDialogOpt",	{"NhËn th­ëng xÕp h¹ng",5} },
		{"AddDialogOpt",	{"Nép vËt phÈm Lóa Xanh",4} },
		{"AddDialogOpt",	{"Nép vËt phÈm Lóa Vµng",8} },
	},
}
tbConfig[3] = --Ò»¸öÏ¸½Ú
{
	nId = 3,
	szMessageType = "nil",
	szName = "sign up",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:SignUp",	{nil} },
	},
}
tbConfig[4] = --Ò»¸öÏ¸½Ú
{
	nId = 4,
	szMessageType = "CreateCompose",
	szName = "compose",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Nép vËt phÈm",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Lóa Xanh",{tbProp={6,1,3199}},1} },
	},
	tbActition = 
	{		
		{"PlayerFunLib:AddExp",	{300000,0,"Event_Thang6","NopVatPhamLuaXanh"} },
	},
}
tbConfig[5] = --Ò»¸öÏ¸½Ú
{
	nId = 5,
	szMessageType = "nil",
	szName = "get rank award",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:GetRankAward",	{nil} },
	},
}
tbConfig[6] = --Ò»¸öÏ¸½Ú
{
	nId = 6,
	szMessageType = "ClickNpc",
	szName = "click lingfan",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Hµng rong"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"mua L­ìi LiÒm S¾t",7} },
	},
}
tbConfig[7] = --Ò»¸öÏ¸½Ú
{
	nId = 7,
	szMessageType = "CreateCompose",
	szName = "buy item",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"L­ìi LiÒm S¾t",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Ng©n l­îng",{nJxb=1},100000} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3197,1,0,0},nExpiredTime = 20120701},1,"Event_Thang6","buy tool"} },
	},
}
tbConfig[8] = --Ò»¸öÏ¸½Ú
{
	nId = 8,
	szMessageType = "CreateCompose",
	szName = "compose",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Nép vËt phÈm",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Lóa Vµng",{tbProp={6,1,3200}},1} },
	},
	tbActition = 
	{		
		{"PlayerFunLib:AddExp",	{3000000,0,"Event_Thang6","NopVatPhamLuaVang"} },
	},
}
tbConfig[9] = --Ò»¸öÏ¸½Ú
{
	nId = 9,
	szMessageType = "ItemScript",
	szName = "Sö dông Tói h­¬ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,3201,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTaskDaily",	{VN_TSK_USE_BAG_DAILY,2,"H«m nay ng­¬i kh«ng thÓ sö dông vËt phÈm nµy n÷a, ngµy mai h·y sö dông tiÕp.","<"} },
	},
	tbActition = 
	{		
		{"PlayerFunLib:AddTaskDaily",	{VN_TSK_USE_BAG_DAILY,1} },
		{"Msg2Player",	{"NhËn ®­îc thªm 1 lÇn tham gia ho¹t ®éng Træ Tµi Nhµ N«ng."} },
		{"ThisActivity:UseBagLog",	{nil} }		
	},
}
tbConfig[10] = --Ò»¸öÏ¸½Ú
{
	nId = 10,
	szMessageType = "nil",
	szName = "nil",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[11] = --Ò»¸öÏ¸½Ú
{
	nId = 11,
	szMessageType = "nil",
	szName = "nil",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[12] = --Ò»¸öÏ¸½Ú
{
	nId = 12,
	szMessageType = "nil",
	szName = "nil",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[13] = --Ò»¸öÏ¸½Ú
{
	nId = 13,
	szMessageType = "nil",
	szName = "nil",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[14] = --Ò»¸öÏ¸½Ú
{
	nId = 14,
	szMessageType = "nil",
	szName = "nil",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[15] = --Ò»¸öÏ¸½Ú
{
	nId = 15,
	szMessageType = "nil",
	szName = "nil",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[16] = --Ò»¸öÏ¸½Ú
{
	nId = 16,
	szMessageType = "nil",
	szName = "nil",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[17] = --Ò»¸öÏ¸½Ú
{
	nId = 17,
	szMessageType = "nil",
	szName = "nil",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[18] = --Ò»¸öÏ¸½Ú
{
	nId = 18,
	szMessageType = "nil",
	szName = "nil",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
