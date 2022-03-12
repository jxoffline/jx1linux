Include("\\script\\activitysys\\config\\18\\variables.lua")
tbConfig = {}
tbConfig[1] = --一个细节
{
	nId = 1,
	szMessageType = "nil",
	szName = "not use",
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
tbConfig[2] = --一个细节
{
	nId = 2,
	szMessageType = "FinishSongJin",
	szName = "songjin finish",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{MIN_LEVEL,"",">="} },
		{"PlayerFunLib:CheckFreeBagCell", {1, TEXT_NO_ENOUGH_ITEM_CELL}},
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_ROSE_BAG,10,EVENT_LOG_TITLE,"Finish_Song_Jin"} },
	},
}
tbConfig[3] = --一个细节
{
	nId = 3,
	szMessageType = "FinishSongJin",
	szName = "songjin point >= 1000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{1000,">="} },
		{"PlayerFunLib:CheckTotalLevel",	{MIN_LEVEL,"",">="} },
		{"PlayerFunLib:CheckFreeBagCell", {1, TEXT_NO_ENOUGH_ITEM_CELL}},
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_ROSE_BAG,20,EVENT_LOG_TITLE,"Song_Jin_1000"} },
	},
}
tbConfig[4] = --一个细节
{
	nId = 4,
	szMessageType = "Chuanguan",
	szName = "COT 17",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{MIN_LEVEL,"",">="} },
		{"PlayerFunLib:CheckFreeBagCell", {1, TEXT_NO_ENOUGH_ITEM_CELL}},
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_ROSE_BAG,15,EVENT_LOG_TITLE,"Change_Of_Time_17"} },
	},
}
tbConfig[5] = --一个细节
{
	nId = 5,
	szMessageType = "Chuanguan",
	szName = "COT 28",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{MIN_LEVEL,"",">="} },
		{"PlayerFunLib:CheckFreeBagCell", {1, TEXT_NO_ENOUGH_ITEM_CELL}},
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_ROSE_BAG,20,EVENT_LOG_TITLE,"Change_Of_Time_28"} },
	},
}
tbConfig[6] = --一个细节
{
	nId = 6,
	szMessageType = "Chuanguan",
	szName = "COT Finish",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{MIN_LEVEL,"",">="} },
		{"PlayerFunLib:CheckFreeBagCell", {1, TEXT_NO_ENOUGH_ITEM_CELL}},
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_ROSE_BAG,1,EVENT_LOG_TITLE,"Change_Of_Time_Each"} },
	},
}
tbConfig[7] = --一个细节
{
	nId = 7,
	szMessageType = "FinishFengLingDu",
	szName = "FinishFengLingDu",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{MIN_LEVEL,"",">="} },
		{"PlayerFunLib:CheckFreeBagCell", {1, TEXT_NO_ENOUGH_ITEM_CELL}},
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_ROSE_BAG,10,EVENT_LOG_TITLE,"Feng_Ling_Du_Finish"} },
	},
}
tbConfig[8] = --一个细节
{
	nId = 8,
	szMessageType = "NpcOnDeath",
	szName = "kill_boat_boss",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{MIN_LEVEL,"",">="} },
		{"NpcFunLib:CheckBoatBoss",	{nil} },
		{"PlayerFunLib:CheckFreeBagCell", {1, TEXT_NO_ENOUGH_ITEM_CELL}},
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_ROSE_BAG,15,EVENT_LOG_TITLE,"Feng_Ling_Du_Boat_Boss"} },
	},
}
tbConfig[9] = --一个细节
{
	nId = 9,
	szMessageType = "NpcOnDeath",
	szName = "kill_boat_big_boss",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckId",	{"1692"} },
		{"PlayerFunLib:CheckTotalLevel",	{MIN_LEVEL,"",">="} },
		{"PlayerFunLib:CheckFreeBagCell", {1, TEXT_NO_ENOUGH_ITEM_CELL}},
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_ROSE_BAG,20,EVENT_LOG_TITLE,"Feng_Ling_Du_Boat_Big_Boss"} },
	},
}
tbConfig[10] = --一个细节
{
	nId = 10,
	szMessageType = "YDBZguoguan",
	szName = "YanDi 10",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {10},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{MIN_LEVEL,"",">="} },
		{"PlayerFunLib:CheckFreeBagCell", {1, TEXT_NO_ENOUGH_ITEM_CELL}},
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_ROSE_BAG,15,EVENT_LOG_TITLE,"Yan_Di_10"} },
	},
}
tbConfig[11] = --一个细节
{
	nId = 11,
	szMessageType = "YDBZguoguan",
	szName = "YanDi",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{MIN_LEVEL,"",">="} },
		{"PlayerFunLib:CheckFreeBagCell", {1, TEXT_NO_ENOUGH_ITEM_CELL}},
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_ROSE_BAG,1,EVENT_LOG_TITLE,"Yan_Di_Each"} },
	},
}
tbConfig[12] = --一个细节
{
	nId = 12,
	szMessageType = "NpcOnDeath",
	szName = "WorldBoss",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{MIN_LEVEL,"",">="} },
		{"NpcFunLib:CheckWorldBoss",	{nil} },
		{"PlayerFunLib:CheckFreeBagCell", {1, TEXT_NO_ENOUGH_ITEM_CELL}},
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_RED_ROSE,1,EVENT_LOG_TITLE,"Yan_Di_Each"} },
	},
}
tbConfig[13] = --一个细节
{
	nId = 13,
	szMessageType = "NpcOnDeath",
	szName = "killer boss",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckKillerdBoss",	{90} },
		{"PlayerFunLib:CheckTotalLevel",	{MIN_LEVEL,"",">="} },
		{"PlayerFunLib:CheckFreeBagCell", {1, TEXT_NO_ENOUGH_ITEM_CELL}},
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_RED_ROSE,1,EVENT_LOG_TITLE,"Yan_Di_Each"} },
	},
}
tbConfig[14] = --一个细节
{
	nId = 14,
	szMessageType = "ClickNpc",
	szName = "click npc",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {TEXT_ACTIVITY_NPC_NAME},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"SetDialogTitle",	{TEXT_DLG_TITLE_1} },
		{"AddDialogOpt",	{TEXT_DLG_OPT_ACT_INFO,15} },
		{"AddDialogOpt",	{TEXT_DLG_OPT_ITEM_SOURCE,16} },
		{"AddDialogOpt",	{TEXT_DLG_OPT_AWARD,17} },
	},
}
tbConfig[15] = --一个细节
{
	nId = 15,
	szMessageType = "CreateDialog",
	szName = "activity introduction",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {TEXT_DLG_TITLE_ACT_INFO,0},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[16] = --一个细节
{
	nId = 16,
	szMessageType = "CreateDialog",
	szName = "item source",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {TEXT_DLG_TITLE_ITEM_SOURCE,0},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[17] = --一个细节
{
	nId = 17,
	szMessageType = "CreateDialog",
	szName = "award exchange",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"GetQueryInfo",1},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{MIN_LEVEL,"default",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{ITEM_YELLOW_ROSE_BAG.szName, 18} },
		{"AddDialogOpt",	{ITEM_GREEN_ROSE_BAG.szName,19} },
		{"AddDialogOpt",	{ITEM_RED_ROSE_BAG.szName,20} },
	},
}
tbConfig[18] = --一个细节
{
	nId = 18,
	szMessageType = "CreateDialog",
	szName = "yellow bag",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"GetExchangeBagDlgTitle",1,{"yellow"}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{MIN_LEVEL,"default",">="} },
	},
	tbActition = 
	{
		{"AddDialogOptFunction",	{TEXT_EHCANGE_ROSE_BAG_DIRECTLY,"ThisActivity:ExchangeRoseBag",{"yellow",0}} },
		{"AddDialogOptFunction",	{TEXT_EXCHANGE_ADV_BAG_YELLOW,"ThisActivity:ExchangeRoseBag",{"yellow_adv",1}} },
	},
}
tbConfig[19] = --一个细节
{
	nId = 19,
	szMessageType = "CreateDialog",
	szName = "green bag",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"GetExchangeBagDlgTitle",1,{"green"}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{MIN_LEVEL,"default",">="} },
	},
	tbActition = 
	{
		{"AddDialogOptFunction",	{TEXT_EHCANGE_ROSE_BAG_DIRECTLY,"ThisActivity:ExchangeRoseBag",{"green",0}} },
		{"AddDialogOptFunction",	{TEXT_EXCHANGE_ADV_BAG_GREEN,"ThisActivity:ExchangeRoseBag",{"green_adv",1}} },
	},
}
tbConfig[20] = --一个细节
{
	nId = 20,
	szMessageType = "CreateDialog",
	szName = "red bag",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"GetExchangeBagDlgTitle",1,{"red"}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{MIN_LEVEL,"default",">="} },
	},
	tbActition = 
	{
		{"AddDialogOptFunction",	{TEXT_EHCANGE_ROSE_BAG_DIRECTLY,"ThisActivity:ExchangeRoseBag",{"red",0}} },
		{"AddDialogOptFunction",	{TEXT_EXCHANGE_ADV_BAG_RED,"ThisActivity:ExchangeRoseBag",{"red_adv",1}} },
	},
}
tbConfig[21] = --一个细节
{
	nId = 21,
	szMessageType = "nil",
	szName = "not use",
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
tbConfig[22] = --一个细节
{
	nId = 22,
	szMessageType = "ItemScript",
	szName = "Use rose bag",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_ROSE_BAG},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{MIN_LEVEL,"",">="} },
		{"PlayerFunLib:CheckFreeBagCell", {1, "default"}},
		{"ThisActivity:CheckActivityDate", {}},
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem", {ROSE_BAG_AWARD, 1, EVENT_LOG_TITLE, "use_rose_bag_award"}},
	},
}
tbConfig[23] = --一个细节
{
	nId = 23,
	szMessageType = "ItemScript",
	szName = "use yellow bag",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_YELLOW_ROSE_BAG},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{MIN_LEVEL,"",">="} },
		{"ThisActivity:UseBagCheck", {"yellow"}},
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem", {YELLOW_ROSE_BAG_AWARD, 1, EVENT_LOG_TITLE, "use_yellow_bag_award"}},
		{"ThisActivity:AddTask", {TSK_USE_YELLOW_BAG, 1}},
	},
}
tbConfig[24] = --一个细节
{
	nId = 24,
	szMessageType = "ItemScript",
	szName = "use green bag",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_GREEN_ROSE_BAG},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{MIN_LEVEL,"",">="} },
		{"ThisActivity:UseBagCheck", {"green"}},
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem", {GREEN_ROSE_BAG_AWARD, 1, EVENT_LOG_TITLE, "use_green_bag_award"}},
		{"ThisActivity:AddTask", {TSK_USE_GREEN_BAG, 1}},
	},
}
tbConfig[25] = --一个细节
{
	nId = 25,
	szMessageType = "ItemScript",
	szName = "use red bag",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_RED_ROSE_BAG},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{MIN_LEVEL,"",">="} },
		{"ThisActivity:UseBagCheck", {"red"}},
		{"PlayerFunLib:CheckFreeBagCell", {2, "default"}},
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem", {RED_ROSE_BAG_AWARD, 1, EVENT_LOG_TITLE, "use_red_bag_award"}},
		{"ThisActivity:AddTask", {TSK_USE_RED_BAG, 1}},
	},
}
tbConfig[26] = --一个细节
{
	nId = 26,
	szMessageType = "ItemScript",
	szName = "use_adv_yellow_bag",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_YELLOW_ROSE_BAG_ADV},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{MIN_LEVEL,"",">="} },
		{"ThisActivity:UseBagCheck", {"yellow_adv"}},
		{"PlayerFunLib:CheckFreeBagCell", {10, "default"}},
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem", {YELLOW_ROSE_BAG_ADV_AWARD, 1, EVENT_LOG_TITLE, "use_yellow_bag_adv_award"}},
		{"ThisActivity:AddTask", {TSK_USE_YELLOW_BAG_ADV, 1}},
		{"ThisActivity:UseAdvRoseBag", {"yellow_adv"}},		
	},
}
tbConfig[27] = --一个细节
{
	nId = 27,
	szMessageType = "ItemScript",
	szName = "use_adv_green_bag",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_GREEN_ROSE_BAG_ADV},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{MIN_LEVEL,"",">="} },
		{"ThisActivity:UseBagCheck", {"green_adv"}},
		{"PlayerFunLib:CheckFreeBagCell", {10, "default"}},
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem", {GREEN_ROSE_BAG_ADV_AWARD, 1, EVENT_LOG_TITLE, "use_green_bag_adv_award"}},
		{"ThisActivity:AddTask", {TSK_USE_GREEN_BAG_ADV, 1}},
		{"ThisActivity:UseAdvRoseBag", {"green_adv"}},
	},
}
tbConfig[28] = --一个细节
{
	nId = 28,
	szMessageType = "ItemScript",
	szName = "use_adv_red_bag",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_RED_ROSE_BAG_ADV},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{MIN_LEVEL,"",">="} },
		{"ThisActivity:UseBagCheck", {"red_adv"}},
		{"PlayerFunLib:CheckFreeBagCell", {10, "default"}},
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem", {RED_ROSE_BAG_ADV_AWARD, 1, EVENT_LOG_TITLE, "use_red_bag_adv_award"}},
		{"ThisActivity:AddTask", {TSK_USE_RED_BAG_ADV, 1}},
		{"ThisActivity:UseAdvRoseBag", {"red_adv"}},
	},
}
tbConfig[29] = --一个细节
{
	nId = 29,
	szMessageType = "nil",
	szName = "not use",
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
tbConfig[30] = --一个细节
{
	nId = 30,
	szMessageType = "nil",
	szName = "not use",
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
tbConfig[31] = --一个细节
{
	nId = 31,
	szMessageType = "nil",
	szName = "not use",
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
tbConfig[32] = --一个细节
{
	nId = 32,
	szMessageType = "nil",
	szName = "not use",
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
tbConfig[33] = --一个细节
{
	nId = 33,
	szMessageType = "nil",
	szName = "not use",
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
tbConfig[34] = --一个细节
{
	nId = 34,
	szMessageType = "nil",
	szName = "not use",
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
tbConfig[35] = --一个细节
{
	nId = 35,
	szMessageType = "nil",
	szName = "not use",
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
tbConfig[36] = --一个细节
{
	nId = 36,
	szMessageType = "nil",
	szName = "not use",
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
