Include("\\script\\activitysys\\config\\1017\\variables.lua")
tbConfig = {}
tbConfig[1] = --§¸nh qu¸i rít Item
{
	nId = 1,
	szMessageType = "NpcOnDeath",
	szName = "kill monster at field",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckInMap",	{"321,322,340,225,226,227"} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{ITEM_MATERIAL_1,1,"8"} },		
	},
}
tbConfig[2] = --Ò»¸öÏ¸½Ú
{
	nId = 2,
	szMessageType = "ClickNpc",
	szName = "Tæng Qu¶n Sù KiÖn",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tæng Qu¶n Sù KiÖn"},
	tbCondition ={},
	tbActition = 
	{
		{"AddDialogOpt",	{"Më « nhËn nhËn nguyªn liÖu",9} },
	},
}
tbConfig[3] = --Hang rong
{
	nId = 3,
	szMessageType = "ClickNpc",
	szName = "click lingfan",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Hµng rong"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{format("Mua %s",ITEM_AWARD_3.szName),4} },
	},
}
tbConfig[4] = 
{
	nId = 4,
	szMessageType = "CreateCompose",
	szName = "buy material2",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_AWARD_3.szName,1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"AddOneMaterial",	{MONEY.szName,MONEY,10000} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_AWARD_3,1,EVENT_LOG_TITLE,"MuaRuongBacTaiHangRong"} },
	},
}
tbConfig[5] =
{
	nId = 5,
	szMessageType = "ItemScript",
	szName = "Dïng R­¬ng Ngò S¾c",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_AWARD_1},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:VnCheckInCity",	{"default"} },
		{"PlayerFunLib:CheckCashLimit",	{1900000000,"default"} },
		{"PlayerFunLib:CheckFreeBagCell",	{30,"default"} },
		{"ThisActivity:CheckUseItem",	{"chiakhoangusac",TSK_USE_AWARD3} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{TSK_USE_AWARD3,LIMIT_USE_BOX_SHINING,"§· ®¹t ®Õn giíi h¹n, kh«ng thÓ sö dông tiÕp","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_AWARD_4,1,EVENT_LOG_TITLE,"SuDungRuongNguSacNhanHoMachDon"} },
		{"ThisActivity:UseItem",	{"chiakhoangusac",TSK_USE_AWARD3,EXP_AWARD_2} },
	},
}
tbConfig[6] =
{
	nId = 6,
	szMessageType = "ItemScript",
	szName = "Dïng R­¬ng §ång",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_AWARD_2},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckCashLimit",	{1900000000,"default"} },
		{"ThisActivity:CheckUseItem",	{"chiakhoadong",TSK_USE_AWARD1} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{TSK_USE_AWARD1,TSK_LIMIT_USE_BRONZE_CHEST,"§· ®¹t ®Õn giíi h¹n, kh«ng thÓ sö dông tiÕp","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:UseItem",	{"chiakhoadong",TSK_USE_AWARD1,EXP_AWARD_1} },
	},
}
tbConfig[7] =
{
	nId = 7,
	szMessageType = "ItemScript",
	szName = "Dïng R­¬ng B¹c",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_AWARD_3},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckCashLimit",	{1900000000,"default"} },
		{"ThisActivity:CheckUseItem",	{"chiakhoabac",TSK_USE_AWARD2} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{TSK_USE_AWARD2,TSK_LIMIT_USE_SILVER_CHEST,"§· ®¹t ®Õn giíi h¹n, kh«ng thÓ sö dông tiÕp","<"} },
	},
	tbActition = 
	{
		--{"PlayerFunLib:GetItem",	{tbExpRate,1,EVENT_LOG_TITLE,"SuDungRuongBacNhanDiemExp"} },
		{"ThisActivity:UseItem",	{"chiakhoabac",TSK_USE_AWARD2,tbExpRate} },
	},
}
tbConfig[8] =
{
	nId = 8,
	szMessageType = "OnLogin",
	szName = "on login",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:PlayerOnLogin",	{nil} },
	},
}
tbConfig[9] =
{
	nId = 9,
	szMessageType = "nil",
	szName = "Më ¤",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:OpenUI",	{nil} },
	},
}