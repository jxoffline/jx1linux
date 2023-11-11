Include("\\script\\activitysys\\config\\1007\\variables.lua")
tbConfig = {}

--C¸ch kiÕm nguyªn liÖu trong c¸c ho¹t ®éng
tbConfig[1] = --Tèng kim 1000 ®iÓm
{
	nId = 1,
	szMessageType = "FinishSongJin",
	szName = "Tèng kim cao cÊp 1000 ®iÓm",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{1500,">="} },
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{3000,"<"} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_THIEP,10,EVENT_LOG_TITLE, "TongKim1000"} },
	},
}

tbConfig[2] = --Tèng kim 3000 ®iÓm
{
	nId = 2,
	szMessageType = "FinishSongJin",
	szName = "Tèng kim cao cÊp 3000 ®iÓm",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{3000,">="} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_THIEP,15,EVENT_LOG_TITLE, "TongKim3000"} },
	},
}
tbConfig[3] =		--V­ît ¶i 17
{
	nId = 3,
	szMessageType = "Chuanguan",
	szName = "V­ît qua ¶i 17",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_THIEP,10,EVENT_LOG_TITLE, "VuotAi17"} },
	},
}
tbConfig[4] =  				--V­ît ¶i 28
{
	nId = 4,
	szMessageType = "Chuanguan",
	szName = "V­ît qua ¶i 28",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_THIEP,10,EVENT_LOG_TITLE, "VuotAi28"} },
	},
}
tbConfig[5] = --Thñy tÆc ®Çu lÜnh
{
	nId = 5,
	szMessageType = "NpcOnDeath",
	szName = "GiÕt chÕt 1 thñy tÆc ®Çu lÜnh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckBoatBoss",	{nil} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_THIEP,10,EVENT_LOG_TITLE, "TieuDietThuyTacDauLinh"} },
	},
}
tbConfig[6] = --thuû tÆc ®¹i ®Çu lÜnh
{
	nId = 6,
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
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_THIEP,20,EVENT_LOG_TITLE, "TieuDietThuyTacDaiDauLinh"} },
	},
}
tbConfig[7] = --Tiªu diÖt Boss tiÓu viªm ®Õ
{
	nId = 7,
	szMessageType = "NpcOnDeath",
	szName = "yandibaozang boss",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckId",	{"1289,1290,1291,1292,1293,1294,1295,1296,1297,1298"} },
		{"NpcFunLib:CheckInMap",	{"853,854,855,856,857,858,859,860,861,862"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_THIEP,2,EVENT_LOG_TITLE,"BossTieuViemDe"} },
	},
}
tbConfig[8] = --Boss §¹i viªm ®Õ
{
	nId = 8,
	szMessageType = "NpcOnDeath",
	szName = "yandibaozang boss sp",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckId",	{"1310,1312,1317,1314,1318,1319,1311,1313,1315,1316"} },
		{"NpcFunLib:CheckInMap",	{"853,854,855,856,857,858,859,860,861,862"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_THIEP,6,EVENT_LOG_TITLE,"BossDaiViemDe"} },
	},
}
tbConfig[9] = --Boss Hoµng Kim
{
	nId = 9,
	szMessageType = "NpcOnDeath",
	szName = "Tiªu diÖt boss Hoµng Kim",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckWorldBoss",	{nil} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_THIEP,20,EVENT_LOG_TITLE, "TieuDietBossTheGioi"} },
	},
}
tbConfig[10] = --Thiªn tr× tÇng 3
{
	nId = 10,
	szMessageType = "NpcOnDeath",
	szName = "tianchimijing floor3",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckInMap",	{"937,938,939,940,941,943,944,945,946"} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{ITEM_THIEP,1,"10"} },
	},
}
tbConfig[11] = --KiÕm gia mª cung
{
	nId = 11,
	szMessageType = "MazeTaskFinish",
	szName = "maze task",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		--{"PlayerFunLib:CheckFreeBagCell",	{1,""} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_THIEP,3,EVENT_LOG_TITLE,"KiemGiaMeCung"} },
	},
}
tbConfig[12] =
{
	nId = 12,
	szMessageType = "NpcOnDeath",
	szName = "B¶n ®å ®¸nh qu¸i",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckInMap",	{"321,322,340,75,225,226,227"} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{ITEM_HOAHONG,1,"5"} },
	},
}
--------------------------------------------------------------------------------------------------------
---§èi tho¹i víi Npc
tbConfig[13] =
{
	nId = 13,
	szMessageType = "ClickNpc",
	szName = "BÊm vµo Tæng Qu¶n Sù KiÖn",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tæng Qu¶n Sù KiÖn"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"GhÐp Hép Quµ",14} },
	},
}
tbConfig[14] =
{
	nId = 14,
	szMessageType = "CreateDialog",
	szName = "GhÐp Hép Quµ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>C¸c h¹ muèn ghÐp hép quµ nµo?"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"GhÐp hép quµ lín",15} },
		{"AddDialogOpt",	{"GhÐp hép quµ nhá",16} },
	},
}
tbConfig[15] = --GhÐp hép quµ lín
{
	nId = 15,
	szMessageType = "CreateCompose",
	szName = "Hîp thµnh Hép quµ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Hép quµ lín",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"§¼ng cÊp cña ng­¬i ch­a ®ñ 150, kh«ng thÓ tham gia ho¹t ®éng nµy",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{ITEM_HOAHONG.szName,ITEM_HOAHONG,1} },
		{"AddOneMaterial",	{ITEM_THIEP.szName,ITEM_THIEP,1} },
		{"AddOneMaterial",	{ITEM_EMPTY_BOX.szName,ITEM_EMPTY_BOX,1} },
		{"AddOneMaterial",	{ITEM_TRANGSUC.szName,ITEM_TRANGSUC,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_BIG_BOX,1,EVENT_LOG_TITLE, "GhepHopQuaLon"} },
	},
}
tbConfig[16] = --GhÐp hép quµ Nho
{
	nId = 16,
	szMessageType = "CreateCompose",
	szName = "Hîp thµnh Hép quµ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Hép quµ nhá",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"§¼ng cÊp cña ng­¬i ch­a ®ñ 150, kh«ng thÓ tham gia ho¹t ®éng nµy",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{ITEM_HOAHONG.szName,ITEM_HOAHONG,1} },
		{"AddOneMaterial",	{ITEM_THIEP.szName,ITEM_THIEP,1} },
		{"AddOneMaterial",	{ITEM_EMPTY_BOX.szName,ITEM_EMPTY_BOX,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_SMALL_BOX,1,EVENT_LOG_TITLE, "GhepHopQuaNho"} },
	},
}
tbConfig[17] = --sö dông Hép quµ nhá
{
	nId = 17,
	szMessageType = "ItemScript",
	szName = "Sö dông Hép quµ nhá",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_SMALL_BOX},
	tbCondition = 
	{
		{"PlayerFunLib:VnCheckInCity", {"default"}},
		{"PlayerFunLib:CheckTotalLevel",	{150,"§¼ng cÊp cña ng­¬i kh«ng ®ñ, kh«ng thÓ sö dông vËt phÈm",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{5,"default"} },		
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbSmall_Box_Use_Limit,nSMALL_BOX_MAX,"Sö dông Hép Quµ Nhá ®¹t ®Õn giíi h¹n, kh«ng thÓ sö \ndông tiÕp","<"} },
		--{"ThisActivity:Use_Box_Limit", {tbSmall_Box_Use_Limit}},
	},
	tbActition = 
	{
		{"tbVNG_BitTask_Lib:addTask", {tbSmall_Box_Use_Limit, 1}},
	--	{"ThisActivity:Use_Small_Box", {nil}},	
		{"PlayerFunLib:AddExp",	{nAWARD_NHO_HQ,0,EVENT_LOG_TITLE,"SuDungHopQuaNhoNhanExp"} },
	},
}
tbConfig[18] = --sö dông Hép quµ lín
{
	nId = 18,
	szMessageType = "ItemScript",
	szName = "Sö dông Hép quµ lín",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_BIG_BOX},
	tbCondition = 
	{
		{"PlayerFunLib:VnCheckInCity", {"default"}},
		{"PlayerFunLib:CheckTotalLevel",	{150,"§¼ng cÊp cña ng­¬i kh«ng ®ñ, kh«ng thÓ sö dông vËt phÈm",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{5,"default"} },		
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBig_Box_Use_Limit,nBIG_BOX_MAX,"Sö dông Hép Quµ lín ®¹t ®Õn giíi h¹n, kh«ng thÓ sö \ndông tiÕp","<"} },
		--{"ThisActivity:Use_Box_Limit", {tbBig_Box_Use_Limit}},
	},
	tbActition = 
	{
		{"tbVNG_BitTask_Lib:addTask", {tbBig_Box_Use_Limit, 1}},
		{"PlayerFunLib:AddExp",	{nAWARD_LON_HQ,0,EVENT_LOG_TITLE,"SuDungHopQuaLonNhanExp"} },
		{"PlayerFunLib:GetItem",	{nITEM_AWARD_LON_HQ,1,EVENT_LOG_TITLE, "SuDungHopQuaLonNhanVatPham"} },	
		{"ThisActivity:Use_Big_Box", {nil}},	
	},
}
tbConfig[19] = --Mua B¸nh dÎo t¹i npc Hang rong
{
	nId = 19,
	szMessageType = "ClickNpc",
	szName = "Hµng rong b¸n Hép quµ trèng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Hµng rong"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Mua Hép quµ trèng",20} },
	},
}
tbConfig[20] =
{
	nId = 20,
	szMessageType = "CreateCompose",
	szName = "Mua Hép quµ trèng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Hép quµ trèng",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"100000 l­îng",{nJxb=10000,},1} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_EMPTY_BOX,1,EVENT_LOG_TITLE,"MuaHopQuaTrongNpcHangRong"} },
	},
}