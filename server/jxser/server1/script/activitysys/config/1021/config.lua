Include("\\script\\activitysys\\config\\1021\\variables.lua")
Include("\\script\\activitysys\\config\\1021\\awardlist.lua")
Include("\\script\\activitysys\\config\\1021\\extend.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
tbConfig = {}
tbConfig[1] = --Ò»¸öÏ¸½Ú
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "server start",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:Init",	{nil} },
	},
}
tbConfig[2] = --Ò»¸öÏ¸½Ú
{
	nId = 2,
	szMessageType = "ClickNpc",
	szName = "click shijianzongguan",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tæng Qu¶n Sù KiÖn"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Hîp thµnh phÇn th­ëng",3} },		
		{"AddDialogOpt",	{"NhËn th­ëng ®¹t mèc sö dông",23} },
		{"SetDialogTitle",	{"<npc>T­¬ng truyÒn nghe giang hå ®ån r»ng, cã thÓ ®iÒu chÕ ®an d­îc ®Ó ®· th«ng Kú Kinh B¸t M¹ch, ng­êi thµnh c«ng sÏ cã hiÖu qu¶ bÊt ngê.\n<color=green>C¸c h¹ cã thÓ mang 5 lo¹i nguyªn liÖu sau  ®Õn ®©y cho ta, ta sÏ tÆng th­ëng cho c¸c h¹ phÇn th­ëng quÝ b¸u.<color>\n<color=yellow>§­¬ng Quy: <color> §¸nh ®uæi c­êng ®¹o ®Ó nhËn ®­îc.\n<color=yellow>X¹ H­¬ng: <color> Mua t¹i hµng Rong.\n<color=yellow>TrÇn B×: <color>Tham gia mét sè tÝnh n¨ng sÏ nhËn ®­îc.\n<color=yellow>Li T©m Th¶o :<color>Thu thËp t¹i c¸c Th«n trang.\n<color=yellow>D­îc V­¬ng §Ønh: <color>Mua trong Kú Tr©n C¸c."} },
	},
}
tbConfig[3] = --Ò»¸öÏ¸½Ú
{
	nId = 3,
	szMessageType = "CreateDialog",
	szName = "compose dialog",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Xin Chµo! C¸c h¹ muèn ®æi PhÇn th­ëng nµo?",0},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{ITEM_AWARD1.szName,4} },
		{"AddDialogOpt",	{ITEM_AWARD2.szName,5} },
		{"AddDialogOpt",	{ITEM_AWARD3.szName,6} },
	},
}
tbConfig[4] = --Ò»¸öÏ¸½Ú
{
	nId = 4,
	szMessageType = "CreateCompose",
	szName = "compose award1",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_AWARD1.szName,1,1,1,0.02,0,250},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"AddOneMaterial",	{ITEM_MATERIAL_1.szName,ITEM_MATERIAL_1,1} },
		{"AddOneMaterial",	{ITEM_MATERIAL_2.szName,ITEM_MATERIAL_2,1} },
		{"AddOneMaterial",	{ITEM_MATERIAL_3.szName,ITEM_MATERIAL_3,1} },
		{"AddOneMaterial",	{ITEM_MATERIAL_4.szName,ITEM_MATERIAL_4,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_AWARD1,1,EVENT_LOG_TITLE,"DoiHoKeDon"} },
	},
}
tbConfig[5] = --Ò»¸öÏ¸½Ú
{
	nId = 5,
	szMessageType = "CreateCompose",
	szName = "compose award2",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_AWARD2.szName,1,1,1,0.02,0,250},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"AddOneMaterial",	{ITEM_MATERIAL_1.szName,ITEM_MATERIAL_1,1} },
		-- {"AddOneMaterial",	{ITEM_MATERIAL_2.szName,ITEM_MATERIAL_2,2} },
		-- {"AddOneMaterial",	{ITEM_MATERIAL_3.szName,ITEM_MATERIAL_3,1} },
		{"AddOneMaterial",	{ITEM_MATERIAL_4.szName,ITEM_MATERIAL_4,1} },
		{"AddOneMaterial",	{ITEM_MATERIAL_5.szName,ITEM_MATERIAL_5,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_AWARD2,1,EVENT_LOG_TITLE,"DoiSuBiDon"} },
	},
}
tbConfig[6] = --Ò»¸öÏ¸½Ú
{
	nId = 6,
	szMessageType = "CreateCompose",
	szName = "compose award3",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_AWARD3.szName,1,1,1,0.02,0,250},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"AddOneMaterial",	{ITEM_MATERIAL_1.szName,ITEM_MATERIAL_1,1} },
		-- {"AddOneMaterial",	{ITEM_MATERIAL_2.szName,ITEM_MATERIAL_2,2} },
		-- {"AddOneMaterial",	{ITEM_MATERIAL_3.szName,ITEM_MATERIAL_3,1} },
		{"AddOneMaterial",	{ITEM_MATERIAL_4.szName,ITEM_MATERIAL_4,1} },
		{"AddOneMaterial",	{ITEM_MATERIAL_5.szName,ITEM_MATERIAL_5,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_AWARD3,1,EVENT_LOG_TITLE,"DoiChanLongDon"} },
	},
}
tbConfig[7] = --Ò»¸öÏ¸½Ú
{
	nId = 7,
	szMessageType = "NpcOnDeath",
	szName = "kill monster at field",
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
		{"NpcFunLib:DropSingleItem",	{ITEM_MATERIAL_1,1,"8"} },
	},
}

tbConfig[8] = --Ò»¸öÏ¸½Ú
{
	nId = 8,
	szMessageType = "FinishSongJin",
	szName = "songjin mark>=1500 and <3000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{"751",3000,"","<"} },
		{"PlayerFunLib:CheckTask",	{"751",1500,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_3,10,EVENT_LOG_TITLE,"TongKim1000"} },
	},
}
tbConfig[9] = --Ò»¸öÏ¸½Ú
{
	nId = 9,
	szMessageType = "FinishSongJin",
	szName = "songjin mark>=3000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{"751",3000,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_3,15,EVENT_LOG_TITLE,"TongKim3000"} },
	},
}
tbConfig[10] = --Ò»¸öÏ¸½Ú
{
	nId = 10,
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
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_3,2,EVENT_LOG_TITLE,"QuaAiViemDe"} },
	},
}
tbConfig[11] = --Ò»¸öÏ¸½Ú
{
	nId = 11,
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
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_3,6,EVENT_LOG_TITLE,"QuaAi10ViemDe"} },
	},
}
tbConfig[12] = --Ò»¸öÏ¸½Ú
{
	nId = 12,
	szMessageType = "Chuanguan",
	szName = "chuangguan_17",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_3,10,EVENT_LOG_TITLE,"VuotAi17"} },
	},
}
tbConfig[13] = --Ò»¸öÏ¸½Ú
{
	nId = 13,
	szMessageType = "Chuanguan",
	szName = "chuangguan_28",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_3,10,EVENT_LOG_TITLE,"VuotAi28"} },
	},
}
tbConfig[14] = --Ò»¸öÏ¸½Ú
{
	nId = 14,
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
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_3,10,EVENT_LOG_TITLE,"TieuDietThuyTacDauLinh"} },
	},
}
tbConfig[15] = --Ò»¸öÏ¸½Ú
{
	nId = 15,
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
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_3,20,EVENT_LOG_TITLE,"TieuDietThuyTacDaiDauLinh"} },
	},
}
tbConfig[16] = --Kill Boss ST 90
{
	nId = 16,
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
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_3,6,EVENT_LOG_TITLE,"HoanThanhBossST90"} },
	},
}
tbConfig[17] = --Kill World Boss 
{
	nId = 17,
	szMessageType = "NpcOnDeath",
	szName = "Tiªu diÖt boss Hoµng Kim",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckWorldBoss",	{nil} },	
		{"PlayerFunLib:CheckFreeBagCell",	{1,"nomsg"} },	
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_3,25,EVENT_LOG_TITLE,"KillBossHKNhanNguyenLieu"} },
	},
}
--Hang Rong
tbConfig[18] = --Ò»¸öÏ¸½Ú
{
	nId = 18,
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
		{"AddDialogOpt",	{format("Mua %s",ITEM_MATERIAL_2.szName),19} },
	},
}
tbConfig[19] = --Ò»¸öÏ¸½Ú
{
	nId = 19,
	szMessageType = "CreateCompose",
	szName = "buy material2",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_MATERIAL_2.szName,1,1,1,0.02,0,250},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"AddOneMaterial",	{MONEY.szName,MONEY,20000} }, --Old Server price 2 van
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_2,1,EVENT_LOG_TITLE,"MuaXaHuongTaiHangRong"} },
	},
}
--Use Item
tbConfig[20] = --Ò»¸öÏ¸½Ú
{
	nId = 20,
	szMessageType = "ItemScript",
	szName = "use award1",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_AWARD1},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckCashLimit",	{1900000000,"default"} },		
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_1, MAX_USE_AWARD1, MSG_LIMITED_USE, "<"}},		
	},
	tbActition = 
	{
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_LIMIT_1, 1}},
		{"PlayerFunLib:AddExp",	{2e6,0,EVENT_LOG_TITLE,"SuDungHoKeDon"} },
		{"ThisActivity:WriteLogPoint",	{tbBITTSK_LIMIT_1,ITEM_AWARD1.szName} },
	},
}
tbConfig[21] = --Ò»¸öÏ¸½Ú
{
	nId = 21,
	szMessageType = "ItemScript",
	szName = "use award2",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_AWARD2},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckCashLimit",	{1900000000,"default"} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_2, MAX_USE_AWARD2_3, MSG_LIMITED_USE, "<"}},
		{"PlayerFunLib:CheckFreeBagCellWH",	{2,4,1,"default"} },
	},
	tbActition = 
	{
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_LIMIT_2_COUNT, 1}},
		{"ThisActivity:UseAward2",	{nil} },
		{"ThisActivity:WriteLogPoint",	{tbBITTSK_LIMIT_2_COUNT,ITEM_AWARD2.szName} },
	},
}
tbConfig[22] = --Ò»¸öÏ¸½Ú
{
	nId = 22,
	szMessageType = "ItemScript",
	szName = "use award3",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_AWARD3},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },		
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_3, MAX_USE_AWARD2_3, MSG_LIMITED_USE, "<"}},		
	},
	tbActition = 
	{	
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_LIMIT_3_COUNT, 1}},		
		{"ThisActivity:UseAwardGetExp",	{tbUseAward3_Exp, tbBITTSK_LIMIT_3, ITEM_AWARD3.szName} },
		{"ThisActivity:WriteLogPoint",	{tbBITTSK_LIMIT_3_COUNT,ITEM_AWARD3.szName} },
	},
}tbConfig[23] = --Ò»¸öÏ¸½Ú
{
	nId = 23,
	szMessageType = "CreateDialog",
	szName = "compose dialog",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Sö dông <color=yellow>S­ B× §¬n<color>  ®¹t tæng sè 500, 1000, 2000 sÏ nhËn ®­îc phÇn th­ëng ®Æc biÖt, HiÖn t¹i c¸c h¹ ®· sö dông ®­îc: <color=yellow><lua GetBitTask(3015, 17, 12) /><color> c¸i"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"NhËn th­ëng mèc 500",24} },
		{"AddDialogOpt",	{"NhËn th­ëng mèc 1000",25} },
		{"AddDialogOpt",	{"NhËn th­ëng mèc 2000",26} },
	},
}
tbConfig[24] = 
{
	nId = 24,
	szMessageType = "nil",
	szName = "Th­ëng ®¹t mèc 500 ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_LIMIT_2_COUNT,500,"Yªu cÇu sö dông tæng <color=yellow>S­ B× §¬n<color>:<color=red> 500<color> lÇn trë lªn míi nhËn ®­îc phÇn th­ëng nµy.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_1,0,"Ng­¬i ®· nhËn phÇn th­ëng nµy råi","=="} },
		{"PlayerFunLib:CheckFreeBagCellWH",	{2,4,1,"default"} },
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:setBitTask",	{tbTSK_INFO_1,1} },
		{"PlayerFunLib:GetItem",	{tbAward_Limit_Old["500"],1,EVENT_LOG_TITLE,"NhanThuongSuDung500Lan"} },
	},
}
tbConfig[25] = 
{
	nId = 25,
	szMessageType = "nil",
	szName = "Th­ëng ®¹t mèc 1000 ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_LIMIT_2_COUNT,1000,"Yªu cÇu sö dông tæng <color=yellow>S­ B× §¬n <color>:<color=red>1000<color> lÇn trë lªn míi nhËn ®­îc phÇn th­ëng nµy.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_2,0,"Ng­¬i ®· nhËn phÇn th­ëng nµy råi","=="} },
		{"PlayerFunLib:CheckFreeBagCellWH",	{2,4,1,"default"} },
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:setBitTask",	{tbTSK_INFO_2,1} },
		{"PlayerFunLib:GetItem",	{tbAward_Limit_Old["1000"],1,EVENT_LOG_TITLE,"NhanThuongSuDung1000Lan"} },
	},
}
tbConfig[26] = 
{
	nId = 26,
	szMessageType = "nil",
	szName = "Th­ëng ®¹t mèc 2000 ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbBITTSK_LIMIT_2_COUNT,2000,"Yªu cÇu sö dông tæng <color=yellow>S­ B× §¬n<color>:<color=red>2000<color> lÇn trë lªn míi nhËn ®­îc phÇn th­ëng nµy.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{tbTSK_INFO_3,0,"Ng­¬i ®· nhËn phÇn th­ëng nµy råi","=="} },
		{"PlayerFunLib:CheckFreeBagCellWH",	{2,4,1,"default"} },
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:setBitTask",	{tbTSK_INFO_3,1} },
		{"PlayerFunLib:GetItem",	{tbAward_Limit_Old["2000"],1,EVENT_LOG_TITLE,"NhanThuongSuDung2000Lan"} },
	},
}