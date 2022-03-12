Include("\\script\\activitysys\\config\\31\\variables.lua")
tbConfig = {}
tbConfig[1] = --Ò»¸öÏ¸½Ú
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "·þÎñÆ÷Æô¶¯¼ÓÔØnpc",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:AddInitNpc",	{nil} },
	},
}
tbConfig[2] = --Ò»¸öÏ¸½Ú
{
	nId = 2,
	szMessageType = "NpcOnDeath",
	szName = "´ò¹Ö¸ø½±Àø",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	--Fix map ID Kháa Lang ®éng - Modified by DinhHQ - 20110606
		{"NpcFunLib:CheckInMap",	{"321,322,340,75,93,144,225,226,227"} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{{tbProp={6,1,2862,1,0,0},nExpiredTime=20110630,},1,"8"} },
	},
}
tbConfig[3] = --Ò»¸öÏ¸½Ú
{
	nId = 3,
	szMessageType = "FinishSongJin",
	szName = "¸ß¼¶ËÎ½ðµÃ·Ö´óÓÚ1000Ð¡ÓÚ3000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{"751",1000,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"","<"} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveRedBox", {5, "jxshengri_songjinggethongselihe", "TongKim1000Diem"} },
	},
}
tbConfig[4] = --Ò»¸öÏ¸½Ú
{
	nId = 4,
	szMessageType = "FinishSongJin",
	szName = "¸ß¼¶ËÎ½ðµÃ·Ö´óÓÚ3000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{"751",3000,"",">="} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveRedBox", {15, "jxshengri_songjinghuodehongselihe", "TongKim3000Diem"} },
	},
}
tbConfig[5] = --Ò»¸öÏ¸½Ú
{
	nId = 5,
	szMessageType = "Chuanguan",
	szName = "¸ß¼¶´³¹Ø¹ýµÚ17¹Ø",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveRedBox", {5, "jxshengri_chuangguanggetlihe", "VuotAiCaoCap(Ai17)"} },
	},
}
tbConfig[6] = --Ò»¸öÏ¸½Ú
{
	nId = 6,
	szMessageType = "Chuanguan",
	szName = "¸ß¼¶´³¹Ø¹ýµÚ28¹Ø",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveRedBox",	{10, "jxshengri_chuangguanghuodelihe", "VuotAiCaoCap(Ai28)"} },
	},
}
tbConfig[7] = --Ò»¸öÏ¸½Ú
{
	nId = 7,
	szMessageType = "NpcOnDeath",
	szName = "ÔÚ1¡¢2¡¢3ÂëÍ·´ò¹Ö",
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
		{"ThisActivity:GiveRedBox", {5, "jxshengri_shuizeitoulingdiaoluohongselihe", "TieuDietThuyTacDauLinh"} },
	},
}
tbConfig[8] = --Ò»¸öÏ¸½Ú
{
	nId = 8,
	szMessageType = "NpcOnDeath",
	szName = "NhiÖm vô s¸t thñ cÊp 90",
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
		{"ThisActivity:GiveRedBox", {1, "jxshengri_shashouchanchuhongselihe", "TieuDietBossSatThu90"} },
	},
}
tbConfig[9] = --Ò»¸öÏ¸½Ú
{
	nId = 9,
	szMessageType = "NpcOnDeath",
	szName = "ÊÀ½çBOSS",
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
		{"ThisActivity:GiveRedBox", {20, "jxshengri_bosschanchuhongselihe", "TieuDietBossTheGioi"} },
	},
}
tbConfig[10] = --Ò»¸öÏ¸½Ú
{
	nId = 10,
	szMessageType = "YDBZguoguan",
	szName = "Ñ×µÛ´³¹Ø",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		--{"ThisActivity:GiveRedBox", {1, "jxshengri_yandichanchuhongselihe"} },
	},
}
tbConfig[11] = --Ò»¸öÏ¸½Ú
{
	nId = 11,
	szMessageType = "YDBZ_KillMaxBoss",
	szName = "Ñ×µÛÉ±ËÀBOSS",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		--{"ThisActivity:YDBZ_GiveRedBox",	{nil} },
	},
}
tbConfig[12] = --Ò»¸öÏ¸½Ú
{
	nId = 12,
	szMessageType = "FinishMail",
	szName = "Íê³ÉÐÅÊ¹ÈÎÎñ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		--{"ThisActivity:GiveRedBox", {5, "jxshengri_xinshichanchuhongselihe"} },
	},
}
tbConfig[13] = --Ò»¸öÏ¸½Ú
{
	nId = 13,
	szMessageType = "ItemScript",
	szName = "Ê¹ÓÃÀ¶É«ÀñºÐ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2862,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:UseBlueBox",	{nil} },
	},
}
tbConfig[14] = --Ò»¸öÏ¸½Ú
{
	nId = 14,
	szMessageType = "ItemScript",
	szName = "Ê¹ÓÃºìÉ«ÀñºÐ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2863,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:UseRedBox",	{nil} },
	},
}
tbConfig[15] = --Ò»¸öÏ¸½Ú
{
	nId = 15,
	szMessageType = "ClickNpc",
	szName = "Óëµ°¸â¶Ô»°",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"B¸nh Sinh NhËt"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Hîp thµnh B¸nh Kem",16} },
		{"AddDialogOpt",	{"Hîp thµnh B¸nh Sinh NhËt",17} },
		{"AddDialogOpt",	{"Hîp thµnh B¸nh Sinh NhËt §Æc BiÖt",18} },
	},
}
tbConfig[16] = --Ò»¸öÏ¸½Ú
{
	nId = 16,
	szMessageType = "CreateCompose",
	szName = "Hîp thµnh B¸nh Kem",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"B¸nh Kem",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"AddOneMaterial",	{"S÷a T­¬i",{tbProp={6,1,2851,1,0,0},},2} },
		{"AddOneMaterial",	{"§­êng tinh",{tbProp={6,1,2852,1,0,0},},2} },
		{"AddOneMaterial",	{"Bét m× ",{tbProp={6,1,2853,1,0,0},},2} },
		{"AddOneMaterial",	{"Kem",{tbProp={6,1,2856,1,0,0},},1} },
		{"AddOneMaterial",	{"B¬",{tbProp={6,1,2855,1,0,0},},2} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2859,1,0,0},nExpiredTime=20110630,},1,"SinhNhatVoLamTruyenKy\tHopThanhBanhKem"} },
		{"AddStatData",	{"jxshengri_naiyoubing", 1} },
	},
}
tbConfig[17] = --Ò»¸öÏ¸½Ú
{
	nId = 17,
	szMessageType = "CreateCompose",
	szName = "Hîp thµnh B¸nh Sinh NhËt",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Hîp thµnh B¸nh Sinh NhËt",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"AddOneMaterial",	{"S÷a T­¬i",{tbProp={6,1,2851,1,0,0},},2} },
		{"AddOneMaterial",	{"§­êng tinh",{tbProp={6,1,2852,1,0,0},},2} },
		{"AddOneMaterial",	{"Bét m× ",{tbProp={6,1,2853,1,0,0},},2} },
		{"AddOneMaterial",	{"Kem",{tbProp={6,1,2856,1,0,0},},1} },
		{"AddOneMaterial",	{"B¬",{tbProp={6,1,2855,1,0,0},},2} },
		{"AddOneMaterial",	{"SoCoLa",{tbProp={6,1,2854,1,0,0},},1} },
		{"AddOneMaterial",	{"NÕn Sinh NhËt",{tbProp={6,1,2857,1,0,0},},1} },
	},
	tbActition = 
	{
		{"ThisActivity:GetCake",	{nil} },
		{"AddStatData",	{"jxshengri_dangao", 1} },
	},
}
tbConfig[18] = --Ò»¸öÏ¸½Ú
{
	nId = 18,
	szMessageType = "CreateCompose",
	szName = "Hîp thµnh B¸nh Sinh NhËt §Æc BiÖt",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"B¸nh Sinh NhËt §Æc BiÖt",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"AddOneMaterial",	{"B¸nh Sinh NhËt Lín",{tbProp={6,1,2861,1,0,0},},1} },
		{"AddOneMaterial",	{"Giá Tr¸i C©y",{tbProp={6,1,2858,1,0,0},},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2864,1,0,0},nExpiredTime=20110630,},1,"SinhNhatVoLamTruyenKy\tHopThanhBanhSinhNhatDacBiet"} },
		{"AddStatData",	{"jxshengri_tebiedangao", 1} },
	},
}
tbConfig[19] = --Ò»¸öÏ¸½Ú
{
	nId = 19,
	szMessageType = "ItemScript",
	szName = "Ê¹ÓÃÄÌÓÍ±ý",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2859,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"CÊp 150 trë lªn hoÆc ®· trïng sinh míi ®­îc sö dông",">="} },
		{"ThisActivity:CheckTask",	{TSKG_NaiYouBing,1000,"Trong suèt thêi gian ho¹t ®éng mçi nh©n vËt chØ ®­îc sö dông nhiÒu nhÊt 1000  B¸nh Kem","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{TSKG_NaiYouBing,1} },
		{"ThisActivity:UseNaiYouBing",	{nil} },		
	},
}
tbConfig[20] = --Ò»¸öÏ¸½Ú
{
	nId = 20,
	szMessageType = "ItemScript",
	szName = "Ê¹ÓÃÐ¡µ°¸â",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2860,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"CÊp 150 trë lªn hoÆc ®· trïng sinh míi ®­îc sö dông",">="} },
		{"ThisActivity:CheckTask",	{TKSG_XiaoDanGao,500,"Trong suèt thêi gian ho¹t ®éng mçi nh©n vËt chØ ®­îc sö dông nhiÒu nhÊt 500  B¸nh Sinh NhËt nhá","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{10,"Hµnh trang kh«ng ®ñ"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{TKSG_XiaoDanGao,1} },
		{"ThisActivity:UseXiaoDanGao",	{nil} },
	},
}
tbConfig[21] = --Ò»¸öÏ¸½Ú
{
	nId = 21,
	szMessageType = "ItemScript",
	szName = "Ê¹ÓÃ´óµ°¸â",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2861,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"CÊp 150 trë lªn hoÆc ®· trïng sinh míi ®­îc sö dông",">="} },
		{"ThisActivity:CheckTaskDaily",	{TKSG_DaDanGao,10,"Mçi ngµy chØ ®­îc sö dông nhiÒu nhÊt 10  B¸nh Sinh NhËt lín","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{10,"Hµnh trang kh«ng ®ñ"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTaskDaily",	{TKSG_DaDanGao,1} },
		{"ThisActivity:UseDaDanGao",	{nil} },
	},
}
tbConfig[22] = --Ò»¸öÏ¸½Ú
{
	nId = 22,
	szMessageType = "ItemScript",
	szName = "Ê¹ÓÃÌØ±ðÉúÈÕ±ý",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2864,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"CÊp 150 trë lªn hoÆc ®· trïng sinh míi ®­îc sö dông",">="} },
		{"ThisActivity:CheckTask",	{TKSG_TeBieShengRiBing,400,"Trong suèt thêi gian ho¹t ®éng mçi nh©n vËt chØ ®­îc sö dông nhiÒu nhÊt 400 B¸nh Sinh NhËt §Æc BiÖt","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{10,"Hµnh trang kh«ng ®ñ"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{TKSG_TeBieShengRiBing,1} },
		{"ThisActivity:UseTeBieDanGao",	{nil} },
		{"ThisActivity:GetRabbit",	{nil} },
	},
}
tbConfig[23] = --Ò»¸öÏ¸½Ú
{
	nId = 23,
	szMessageType = "ClickNpc",
	szName = "L«ng Thá ®æi lÊy Phiªn Vò",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"§oµn §¹i Nh©n"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"§æi Phiªn Vò",24} },
	},
}
tbConfig[24] = --Ò»¸öÏ¸½Ú
{
	nId = 24,
	szMessageType = "CreateCompose",
	szName = "Hîp thµnh Phiªn Vò",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Phiªn Vò ",0,2,3,1},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"AddOneMaterial",	{"L«ng Thá",{tbProp={6,1,2865,1,0,0},},200} },
	},
	tbActition = 
	{
		{"ThisActivity:GetFanYu",	{nil}},
	},
}
tbConfig[25] = --Ò»¸öÏ¸½Ú
{
	nId = 25,
	szMessageType = "NpcOnDeath",
	szName = "É±ËÀË®Ôô´óÍ·Áì",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckId",	{"1692"} },
		{"NpcFunLib:CheckInMap",	{"337,338,339"} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveRedBox", {5, "jxshengri_shuizeidatoulingdiaoluohongselihe", "TieuDietThuyTacDaiDauLinh"} },
	},
}
tbConfig[26] = --Ò»¸öÏ¸½Ú
{
	nId = 26,
	szMessageType = "FinishSongJin",
	szName = "HoanThanhTranTK",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{		
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		--{"PlayerFunLib:AddTaskDaily",	{2725,1} },
		{"ThisActivity:Vn_AwardOnSJMatchCount",	{nil} },
	},
}
tbConfig[27] = --Ò»¸öÏ¸½Ú
{
	nId = 27,
	szMessageType = "Chuanguan",
	szName = "HoanThanhAi28",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },		
	},
	tbActition = 
	{
		--{"PlayerFunLib:AddTaskDaily",	{2726,1} },
		{"ThisActivity:Vn_AwardOnCOTMatchCount",	{nil} },
	},
}
tbConfig[28] = 
{
	nId = 28,
	szMessageType = "FinishFengLingDu",
	szName = "Hoµn thµnh Phong L¨ng §é tèn phÝ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:Vn_CheckPLDTime", {nil} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2863,1,0,0},nExpiredTime=20110630,},10,"SinhNhatVoLamTruyenKy\tHoanThanhPLDTonPhi"} },
	},
}