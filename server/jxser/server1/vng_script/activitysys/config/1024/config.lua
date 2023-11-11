Include("\\vng_script\\activitysys\\config\\1024\\variables.lua")
Include("\\vng_script\\activitysys\\config\\1024\\extend.lua")
Include("\\vng_script\\activitysys\\config\\1024\\extend_1.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\vng_script\\features\\huynhdelenhbai\\mainfuc.lua")
Include("\\script\\lib\\log.lua")
tbConfig = {}

tbConfig[1] = --§¸nh quai
{
	nId = 1,
	szMessageType = "NpcOnDeath",
	szName = "Tiªu diÖt qu¸i",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		--{"ThisActivity:CheckInMapThapNien",	{nil} },
	},
	tbActition = 
	{
		{"ThisActivity:DropItemNpcInMap",	{nil} },
	},
}
tbConfig[2] =
{
	nId = 2,
	szMessageType = "ClickNpc",
	szName = "V« Danh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"V« Danh"},
	tbCondition =
	{
		{"ThisActivity:CheckLevel_ShowDlg", {1} },
	},
	tbActition =
	{
		{"AddDialogOpt",	{"NhËn Huynh §Ö T­¬ng Phïng lÖnh bµi",3} },
		{"AddDialogOpt",	{"NhËn nhiÖm vô H­íng DÉn T©n Thñ",4} },
		{"AddDialogOpt",	{"Tr¶ nhiÖm vô",5} },	
	},
}
tbConfig[3] =
{
	nId = 3,
	szMessageType = "nil",
	szName = "NhËn Huynh §Ö T­¬ng Phïng lÖnh bµi",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{		
		{"ThisActivity:CheckActiveCondition",	{2} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_HDTP_LB,1,EVENT_LOG_TITLE,"NhanHuynhDeTPLenhBai"} },	
		{"tbVNG_BitTask_Lib:addTask", {TSK_NHAN_LB_HDTP, 1}},	
		{"ThisActivity:ResetBitCodeHDLB",	{} },
	},
}
tbConfig[4] =
{
	nId = 4,
	szMessageType = "nil",
	szName = "NhËn nhiÖm vô",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:Check_ItemHDLB", {} },		
	},
	tbActition = 
	{
		{"tbHuynhdelenhbai:onDialogNpcGiveTask",	{} },
	},
}
tbConfig[5] =
{
	nId = 5,
	szMessageType = "nil",
	szName = "Tr¶ nhiÖm vô",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckLevel_ShowDlg", {1} },	
	},
	tbActition = 
	{
		{"tbHuynhdelenhbai:onDialogNpcGiveAward",{}},
	},
}
tbConfig[6] = --Tèng kim 500 ®iÓm
{
	nId = 6,
	szMessageType = "FinishSongJin",
	szName = "when FinishSongJin",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-1, "1,2", 500, -1},
	tbCondition = 
	{
		{"ThisActivity:CheckFeatHuynhDe", {ID_NV_TK,1}},		
	},
	tbActition = 
	{
		{"ThisActivity:GiveFeatHuynhDe", {ID_NV_TK,1}},
	},
}
tbConfig[7] =
{
	nId = 7,
	szMessageType = "ClickNpc",
	szName = "V« Danh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"V« Danh"},
	tbCondition =
	{
		{"ThisActivity:CheckLevel_ShowDlg", {2} },
	},
	tbActition =
	{
		{"AddDialogOpt",	{"NhËn Huynh §Ö T­¬ng Phïng lÖnh bµi",3} },
	},
}

--su dung item hoan thanh nhiem vu
tbConfig[8] =
{
	nId = 8,
	szMessageType = "ItemScript",
	szName = "Sö dông Tèng Kim - Hoµn Thµnh LÖnh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_HOANTHANH_TK_LB},
	tbCondition = 
	{
		{"PlayerFunLib:VnCheckInCity", {"default"}},
		{"ThisActivity:ResetTaskDaily_LenhBai",	{nil}},
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{TSK_DAILY_LIMIT_TK,4,"Mçi ng­êi ch¬i chØ sö dông 4 lÇn duy nhÊt trong ngµy","<"} },
		{"ThisActivity:CheckFeatHuynhDe", {ID_NV_TK,0}},
	},
	tbActition = 
	{
		{"ThisActivity:GiveFeatHuynhDe", {ID_NV_TK,1}},
		{"tbVNG_BitTask_Lib:addTask", {TSK_DAILY_LIMIT_TK, 1}},
		{"Msg2Player", {"Hoµn thµnh 1 nhiÖm vô Tèng Kim cña Huynh §Ö LÖnh Bµi"}}, 
		{"tbLog:PlayerActionLog", {EVENT_LOG_TITLE,"Use_ITEM_HOANTHANH_TK_LB"}},
	},
}
tbConfig[9] =
{
	nId = 9,
	szMessageType = "ItemScript",
	szName = "Sö dông §¸nh Qu¸i Hoµn Thµnh LÖnh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_HOANTHANH_KILL_NPC_LB},
	tbCondition = 
	{
		{"PlayerFunLib:VnCheckInCity", {"default"}},
		{"ThisActivity:ResetTaskDaily_LenhBai",	{nil}},
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{TSK_DAILY_LIMIT_KILL_NPC,4,"Mçi ng­êi ch¬i chØ sö dông 4 lÇn duy nhÊt trong ngµy","<"} },
		{"ThisActivity:CheckFeatHuynhDe_KilNpc", {0}},
	},
	tbActition = 
	{
		{"ThisActivity:GiveFeatHuynhDe_KillNpc", {NUM_ADD_KILL}},
		{"tbVNG_BitTask_Lib:addTask", {TSK_DAILY_LIMIT_KILL_NPC, 1}},
		{"Msg2Player", {"Sö dông §¸nh qu¸i hoµn thµnh lÖnh thµnh c«ng, h·y kiÓm tra nhiÖm vô."}}, 		
	},
}
--su dung item nhan bi kip 90 mon phai
tbConfig[10] =
{
	nId = 10,
	szMessageType = "ItemScript",
	szName = "Sö dông BÝ KÝp ThËp §¹i Ph¸i 90",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_BK90_THAP_DAI_PHAI},
	tbCondition = 
	{
		{"PlayerFunLib:VnCheckInCity", {"default"}},
		{"PlayerFunLib:CheckFreeBagCell",{5,"Ph¶i cã Ýt nhÊt 5 « trèng míi cã thÓ nhËn th­ëng."} },
		{"ThisActivity:HDTP_Check_Facion",	{}},
		{"ThisActivity:HDTP_BK_90_Dialog",	{}},
	},
	tbActition = 
	{	
	},
}
tbConfig[11] = --Tèng kim 1000 ®iÓm
{
	nId = 11,
	szMessageType = "FinishSongJin",
	szName = "when FinishSongJin",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-1, "1,2", 1000, -1},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",{1,""} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{szName="B¶o R­¬ng Tèng Kim", tbProp={6,1,30547,1,0,0},nExpiredTime=7*24*60},10,"LOG_FEATURE_CTC","HoanThanhTK 1000"} },	
	},
}
tbConfig[12] = --Tèng kim 2000 ®iÓm
{
	nId = 12,
	szMessageType = "FinishSongJin",
	szName = "when FinishSongJin",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-1, "1,2", 2000, -1},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",{1,""} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{szName="B¶o R­¬ng Tèng Kim", tbProp={6,1,30547,1,0,0},nExpiredTime=7*24*60},10,"LOG_FEATURE_CTC","HoanThanhTK 2000"} },	
	},
}
tbConfig[13] = --Tèng kim 500 ®iÓm
{
	nId = 13,
	szMessageType = "FinishSongJin",
	szName = "when FinishSongJin",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-1, "1,2", 3000, -1},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",{1,""} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{szName="B¶o R­¬ng Tèng Kim", tbProp={6,1,30547,1,0,0},nExpiredTime=7*24*60},10,"LOG_FEATURE_CTC","HoanThanhTK 3000"} },	
	},
}
