Include("\\script\\activitysys\\config\\40\\variables.lua")
tbConfig = {}
tbConfig[1] = --Ò»¸öÏ¸½Ú
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "Add npc when server start",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:InitAddNpc",	{nil} },
	},
}
tbConfig[2] = --Ò»¸öÏ¸½Ú
{
	nId = 2,
	szMessageType = "NpcOnDeath",
	szName = "kill monster at field",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckInMap",	{"321,322,227,340"} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:KillMonsterAward",	{nil} },
	},
}
tbConfig[3] = --Ò»¸öÏ¸½Ú
{
	nId = 3,
	szMessageType = "FinishSongJin",
	szName = "songjin mark >= 3000",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MEIGUIXIANGDAI,30,EVENT_LOG_TITLE,"TongKim3000"} },
	},
}
tbConfig[4] = --Ò»¸öÏ¸½Ú
{
	nId = 4,
	szMessageType = "FinishSongJin",
	szName = "songjin mark >= 1000 and < 3000",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"","<"} },
		{"PlayerFunLib:CheckTask",	{"751",1000,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MEIGUIXIANGDAI,10,EVENT_LOG_TITLE,"TongKim1000"} },
	},
}
tbConfig[5] = --Ò»¸öÏ¸½Ú
{
	nId = 5,
	szMessageType = "Chuanguan",
	szName = "chuangguan_17",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MEIGUIXIANGDAI,10,EVENT_LOG_TITLE,"VuotAi17"} },
	},
}
tbConfig[6] = --Ò»¸öÏ¸½Ú
{
	nId = 6,
	szMessageType = "Chuanguan",
	szName = "chuangguan_28",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MEIGUIXIANGDAI,10,EVENT_LOG_TITLE,"VuotAi28"} },
	},
}
tbConfig[7] = --Ò»¸öÏ¸½Ú
{
	nId = 7,
	szMessageType = "NpcOnDeath",
	szName = "fenglingdu_boatboss",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckBoatBoss",	{nil} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MEIGUIXIANGDAI,10,EVENT_LOG_TITLE,"TieuDietThuyTacDauLinh"} },
	},
}
tbConfig[8] = --Ò»¸öÏ¸½Ú
{
	nId = 8,
	szMessageType = "NpcOnDeath",
	szName = "fenglingdu_bigboatboss",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckId",	{"1692"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MEIGUIXIANGDAI,20,EVENT_LOG_TITLE,"TieuDietThuyTacDaiDauLinh"} },
	},
}
tbConfig[9] = --Ò»¸öÏ¸½Ú
{
	nId = 9,
	szMessageType = "YDBZguoguan",
	szName = "YDBZ_10",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {10},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MEIGUIXIANGDAI,15,EVENT_LOG_TITLE,"VuotAiViemDe10"} },
	},
}
tbConfig[10] = --Ò»¸öÏ¸½Ú
{
	nId = 10,
	szMessageType = "NpcOnDeath",
	szName = "kill_gold_boss",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckWorldBoss",	{nil} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MEIGUIXIANGDAI,30,EVENT_LOG_TITLE,"TieuDietBossTheGioi"} },
	},
}
tbConfig[11] = --Ò»¸öÏ¸½Ú
{
	nId = 11,
	szMessageType = "NpcOnDeath",
	szName = "kill_killer_boss",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckKillerdBoss",	{90} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MEIGUIXIANGDAI,3,EVENT_LOG_TITLE,"TieuDietBossSatThu"} },
	},
}
tbConfig[12] = --Ò»¸öÏ¸½Ú
{
	nId = 12,
	szMessageType = "ClickNpc",
	szName = "click npc named master hechenghua",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {"Thî GhÐp Hoa"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Hîp thµnh Hoa Hång Tam S¾c",13} },
		{"AddDialogOpt",	{"Hîp thµnh Hoa Hång Tø S¾c",14} },
		{"AddDialogOpt",	{"Hîp thµnh Giá Hoa Hång VÜnh Cöu",15} },
		{"AddDialogOpt",	{"§æi Cá Xanh",20} },
		{"AddDialogOpt",	{"NhËn th­ëng trùc tuyÕn",21} },
	},
}
tbConfig[13] = --Ò»¸öÏ¸½Ú
{
	nId = 13,
	szMessageType = "CreateDialog",
	szName = "compose 3 color rose total",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {"Xin chµo",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"C¸ch 1",16} },
		{"AddDialogOpt",	{"C¸ch 2",17} },
		{"AddDialogOpt",	{"C¸ch 3",18} },
		{"AddDialogOpt",	{"C¸ch 4",19} },
	},
}
tbConfig[14] = --Ò»¸öÏ¸½Ú
{
	nId = 14,
	szMessageType = "CreateCompose",
	szName = "compose 4 color rose",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {"Hoa Hång Tø S¾c",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"AddOneMaterial",	{"Hoa Hång Tr¾ng",ITEM_WHITE_ROSE,5} },
		{"AddOneMaterial",	{"Hoa Hång Vµng",ITEM_YELLOW_ROSE,5} },
		{"AddOneMaterial",	{"Hoa Hång Xanh",ITEM_GREEN_ROSE,5} },
		{"AddOneMaterial",	{"Hoa hång ®á",ITEM_RED_ROSE,5} },
		{"AddOneMaterial",	{"Cá Xanh",ITEM_GRASS,1} },
		{"AddOneMaterial",	{"Giá §ùng Hoa",ITEM_BASKET,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_4COLOR_ROSE,1,EVENT_LOG_TITLE,"GhepBoHongTuSac"} },
	},
}
tbConfig[15] = --Ò»¸öÏ¸½Ú
{
	nId = 15,
	szMessageType = "CreateCompose",
	szName = "compose corbeil",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {"Giá Hoa Hång VÜnh Cöu",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"AddOneMaterial",	{"Hoa Hång Tr¾ng",ITEM_WHITE_ROSE,5} },
		{"AddOneMaterial",	{"Hoa Hång Vµng",ITEM_YELLOW_ROSE,5} },
		{"AddOneMaterial",	{"Hoa Hång Xanh",ITEM_GREEN_ROSE,5} },
		{"AddOneMaterial",	{"Hoa hång ®á",ITEM_RED_ROSE,5} },
		{"AddOneMaterial",	{"Cá Xanh",ITEM_GRASS,2} },
		{"AddOneMaterial",	{"Giá §ùng Hoa",ITEM_BASKET,1} },
		{"AddOneMaterial",	{"N¬ Cét Bã Hoa",ITEM_RIBAND,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_CORBEIL,1,EVENT_LOG_TITLE,"GhepGioHoaHongVinhCuu"} },
	},
}
tbConfig[16] = --Ò»¸öÏ¸½Ú
{
	nId = 16,
	szMessageType = "CreateCompose",
	szName = "compose 3 color rose 1",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {"Hoa Hång Tam S¾c",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"AddOneMaterial",	{"Hoa Hång Tr¾ng",ITEM_WHITE_ROSE,5} },
		{"AddOneMaterial",	{"Hoa Hång Vµng",ITEM_YELLOW_ROSE,5} },
		{"AddOneMaterial",	{"Hoa Hång Xanh",ITEM_GREEN_ROSE,5} },
		{"AddOneMaterial",	{"Giá §ùng Hoa",ITEM_BASKET,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_3COLOR_ROSE,1,EVENT_LOG_TITLE,ACTION_LOG_COMPOSE_3COLOR_ROSE} },
	},
}
tbConfig[17] = --Ò»¸öÏ¸½Ú
{
	nId = 17,
	szMessageType = "CreateCompose",
	szName = "compose 3 color rose 2",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {"Hoa Hång Tam S¾c",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"AddOneMaterial",	{"Hoa Hång Tr¾ng",ITEM_WHITE_ROSE,5} },
		{"AddOneMaterial",	{"Hoa Hång Vµng",ITEM_YELLOW_ROSE,5} },
		{"AddOneMaterial",	{"Hoa hång ®á",ITEM_RED_ROSE,5} },
		{"AddOneMaterial",	{"Giá §ùng Hoa",ITEM_BASKET,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_3COLOR_ROSE,1,EVENT_LOG_TITLE,ACTION_LOG_COMPOSE_3COLOR_ROSE} },
	},
}
tbConfig[18] = --Ò»¸öÏ¸½Ú
{
	nId = 18,
	szMessageType = "CreateCompose",
	szName = "compose 3 color rose 3",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {"Hoa Hång Tam S¾c",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"AddOneMaterial",	{"Hoa Hång Tr¾ng",ITEM_WHITE_ROSE,5} },
		{"AddOneMaterial",	{"Hoa hång ®á",ITEM_RED_ROSE,5} },
		{"AddOneMaterial",	{"Hoa Hång Xanh",ITEM_GREEN_ROSE,5} },
		{"AddOneMaterial",	{"Giá §ùng Hoa",ITEM_BASKET,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_3COLOR_ROSE,1,EVENT_LOG_TITLE,ACTION_LOG_COMPOSE_3COLOR_ROSE} },
	},
}
tbConfig[19] = --Ò»¸öÏ¸½Ú
{
	nId = 19,
	szMessageType = "CreateCompose",
	szName = "compose 3 color rose 4",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {"Hoa Hång Tam S¾c",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"AddOneMaterial",	{"Hoa Hång Vµng",ITEM_YELLOW_ROSE,5} },
		{"AddOneMaterial",	{"Hoa hång ®á",ITEM_RED_ROSE,5} },
		{"AddOneMaterial",	{"Hoa Hång Xanh",ITEM_GREEN_ROSE,5} },
		{"AddOneMaterial",	{"Giá §ùng Hoa",ITEM_BASKET,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_3COLOR_ROSE,1,EVENT_LOG_TITLE,ACTION_LOG_COMPOSE_3COLOR_ROSE} },
	},
}
tbConfig[20] = --Ò»¸öÏ¸½Ú
{
	nId = 20,
	szMessageType = "nil",
	szName = "compose grass total",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:ComposeGrass",	{nil} },
	},
}
tbConfig[21] = --Ò»¸öÏ¸½Ú
{
	nId = 21,
	szMessageType = "nil",
	szName = "get award by online",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		--{"PlayerFunLib:CheckLevel",	{120,"default",">"} },
		{"PlayerFunLib:CheckIsTransLife",	{"Trïng sinh 1 trë lªn míi cã thÓ nhËn phÇn th­ëng"} },
		{"ThisActivity:CheckTaskDaily",	{TSK_DAILY_LUCK_BELT,MAX_DAILY_LUCK_BELT,"H«m nay ng­¬i kh«ng thÓ nhËn n÷a, ngµy mai h·y quay l¹i.","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"ThisActivity:GetOnLineAward",	{nil} },
	},
}
tbConfig[22] = --Ò»¸öÏ¸½Ú
{
	nId = 22,
	szMessageType = "ItemScript",
	szName = "use item named 3color rose",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {ITEM_3COLOR_ROSE},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"ThisActivity:CheckTask",	{TSK_3COLOR_ROSE,MAX_3COLOR_ROSE,"§· ®¹t ®Õn giíi h¹n, kh«ng thÓ sö dông tiÕp","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:Use3ColorRose",	{nil} },
		{"ThisActivity:AddTask",	{TSK_3COLOR_ROSE,1} },
	},
}
tbConfig[23] = --Ò»¸öÏ¸½Ú
{
	nId = 23,
	szMessageType = "ItemScript",
	szName = "use item named 4color rose",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {ITEM_4COLOR_ROSE},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"ThisActivity:CheckTask",	{TSK_4COLOR_ROSE,MAX_4COLOR_ROSE,"§· ®¹t ®Õn giíi h¹n, kh«ng thÓ sö dông tiÕp","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:Use4ColorRose",	{nil} },
		{"ThisActivity:AddTask",	{TSK_4COLOR_ROSE,1} },
	},
}
tbConfig[24] = --Ò»¸öÏ¸½Ú
{
	nId = 24,
	szMessageType = "ItemScript",
	szName = "use item named corbeil",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {ITEM_CORBEIL},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{2,"default"} },
		{"ThisActivity:CheckTask",	{TSK_CORBEIL,MAX_CORBEIL,"§· ®¹t ®Õn giíi h¹n, kh«ng thÓ sö dông tiÕp","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:UseCorbeil",	{nil} },
		{"ThisActivity:AddTask",	{TSK_CORBEIL,1} },
	},
}
tbConfig[25] = --Ò»¸öÏ¸½Ú
{
	nId = 25,
	szMessageType = "ItemScript",
	szName = "use item named luck belt",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {ITEM_LUCY_BELT},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"ThisActivity:UseLucyBelt",	{nil} },
	},
}
tbConfig[26] = --Ò»¸öÏ¸½Ú
{
	nId = 26,
	szMessageType = "ItemScript",
	szName = "use item named meiguixiangdai",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {ITEM_MEIGUIXIANGDAI},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"ThisActivity:UseMeiGuiXiangDai",	{nil} },
	},
}
tbConfig[27] = --Ò»¸öÏ¸½Ú
{
	nId = 27,
	szMessageType = "OnLogin",
	szName = "player login",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:PlayerOnLogin",	{nil} },
	},
}
tbConfig[28] = --Ò»¸öÏ¸½Ú
{
	nId = 28,
	szMessageType = "ClickNpc",
	szName = "click lingfan",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {"Hµng rong"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Mua Giá §ùng Hoa",29} },
	},
}
tbConfig[29] = --Ò»¸öÏ¸½Ú
{
	nId = 29,
	szMessageType = "CreateCompose",
	szName = "buy basket",
	nStartDate = 201203050000,
	nEndDate  = 201204010000,
	tbMessageParam = {"Giá §ùng Hoa",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"AddOneMaterial",	{"Ng©n l­îng",{nJxb=1},10000} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_BASKET,1,EVENT_LOG_TITLE,"buy_basket"} },
	},
}
