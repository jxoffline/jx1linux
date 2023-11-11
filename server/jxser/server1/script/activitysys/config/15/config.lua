Include("\\script\\activitysys\\config\\15\\variables.lua")
tbConfig = {}
tbConfig[1] = --Ò»¸öÏ¸½Ú
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "Load NPC",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"NpcFunLib:AddDialogNpc",	{tbLvTongXinPos.szName,tbLvTongXinPos.nId,tbLvTongXinPos} },
		--{"NpcFunLib:AddDialogNpc",	{tbShiJianZongGuanPos.szName,tbShiJianZongGuanPos.nId,tbShiJianZongGuanPos} },
	},
}
tbConfig[2] = --Ò»¸öÏ¸½Ú
{
	nId = 2,
	szMessageType = "ClickNpc",
	szName = "NPC LvTongXin dialog",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {tbLvTongXinPos.szName},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Tham gia t×m nguyªn liÖu",3} },
	},
}
tbConfig[3] = --Ò»¸öÏ¸½Ú
{
	nId = 3,
	szMessageType = "nil",
	szName = "Open flipcard",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"§¼ng cÊp cña c¸c h¹ kh«ng ®ñ ®Ó tham gia ho¹t ®éng, h·y cè g¾ng luyÖn tËp thªm.",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:OpenUI",	{nil} },
	},
}
tbConfig[4] = --Ò»¸öÏ¸½Ú
{
	nId = 4,
	szMessageType = "ClickNpc",
	szName = "NPC ShiJianZongGuan dialog",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tæng Qu¶n Sù KiÖn"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{format("Hîp thµnh %s", tbAward_1.szName),5} },
		{"AddDialogOpt",	{format("Hîp thµnh %s", tbAward_2.szName),6} },
		{"AddDialogOpt",	{format("Hîp thµnh %s", tbAward_3.szName),12} },
	},
}
tbConfig[5] = --Ò»¸öÏ¸½Ú
{
	nId = 5,
	szMessageType = "CreateCompose",
	szName = "Compose award_1",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {tbAward_1.szName,1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"§¼ng cÊp cña c¸c h¹ kh«ng ®ñ ®Ó tham gia ho¹t ®éng, h·y cè g¾ng luyÖn tËp thªm.",">="} },
		{"AddOneMaterial",	{tbMaterail_4.szName,tbMaterail_4,1} },
		{"AddOneMaterial",	{tbMaterail_5.szName,tbMaterail_5,1} },
		{"AddOneMaterial",	{tbMaterail_1.szName,tbMaterail_1,1} },
		{"AddOneMaterial",	{tbMaterail_3.szName,tbMaterail_3,1} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"Hîp thµnh thÊt b¹i, hµnh trang cña c¸c h¹ kh«ng ®ñ « trèng."} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{tbAward_1,1,EVENT_LOG_TITLE,"GhepQuocKhanhVang"} },
	},
}
tbConfig[6] = --Ò»¸öÏ¸½Ú
{
	nId = 6,
	szMessageType = "CreateCompose",
	szName = "Compose award_2",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {tbAward_2.szName,1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"§¼ng cÊp cña c¸c h¹ kh«ng ®ñ ®Ó tham gia ho¹t ®éng, h·y cè g¾ng luyÖn tËp thªm.",">="} },
		{"AddOneMaterial",	{tbMaterail_4.szName,tbMaterail_4,1} },
		{"AddOneMaterial",	{tbMaterail_5.szName,tbMaterail_5,1} },
		{"AddOneMaterial",	{tbMaterail_1.szName,tbMaterail_1,1} },
		{"AddOneMaterial",	{tbMaterail_6.szName,tbMaterail_6,1} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"Hîp thµnh thÊt b¹i, hµnh trang cña c¸c h¹ kh«ng ®ñ « trèng."} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{tbAward_2,1,EVENT_LOG_TITLE,"GhepQuocKhanhDo"} },
	},
}
tbConfig[7] = --Ò»¸öÏ¸½Ú
{
	nId = 7,
	szMessageType = "ItemScript",
	szName = "Use award_1",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {tbAward_1},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"§¼ng cÊp cña c¸c h¹ kh«ng ®ñ ®Ó sö dông ®¹o cô, h·y cè g¾ng luyÖn tËp thªm.",">="} },
		{"ThisActivity:CheckTask",	{TSKI_AWARD_NUM_1,MAX_USE_LIMIT_AWARD_1,"C¸c h¹ sö dông Quèc Kh¸nh (vµng) ®· ®¹t ®Õn 1000 c¸i, kh«ng thÓ tiÕp tôc sö dông.","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"Kh«ng gian hµnh trang cña ng­¬i kh«ng ®ñ."} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{TSKI_AWARD_NUM_1,1} },
		{"ThisActivity:UseAward1",	{EXP_OPEN_AWARD_1} },
	},
}
tbConfig[8] = --Ò»¸öÏ¸½Ú
{
	nId = 8,
	szMessageType = "ItemScript",
	szName = "Use award_2",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {tbAward_2},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"§¼ng cÊp cña c¸c h¹ kh«ng ®ñ ®Ó sö dông ®¹o cô, h·y cè g¾ng luyÖn tËp thªm.",">="} },
		{"ThisActivity:CheckTask",	{TSKI_AWARD_NUM_2,MAX_USE_LIMIT_AWARD_2,"C¸c h¹ sö dông Quèc Kh¸nh (®á) ®· ®¹t ®Õn 2000 c¸i, kh«ng thÓ tiÕp tôc sö dông.","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{4,"Kh«ng gian hµnh trang cña ng­¬i kh«ng ®ñ."} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{TSKI_AWARD_NUM_2,1} },
		{"ThisActivity:UseAward2",	{EXP_OPEN_AWARD_2} },
	},
}
tbConfig[9] = --Ò»¸öÏ¸½Ú
{
	nId = 9,
	szMessageType = "HarvestPlants",
	szName = "Plant tree award",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"tianlu_tree"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		--{"PlayerFunLib:GetItem",	{tbMaterail_4,10,"",""} },
	},
}
tbConfig[10] = --sö dông tói quµ mõng Quèc Kh¸nh
{
	nId = 10,
	szMessageType = "ItemScript",
	szName = "Use award_1",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {tbAward_4},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"§¼ng cÊp cña c¸c h¹ kh«ng ®ñ ®Ó sö dông ®¹o cô, h·y cè g¾ng luyÖn tËp thªm.",">="} },		
		{"PlayerFunLib:CheckFreeBagCell",	{1,"Kh«ng gian hµnh trang cña ng­¬i kh«ng ®ñ."} },
	},
	tbActition = 
	{		
		{"PlayerFunLib:GetItem",	{tbMaterail_2,5,EVENT_LOG_TITLE,"SuDungTuiMungQuocKhanh"} },
	},
}
tbConfig[11] = --sö dông quèc khanh xanh
{
	nId = 11,
	szMessageType = "ItemScript",
	szName = "Use award_3",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {tbAward_3},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"§¼ng cÊp cña c¸c h¹ kh«ng ®ñ ®Ó sö dông ®¹o cô, h·y cè g¾ng luyÖn tËp thªm.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{BITTSK_AWARD_NUM_3,MAX_USE_LIMIT_AWARD_3,"§· ®¹t ®Õn giíi h¹n, kh«ng thÓ sö dông tiÕp","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"Kh«ng gian hµnh trang cña ng­¬i kh«ng ®ñ."} },
	},
	tbActition = 
	{
		{"tbVNG_BitTask_Lib:addTask", {BITTSK_AWARD_NUM_3, 1}},
		{"PlayerFunLib:AddExp",	{EXP_OPEN_AWARD_3,0,EVENT_LOG_TITLE,"SuDungQuocKhanhXanh"} },
	},
}
tbConfig[12] = --Ò»¸öÏ¸½Ú
{
	nId = 12,
	szMessageType = "CreateCompose",
	szName = "Compose award_3",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {tbAward_3.szName,1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"§¼ng cÊp cña c¸c h¹ kh«ng ®ñ ®Ó tham gia ho¹t ®éng, h·y cè g¾ng luyÖn tËp thªm.",">="} },
		{"AddOneMaterial",	{tbMaterail_2.szName,tbMaterail_2,1} },
		{"AddOneMaterial",	{tbAward_1.szName,tbAward_1,1} },		
		{"PlayerFunLib:CheckFreeBagCell",	{1,"Hîp thµnh thÊt b¹i, hµnh trang cña c¸c h¹ kh«ng ®ñ « trèng."} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{tbAward_3,1,EVENT_LOG_TITLE,"GhepQuocKhanhXanh"} },
	},
}