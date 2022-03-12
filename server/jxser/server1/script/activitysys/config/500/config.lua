Include("\\script\\activitysys\\config\\500\\variables.lua")
tbConfig = {}
tbConfig[1] = --Ò»¸öÏ¸½Ú
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "Init",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"lib:Include",	{"\\script\\event\\expansion\\201006\\fuguijinhe\\fuguijinhe.lua"} },
	},
	tbActition = 
	{
		--{"tbBetInfo:Init",	{nil} },
	},
}
tbConfig[2] = --Ò»¸öÏ¸½Ú
{
	nId = 2,
	szMessageType = "ClickNpc",
	szName = "CaiShenDialogue",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"ThÇn Tµi"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		--{"AddDialogOpt",	{"Mua ch×a Khãa §ång",6} },
--		{"AddDialogOpt",	{"Xem vßng thi nµy",3} },
--		{"AddDialogOpt",	{"Xem con sè may m¾n lÇn tr­íc",4} },
--		{"AddDialogOpt",	{"NhËn l·nh phÇn th­ëng",5} },
--		{"SetDialogTitle",	{"<npc>Phó Quý CÈm H¹p"} },
	},
}
tbConfig[3] = --Ò»¸öÏ¸½Ú
{
	nId = 3,
	szMessageType = "nil",
	szName = "CurBetInfo_dlg",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"lib:Include",	{"\\script\\event\\expansion\\201006\\fuguijinhe\\fuguijinhe.lua"} },
	},
	tbActition = 
	{
		{"tbBetInfo:CurBetInfo_dlg",	{nil} },
	},
}
tbConfig[4] = --Ò»¸öÏ¸½Ú
{
	nId = 4,
	szMessageType = "nil",
	szName = "LastBetInfo_dlg",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"lib:Include",	{"\\script\\event\\expansion\\201006\\fuguijinhe\\fuguijinhe.lua"} },
	},
	tbActition = 
	{
		{"tbBetInfo:LastBetInfo_dlg",	{nil} },
	},
}
tbConfig[5] = --Ò»¸öÏ¸½Ú
{
	nId = 5,
	szMessageType = "nil",
	szName = "GetAward_dlg",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"lib:Include",	{"\\script\\event\\expansion\\201006\\fuguijinhe\\fuguijinhe.lua"} },
	},
	tbActition = 
	{
		--{"tbBetInfo:GetAward_dlg",	{nil} },
	},
}
--tbConfig[6] = --Ò»¸öÏ¸½Ú
--{
--	nId = 6,
--	szMessageType = "CreateCompose",
--	szName = "Buy_TongYaoShi",
--	nStartDate = nil,
--	nEndDate  = nil,
--	tbMessageParam = {"Ch×a khãa  §ång",1,1,1,1},
--	tbCondition = 
--	{
--		{"AddOneMaterial",	{"Ng©n l­îng",{nJxb=1,},100000} },
--	},
--	tbActition = 
--	{
--		{"PlayerFunLib:GetItem",	{tbTongyaoshi,1,"CaiShen_Buy_TongYaoShi"} },
--	},
--}
tbConfig[6] = --Ò»¸öÏ¸½Ú
{
	nId = 6,
	szMessageType = "ItemScript",
	szName = "Sö dông tói may m¾n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30111,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"tbAwardTemplet:Give",	{tbLuckyBagAward,1,{"PhuQuyCamHap","SuDungTuiMayMan"}} },
	},
}
