Include("\\script\\activitysys\\config\\4\\variables.lua")
tbConfig = {}
tbConfig[1] = --Ò»¸öÏ¸½Ú
{
	nId = 1,
	szMessageType = "NpcOnDeath",
	szName = "KillMonster",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckInMap",	{"340,321,322,225,226,227,75"} },
	},
	tbActition = 
	{
		{"ThisActivity:KillMonster",	{nil} },
	},
}
tbConfig[2] = --Ò»¸öÏ¸½Ú
{
	nId = 2,
	szMessageType = "FinishSongJin",
	szName = "SongJin1000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",1000,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_WATER,10,EVENT_LOG_TITLE,"TongKim1000"} },
	},
}
tbConfig[3] = --Ò»¸öÏ¸½Ú
{
	nId = 3,
	szMessageType = "FinishSongJin",
	szName = "SongJin3000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_WATER,30,EVENT_LOG_TITLE,"TongKim3000"} },
	},
}
tbConfig[4] = --Ò»¸öÏ¸½Ú
{
	nId = 4,
	szMessageType = "Chuanguan",
	szName = "ChuangGuan17",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_WATER,10,EVENT_LOG_TITLE,"VuotAi17"} },
	},
}
tbConfig[5] = --Ò»¸öÏ¸½Ú
{
	nId = 5,
	szMessageType = "Chuanguan",
	szName = "ChuangGuan28",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_WATER,10,EVENT_LOG_TITLE,"VuotAi28"} },
	},
}
tbConfig[6] = --Ò»¸öÏ¸½Ú
{
	nId = 6,
	szMessageType = "NpcOnDeath",
	szName = "FengLingDu_Boss",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckBoatBoss",	{nil} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_WATER,10,EVENT_LOG_TITLE,"TieuDietThuyTacDauLinh"} },
	},
}
tbConfig[7] = --Ò»¸öÏ¸½Ú
{
	nId = 7,
	szMessageType = "NpcOnDeath",
	szName = "FengLingDu_BigBoss",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckId",	{"1692"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_WATER,20,EVENT_LOG_TITLE,"TieuDietThuyTacDaiDauLinh"} },
	},
}
tbConfig[8] = --Ò»¸öÏ¸½Ú
{
	nId = 8,
	szMessageType = "YDBZguoguan",
	szName = "YDBZ6",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {6},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_WATER,15,EVENT_LOG_TITLE,"VuotAiViemDe6"} },
	},
}
tbConfig[9] = --Ò»¸öÏ¸½Ú
{
	nId = 9,
	szMessageType = "NpcOnDeath",
	szName = "GoldenBoss",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckWorldBoss",	{nil} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_WATER,30,EVENT_LOG_TITLE,"TieuDietBossTheGioi"} },
	},
}
tbConfig[10] = --Ò»¸öÏ¸½Ú
{
	nId = 10,
	szMessageType = "NpcOnDeath",
	szName = "KillerBoss",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckKillerdBoss",	{90} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_WATER,3,EVENT_LOG_TITLE,"TieuDietBossSatThu"} },
	},
}
tbConfig[11] = --Ò»¸öÏ¸½Ú
{
	nId = 11,
	szMessageType = "ClickNpc",
	szName = "ClickNpc_QiuYun",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Thu V©n"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Giíi thiÖu ho¹t ®éng",23} },
		{"AddDialogOpt",	{"Hîp thµnh Hoa Ph­îng §á",12} },
		{"AddDialogOpt",	{"Hîp thµnh Hoa Ph­îng Tr¾ng",13} },
		{"AddDialogOpt",	{"Hîp thµnh Hoa Ph­îng TÝm",14} },
		{"SetDialogTitle",	{"<npc>3/5/2012 ®Õn 24:00/31/52012, c¸c ch­ vÞ ®¹i hiÖp cã thÓ ®Õn chç cña t«i sö dông H¹t MÇm, Tói Thuèc T¨ng Tr­ëng, B×nh N­íc, PhÈm Mµu S¾c ®Ó hîp thµnh c¸c lo¹i Hoa Ph­îng ®Ó ®æi lÊy phÇn th­ëng."} },
	},
}
tbConfig[12] = --Ò»¸öÏ¸½Ú
{
	nId = 12,
	szMessageType = "nil",
	szName = "ComposeRedFlower",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:ComposeFlower",	{"Red"} },
	},
}
tbConfig[13] = --Ò»¸öÏ¸½Ú
{
	nId = 13,
	szMessageType = "nil",
	szName = "ComposeWhiteFlower",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:ComposeFlower",	{"White"} },
	},
}
tbConfig[14] = --Ò»¸öÏ¸½Ú
{
	nId = 14,
	szMessageType = "nil",
	szName = "ComposePurpleFlower",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:ComposeFlower",	{"Purple"} },
	},
}
tbConfig[15] = --Ò»¸öÏ¸½Ú
{
	nId = 15,
	szMessageType = "ItemScript",
	szName = "UseRedFlower",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,3161,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"lib:CheckDay",	{20120503, 20120601, szOUT_OF_DATE} },
		{"ThisActivity:CheckTask",	{TSK_RED_FLOWER_COUNT,N_MAX_RED_FLOWER,szCANT_USE,"<"} },
	},
	tbActition = 
	{
		{"ThisActivity:UseRedFlower",	{nil} },
	},
}
tbConfig[16] = --Ò»¸öÏ¸½Ú
{
	nId = 16,
	szMessageType = "ItemScript",
	szName = "UseWhiteFlower",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,3163,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"lib:CheckDay",	{20120503, 20120601, szOUT_OF_DATE} },
		{"ThisActivity:CanUseWhiteFlower",	{nil} },
		{"ThisActivity:CheckTask",	{TSK_2_FLOWER_COUNT,N_MAX_2_FLOWER,szCANT_USE,"<"} },
	},
	tbActition = 
	{
		{"ThisActivity:UseWhiteFlower",	{nil} },
	},
}
tbConfig[17] = --Ò»¸öÏ¸½Ú
{
	nId = 17,
	szMessageType = "ItemScript",
	szName = "UsePurpleFlower",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,3162,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"lib:CheckDay",	{20120503, 20120601, szOUT_OF_DATE} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"Hµnh trang Ýt nhÊt cßn 1 chç trèng"} },
		{"ThisActivity:CheckTask",	{TSK_2_FLOWER_COUNT,N_MAX_2_FLOWER,szCANT_USE,"<"} },
	},
	tbActition = 
	{
		{"ThisActivity:UsePurpleFlower",	{nil} },
	},
}
tbConfig[18] = --Ò»¸öÏ¸½Ú
{
	nId = 18,
	szMessageType = "ServerStart",
	szName = "ServerStart",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"NpcFunLib:AddDialogNpc",	{"Thu V©n",1907,{{11,3182,4951}}} },
	},
}
tbConfig[19] = --Ò»¸öÏ¸½Ú
{
	nId = 19,
	szMessageType = "ClickNpc",
	szName = "ClickNpc_LingFan",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Hµng rong"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Mua Tói Thuèc T¨ng Tr­ëng",20} },
	},
}
tbConfig[20] = --Ò»¸öÏ¸½Ú
{
	nId = 20,
	szMessageType = "CreateCompose",
	szName = "Buy_NongYao",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tói Thuèc T¨ng Tr­ëng",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"Hµnh trang Ýt nhÊt cßn 1 chç trèng"} },
		{"AddOneMaterial",	{"Ng©n l­îng",{nJxb=10000},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3158,1,0,0},nExpiredTime=20120601,},1,EVENT_LOG_TITLE,"BuyNongyao"} },
	},
}
tbConfig[21] = --Ò»¸öÏ¸½Ú
{
	nId = 21,
	szMessageType = "ItemScript",
	szName = "UseSeedBox",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,3164,1,0,0}}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"lib:CheckDay",	{20120503, 20120601, szOUT_OF_DATE} },
		{"PlayerFunLib:CheckFreeBagCell",	{2,"Kh«ng gian hµnh trang kh«ng ®ñ chç trèng, xin h·y s¾p xÕp l¹i Ýt nhÊt cßn hai chç trèng trong hµnh trang"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3157,1,0,0},nExpiredTime=20120601},100,EVENT_LOG_TITLE,"UseSeedBox"} },
	},
}
tbConfig[22] = --Ò»¸öÏ¸½Ú
{
	nId = 22,
	szMessageType = "ItemScript",
	szName = "UseWaterBox",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,3165,1,0,0}}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"lib:CheckDay",	{20120503, 20120601, szOUT_OF_DATE} },
		{"PlayerFunLib:CheckFreeBagCell",	{2,"Kh«ng gian hµnh trang kh«ng ®ñ chç trèng, xin h·y s¾p xÕp l¹i Ýt nhÊt cßn hai chç trèng trong hµnh trang"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3159,1,0,0},nExpiredTime=20120601},100,EVENT_LOG_TITLE,"UseWaterBox"} },
	},
}
tbConfig[23] = --Ò»¸öÏ¸½Ú
{
	nId = 23,
	szMessageType = "CreateDialog",
	szName = "nil",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>H¹t MÇm cã thÓ t×m thÊy t¹i M¹c Cao QuËt, Tr­êng B¹ch S¬n Nam, Tr­êng B¹ch S¬n B¾c, Sa M¹c 1, Sa M¹c 2, Sa M¹c 3, Kháa Lang §éng, Tói Thuèc T¨ng Tr­ëng cã thÓ t×m thÊy t¹i Hµng Rong, B×nh N­íc cã thÓ th«ng qua tham gia Tèng Kim, V­ît ¶i, Phong L¨ng §é, Viªm §Õ, Boss Hoµng Kim, Boss S¸t Thñ. PhÈm Mµu S¾c cã t¹i Kú Tr©n C¸c, khi ®¹i hiÖp t×m ®ñ 4 lo¹i vËt phÈm nµy cã thÓ ®Õn chç cña ta ®©y hîp thµnh c¸c lo¹i Hoa Ph­îng s¾c mµu ®Ó ®æi phÇn th­ëng phong phó",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[24] = --Ò»¸öÏ¸½Ú
{
	nId = 24,
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
tbConfig[25] = --Ò»¸öÏ¸½Ú
{
	nId = 25,
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
tbConfig[26] = --Ò»¸öÏ¸½Ú
{
	nId = 26,
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
tbConfig[27] = --Ò»¸öÏ¸½Ú
{
	nId = 27,
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
tbConfig[28] = --Ò»¸öÏ¸½Ú
{
	nId = 28,
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
tbConfig[29] = --Ò»¸öÏ¸½Ú
{
	nId = 29,
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
tbConfig[30] = --Ò»¸öÏ¸½Ú
{
	nId = 30,
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
tbConfig[31] = --Ò»¸öÏ¸½Ú
{
	nId = 31,
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
tbConfig[32] = --Ò»¸öÏ¸½Ú
{
	nId = 32,
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
