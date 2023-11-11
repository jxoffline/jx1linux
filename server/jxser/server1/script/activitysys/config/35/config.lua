Include("\\script\\activitysys\\config\\35\\variables.lua")
tbConfig = {}
tbConfig[1] = --Ò»¸öÏ¸½Ú
{
	nId = 1,
	szMessageType = "FinishSongJin",
	szName = "finish songjing and mark >= 3000",
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
		{"PlayerFunLib:GetItem",	{ITEM_SEED,40,EVENT_LOG_TITLE,"TongKimDat3000DiemNhanHatGiong"} },
		{"tbVngTransLog:Write", {"201201_event_tet/", 22, "TongKimDat3000DiemNhanHatGiong", "40 H¹t Gièng", 1}},
	},
}
tbConfig[2] = --Ò»¸öÏ¸½Ú
{
	nId = 2,
	szMessageType = "Chuanguan",
	szName = "chuangguan_17",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_SEED,10,EVENT_LOG_TITLE,"VuotQuaAi17NhanHatGiong"} },
		{"tbVngTransLog:Write", {"201201_event_tet/", 22, "VuotQuaAi17NhanHatGiong", "10 H¹t Gièng", 1}},
	},
}
tbConfig[3] = --Ò»¸öÏ¸½Ú
{
	nId = 3,
	szMessageType = "Chuanguan",
	szName = "chuangguan_28",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_SEED,10,EVENT_LOG_TITLE,"VuotQuaAi28NhanHatGiong"} },
		{"tbVngTransLog:Write", {"201201_event_tet/", 22, "VuotQuaAi28NhanHatGiong", "10 H¹t Gièng", 1}},
	},
}
tbConfig[4] = --Ò»¸öÏ¸½Ú
{
	nId = 4,
	szMessageType = "NpcOnDeath",
	szName = "fengling_leader",
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
		{"PlayerFunLib:GetItem",	{ITEM_SEED,10,EVENT_LOG_TITLE,"TieuDietThuyTacDauLinhNhanHatGiong"} },
		{"tbVngTransLog:Write", {"201201_event_tet/", 22, "TieuDietThuyTacDauLinhNhanHatGiong", "10 H¹t Gièng", 1}},
	},
}
tbConfig[5] = --Ò»¸öÏ¸½Ú
{
	nId = 5,
	szMessageType = "NpcOnDeath",
	szName = "fengling_bigleader",
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
		{"PlayerFunLib:GetItem",	{ITEM_SEED,20,EVENT_LOG_TITLE,"TieuDietThuyTacDaiDauLinhNhanHatGiong"} },
		{"tbVngTransLog:Write", {"201201_event_tet/", 22, "TieuDietThuyTacDaiDauLinhNhanHatGiong", "20 H¹t Gièng", 1}},
	},
}
tbConfig[6] = --Ò»¸öÏ¸½Ú
{
	nId = 6,
	szMessageType = "YDBZguoguan",
	szName = "YDBZ_10",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {10},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_SEED,20,EVENT_LOG_TITLE,"VuotQuaAi10ViemDeNhanHatGiong"} },
		{"tbVngTransLog:Write", {"201201_event_tet/", 22, "VuotQuaAi10ViemDeNhanHatGiong", "20 H¹t Gièng", 1}},
	},
}
tbConfig[7] = --Ò»¸öÏ¸½Ú
{
	nId = 7,
	szMessageType = "NpcOnDeath",
	szName = "worldboss",
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
		{"PlayerFunLib:GetItem",	{ITEM_SEED,50,EVENT_LOG_TITLE,"TieuDietBossHoangKimNhanHatGiong"} },
		{"tbVngTransLog:Write", {"201201_event_tet/", 22, "TieuDietBossHoangKimNhanHatGiong", "50 H¹t Gièng", 1}},
	},
}
tbConfig[8] = --Ò»¸öÏ¸½Ú
{
	nId = 8,
	szMessageType = "FinishKillerBoss",
	szName = "killer",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {90},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_SEED,3,EVENT_LOG_TITLE,"TieuDietBossSatThuNhanHatGiong"} },
		{"tbVngTransLog:Write", {"201201_event_tet/", 22, "TieuDietBossSatThuNhanHatGiong", "3 H¹t Gièng", 1}},
	},
}
tbConfig[9] = --Ò»¸öÏ¸½Ú
{
	nId = 9,
	szMessageType = "NpcOnDeath",
	szName = "killer monster",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckInMap",	{"321,322,75,227,340,93"} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{{szName="M©m B¹c",tbProp={6,1,3103,1,0,0},nExpiredTime=20120201,},1,"5"} },
	},
}
tbConfig[10] = --Ò»¸öÏ¸½Ú
{
	nId = 10,
	szMessageType = "FinishSongJin",
	szName = "finish songjing and mark >= 1000 and mark < 3000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"","<"} },
		{"PlayerFunLib:CheckTask",	{"751",1000,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_SEED,20,EVENT_LOG_TITLE,"TongKimDat1000DiemNhanHatGiong"} },
		{"tbVngTransLog:Write", {"201201_event_tet/", 22, "TongKimDat1000DiemNhanHatGiong", "20 H¹t Gièng", 1}},
	},
}
tbConfig[11] = --Ò»¸öÏ¸½Ú
{
	nId = 11,
	szMessageType = "ClickNpc",
	szName = "click npc named plutus",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"§¹i ThÇn Tµi"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"SetDialogTitle",	{"Trong tiÕt trêi xu©n Êm ¸p nµy, c¸c ®¹i hiÖp cã thÓ ®Õn chç cña ta ®©y lÊy c¸c lo¹i tr¸i c©y ®Ó hîp thµnh <color=yellow> M©m B¹c Ngò Qu¶ vµ M©m Vµng Ngò Qu¶ <color>. NhÊn chuét sö dông <color=yellow> M©m B¹c Ngò Qu¶ vµ M©m Vµng Ngò Qu¶ <color> sÏ cã phÇn th­ëng hËu hÜnh, nÕu nh­ may m¾n cã thÓ nhËn ®­îc <color=yellow> Bao L× X× N¨m Míi, nÕu nh­ ®¹i hiÖp ®­a Bao L× X× N¨m Míi (nhá) <color> vµ 10 v¹n tÆng cho l·o n¹p giao cho ta th× ta sÏ tÆng cho ng­¬i phÇn th­ëng phong phó. Trong suèt thêi gian ho¹t ®éng ta sÏ lu«n ë ®©y ®Ó cung hËu gi¸ ®¸o cua c¸c ch­ vÞ !"} },
		{"AddDialogOpt",	{"Hîp thµnh M©m B¹c Ngò Qu¶",12} },
		{"AddDialogOpt",	{"Hîp thµnh M©m Vµng Ngò Qu¶",15} },
		{"AddDialogOpt",	{"Giao nép Bao L× X× N¨m Míi (nhá)",18} },
		{"AddDialogOpt",	{"§æi Bao L× X× §á",22} },
		{"AddDialogOpt",	{"MiÔn phÝ nhËn kinh nghiÖm",28} },
		{"AddDialogOpt",	{"Giao nép mÆt n¹ h×nh rång",30} },
	},
}
tbConfig[12] = --Ò»¸öÏ¸½Ú
{
	nId = 12,
	szMessageType = "CreateDialog",
	szName = "wuguobaiyinpan select",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Hîp thµnh M©m B¹c Ngò Qu¶ cã hai c¸ch, c¸ch thø 1: 1 N¶i Chuèi + 1 Tr¸i Cam + 1 Tr¸i B­ëi + 1 Tr¸i Hång + 1 Tr¸i Lª + 1 M©m B¹c; C¸ch 2 lµ: 1 Tr¸i Dõa + 1 Tr¸i §u §ñ +1 Tr¸i M¶ng Cçu + 1 Tr¸i Sung + 1 Tr¸i Xoµi + 1 M©m Vµng. §¹i hiÖp muèn sö dông c¸ch nµo. ",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"C¸ch 1",13} },
		{"AddDialogOpt",	{"c¸ch 2",14} },
	},
}
tbConfig[13] = --Ò»¸öÏ¸½Ú
{
	nId = 13,
	szMessageType = "CreateCompose",
	szName = "wuguobaiyinpan plan_1",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"M©m B¹c Ngò Qu¶",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"AddOneMaterial",	{"N¶i Chuèi",{tbProp={6,1,3098,1,0,0},},1} },
		{"AddOneMaterial",	{"Tr¸i Cam",{tbProp={6,1,3095,1,0,0},},1} },
		{"AddOneMaterial",	{"Tr¸i B­ëi",{tbProp={6,1,3097,1,0,0},},1} },
		{"AddOneMaterial",	{"Tr¸i Hång",{tbProp={6,1,3099,1,0,0},},1} },
		{"AddOneMaterial",	{"Tr¸i Lª",{tbProp={6,1,3096,1,0,0},},1} },
		{"AddOneMaterial",	{"M©m B¹c",{tbProp={6,1,3103,1,0,0},},1} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{szName="M©m B¹c Ngò Qu¶",tbProp={6,1,3105,1,0,0},nExpiredTime=20120201,},1,EVENT_LOG_TITLE,"GhepMamBacNguQua"} },
	},
}
tbConfig[14] = --Ò»¸öÏ¸½Ú
{
	nId = 14,
	szMessageType = "CreateCompose",
	szName = "wuguobaiyinpan plan_2",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"M©m B¹c Ngò Qu¶",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Xoµi",{tbProp={6,1,3093,1,0,0},},1} },
		{"AddOneMaterial",	{"Dõa",{tbProp={6,1,3100,1,0,0},},1} },
		{"AddOneMaterial",	{"§u ®ñ",{tbProp={6,1,3101,1,0,0},},1} },
		{"AddOneMaterial",	{"Tr¸i M·ng CÇu",{tbProp={6,1,3094,1,0,0},},1} },
		{"AddOneMaterial",	{"Tr¸i Sung",{tbProp={6,1,3102,1,0,0},},1} },
		{"AddOneMaterial",	{"M©m B¹c",{tbProp={6,1,3103,1,0,0},},1} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{szName="M©m B¹c Ngò Qu¶",tbProp={6,1,3105,1,0,0},nExpiredTime=20120201,},1,EVENT_LOG_TITLE,"GhepMamBacNguQua"} },
	},
}
tbConfig[15] = --Ò»¸öÏ¸½Ú
{
	nId = 15,
	szMessageType = "CreateDialog",
	szName = "wuguohuangjinpan select",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Hîp thµnh M©m Vµng Ngò Qu¶ cã hai c¸ch, c¸ch thø 1: 1 N¶i Chuèi + 1 Tr¸i Cam + 1 Tr¸i B­ëi + 1 Tr¸i Hång + 1 Tr¸i Lª + 1 M©m Vµng; C¸ch thø 2: 1 Tr¸i Dõa + 1 §u §ñ + 1 M·ng CÇu + 1 Tr¸i Sung + 1 Tr¸i Xoµi + M©m Vµng. §¹i hiÖp muèn sö dông c¸ch nµo.",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"C¸ch 1",16} },
		{"AddDialogOpt",	{"c¸ch 2",17} },
	},
}
tbConfig[16] = --Ò»¸öÏ¸½Ú
{
	nId = 16,
	szMessageType = "CreateCompose",
	szName = "wuguohuangjinpan plan_1",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"M©m Vµng Ngò Qu¶",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"AddOneMaterial",	{"N¶i Chuèi",{tbProp={6,1,3098,1,0,0},},1} },
		{"AddOneMaterial",	{"Tr¸i Cam",{tbProp={6,1,3095,1,0,0},},1} },
		{"AddOneMaterial",	{"Tr¸i B­ëi",{tbProp={6,1,3097,1,0,0},},1} },
		{"AddOneMaterial",	{"Tr¸i Hång",{tbProp={6,1,3099,1,0,0},},1} },
		{"AddOneMaterial",	{"Tr¸i Lª",{tbProp={6,1,3096,1,0,0},},1} },
		{"AddOneMaterial",	{"M©m Vµng",{tbProp={6,1,3104,1,0,0},},1} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3106,1,0,0},nExpiredTime=20120201,},1,EVENT_LOG_TITLE,"GhepMamVangNguQua"} },
	},
}
tbConfig[17] = --Ò»¸öÏ¸½Ú
{
	nId = 17,
	szMessageType = "CreateCompose",
	szName = "wuguohuangjinpan plan_2",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"M©m Vµng Ngò Qu¶",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Xoµi",{tbProp={6,1,3093,1,0,0},},1} },
		{"AddOneMaterial",	{"Dõa",{tbProp={6,1,3100,1,0,0},},1} },
		{"AddOneMaterial",	{"§u ®ñ",{tbProp={6,1,3101,1,0,0},},1} },
		{"AddOneMaterial",	{"Tr¸i M·ng CÇu",{tbProp={6,1,3094,1,0,0},},1} },
		{"AddOneMaterial",	{"Tr¸i Sung",{tbProp={6,1,3102,1,0,0},},1} },
		{"AddOneMaterial",	{"M©m Vµng",{tbProp={6,1,3104,1,0,0},},1} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3106,1,0,0},nExpiredTime=20120201,},1,EVENT_LOG_TITLE,"GhepMamVangNguQua"} },
	},
}
tbConfig[18] = --Ò»¸öÏ¸½Ú
{
	nId = 18,
	szMessageType = "CreateCompose",
	szName = "handin redbag",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"",0,0,0,0},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Bao L× X× N¨m Míi (nhá)",{tbProp={6,1,3108,1,0,0},},1} },
		{"AddOneMaterial",	{"Ng©n l­îng",{nJxb=1},100000} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TSK_REDBAG_DAILY,MAX_REDBAG_DAILY,"H«m nay ®¹i hiÖp ®· giao ®ñ råi, ®îi ngµy mai h·y tiÕp tôc nhÐ!","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{1000000,1,EVENT_LOG_TITLE,"NopBaoLiXiNamMoiTaiNPCDaiThanTai"} },
		{"tbVngTransLog:Write", {"201201_event_tet/", 22, "NopBaoLiXiNamMoiTaiNPCDaiThanTai", "1000000 §iÓm kinh nghiÖm", 1}},
		{"ThisActivity:AddTaskDaily",	{TSK_REDBAG_DAILY,1} },
	},
}
tbConfig[19] = --Ò»¸öÏ¸½Ú
{
	nId = 19,
	szMessageType = "ItemScript",
	szName = "use wuguodebaiyinpan",
	nStartDate = 201201010000,
	nEndDate  = 201202010000,
	tbMessageParam = {{tbProp={6,1,3105,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "ChØ cã thÓ sö dông t¹i c¸c thµnh thÞ vµ c¸c t©n thñ th«n."} },
		{"ThisActivity:CheckTask",	{TSK_USED_WUGUOBAIYINPAN,MAX_USED_WUGUOBAIYINPAN,"§¹i hiÖp ®· nhËn qu¸ nhiÒu phÇn th­ëng råi, hay lµ thö c¸i kh¸c xem sao!","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"ThisActivity:UseWuguobaiyinpan",	{nil} },
	},
}
tbConfig[20] = --Ò»¸öÏ¸½Ú
{
	nId = 20,
	szMessageType = "ItemScript",
	szName = "use wuguodehuangjinpan",
	nStartDate = 201201010000,
	nEndDate  = 201202010000,
	tbMessageParam = {{tbProp={6,1,3106,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "ChØ cã thÓ sö dông t¹i c¸c thµnh thÞ vµ c¸c t©n thñ th«n."} },
		{"ThisActivity:CheckTask",	{TSK_USED_WUGUOHUANGJINPAN,MAX_USED_WUGUOHUANGJINPAN,"§¹i hiÖp ®· nhËn qu¸ nhiÒu phÇn th­ëng råi, hay lµ thö c¸i kh¸c xem sao!","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"ThisActivity:UseWuguohuangjinpan",	{nil} },
	},
}
tbConfig[21] = --Ò»¸öÏ¸½Ú
{
	nId = 21,
	szMessageType = "ItemScript",
	szName = "use zhongzi",
	nStartDate = 201201010000,
	nEndDate  = 201202010000,
	tbMessageParam = {{tbProp={6,1,3107,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:IsFightState",	{1, "ChØ cã thÓ sö dông t¹i c¸c khu vùc chiÕn ®Êu."} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "ChØ cã thÓ sö dông t¹i c¸c thµnh thÞ vµ c¸c t©n thñ th«n."} },
		{"ThisActivity:CheckUseZhongzi",	{nil} },
	},
	tbActition = 
	{
		{"ThisActivity:UseZhongzi",	{nil} },
	},
}
tbConfig[22] = --§æi bao l× x× ®á
{
	nId = 22,
	szMessageType = "CreateDialog",
	szName = "bao li xi do select",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"§æi Bao L× X× §á cã thÓ dïng mét trong c¸c lo¹i b¶o th¹ch sau:",0},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTaskDaily",	{2918,2,"H«m nay ®¹i hiÖp ®· ®æi ®ñ råi, ®îi ngµy mai h·y tiÕp tôc nhÐ!","<"} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Dïng Tinh Hång B¶o Th¹ch",23} },
		{"AddDialogOpt",	{"Dïng Lam Thñy Tinh",24} },
		{"AddDialogOpt",	{"Dïng Tö Thñy Tinh",25} },
		{"AddDialogOpt",	{"Dïng Lôc Thñy Tinh",26} },
	},
}
tbConfig[23] = --dïng tinh hång ®æi bao l× x× ®á
{
	nId = 23,
	szMessageType = "CreateCompose",
	szName = "baolixido_1",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Bao l× x× ®á",1,1,1,0.02,0,2},
	tbCondition = 
	{		
		{"AddOneMaterial",	{"Tinh Hång B¶o Th¹ch",{tbProp={4,353,1,1,0,0},},1} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckComposeRedEvelopLimit",	{nil} },
	},
	tbActition = 
	{		
		{"ThisActivity:ComposeRedEvelop",	{"DungTinhHongBaoThachDoiBaoLiXiDo"} },
	},
}
tbConfig[24] = --dïng Lam Thñy Tinh ®æi bao l× x× ®á
{
	nId = 24,
	szMessageType = "CreateCompose",
	szName = "baolixido_1",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Bao l× x× ®á",1,1,1,0.02,0,2},
	tbCondition = 
	{		
		{"AddOneMaterial",	{"Lam Thñy Tinh",{tbProp={4,238,1,1,0,0},},1} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckComposeRedEvelopLimit",	{nil} },
	},
	tbActition = 
	{			
		{"ThisActivity:ComposeRedEvelop",	{"DungLamThuyTinhDoiBaoLiXiDo"} },
	},
}
tbConfig[25] = --dïng Tö Thñy Tinh ®æi bao l× x× ®á
{
	nId = 25,
	szMessageType = "CreateCompose",
	szName = "baolixido_2",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Bao l× x× ®á",1,1,1,0.02,0,2},
	tbCondition = 
	{		
		{"AddOneMaterial",	{"Tö Thñy Tinh",{tbProp={4,239,1,1,0,0},},1} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckComposeRedEvelopLimit",	{nil} },
	},
	tbActition = 
	{
		{"ThisActivity:ComposeRedEvelop",	{"DungTuThuyTinhDoiBaoLiXiDo"} },		
	},
}
tbConfig[26] = --dïng Lôc Thñy Tinh ®æi bao l× x× ®á
{
	nId = 26,
	szMessageType = "CreateCompose",
	szName = "baolixido_2",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Bao l× x× ®á",1,1,1,0.02,0,2},
	tbCondition = 
	{		
		{"AddOneMaterial",	{"Lôc Thñy Tinh",{tbProp={4,240,1,1,0,0},},1} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckComposeRedEvelopLimit",	{nil} },
	},
	tbActition = 
	{
		{"ThisActivity:ComposeRedEvelop",	{"DungLucThuyTinhDoiBaoLiXiDo"} },		
	},
}
tbConfig[27] = --Sö dông bao l× x× ®á
{
	nId = 27,
	szMessageType = "ItemScript",
	szName = "use red evelop",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30169,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },			
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{2500000,1,EVENT_LOG_TITLE,"SuDungBaoLiXiDo"} },
	},
}
tbConfig[28] =
{
	nId = 28,
	szMessageType = "CreateDialog",
	szName = "§èi tho¹i nhËn phÇn th­ëng free exp",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Vµo lóc 0:00-16-1-2012 ®Õn 24:00-17-1-2012, c¸c ®¹i hiÖp cÊp 150 vµ 150 trë lªn (trïng sinh kh«ng giíi h¹n) cã thÓ ®Õn gÆp ta ®Ó nhËn mãn quµ  lµ 100 triÖu ®iÓm kinh nghiÖm kh«ng céng dån, mçi nh©n vËt chØ cã thÓ nhËn mét lÇn duy nhÊt.",0},
	tbCondition = 
	{		
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Ta muèn nhËn th­ëng",29} },
	},
}
tbConfig[29] = 
{
	nId = 29,
	szMessageType = "nil",
	szName = "nhËn phÇn th­ëng free exp",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckTimeGetFreeExp",	{nil} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {{nTaskID = 2912,nStartBit = 21,nBitCount = 1,nMaxValue = 1}, 0, "Mçi nh©n vËt chØ ®­îc nhËn th­ëng 1 lÇn", "=="}},	
	},
	tbActition = 
	{
		{"tbVNG_BitTask_Lib:setBitTask", {{nTaskID = 2912,nStartBit = 21,nBitCount = 1,nMaxValue = 1}, 1}},
		{"PlayerFunLib:AddExp",	{100e6,0,EVENT_LOG_TITLE,"MienPhiNhanThuongDiemKinhNghiem"} },
		{"tbVngTransLog:Write", {"201201_event_tet/", 22, "MienPhiNhanThuongDiemKinhNghiem", "100000000 §iÓm kinh nghiÖm", 1}},
	},
}
tbConfig[30] = --nép mÆt n¹ rång
{
	nId = 30,
	szMessageType = "CreateCompose",
	szName = "give dragon mask",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>§æi ®iÓm kinh nghiÖm",1,1,1,0.02},
	tbCondition = 
	{		
		{"AddOneMaterial",	{"MÆt n¹ - Long Ch©u",{tbProp={0,11,75,1,0,0},},1} },
		{"AddOneMaterial",	{"MÆt n¹ - §Çu Rång",{tbProp={0,11,76,1,0,0},},1} },
		{"AddOneMaterial",	{"MÆt n¹ - Th©n Rång",{tbProp={0,11,77,1,0,0},},1} },
		{"AddOneMaterial",	{"MÆt n¹ - §u«i Rång",{tbProp={0,11,78,1,0,0},},1} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckComposeDragonMask",	{nil} },		
	},
	tbActition = 
	{
		{"ThisActivity:ComposeDragonMask",	{nil} },		
	},
}