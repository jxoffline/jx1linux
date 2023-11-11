Include("\\script\\activitysys\\config\\1020\\variables.lua")
Include("\\script\\activitysys\\config\\1020\\awardlist.lua")
tbConfig = {}
tbConfig[1] = --§¸nh qu¸i rít Item
{
	nId = 1,
	szMessageType = "NpcOnDeath",	
	szName = "B¶n ®å ®¸nh qu¸i nhËn Bét M×",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckInMap",	{"75,321,322,340,225,226,227"} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{ITEM_MATERIAL_1,1,"8"} },		
	},
}
tbConfig[2] = --Ò»¸öÏ¸½Ú
{
	nId = 2,
	szMessageType = "FinishSongJin",
	szName = "songjin mark>=1000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",1000,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_2,30,EVENT_LOG_TITLE,"TongKim1000"} },
	},
}
tbConfig[3] = --Ò»¸öÏ¸½Ú
{
	nId = 3,
	szMessageType = "Chuanguan",
	szName = "KÕt thóc mçi ¶i",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_2,1,EVENT_LOG_TITLE,"VuotquamoiAi"} },
	},
}
tbConfig[4] = --v­ît ¶i 17
{
	nId = 4,
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
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_2,10,EVENT_LOG_TITLE,"VuotAi17"} },
	},
}
tbConfig[5] = --v­ît ¶i 28
{
	nId = 5,
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
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_2,10,EVENT_LOG_TITLE,"VuotAi28"} },
	},
}
tbConfig[6] =
{
	nId = 6,
	szMessageType = "FinishFengLingDu",
	szName = "FinishFengLingDu",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_2,5,EVENT_LOG_TITLE,"HoanThanhPLD"} },
	},
}
tbConfig[7] =
{
	nId = 7,
	szMessageType = "NpcOnDeath",
	szName = "kill_boat_boss",
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
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_2,20,EVENT_LOG_TITLE,"TieuDietThuyTacDauLinh"} },
	},
}
tbConfig[8] =
{
	nId = 8,
	szMessageType = "NpcOnDeath",
	szName = "kill_boat_big_boss",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckId",	{"1692"} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_2,20,EVENT_LOG_TITLE,"TieuDietThuyTacDaiDauLinh"} },
	},
}
tbConfig[9] =
{
	nId = 9,
	szMessageType = "YDBZguoguan",
	szName = "YanDi",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_2,2,EVENT_LOG_TITLE,"QuaAiViemDe"} },
	},
}
tbConfig[10] =
{
	nId = 10,
	szMessageType = "YDBZguoguan",
	szName = "YanDi 10",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {10},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_2,20,EVENT_LOG_TITLE,"QuaAi10ViemDe"} },
	},
}
tbConfig[11] =
{
	nId = 11,
	szMessageType = "NpcOnDeath",
	szName = "killer boss",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckKillerdBoss",	{90} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_2,5,EVENT_LOG_TITLE,"HoanThanhBossST90"} },
	},
}

--Hang Rong
tbConfig[12] = --Hang rong
{
	nId = 12,
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
		{"SetDialogTitle",	{"Cã thÓ dïng 1 v¹n l­îng ®Ó mua nguyªn liÖu B¬ ®Ó ghÐp thµnh b¸nh Sinh NhËt Vâ L©m TruyÒn Kú"} },	
		{"AddDialogOpt",	{format("Mua nguyªn liÖu %s",ITEM_MATERIAL_3.szName),13} },
	},
}
tbConfig[13] = 
{
	nId = 13,
	szMessageType = "CreateCompose",
	szName = "Mua B¬ t¹i Hµng rong",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_MATERIAL_3.szName,1,1,1,0.04,0,250},	
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"AddOneMaterial",	{MONEY.szName,MONEY,10000} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_3,1,EVENT_LOG_TITLE,"MuaBoTaiHangRong"} },
	},
}
--Dai su Hoat dong
tbConfig[14] =
{
	nId = 14,
	szMessageType = "ClickNpc",
	szName = "click DaiSuHoatDong",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"§¹i sø ho¹t ®éng"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"SetDialogTitle",	{"Chóc mõng Sinh NhËt Vâ L©m TruyÒn Kú. H·y ®Õn chç ta tham gia ho¹t ®éng lµm b¸nh Sinh NhËt vµ nhËn nhiÒu phÇn th­ëng hÊp dÉn."} },			
		{"AddDialogOpt",	{"GhÐp Nguyªn LiÖu ",15} },
		{"AddDialogOpt",	{"NhËn phÇn th­ëng ®¹t mèc",26} },
		{"AddDialogOpt",	{"NhËn phÇn th­ëng Sinh nhËt VLTK",21} },
	},
}
tbConfig[15] =
{
	nId = 15,
	szMessageType = "CreateDialog",
	szName = "Ghep phan thuong",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Xin chän lo¹i phÇn th­ëng?"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{		
		{"AddDialogOpt",	{"§æi Bét M× lÊy  §­êng",16} },
		{"AddDialogOpt",	{"Lµm B¸nh kem th­êng",17} },
		{"AddDialogOpt",	{"Lµm  B¸nh kem Chocolate",18} },
		{"AddDialogOpt",	{"Lµm  B¸nh kem Tr¸i C©y",19} },
		{"AddDialogOpt",	{"Lµm  B¸nh Sinh nhËt VLTK",20} },
	},
}
tbConfig[16] = 
{
	nId = 16,
	szMessageType = "CreateCompose",
	szName = "Ta muèn ®æi Bét M× thµnh §­êng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Bét M×",1,1,1,0.04},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"§¼ng cÊp cña ng­¬i kh«ng ®ñ, lÇn sau h·y ®Õn nhÐ!",">="} },		
		{"AddOneMaterial",	{ITEM_MATERIAL_1.szName,ITEM_MATERIAL_1,5} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_4,1,EVENT_LOG_TITLE,"DoiBotMi"} },
	},
}
tbConfig[17] = 
{
	nId = 17,
	szMessageType = "CreateCompose",
	szName = "Ta muèn lµm B¸nh Kem Th­êng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"B¸nh Kem Th­êng",1,1,1,0.04},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"§¼ng cÊp cña ng­¬i kh«ng ®ñ, lÇn sau h·y ®Õn nhÐ!",">="} },
		{"AddOneMaterial",	{ITEM_MATERIAL_1.szName,ITEM_MATERIAL_1,2} }, -- 2 Bot mi
		{"AddOneMaterial",	{ITEM_MATERIAL_4.szName,ITEM_MATERIAL_4,1} }, -- 1 Duong
		{"AddOneMaterial",	{ITEM_MATERIAL_2.szName,ITEM_MATERIAL_2,1} }, -- 1 Sua
		{"AddOneMaterial",	{ITEM_MATERIAL_3.szName,ITEM_MATERIAL_3,2} }, -- 2 Bo	
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_AWARD_1,1,EVENT_LOG_TITLE,"GhepBanhKemThuong"} },
	},
}

tbConfig[18] = 
{
	nId = 18,
	szMessageType = "CreateCompose",
	szName = "Ta muèn lµm B¸nh Kem Chocolate",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"B¸nh Kem Chocolate",1,1,1,0.04},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"§¼ng cÊp cña ng­¬i kh«ng ®ñ, lÇn sau h·y ®Õn nhÐ!",">="} },
		{"AddOneMaterial",	{ITEM_MATERIAL_1.szName,ITEM_MATERIAL_1,2} }, -- 2 Bot mi
		{"AddOneMaterial",	{ITEM_MATERIAL_4.szName,ITEM_MATERIAL_4,1} }, -- 1 Duong
		{"AddOneMaterial",	{ITEM_MATERIAL_2.szName,ITEM_MATERIAL_2,1} }, -- 1 Sua
		{"AddOneMaterial",	{ITEM_MATERIAL_3.szName,ITEM_MATERIAL_3,2} }, -- 2 Bo
		{"AddOneMaterial",	{ITEM_MATERIAL_5.szName,ITEM_MATERIAL_5,1} }, -- 1 Chocolate
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_AWARD_2,1,EVENT_LOG_TITLE,"GhepBanhKemChocolate"} },
	},
}
tbConfig[19] = 
{
	nId = 19,
	szMessageType = "CreateCompose",
	szName = "Ta muèn lµm B¸nh Kem Tr¸i C©y",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"B¸nh Kem Tr¸i C©y",1,1,1,0.04},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"§¼ng cÊp cña ng­¬i kh«ng ®ñ, lÇn sau h·y ®Õn nhÐ!",">="} },
		{"AddOneMaterial",	{ITEM_MATERIAL_1.szName,ITEM_MATERIAL_1,2} }, -- 2 Bot mi
		{"AddOneMaterial",	{ITEM_MATERIAL_4.szName,ITEM_MATERIAL_4,1} }, -- 1 Duong
		{"AddOneMaterial",	{ITEM_MATERIAL_2.szName,ITEM_MATERIAL_2,1} }, -- 1 Sua
		{"AddOneMaterial",	{ITEM_MATERIAL_3.szName,ITEM_MATERIAL_3,2} }, -- 2 Bo
		{"AddOneMaterial",	{ITEM_MATERIAL_6.szName,ITEM_MATERIAL_6,1} }, -- 1 Trai Cay	
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_AWARD_3,1,EVENT_LOG_TITLE,"GhepBanhKemTraiCay"} },
	},
}
tbConfig[20] = 
{
	nId = 20,
	szMessageType = "CreateCompose",
	szName = "Ta muèn lµm B¸nh Sinh NhËt Vâ L©m TruyÒn Kú",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"B¸nh Sinh NhËt Vâ L©m TruyÒn Kú",1,1,1,0.04},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"§¼ng cÊp cña ng­¬i kh«ng ®ñ, lÇn sau h·y ®Õn nhÐ!",">="} },
		{"AddOneMaterial",	{ITEM_MATERIAL_1.szName,ITEM_MATERIAL_1,2} }, -- 2 Bot mi
		{"AddOneMaterial",	{ITEM_MATERIAL_4.szName,ITEM_MATERIAL_4,1} }, -- 1 Duong
		{"AddOneMaterial",	{ITEM_MATERIAL_2.szName,ITEM_MATERIAL_2,1} }, -- 1 Sua
		{"AddOneMaterial",	{ITEM_MATERIAL_3.szName,ITEM_MATERIAL_3,2} }, -- 2 Bo
		{"AddOneMaterial",	{ITEM_MATERIAL_5.szName,ITEM_MATERIAL_5,2} }, -- 2 Chocolate
		{"AddOneMaterial",	{ITEM_MATERIAL_6.szName,ITEM_MATERIAL_6,2} }, -- 2 Trai Cay
		 
	},
	tbActition = 
	{		
		{"PlayerFunLib:GetItem",	{ITEM_AWARD_4,1,EVENT_LOG_TITLE,"GhepBanhSinhNhatVLTK"} },
	},
}
tbConfig[21] =
{
	nId = 21,
	szMessageType = "nil",
	szName = "NhËn th­ëng Sinh NhËt Vâ L©m TruyÒn Kú",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"§¼ng cÊp cña ng­¬i kh«ng ®ñ, lÇn sau h·y ®Õn nhÐ!",">="} },
		{"ThisActivity:CheckAwardExp", {"NhËn th­ëng trong thêi gian tõ 0h00 ngµy 11/06/2013 ®Õn 24h00 ngµy 11/06/2013, Mçi b»ng h÷u chØ nhËn ®­îc 1 lÇn duy nhÊt. "},},
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_GET_EXP,0,"Ng­¬i ®· nhËn phÇn th­ëng ho¹t ®éng råi, kh«ng thÓ nhËn thªm n÷a!","=="} },
	},
	tbActition = 
	{
		{"tbVNG_BitTask_Lib:setBitTask", {tbBITTSK_GET_EXP, 1}},
		{"PlayerFunLib:AddExp",	{500e6,0,EVENT_LOG_TITLE,"Nhan500trExpTaiNpcDaiSuHoatDong"} },
	},
}
--Sö dông Item
tbConfig[22] = 
{
	nId = 22,
	szMessageType = "ItemScript",
	szName = "Sö dông B¸nh Kem Th­êng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_AWARD_1},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },				
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_OFTEN_CAKE, 1000, "Sö dông vËt phÈm qu¸ giíi h¹n, kh«ng thÓ sö dông thªm", "<"}},	
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_LIMIT_USE_OFTEN_CAKE, 1}},
		{"PlayerFunLib:AddExp",	{1e6,0,EVENT_LOG_TITLE,"SuDungBanhKemThuong"} },
	},
}
tbConfig[23] = 
{
	nId = 23,
	szMessageType = "ItemScript",
	szName = "Sö dông B¸nh Chocolate",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_AWARD_2},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },				
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_CHOCOLATE, 800, "Sö dông vËt phÈm qu¸ giíi h¹n, kh«ng thÓ sö dông thªm", "<"}},	
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_LIMIT_USE_CHOCOLATE, 1}},		
		{"PlayerFunLib:AddExp",	{12e6,0,EVENT_LOG_TITLE,"SuDungBanhChocolate"} },		
	},
}
tbConfig[24] = 
{
	nId = 24,
	szMessageType = "ItemScript",
	szName = "Sö dông B¸nh Tr¸i C©y",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_AWARD_3},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },				
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_FRUIT, 10000, "Sö dông vËt phÈm qu¸ giíi h¹n, kh«ng thÓ sö dông thªm", "<"}},	
		{"PlayerFunLib:CheckFreeBagCellWH",	{1,1,1,"default"} },
	},
	tbActition = 
	{		
		{"ThisActivity:UseFruitCake",	{nil} },	
	},
}
tbConfig[25] = 
{
	nId = 25,
	szMessageType = "ItemScript",
	szName = "Sö dông B¸nh Sinh NhËt §Æc biÖt",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_AWARD_4},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_BIRTHDAY_CAKE, 500, "Sö dông vËt phÈm qu¸ giíi h¹n, kh«ng thÓ sö dông thªm", "<"}},
		{"PlayerFunLib:CheckFreeBagCellWH",	{1,1,1,"default"} },	
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_LIMIT_USE_BIRTHDAY_CAKE, 1}},
		{"PlayerFunLib:AddExp",	{30e6,0,EVENT_LOG_TITLE,"SuDungBanhSinhNhatDacBietNhanExp"} },
		{"PlayerFunLib:GetItem",	{tbAward_BirthDayCake_Item,1,EVENT_LOG_TITLE,"SuDungBanhSinhNhatDacBietNhanItem"} },			
	},
}
--NhËn th­ëng ®¹t mèc
tbConfig[26] =
{
	nId = 26,
	szMessageType = "CreateDialog",
	szName = "Nhan thuong dat moc",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Khi sö dông vËt phÈm B¸nh kem Tr¸i C©y ®¹t mèc 500, 1000, hoÆc B¸nh kem §Æc biÖt 250, 500 cã thÓ ®Õn gÆp ta ®Ó nhËn th­ëng. HiÖn t¹i ®¹i hiÖp ®· sö dông <color=yellow><lua GetBitTask(3000, 1, 16) /><color> B¸nh kem Tr¸i C©y, <color=yellow><lua GetBitTask(2999, 17, 14) /><color> B¸nh kem §Æc biÖt"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },			
	},
	tbActition = 
	{		
		{"AddDialogOpt",	{"Th­ëng ®¹t mèc 500   B¸nh Tr¸i C©y",27} },
		{"AddDialogOpt",	{"Th­ëng ®¹t mèc 1000 B¸nh Tr¸i C©y",28} },
		{"AddDialogOpt",	{"Th­ëng ®¹t mèc 250 B¸nh §Æc biÖt",29} },
		{"AddDialogOpt",	{"Th­ëng ®¹t mèc 500 B¸nh §Æc biÖt",30} },
	},
}
tbConfig[27] = 
{
	nId = 27,
	szMessageType = "nil",
	szName = "Th­ëng ®¹t mèc 500   B¸nh Tr¸i C©y",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_LIMIT_USE_FRUIT_COUNT,500,"Yªu cÇu sö dông B¸nh kem Tr¸i C©y ®¹t <color=red>500<color> lÇn trë lªn míi nhËn ®­îc phÇn th­ëng nµy.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_1,0,"Ng­¬i ®· nhËn phÇn th­ëng nµy råi","=="} },
		{"PlayerFunLib:CheckFreeBagCell",	{12,"default"} },
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:setBitTask",	{tbTSK_INFO_1,1} },
		{"PlayerFunLib:GetItem",	{tbAward_1["500"],1,EVENT_LOG_TITLE,"NhanThuongSuDungBanhTraiCayDat500Lan"} },
	},
}
tbConfig[28] = 
{
	nId = 28,
	szMessageType = "nil",
	szName = "Th­ëng ®¹t mèc 1000   B¸nh Tr¸i C©y",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_LIMIT_USE_FRUIT_COUNT,1000,"Yªu cÇu sö dông B¸nh kem Tr¸i C©y ®¹t <color=red>1000<color> lÇn trë lªn míi nhËn ®­îc phÇn th­ëng nµy.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_2,0,"Ng­¬i ®· nhËn phÇn th­ëng nµy råi","=="} },
		{"PlayerFunLib:CheckFreeBagCellWH",	{2,4,1,"default"} },
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:setBitTask",	{tbTSK_INFO_2,1} },
		{"PlayerFunLib:GetItem",	{tbAward_1["1000"],1,EVENT_LOG_TITLE,"NhanThuongSuDungBanhTraiCayDat1000Lan"} },
	},
}
tbConfig[29] = 
{
	nId = 29,
	szMessageType = "nil",
	szName = "Th­ëng ®¹t mèc 250   B¸nh §Æc biÖt",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_LIMIT_USE_BIRTHDAY_CAKE,250,"Yªu cÇu sö dông B¸nh kem  §Æc biÖt <color=red>250<color> lÇn trë lªn míi nhËn ®­îc phÇn th­ëng nµy.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_3,0,"Ng­¬i ®· nhËn phÇn th­ëng nµy råi","=="} },
		{"PlayerFunLib:CheckFreeBagCellWH",	{1,1,1,"default"} },
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:setBitTask",	{tbTSK_INFO_3,1} },
		{"PlayerFunLib:GetItem",	{tbAward_2["250"],1,EVENT_LOG_TITLE,"NhanThuongSuDungBanhDacBiett250Lan"} },
	},
}
tbConfig[30] = 
{
	nId = 30,
	szMessageType = "nil",
	szName = "Th­ëng ®¹t mèc 500   B¸nh §Æc biÖt",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_LIMIT_USE_BIRTHDAY_CAKE,500,"Yªu cÇu sö dông B¸nh kem  §Æc biÖt <color=red>500<color> lÇn trë lªn míi nhËn ®­îc phÇn th­ëng nµy.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_4,0,"Ng­¬i ®· nhËn phÇn th­ëng nµy råi","=="} },
		{"PlayerFunLib:CheckFreeBagCellWH",	{1,1,1,"default"} },
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:setBitTask",	{tbTSK_INFO_4,1} },
		{"PlayerFunLib:GetItem",	{tbAward_2["500"],1,EVENT_LOG_TITLE,"NhanThuongSuDungBanhDacBiett500Lan"} },
	},
}