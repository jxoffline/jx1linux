Include("\\script\\activitysys\\config\\41\\variables.lua")
tbConfig = {}
tbConfig[1] = --Ò»¸öÏ¸½Ú
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "Add npc when server start",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
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
	szMessageType = "ClickNpc",
	szName = "click npc named dazhushuai",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {"§¹i Chñ So¸i"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Nép Huy HiÖu",3} },
		{"AddDialogOpt",	{"NhËn danh hiÖu §Ö NhÊt Chñ So¸i",4} },
		{"AddDialogOpt",	{"NhËn phÇn th­ëng §Ö NhÊt Chñ So¸i",5} },
		{"AddDialogOpt",	{"KÝch ho¹t tÝnh n¨ng §Ö NhÊt Chñ So¸i",6} },
		{"AddDialogOpt",	{"KiÓm tra ®iÓm tÝch lòy danh hiÖu",7} },
		{"AddDialogOpt",	{"N©ng cÊp Huy HiÖu",16} },
	},
}
tbConfig[3] = --Ò»¸öÏ¸½Ú
{
	nId = 3,
	szMessageType = "CreateDialog",
	szName = "handin medal total",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {"Xin chµo",0},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TSK_DAILY_MEDAL,MAX_DAILY_HANDIN_MEDAL,"H«m nay ng­¬i ®· giao nép qu¸ nhiÒu råi, ®îi ngµy mai quai l¹i nhÐ","<"} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Giao nép Huy HiÖu cÊp 1",24} },
		{"AddDialogOpt",	{"Giao nép Huy HiÖu cÊp 2",25} },
		{"AddDialogOpt",	{"Giao nép Huy HiÖu cÊp 3",26} },
	},
}
tbConfig[4] = --Ò»¸öÏ¸½Ú
{
	nId = 4,
	szMessageType = "nil",
	szName = "get title named diyizhushuai",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TSK_DAILY_GET_TITLE,1,"Ng­¬i ®· nhËn danh hiÖu nµy råi","<"} },
		{"lib:CheckTimeAndWeekDay",	{1000,2400,"4","Tõ 10:00 ®Õn 24:00 thø 5 hµng tuÇn míi cã thÓ nhËn"} },
	},
	tbActition = 
	{
		{"ThisActivity:GetTitle_1",	{nil} },
	},
}
tbConfig[5] = --Ò»¸öÏ¸½Ú
{
	nId = 5,
	szMessageType = "nil",
	szName = "get diyizhushuai award",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TSK_DAILY_EXP_AWARD,1,"H«m nay ng­¬i ®· nhËn phÇn th­ëng nµy, ®îi ngµy mai quay l¹i nhÐ","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:GetZhuShuaiAward_1",	{nil} },
	},
}
tbConfig[6] = --Ò»¸öÏ¸½Ú
{
	nId = 6,
	szMessageType = "CreateDialog",
	szName = "active diyizhushuai",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {"Xin chµo",0},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TSK_DAILY_ACTIVE,MAX_DAILY_ACTIVE,"H«m nay sè lÇn kÝch ho¹t cña c¸c h¹ ®· sö dung hÕt, ®îi ngµy mai quay l¹i nhÐ","<"} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"KÝch ho¹t V­ît ¶i nhËn hiÖu qu¶ nh©n 2 kinh nghiÖm",8} },
		{"AddDialogOpt",	{"KÝch ho¹t Viªm §Õ nhËn hiÖu qu¶ nh©n 2 kinh nghiÖm",9} },
		{"AddDialogOpt",	{"KÝch ho¹t Tèng Kim nhËn hiÖu qu¶ nh©n 2 ®iÓm tÝch lòy",10} },
	},
}
tbConfig[7] = --Ò»¸öÏ¸½Ú
{
	nId = 7,
	szMessageType = "nil",
	szName = "query mark",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:QueryMark_1",	{nil} },
	},
}
tbConfig[8] = --Ò»¸öÏ¸½Ú
{
	nId = 8,
	szMessageType = "nil",
	szName = "active chuangguan",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TSK_DAILY_ACTIVE,MAX_DAILY_ACTIVE,"H«m nay sè lÇn kÝch ho¹t cña c¸c h¹ ®· sö dung hÕt, ®îi ngµy mai quay l¹i nhÐ","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:ActiveFunction_1",	{NUM_CHUANGGUAN} },
	},
}
tbConfig[9] = --Ò»¸öÏ¸½Ú
{
	nId = 9,
	szMessageType = "nil",
	szName = "active YDBZ",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TSK_DAILY_ACTIVE,MAX_DAILY_ACTIVE,"H«m nay sè lÇn kÝch ho¹t cña c¸c h¹ ®· sö dung hÕt, ®îi ngµy mai quay l¹i nhÐ","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:ActiveFunction_1",	{NUM_YDBZ} },
	},
}
tbConfig[10] = --Ò»¸öÏ¸½Ú
{
	nId = 10,
	szMessageType = "nil",
	szName = "active songjin",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TSK_DAILY_ACTIVE,MAX_DAILY_ACTIVE,"H«m nay sè lÇn kÝch ho¹t cña c¸c h¹ ®· sö dung hÕt, ®îi ngµy mai quay l¹i nhÐ","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:ActiveFunction_1",	{NUM_SONGJIN} },
	},
}
tbConfig[11] = --Ò»¸öÏ¸½Ú
{
	nId = 11,
	szMessageType = "FinishSongJin",
	szName = "songjin mark >= 3000",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"nomsg",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MEDAL_1,10,EVENT_LOG_TITLE,"TongKim3000NhanHuyHieu"} },
	},
}
tbConfig[12] = --Ò»¸öÏ¸½Ú
{
	nId = 12,
	szMessageType = "FinishSongJin",
	szName = "songjin mark < 3000 and >= 1000",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"nomsg",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"","<"} },
		{"PlayerFunLib:CheckTask",	{"751",1000,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MEDAL_1,5,EVENT_LOG_TITLE,"TongKim1000NhanHuyHieu"} },
	},
}
tbConfig[13] = --Ò»¸öÏ¸½Ú
{
	nId = 13,
	szMessageType = "Chuanguan",
	szName = "chuangguan 17",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"nomsg",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MEDAL_1,5,EVENT_LOG_TITLE,"VuotAi17NhanHuyHieu"} },
	},
}
tbConfig[14] = --Ò»¸öÏ¸½Ú
{
	nId = 14,
	szMessageType = "Chuanguan",
	szName = "chuangguan 28",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"nomsg",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MEDAL_1,5,EVENT_LOG_TITLE,"VuotAi28NhanHuyHieu"} },
	},
}
tbConfig[15] = --Ò»¸öÏ¸½Ú
{
	nId = 15,
	szMessageType = "YDBZguoguan",
	szName = "YDBZ 6",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {6},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"nomsg",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MEDAL_1,10,EVENT_LOG_TITLE,"VuotAiViemDe6NhanHuyHieu"} },
	},
}
tbConfig[16] = --Ò»¸öÏ¸½Ú
{
	nId = 16,
	szMessageType = "CreateDialog",
	szName = "level up medal",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {"Xin chµo",0},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"N©ng cÊp lªn Huy HiÖu cÊp 2",17} },
		{"AddDialogOpt",	{"N©ng cÊp lªn Huy HiÖu cÊp 3",18} },
	},
}
tbConfig[17] = --Ò»¸öÏ¸½Ú
{
	nId = 17,
	szMessageType = "nil",
	szName = "compse medal 1",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:toUpdatecompose",	{1} },
	},
}
tbConfig[18] = --Ò»¸öÏ¸½Ú
{
	nId = 18,
	szMessageType = "nil",
	szName = "compse medal 2",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:toUpdatecompose",	{2} },
	},
}
tbConfig[19] = --Ò»¸öÏ¸½Ú
{
	nId = 19,
	szMessageType = "ClickNpc",
	szName = "click npc name lingfan",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {"Hµng rong"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Mua Th¹ch Kim",20} },
	},
}
tbConfig[20] = --Ò»¸öÏ¸½Ú
{
	nId = 20,
	szMessageType = "CreateCompose",
	szName = "compose shijin",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {"Th¹ch Kim",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"AddOneMaterial",	{"Ng©n l­îng",{nJxb=1},10000} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_SHIJIN,1,EVENT_LOG_TITLE,"buy_shijin"} },
	},
}
tbConfig[21] = --Ò»¸öÏ¸½Ú
{
	nId = 21,
	szMessageType = "ClickNpc",
	szName = "click npc named caifengshi",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {"Thî May"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"NhËn phÇn th­ëng trùc tuyÕn",22} },
	},
}
tbConfig[22] = --Ò»¸öÏ¸½Ú
{
	nId = 22,
	szMessageType = "nil",
	szName = "get award by online",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{90,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TSK_DAILY_LOGIN_MEDAL,MAX_DAILY_LOGIN_MEDAL,"H«m nay ng­¬i kh«ng thÓ nhËn n÷a, ngµy mai h·y quay l¹i.","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"ThisActivity:GetOnLineAward",	{nil} },
	},
}
tbConfig[23] = --Ò»¸öÏ¸½Ú
{
	nId = 23,
	szMessageType = "OnLogin",
	szName = "player login",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:PlayerOnLogin",	{nil} },
	},
}
tbConfig[24] = --Ò»¸öÏ¸½Ú
{
	nId = 24,
	szMessageType = "nil",
	szName = "hand in medal 1",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:tocompose",	{1} },
	},
}
tbConfig[25] = --Ò»¸öÏ¸½Ú
{
	nId = 25,
	szMessageType = "nil",
	szName = "hand in medal 2",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:tocompose",	{2} },
	},
}
tbConfig[26] = --Ò»¸öÏ¸½Ú
{
	nId = 26,
	szMessageType = "nil",
	szName = "hand in medal 3",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:tocompose",	{3} },
	},
}
tbConfig[27] = --Ò»¸öÏ¸½Ú
{
	nId = 27,
	szMessageType = "nil",
	szName = "hand in medal 3",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:tocompose",	{3} },
	},
}
tbConfig[28] = --Ò»¸öÏ¸½Ú
{
	nId = 28,
	szMessageType = "SignUpSongJin",
	szName = "sign up songjin",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {3},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:PlayerSignUp",	{NUM_SONGJIN} },
	},
}
tbConfig[29] = --Ò»¸öÏ¸½Ú
{
	nId = 29,
	szMessageType = "SignUpYDBZ",
	szName = "sign up ydbz",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:PlayerSignUp",	{NUM_YDBZ} },
	},
}
tbConfig[30] = --Ò»¸öÏ¸½Ú
{
	nId = 30,
	szMessageType = "SignUpChuangguan",
	szName = "sign up chuanggguan",
	nStartDate = 201204020000,
	nEndDate  = 201205010000,
	tbMessageParam = {2},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:PlayerSignUp",	{NUM_CHUANGGUAN} },
	},
}
