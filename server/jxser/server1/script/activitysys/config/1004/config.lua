Include("\\script\\activitysys\\config\\1004\\variables.lua")
tbConfig = {}
tbConfig[1] = --Tèng kim 4000 ®iÓm
{
	nId = 1,
	szMessageType = "FinishSongJin",
	szName = "Tèng kim cao cÊp 4000 ®iÓm",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"ThisActivity:HaveAnyQuest", {nil},},
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{4000,">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"nomsg"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30133,1,0,0},},2,strEventName, "TongKim4000"} },
	},
}
tbConfig[2] =
{
	nId = 2,
	szMessageType = "Chuanguan",
	szName = "V­ît qua ¶i 28",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"ThisActivity:HaveAnyQuest", {nil},},					
	},
	tbActition = 
	{		
		{"ThisActivity:Add_PaidCOT_Task", {nTSK_WEEKLY_CHUANGUAN, 1}},
		{"ThisActivity:Chuanguan28Action", {nil}},
	},
}
tbConfig[3] = 
{
	nId = 3,
	szMessageType = "FinishFengLingDu",
	szName = "Hoµn thµnh Phong L¨ng §é",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:HaveAnyQuest", {nil},},
		{"ThisActivity:IsPaidBoat", {nil}},
	},
	tbActition = 
	{
		{"ThisActivity:VngAddTaskCounter", {nTSK_WEEKLY_FENGLINGDU, 1}},
	},
}
tbConfig[4] = --Viªm ®Õ
{
	nId = 4,
	szMessageType = "YDBZguoguan",
	szName = "V­ît qua ¶i Viªm §Õ thø 6",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {6},
	tbCondition = 
	{
		{"ThisActivity:HaveAnyQuest", {nil},},
	},
	tbActition = 
	{
		{"ThisActivity:YDBZguoguanAction", {6}},
		{"ThisActivity:VngAddTaskCounter", {nTSK_WEEKLY_YDBZ, 1}},
	},
}
tbConfig[5] = --§èi tho¹i B¾c §Èu L·o Nh©n
{
	nId = 5,
	szMessageType = "ClickNpc",
	szName = "BÊm vµo B¾c §Èu L·o Nh©n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"B¾c §Èu L·o Nh©n"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"NhiÖm vô §«ng Trïng H¹ Th¶o",6} },		
	},
}
tbConfig[6] =
{
	nId = 6,
	szMessageType = "CreateDialog",
	szName = "NhiÖm vô §«ng Trïng Th¶o - main dialog",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>C¸c h¹ t×m ta cã viÖc g×?"},
	tbCondition = 
	{
		
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"NhiÖm vô giai ®o¹n 1",7} },
		{"AddDialogOpt",	{"NhiÖm vô giai ®o¹n 2",8} },
		{"AddDialogOpt",	{"NhiÖm vô giai ®o¹n 3",9} },
		--{"AddDialogOpt",	{"NhËn phÇn th­ëng tham gia tÝnh n¨ng tuÇn",10} },
		--{"AddDialogOpt",	{"KiÓm tra t×nh h×nh tham gia tÝnh n¨ng tuÇn",11} },
		{"AddDialogOpt",	{"MiÔn phÝ nhËn vËt phÈm Tói Linh §¬n",20} },
	},
}
tbConfig[7] =
{
	nId = 7,
	szMessageType = "nil",
	szName = "NhiÖm vô §«ng Trïng Th¶o - 1",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{		
	},
	tbActition = 
	{
		{"ThisActivity:MainQuestDialog", {1},},
	},
}
tbConfig[8] =
{
	nId = 8,
	szMessageType = "nil",
	szName = "NhiÖm vô §«ng Trïng Th¶o - 2",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		
	},
	tbActition = 
	{
		{"ThisActivity:MainQuestDialog", {2},},
	},
}
tbConfig[9] =
{
	nId = 9,
	szMessageType = "nil",
	szName = "NhiÖm vô §«ng Trïng Th¶o - 3",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		
	},
	tbActition = 
	{
		{"ThisActivity:MainQuestDialog", {3},},
	},
}
tbConfig[10] =
{
	nId = 10,
	szMessageType = "CreateDialog",
	szName = "NhËn phÇn th­ëng tham gia tÝnh n¨ng tuÇn dialog",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Xin h·y chän phÇn th­ëng:"},
	tbCondition = 
	{
		{"ThisActivity:WeeklyAwardCondition", {nil},},
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"PhÇn th­ëng hoµn thµnh 15 trËn Tèng Kim ®¹t 3000 ®iÓm",12} },
		{"AddDialogOpt",	{"PhÇn th­ëng hoµn thµnh 10 lÇn V­ît ¶i cã sö dông Long HuyÕt Hoµn",13} },
		{"AddDialogOpt",	{"PhÇn th­ëng hoµn thµnh 14 lÇn ®i thuyÒn Phong L¨ng §é sö dông LÖnh Bµi Thñy TÆc",14} },
		{"AddDialogOpt",	{"PhÇn th­ëng hoµn thµnh 10 lÇn V­ît ¶i 6 Viªm §Õ",15} },
	},
}
tbConfig[11] =
{
	nId = 11,
	szMessageType = "nil",
	szName = "KiÓm tra t×nh h×nh tham gia tÝnh n¨ng tuÇn",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{		
	},
	tbActition = 
	{
		{"ThisActivity:CheckWeeklyTask", {nil},},		
	},
}
tbConfig[12] =
{
	nId = 12,
	szMessageType = "nil",
	szName = "PhÇn th­ëng Tèng Kim tuÇn",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{		
		{"PlayerFunLib:CheckTask", {nTSK_WEEKLY_SONGJIN_3000, 15,"Xin lçi, c¸c h¹ kh«ng ®ñ ®iÒu kiÖn nhËn th­ëng",">="}},		
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"ThisActivity:VngSubtractTaskCounter", {nTSK_WEEKLY_SONGJIN_3000, 15, "Xin lçi, c¸c h¹ kh«ng ®ñ ®iÒu kiÖn nhËn th­ëng"},},
	},
	tbActition = 
	{		
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30134,1,0,0},},1,"NhiemVuDongTrungThao", "PhanThuongTKTuan"} },
	},
}
tbConfig[13] =
{
	nId = 13,
	szMessageType = "nil",
	szName = "PhÇn th­ëng V­ît ¶i tuÇn",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{		
		{"PlayerFunLib:CheckTask", {nTSK_WEEKLY_CHUANGUAN, 10,"Xin lçi, c¸c h¹ kh«ng ®ñ ®iÒu kiÖn nhËn th­ëng",">="}},		
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"ThisActivity:VngSubtractTaskCounter", {nTSK_WEEKLY_CHUANGUAN, 10, "Xin lçi, c¸c h¹ kh«ng ®ñ ®iÒu kiÖn nhËn th­ëng"},},
	},
	tbActition = 
	{		
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30134,1,0,0},},1,"NhiemVuDongTrungThao", "PhanThuongVuotAiTuan"} },
	},
}
tbConfig[14] =
{
	nId = 14,
	szMessageType = "nil",
	szName = "PhÇn th­ëng PLD tuÇn",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{		
		{"PlayerFunLib:CheckTask", {nTSK_WEEKLY_FENGLINGDU, 14,"Xin lçi, c¸c h¹ kh«ng ®ñ ®iÒu kiÖn nhËn th­ëng",">="}},		
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"ThisActivity:VngSubtractTaskCounter", {nTSK_WEEKLY_FENGLINGDU, 14, "Xin lçi, c¸c h¹ kh«ng ®ñ ®iÒu kiÖn nhËn th­ëng"},},
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30134,1,0,0},},1,"NhiemVuDongTrungThao", "PhanThuongPLDTuan"} },
	},
}
tbConfig[15] =
{
	nId = 15,
	szMessageType = "nil",
	szName = "PhÇn th­ëng Viªm §Õ tuÇn",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{		
		{"PlayerFunLib:CheckTask", {nTSK_WEEKLY_YDBZ, 10,"Xin lçi, c¸c h¹ kh«ng ®ñ ®iÒu kiÖn nhËn th­ëng",">="}},		
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"ThisActivity:VngSubtractTaskCounter", {nTSK_WEEKLY_YDBZ, 10, "Xin lçi, c¸c h¹ kh«ng ®ñ ®iÒu kiÖn nhËn th­ëng"},},
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30134,1,0,0},},1,"NhiemVuDongTrungThao", "PhanThuongViemDeTuan"} },
	},
}
tbConfig[16] =
{
	nId = 16,
	szMessageType = "nil",
	szName = "NhËn nhiÖm vô giai ®o¹n 1",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{		
		{"ThisActivity:Stage1_QuestCondition", {nil}},
		
	},
	tbActition = 
	{
		{"ThisActivity:Stage1_QuestAccept", {nil}},	
	},
}
tbConfig[17] =
{
	nId = 17,
	szMessageType = "nil",
	szName = "Hoµn thµnh nhiÖm vô giai ®o¹n 1",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{		
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_STAGE_1, 1, "Ng­¬i ch­a nhËn nhiÖm vô lµm sao mµ hoµn thµnh!", "~="}},		
	},
	tbActition = 
	{
		{"ThisActivity:Stage1_QuestAccept", {nil}},	
	},
}
tbConfig[18] =
{
	nId = 18,
	szMessageType = "ServerStart",
	szName = "Khi khëi ®éng server sÏ t¶i data",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:OnServerStart",	{nil} },
	},
}
tbConfig[19] = --Tèng kim 3000 ®iÓm
{
	nId = 19,
	szMessageType = "FinishSongJin",
	szName = "Tèng kim cao cÊp 3000 ®iÓm",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"ThisActivity:HaveAnyQuest", {nil},},
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{3000,">="} },
	},
	tbActition = 
	{
		{"ThisActivity:VngAddTaskCounter", {nTSK_WEEKLY_SONGJIN_3000, 1}},
	},
}
tbConfig[20] = 
{
	nId = 20,
	szMessageType = "nil",
	szName = "MiÔn phÝ nhËn tói linh ®¬n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:HaveAnyQuest", {"CÇn ph¶i nhËn nhiÖm vô §«ng Trïng H¹ Th¶o míi cã thÓ nhËn vËt phÈm nµy!"},},		
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30134,1,0,0},},1,strEventName, "MienPhiNhanTuiLinhDon"} },
	},
}
tbConfig[21] = 
{
	nId = 21,
	szMessageType = "FinishFengLingDu",
	szName = "Hoµn thµnh Phong L¨ng §é",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:HaveAnyQuest", {nil},},
		{"ThisActivity:IsPaidBoat", {nil}},
		{"PlayerFunLib:CheckFreeBagCell",	{1,"nomsg"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30133,1,0,0},},3,strEventName, "HoanThanhPLD"} },
	},
}
