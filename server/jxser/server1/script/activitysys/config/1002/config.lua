Include("\\script\\activitysys\\config\\1002\\variables.lua")
tbConfig = {}
tbConfig[1] =
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "Init Npc",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:InitNpc",	{nil} },
	},
}
tbConfig[2] = --TËng kim 2000 Æi”m
{
	nId = 2,
	szMessageType = "FinishSongJin",
	szName = "TËng kim cao c p 2000 Æi”m",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{2000,">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30118,0,0,0},nExpiredTime=nItemExpiredTime,},20,"Event_NgoiSaoTuyet\tTongKim2000"} },
	},
}
tbConfig[3] =
{
	nId = 3,
	szMessageType = "Chuanguan",
	szName = "V≠Ót qua ∂i 17",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30118,0,0,0},nExpiredTime=nItemExpiredTime,},10,"Event_NgoiSaoTuyet\tVuotAi17"} },
	},
}
tbConfig[4] =
{
	nId = 4,
	szMessageType = "Chuanguan",
	szName = "V≠Ót qua ∂i 28",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30118,0,0,0},nExpiredTime=nItemExpiredTime,},10,"Event_NgoiSaoTuyet\tVuotAi28"} },
	},
}
tbConfig[5] = 
{
	nId = 5,
	szMessageType = "FinishFengLingDu",
	szName = "Hoµn thµnh Phong L®ng ßÈ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30118,0,0,0},nExpiredTime=nItemExpiredTime,},20,"Event_NgoiSaoTuyet\tHoanThanhPLD"} },
	},
}
tbConfig[6] = --boss s∏t thÒ
{
	nId = 6,
	szMessageType = "NpcOnDeath",
	szName = "Nhi÷m vÙ s∏t thÒ c p 90",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckKillerdBoss",	{90} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30118,0,0,0},nExpiredTime=nItemExpiredTime,},3,"Event_NgoiSaoTuyet\tTieuDietBossS∏tThÒ"} },
	},
}
tbConfig[7] = --TËng kim 1000 Æi”m
{
	nId = 7,
	szMessageType = "FinishSongJin",
	szName = "TËng kim cao c p 1000 Æi”m",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		--{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{1000,">="} },
		--{"PlayerFunLib:CheckTaskDaily",	{nTSK_DAILY_TK_NHAN_BANG_THACH,4,"","<"} },
	},
	tbActition = 
	{
		--{"PlayerFunLib:AddTaskDaily",	{nTSK_DAILY_TK_NHAN_BANG_THACH,4} },
		--{"PlayerFunLib:GetItem",	{{tbProp={6,1,30119,1,0,0},nExpiredTime=nItemExpiredTime, nBindState = -2},4,"Event_NgoiSaoTuyet\tTongKimNhanBangThach"} },
	},
}
tbConfig[8] = --sˆ dÙng tuy’t b®ng thπch l‘ hÈp
{
	nId = 8,
	szMessageType = "ItemScript",
	szName = "Sˆ dÙng Tuy’t B®ng Thπch L‘ HÈp",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30120,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{2,"default"} },
		{"PlayerFunLib:CheckTaskDaily",	{nTSK_DAILY_SU_DUNG_BANG_THACH_LE_HOP,15,"H´m nay Æ∑ sˆ dÙng 15 Tuy’t B®ng Thπch L‘ HÈp, mai h∑y sˆ dÙng ti’p.","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddTaskDaily",	{nTSK_DAILY_SU_DUNG_BANG_THACH_LE_HOP,1} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30119,1,0,0},nExpiredTime=nItemExpiredTime},10,"Event_NgoiSaoTuyet\tSuDungTuyetBangThachLeHop"} },
		{"ThisActivity:UseFreezingStoneBoxLog", {nil}},
	},
}
----add dﬂng ÆËi thoπi npc
tbConfig[9] = --ßËi thoπi ßπi L∑o S≠
{
	nId = 9,
	szMessageType = "ClickNpc",
	szName = "B m vµo Thi™n Tinh L∑o Nh©n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Thi™n Tinh L∑o Nh©n"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"SetDialogTitle",	{"Xin chµo, c∏c muËn ta th®ng c p Tuy’t B®ng Tinh kh´ng?"} },
		{"AddDialogOpt",	{"Th®ng c p Tuy’t B®ng Tinh c p 1", 11} },
		{"AddDialogOpt",	{"Th®ng c p Tuy’t B®ng Tinh c p 2", 12} },
		{"AddDialogOpt",	{"Th®ng c p Tuy’t B®ng Tinh c p 3", 13} },
		{"AddDialogOpt",	{"Th®ng c p Tuy’t B®ng Tinh c p 4", 14} },
		{"AddDialogOpt",	{"Th®ng c p Tuy’t B®ng Tinh c p 5", 15} },
		{"AddDialogOpt",	{"Th®ng c p Tuy’t B®ng Tinh c p 6", 16} },
		{"AddDialogOpt",	{"Th®ng c p Tuy’t B®ng Tinh c p 7", 17} },
		{"AddDialogOpt",	{"Th®ng c p Tuy’t B®ng Tinh c p 8", 18} },
		{"AddDialogOpt",	{"Th®ng c p Tuy’t B®ng Tinh c p 9", 19} },
		{"AddDialogOpt",	{"Th®ng c p Tuy’t B®ng Tinh c p 10", 20} },
		{"AddDialogOpt",	{"Th®ng c p Tuy’t B®ng Tinh c p 11", 21} },
		{"AddDialogOpt",	{"Th®ng c p Tuy’t B®ng Tinh c p 12", 22} },	
	},
}
tbConfig[10] =
{
	nId = 10,
	szMessageType = "CreateDialog",
	szName = "Th®ng c p Tuy’t B®ng Tinh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Xin h∑y ch‰n Æºng c p"},
	tbCondition = 
	{
	},
	tbActition = 
	{		
--		{"AddDialogOpt",	{"Tuy’t B®ng Tinh c p 1", 11} },
--		{"AddDialogOpt",	{"Tuy’t B®ng Tinh c p 2", 12} },
--		{"AddDialogOpt",	{"Tuy’t B®ng Tinh c p 3", 13} },
--		{"AddDialogOpt",	{"Tuy’t B®ng Tinh c p 4", 14} },
--		{"AddDialogOpt",	{"Tuy’t B®ng Tinh c p 5", 15} },
--		{"AddDialogOpt",	{"Tuy’t B®ng Tinh c p 6", 16} },
--		{"AddDialogOpt",	{"Tuy’t B®ng Tinh c p 7", 17} },
--		{"AddDialogOpt",	{"Tuy’t B®ng Tinh c p 8", 18} },
--		{"AddDialogOpt",	{"Tuy’t B®ng Tinh c p 9", 19} },
--		{"AddDialogOpt",	{"Tuy’t B®ng Tinh c p 10", 20} },
--		{"AddDialogOpt",	{"Tuy’t B®ng Tinh c p 11", 21} },
--		{"AddDialogOpt",	{"Tuy’t B®ng Tinh c p 12", 22} },
	},
}
----Gh–p nguy™n li÷u
tbConfig[11] = --Gh–p sao c p 1
{
	nId = 11,
	szMessageType = "CreateCompose",
	szName = "Gh–p sao c p 1",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Tuy’t B®ng Tinh [C p 1]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Tuy’t B®ng Tinh C p [0]",{tbProp={6,1,30118,0,0,0},nExpiredTime=nItemExpiredTime,},1} },
		{"AddOneMaterial",	{"Tuy’t B®ng Thπch",{tbProp={6,1,30119,1,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:UpgradeStar",	{1} },
	},
}
tbConfig[12] = --Gh–p sao c p 2
{
	nId = 12,
	szMessageType = "CreateCompose",
	szName = "Gh–p sao c p 2",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Tuy’t B®ng Tinh [C p 2]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Tuy’t B®ng Tinh C p [1]",{tbProp={6,1,30118,1,0,0},nExpiredTime=nItemExpiredTime,},1} },
		{"AddOneMaterial",	{"Tuy’t B®ng Thπch",{tbProp={6,1,30119,1,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:UpgradeStar",	{2} },
	},
}
tbConfig[13] = --Gh–p sao c p 3
{
	nId = 13,
	szMessageType = "CreateCompose",
	szName = "Gh–p sao c p 3",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Tuy’t B®ng Tinh [C p 3]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Tuy’t B®ng Tinh C p [2]",{tbProp={6,1,30118,2,0,0},nExpiredTime=nItemExpiredTime,},1} },
		{"AddOneMaterial",	{"Tuy’t B®ng Thπch",{tbProp={6,1,30119,1,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:UpgradeStar",	{3} },
	},
}
tbConfig[14] = --Gh–p sao c p 4
{
	nId = 14,
	szMessageType = "CreateCompose",
	szName = "Gh–p sao c p 4",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Tuy’t B®ng Tinh [C p 4]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Tuy’t B®ng Tinh C p [3]",{tbProp={6,1,30118,3,0,0},nExpiredTime=nItemExpiredTime,},1} },
		{"AddOneMaterial",	{"Tuy’t B®ng Thπch",{tbProp={6,1,30119,1,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:UpgradeStar",	{4} },
	},
}
tbConfig[15] = --Gh–p sao c p 5
{
	nId = 15,
	szMessageType = "CreateCompose",
	szName = "Gh–p sao c p 5",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Tuy’t B®ng Tinh [C p 5]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Tuy’t B®ng Tinh C p [4]",{tbProp={6,1,30118,4,0,0},nExpiredTime=nItemExpiredTime,},1} },
		{"AddOneMaterial",	{"Tuy’t B®ng Thπch",{tbProp={6,1,30119,1,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:UpgradeStar",	{5} },
	},
}
tbConfig[16] = --Gh–p sao c p 6
{
	nId = 16,
	szMessageType = "CreateCompose",
	szName = "Gh–p sao c p 6",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Tuy’t B®ng Tinh [C p 6]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Tuy’t B®ng Tinh C p [5]",{tbProp={6,1,30118,5,0,0},nExpiredTime=nItemExpiredTime,},1} },
		{"AddOneMaterial",	{"Tuy’t B®ng Thπch",{tbProp={6,1,30119,1,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:UpgradeStar",	{6} },
	},
}
tbConfig[17] = --Gh–p sao c p 7
{
	nId = 17,
	szMessageType = "CreateCompose",
	szName = "Gh–p sao c p 7",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Tuy’t B®ng Tinh [C p 7]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Tuy’t B®ng Tinh C p [6]",{tbProp={6,1,30118,6,0,0},nExpiredTime=nItemExpiredTime,},1} },
		{"AddOneMaterial",	{"Tuy’t B®ng Thπch",{tbProp={6,1,30119,1,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:UpgradeStar",	{7} },
	},
}
tbConfig[18] = --Gh–p sao c p 8
{
	nId = 18,
	szMessageType = "CreateCompose",
	szName = "Gh–p sao c p 8",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Tuy’t B®ng Tinh [C p 8]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Tuy’t B®ng Tinh C p [7]",{tbProp={6,1,30118,7,0,0},nExpiredTime=nItemExpiredTime,},1} },
		{"AddOneMaterial",	{"Tuy’t B®ng Thπch",{tbProp={6,1,30119,1,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:UpgradeStar",	{8} },
	},
}
tbConfig[19] = --Gh–p sao c p 9
{
	nId = 19,
	szMessageType = "CreateCompose",
	szName = "Gh–p sao c p 9",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Tuy’t B®ng Tinh [C p 9]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Tuy’t B®ng Tinh C p [8]",{tbProp={6,1,30118,8,0,0},nExpiredTime=nItemExpiredTime,},1} },
		{"AddOneMaterial",	{"Tuy’t B®ng Thπch",{tbProp={6,1,30119,1,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:UpgradeStar",	{9} },
	},
}
tbConfig[20] = --Gh–p sao c p 10
{
	nId = 20,
	szMessageType = "CreateCompose",
	szName = "Gh–p sao c p 10",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Tuy’t B®ng Tinh [C p 10]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Tuy’t B®ng Tinh C p [9]",{tbProp={6,1,30118,9,0,0},nExpiredTime=nItemExpiredTime,},1} },
		{"AddOneMaterial",	{"Tuy’t B®ng Thπch",{tbProp={6,1,30119,1,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:UpgradeStar",	{10} },
	},
}
tbConfig[21] = --Gh–p sao c p 11
{
	nId = 21,
	szMessageType = "CreateCompose",
	szName = "Gh–p sao c p 11",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Tuy’t B®ng Tinh [C p 11]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Tuy’t B®ng Tinh C p [10]",{tbProp={6,1,30118,10,0,0},nExpiredTime=nItemExpiredTime,},1} },
		{"AddOneMaterial",	{"Tuy’t B®ng Thπch",{tbProp={6,1,30119,1,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:UpgradeStar",	{11} },
	},
}
tbConfig[22] = --Gh–p sao c p 12
{
	nId = 22,
	szMessageType = "CreateCompose",
	szName = "Gh–p sao c p 12",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Tuy’t B®ng Tinh [C p 12]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Tuy’t B®ng Tinh C p [11]",{tbProp={6,1,30118,11,0,0},nExpiredTime=nItemExpiredTime,},1} },
		{"AddOneMaterial",	{"Tuy’t B®ng Thπch",{tbProp={6,1,30119,1,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:UpgradeStar",	{12} },
	},
}

tbConfig[23] = --ßËi thoπi Ti”u ßÂng Tˆ
{
	nId = 23,
	szMessageType = "ClickNpc",
	szName = "B m vµo Ti”u ßÂng Tˆ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Ti”u ßÂng Tˆ"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"SetDialogTitle",	{"Xin chµo, Æπi hi÷p c«n g◊?"} },
		{"AddDialogOpt",	{"T∆ng Tuy’t B®ng Tinh [C p 1]",24} },	
		{"AddDialogOpt",	{"T∆ng Tuy’t B®ng Tinh [C p 2]",25} },	
		{"AddDialogOpt",	{"T∆ng Tuy’t B®ng Tinh [C p 3]",26} },	
		{"AddDialogOpt",	{"T∆ng Tuy’t B®ng Tinh [C p 4]",27} },	
		{"AddDialogOpt",	{"T∆ng Tuy’t B®ng Tinh [C p 5]",28} },	
		{"AddDialogOpt",	{"T∆ng Tuy’t B®ng Tinh [C p 6]",29} },	
		{"AddDialogOpt",	{"T∆ng Tuy’t B®ng Tinh [C p 7]",30} },	
		{"AddDialogOpt",	{"T∆ng Tuy’t B®ng Tinh [C p 8]",31} },	
		{"AddDialogOpt",	{"T∆ng Tuy’t B®ng Tinh [C p 9]",32} },	
		{"AddDialogOpt",	{"T∆ng Tuy’t B®ng Tinh [C p 10]",33} },	
		{"AddDialogOpt",	{"T∆ng Tuy’t B®ng Tinh [C p 11]",34} },	
		{"AddDialogOpt",	{"T∆ng Tuy’t B®ng Tinh [C p 12]",35} },	
	},
}
tbConfig[24] = --T∆ng Tuy’t B®ng Tinh c p 1
{
	nId = 24,
	szMessageType = "CreateCompose",
	szName = "T∆ng sao c p 1",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Tuy’t B®ng Tinh [C p 1]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Tuy’t B®ng Tinh C p [1]",{tbProp={6,1,30118,1,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveStar",	{1} },
	},
}
tbConfig[25] = --T∆ng Tuy’t B®ng Tinh c p 2
{
	nId = 25,
	szMessageType = "CreateCompose",
	szName = "T∆ng sao c p 2",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Tuy’t B®ng Tinh [C p 2]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Tuy’t B®ng Tinh C p [2]",{tbProp={6,1,30118,2,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveStar",	{2} },
	},
}
tbConfig[26] = --T∆ng Tuy’t B®ng Tinh c p 3
{
	nId = 26,
	szMessageType = "CreateCompose",
	szName = "T∆ng sao c p 3",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Tuy’t B®ng Tinh [C p 3]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Tuy’t B®ng Tinh C p [3]",{tbProp={6,1,30118,3,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveStar",	{3} },
	},
}
tbConfig[27] = --T∆ng Tuy’t B®ng Tinh c p 4
{
	nId = 27,
	szMessageType = "CreateCompose",
	szName = "T∆ng sao c p 4",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Tuy’t B®ng Tinh [C p 4]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Tuy’t B®ng Tinh C p [4]",{tbProp={6,1,30118,4,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveStar",	{4} },
	},
}
tbConfig[28] = --T∆ng Tuy’t B®ng Tinh c p 5
{
	nId = 28,
	szMessageType = "CreateCompose",
	szName = "T∆ng sao c p 5",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Tuy’t B®ng Tinh [C p 5]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Tuy’t B®ng Tinh C p [5]",{tbProp={6,1,30118,5,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveStar",	{5} },
	},
}
tbConfig[29] = --T∆ng Tuy’t B®ng Tinh c p 6
{
	nId = 29,
	szMessageType = "CreateCompose",
	szName = "T∆ng sao c p 6",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Tuy’t B®ng Tinh [C p 6]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Tuy’t B®ng Tinh C p [6]",{tbProp={6,1,30118,6,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveStar",	{6} },
	},
}
tbConfig[30] = --T∆ng Tuy’t B®ng Tinh c p 7
{
	nId = 30,
	szMessageType = "CreateCompose",
	szName = "T∆ng sao c p 7",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Tuy’t B®ng Tinh [C p 7]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Tuy’t B®ng Tinh C p [7]",{tbProp={6,1,30118,7,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveStar",	{7} },
	},
}
tbConfig[31] = --T∆ng Tuy’t B®ng Tinh c p 8
{
	nId = 31,
	szMessageType = "CreateCompose",
	szName = "T∆ng sao c p 8",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Tuy’t B®ng Tinh [C p 8]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Tuy’t B®ng Tinh C p [8]",{tbProp={6,1,30118,8,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveStar",	{8} },
	},
}
tbConfig[32] = --T∆ng Tuy’t B®ng Tinh c p 9
{
	nId = 32,
	szMessageType = "CreateCompose",
	szName = "T∆ng sao c p 9",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Tuy’t B®ng Tinh [C p 9]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Tuy’t B®ng Tinh C p [9]",{tbProp={6,1,30118,9,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveStar",	{9} },
	},
}
tbConfig[33] = --T∆ng Tuy’t B®ng Tinh c p 10
{
	nId = 33,
	szMessageType = "CreateCompose",
	szName = "T∆ng sao c p 10",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Tuy’t B®ng Tinh [C p 10]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Tuy’t B®ng Tinh C p [10]",{tbProp={6,1,30118,10,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveStar",	{10} },
	},
}
tbConfig[34] = --T∆ng Tuy’t B®ng Tinh c p 11
{
	nId = 34,
	szMessageType = "CreateCompose",
	szName = "T∆ng sao c p 11",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Tuy’t B®ng Tinh [C p 11]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Tuy’t B®ng Tinh C p [11]",{tbProp={6,1,30118,11,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveStar",	{11} },
	},
}
tbConfig[35] = --T∆ng Tuy’t B®ng Tinh c p 12
{
	nId = 35,
	szMessageType = "CreateCompose",
	szName = "T∆ng sao c p 12",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Tuy’t B®ng Tinh [C p 12]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Tuy’t B®ng Tinh C p [12]",{tbProp={6,1,30118,12,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveStar",	{12} },
	},
}
tbConfig[36] = --sˆ dÙng r≠¨ng gÁ
{
	nId = 36,
	szMessageType = "ItemScript",
	szName = "Sˆ dÙng r≠¨ng gÁ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30121,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{2,"default"} },
	},
	tbActition = 
	{
		{"ThisActivity:UseWoodenChest", {nil}},
	},
}