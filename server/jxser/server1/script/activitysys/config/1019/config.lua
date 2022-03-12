Include("\\script\\activitysys\\config\\1019\\variables.lua")
tbConfig = {}
tbConfig[1] =
{
	nId = 1,
	szMessageType = "ClickNpc",
	szName = "§èi tho¹i víi ThÇn Tµi",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"ThÇn Tµi"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"SetDialogTitle",	{"<npc>B¾t ®Çu tõ 20/05/2013 - 17/06/2013, §ång ®¹o cã thÓ tíi gÆp <npc> ë BiÖn Kinh ®Ó tham gia sù kiÖn - <color=yellow>Truy T×m B¶o VËt<color>"} },
		{"AddDialogOpt",	{"TÝch lòy B¶o r­¬ng ®æi ch÷ c¸i t­¬ng øng",24} },
		{"AddDialogOpt",	{"GhÐp m¶nh ch÷ c¸i ®æi ch÷ c¸i t­¬ng øng",2} },
		{"AddDialogOpt",	{"TÝch lòy bé ch÷ c¸i nhËn th­ëng",11} },
		{"AddDialogOpt",	{"Danh S¸ch top nép Bé ch÷",20} },
		{"AddDialogOpt",	{"NhËn th­ëng nép ®ñ hai Bé Ch÷",18} },
		--{"AddDialogOpt",	{"NhËn th­ëng xÕp h¹ng b¶o r­¬ng tuÇn tr­íc",40} },
		{"AddDialogOpt",	{"NhËn Danh hiÖu Hïng Binh L­u Danh",40} },
	},
}
tbConfig[2] =
{
	nId = 2,
	szMessageType = "CreateDialog",
	szName = "§æi m¶nh ch÷ c¸i",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>C¸c h¹ muèn ghÐp m¶nh ch÷ c¸i nµo?"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"M¶nh ch÷ Vâ",3} },
		{"AddDialogOpt",	{"M¶nh ch÷ L©m",4} },
		{"AddDialogOpt",	{"M¶nh ch÷ TruyÒn",5} },
		{"AddDialogOpt",	{"M¶nh ch÷ Kú",6} },
		{"AddDialogOpt",	{"M¶nh ch÷ Hïng",7} },
		{"AddDialogOpt",	{"M¶nh ch÷ Binh",8} },
		{"AddDialogOpt",	{"M¶nh ch÷ L­u",9} },
		{"AddDialogOpt",	{"M¶nh ch÷ Danh",10} },
	},
}
tbConfig[3] =
{
	nId = 3,
	szMessageType = "CreateCompose",
	szName = "§æi M¶nh ch÷ Vâ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"§æi M¶nh ch÷ Vâ",1,1,2,0.08},
	tbCondition = 
	{
		{"AddOneMaterial",	{"M¶nh ch÷ Vâ",MANH_VO,99} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{CHU_VO,1,EVENT_LOG_TITLE,"DoiManhChuVo"} },
	},
}
tbConfig[4] =
{
	nId = 4,
	szMessageType = "CreateCompose",
	szName = "§æi M¶nh ch÷ L©m",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"§æi M¶nh ch÷ L©m",1,1,2,0.08},
	tbCondition = 
	{
		{"AddOneMaterial",	{"M¶nh ch÷ L©m",MANH_LAM,99} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{CHU_LAM,1,EVENT_LOG_TITLE,"DoiManhChuLam"} },
	},
}
tbConfig[5] =
{
	nId = 5,
	szMessageType = "CreateCompose",
	szName = "§æi M¶nh ch÷ TruyÒn",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"§æi M¶nh ch÷ TruyÒn",1,1,2,0.08},
	tbCondition = 
	{
		{"AddOneMaterial",	{"M¶nh ch÷ TruyÒn",MANH_TRUYEN,99} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{CHU_TRUYEN,1,EVENT_LOG_TITLE,"DoiManhChuTruyen"} },
	},
}
tbConfig[6] =
{
	nId = 6,
	szMessageType = "CreateCompose",
	szName = "§æi M¶nh ch÷ Kú",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"§æi M¶nh ch÷ Kú",1,1,2,0.08},
	tbCondition = 
	{
		{"AddOneMaterial",	{"M¶nh ch÷ Kú",MANH_KY,100} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{CHU_KY,1,EVENT_LOG_TITLE,"DoiManhChuKy"} },
	},
}
tbConfig[7] =
{
	nId = 7,
	szMessageType = "CreateCompose",
	szName = "§æi M¶nh ch÷ Hïng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"§æi M¶nh ch÷ Hïng",1,1,2,0.08},
	tbCondition = 
	{
		{"AddOneMaterial",	{"M¶nh ch÷ Hïng",MANH_HUNG,100} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{CHU_HUNG,1,EVENT_LOG_TITLE,"DoiManhChuHung"} },
	},
}
tbConfig[8] =
{
	nId = 8,
	szMessageType = "CreateCompose",
	szName = "§æi M¶nh ch÷ Binh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"§æi M¶nh ch÷ Binh",1,1,2,0.08},
	tbCondition = 
	{
		{"AddOneMaterial",	{"M¶nh ch÷ Binh",MANH_BINH,99} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{CHU_BINH,1,EVENT_LOG_TITLE,"DoiManhChuBinh"} },
	},
}
tbConfig[9] =
{
	nId = 9,
	szMessageType = "CreateCompose",
	szName = "§æi M¶nh ch÷ L­u",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"§æi M¶nh ch÷ L­u",1,1,2,0.08},
	tbCondition = 
	{
		{"AddOneMaterial",	{"M¶nh ch÷ L­u",MANH_LUU,99} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{CHU_LUU,1,EVENT_LOG_TITLE,"DoiManhChuLuu"} },
	},
}
tbConfig[10] =
{
	nId = 10,
	szMessageType = "CreateCompose",
	szName = "§æi M¶nh ch÷ Danh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"§æi M¶nh ch÷ Danh",1,1,2,0.08},
	tbCondition = 
	{
		{"AddOneMaterial",	{"M¶nh ch÷ Danh",MANH_DANH,99} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{CHU_DANH,1,EVENT_LOG_TITLE,"DoiManhChuDanh"} },
	},
}
tbConfig[11] =
{
	nId = 11,
	szMessageType = "CreateDialog",
	szName = "Nép ch÷ c¸i",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>C¸c h¹ muèn nép ch÷ c¸i nµo?"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Nép ch÷ Vâ L©m",13} },
		{"AddDialogOpt",	{"Nép ch÷ TruyÒn Kú",12} },
		{"AddDialogOpt",	{"Nép ch÷ Vâ L©m TruyÒn Kú",14} },
		{"AddDialogOpt",	{"Nép ch÷ L­u Danh",16} },
		{"AddDialogOpt",	{"Nép ch÷ Hïng Binh",15} },
		{"AddDialogOpt",	{"Nép ch÷ Hïng Binh L­u Danh",17} },
	},
}
tbConfig[12] =
{
	nId = 12,
	szMessageType = "CreateCompose",
	szName = "Nép ch÷ TruyÒn - Kú",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Nép ch÷ TruyÒn Kú",1,1,2,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"TruyÒn",CHU_TRUYEN,1} },
		{"AddOneMaterial",	{"Kú",CHU_KY,1} },
	},
	tbActition = 
	{
		{"ThisActivity:NopBoChu", {"TruyÒn Kú","NopTruyenKy"}},
		{"ThisActivity:Global2File", {nil}},
	},
}
tbConfig[13] =
{
	nId = 13,
	szMessageType = "CreateCompose",
	szName = "Nép ch÷ Vâ - L©m",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Nép ch÷ Vâ L©m",1,1,2,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Vâ",CHU_VO,1} },
		{"AddOneMaterial",	{"L©m",CHU_LAM,1} },
	},
	tbActition = 
	{
		{"ThisActivity:NopBoChu", {"Vâ L©m", "NopVoLam"}},
		{"ThisActivity:Global2File", {nil}},
	},
}
tbConfig[14] =
{
	nId = 14,
	szMessageType = "CreateCompose",
	szName = "Nép ch÷ Vâ - L©m - TruyÒn - Kú",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Nép ch÷ Vâ L©m TruyÒn Kú",1,1,2,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Vâ",CHU_VO,1} },
		{"AddOneMaterial",	{"L©m",CHU_LAM,1} },
		{"AddOneMaterial",	{"TruyÒn",CHU_TRUYEN,1} },
		{"AddOneMaterial",	{"Kú",CHU_KY,1} },
	},
	tbActition = 
	{
		{"ThisActivity:NopBoChu", {"Vâ L©m TruyÒn Kú", "NopVoLamTruyenKy"}},
		{"ThisActivity:Global2File", {nil}},
	},
}
tbConfig[15] =
{
	nId = 15,
	szMessageType = "CreateCompose",
	szName = "Nép ch÷ Hïng - Binh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Nép ch÷ Hïng Binh",1,1,2,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Hïng",CHU_HUNG,1} },
		{"AddOneMaterial",	{"Binh",CHU_BINH,1} },
	},
	tbActition = 
	{
		{"ThisActivity:NopBoChu", {"Hïng Binh", "NopHungBinh"}},
		{"ThisActivity:Global2File", {nil}},
	},
}
tbConfig[16] =
{
	nId = 16,
	szMessageType = "CreateCompose",
	szName = "Nép ch÷ L­u - Danh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Nép ch÷ L­u Danh",1,1,2,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"L­u",CHU_LUU,1} },
		{"AddOneMaterial",	{"Danh",CHU_DANH,1} },
	},
	tbActition = 
	{
		{"ThisActivity:NopBoChu", {"L­u Danh", "NopLuuDanh"}},
		{"ThisActivity:Global2File", {nil}},
	},
}
tbConfig[17] =
{
	nId = 17,
	szMessageType = "CreateCompose",
	szName = "Nép ch÷ Hïng Binh L­u Danh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Nép ch÷ Hïng Binh L­u Danh",1,1,2,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Hïng",CHU_HUNG,1} },
		{"AddOneMaterial",	{"Binh",CHU_BINH,1} },
		{"AddOneMaterial",	{"L­u",CHU_LUU,1} },
		{"AddOneMaterial",	{"Danh",CHU_DANH,1} },
	},
	tbActition = 
	{
		{"ThisActivity:NopBoChu", {"Hïng Binh L­u Danh", "NopHungBinhLuuDanh"}},
		{"ThisActivity:Global2File", {nil}},
	},
}
tbConfig[18] =
{
	nId = 18,
	szMessageType = "nil",
	szName = "NhËn th­ëng nép ®ñ 2 bé ch÷ VLTK vµ HBLD",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"ThisActivity:CheckAwardLimit", {nil}},
	},
	tbActition = 
	{
		{"tbVNG_BitTask_Lib:setBitTask", {TASK_VLTK_HBLD, 1}},
		{"PlayerFunLib:AddExp",	{2000e6,0,EVENT_LOG_TITLE,"HoanThanhVoLamTruyenKyHungBinhLuuDanh"} },
	},
}
tbConfig[19] = --Load Npc
{
	nId = 19,
	szMessageType = "ServerStart",
	szName = "KÝch Ho¹t data",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = {},
	tbActition = 
	{
		{"ThisActivity:StartServer",	{nil} },
	},
}
tbConfig[20] =
{
	nId = 20,
	szMessageType = "CreateDialog",
	szName = "hiÓn thÞ top 10",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>§¹i hiÖp muèn xem top bé ch÷ nµo?"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Xem xÕp h¹ng bé ch÷ Vâ L©m TruyÒn Kú",21} },
		{"AddDialogOpt",	{"Xem xÕp h¹ng bé ch÷ Hïng Binh L­u Danh",22} },
		{"AddDialogOpt",	{"Xem xÕp h¹ng n¹p ®ñ 2 bé ch÷",23} },
	},
}
tbConfig[21] =
{
	nId = 21,
	szMessageType = "nil",
	szName = "Xem th«ng tin TOP 10 nép ®ñ bé ch÷ VLTK",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = {},
	tbActition = 
	{
		{"ThisActivity:ShowTop",	{"Vâ L©m TruyÒn Kú","NopVoLamTruyenKy"} },
	},
}
tbConfig[22] =
{
	nId = 22,
	szMessageType = "nil",
	szName = "Xem th«ng tin TOP 10 nép ®ñ bé ch÷ Hïng Binh L­u Danh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = {},
	tbActition = 
	{
		{"ThisActivity:ShowTop",	{"Hïng Binh L­u Danh","NopHungBinhLuuDanh"} },
	},
}
tbConfig[23] =
{
	nId = 23,
	szMessageType = "nil",
	szName = "Xem th«ng tin TOP 10 nép ®ñ 2 bé ch÷",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = {},
	tbActition = 
	{
		{"ThisActivity:Show_VLTK_HBLD",{nil} },
	},
}
tbConfig[24] =
{
	nId = 24,
	szMessageType = "CreateDialog",
	szName = "TÝch lòy b¶o r­¬ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Mét sè ho¹t ®éng tÝch lòy B¶o R­¬ng !"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Ho¹t ®éng nép r­¬ng b¶o vËt",25} },
		{"AddDialogOpt",	{"Ho¹t ®éng nhËn th­ëng xÕp h¹ng tuÇn",39} },
		{"AddDialogOpt",	{"Xem b¶o r­¬ng ®· tÝch lòy",26} },
		{"AddDialogOpt",	{"Xem b¶ng xÕp h¹ng tÝch lòy b¶o r­¬ng tuÇn nµy",27} },
		{"AddDialogOpt",	{"Xem b¶ng xÕp h¹ng tÝch lòy b¶o r­¬ng tuÇn tr­íc",28} },
	},
}
tbConfig[25] =
{
	nId = 25,
	szMessageType = "CreateCompose",
	szName = "Nép b¶o r­¬ng",
	nStartDate = 201305200000,
	nEndDate  = 201306162400,
	tbMessageParam = {"Nép b¶o r­¬ng",1,1,2,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"R­¬ng B¶o VËt",ITEM_RUONG_BAOVAT,10} },
	},
	tbActition = 
	{
		{"ThisActivity:Tichluy", {TASK_BAORUONG}},
	},
}
tbConfig[26] =
{
	nId = 26,
	szMessageType = "nil",
	szName = "Xem th«ng tin tÝch lòy B¶o r­¬ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = {},
	tbActition = 
	{
		{"ThisActivity:Show_BaoRuong",	{TASK_BAORUONG} },
	},
}
tbConfig[27] =
{
	nId = 27,
	szMessageType = "nil",
	szName = "Xem th«ng tin XÕp h¹ng tÝch lòy B¶o r­¬ng tuÇn nµy",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = {},
	tbActition = 
	{
		{"ThisActivity:Show_XepHang",	{nil} },
	},
}
tbConfig[28] =
{
	nId = 28,
	szMessageType = "nil",
	szName = "Xem th«ng tin XÕp h¹ng tÝch lòy B¶o r­¬ng tuÇn tr­íc",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = {},
	tbActition = 
	{
		{"ThisActivity:Show_XepHangPr",	{nil} },
	},
}
tbConfig[29] =
{
	nId = 29,
	szMessageType = "FinishSongJin",
	szName = "songjin 3000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{"751",3000,"",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,""} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_RUONG_BAOVAT,2,EVENT_LOG_TITLE,"TongKim3000"} },
	},
}
tbConfig[30] = 
{
	nId = 30,
	szMessageType = "NpcOnDeath",
	szName = "fenglingdu_boatboss",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckBoatBoss",	{nil} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,""} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_RUONG_BAOVAT,2,EVENT_LOG_TITLE,"TieuDietThuyTacDauLinh"} },
	},
}
tbConfig[31] = --thuû tÆc ®¹i ®Çu lÜnh
{
	nId = 31,
	szMessageType = "NpcOnDeath",
	szName = "Tiªu diÖt thuû tÆc ®¹i ®Çu lÜnh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{		
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckId",	{"1692"} },
		{"NpcFunLib:CheckInMap",	{"337,338,339"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,""} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_RUONG_BAOVAT,5,EVENT_LOG_TITLE,"TieuDietThuyTacDaiDauLinh"} },		
	},
}
tbConfig[32] = --Boss Hoµng Kim
{
	nId = 32,
	szMessageType = "NpcOnDeath",
	szName = "kill world boss",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckWorldBoss",	{nil} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,""} },
	},
	tbActition = 
	{		
		{"PlayerFunLib:GetItem",	{ITEM_RUONG_BAOVAT,5,EVENT_LOG_TITLE,"TieuDietBossTheGioi"} },	
	},
}
tbConfig[33] = --Trång c©y thiªn léc
{
	nId = 33,
	szMessageType = "HarvestPlants",
	szName = "Plant tree award",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"tianlu_tree"},
	tbCondition = { 
	},
	tbActition = 
	{
		{"ThisActivity:GetAwardEvent",	{nil}},
	},
}
tbConfig[34] =--V­ît ¶i 17
{
	nId = 34,
	szMessageType = "Chuanguan",
	szName = "V­ît qua ¶i 17",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,""} },
	},
	tbActition = 
	{	
		{"PlayerFunLib:GetItem",	{ITEM_RUONG_BAOVAT,2,EVENT_LOG_TITLE,"VuotAi17"} },	
	},
}
tbConfig[35] =--V­ît ¶i 17
{
	nId = 35,
	szMessageType = "Chuanguan",
	szName = "V­ît qua ¶i 28",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,""} },
	},
	tbActition = 
	{	
		{"PlayerFunLib:GetItem",	{ITEM_RUONG_BAOVAT,2,EVENT_LOG_TITLE,"VuotAi28"} },	
	},
}
tbConfig[36] = --Viªm ®Õ - v­ît ¶i thø 10
{
	nId = 36,
	szMessageType = "YDBZguoguan",
	szName = "V­ît qua ¶i Viªm §Õ thø 4",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {4},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,""} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_RUONG_BAOVAT,2,EVENT_LOG_TITLE,"VuotAiviemde4"} },
	},
}
tbConfig[37] = --Viªm ®Õ - v­ît ¶i thø 10
{
	nId = 37,
	szMessageType = "YDBZguoguan",
	szName = "V­ît qua ¶i Viªm §Õ thø 6",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {6},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,""} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_RUONG_BAOVAT,2,EVENT_LOG_TITLE,"VuotAiviemde6"} },
	},
}
tbConfig[38] =
{
	nId = 38,
	szMessageType = "ItemScript",
	szName = "Dïng r­¬ng B¶o VËt",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_RUONG_BAOVAT},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckCashLimit",	{1900000000,"default"} },
		{"PlayerFunLib:CheckFreeBagCell",	{2,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{tbAwardRuong,1,EVENT_LOG_TITLE,"Mobaoruong"} },
	},
}
tbConfig[39] =
{
	nId = 39,
	szMessageType = "nil",
	szName = "NhËn th­ëng TÝch lòy b¶o r­¬ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>NhËn th­ëng tÝch lòy B¶o R­¬ng theo h¹ng!"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"ThisActivity:CheckXephang",	{nil}},
	},
	tbActition = 
	{
		{"ThisActivity:NhanThuongXephang",{nil}},
	},
}
tbConfig[40] =
{
	nId = 40,
	szMessageType = "nil",
	szName = "NhËn th­ëng TÝch lòy b¶o r­¬ng tuÇn tr­íc",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>NhËn th­ëng tÝch lòy B¶o R­¬ng tuÇn tr­íc!"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {TASK_DH_HBLD, 1, "§¹i hiÖp ®· nhËn danh hiÖu nµy råi, kh«ng thÓ nhËn l¹i", "<"}},	
	},
	tbActition = 
	{
		{"SetDialogTitle",	{"<npc>Danh hiÖu Hïng Binh L­u danh chØ ®­îc nhËn 1 lÇn duy nhÊt trong suèt thêi gian diÔn ra sù kiÖn ®èi víi 5 nhËn vËt ®· tÝch lòy bé ch÷ c¸i Hïng Binh L­u Danh ®Çu tiªn<color>"} },
		{"ThisActivity:TitleAwardEx",{nil}},
	},
}