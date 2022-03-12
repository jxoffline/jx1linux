Include("\\script\\activitysys\\config\\1001\\variables.lua")
tbConfig = {}
tbConfig[1] = --Sè trËn tèng kim 2000 ®iÓm trong tuÇn
{
	nId = 1,
	szMessageType = "FinishSongJin",
	szName = "Tèng kim cao cÊp 2000 ®iÓm",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{2000,">="} },
	},
	tbActition = 
	{
		{"ThisActivity:VngAddWeeklyTask", {nTSK_TONGKIM_WEEKLY_MATCH_COUNT, 1}},
	},
}
tbConfig[2] =
{
	nId = 2,
	szMessageType = "Chuanguan",
	szName = "Hoµn thµnh v­ît ¶i trong tuÇn",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:VngAddWeeklyTask", {nTSK_VUOTAI_WEEKLY_MATCH_COUNT, 1}},		
		--{"PlayerFunLib:GetItem",	{{tbProp={6,1,30162,1,0,0}, nExpiredTime=24*60,},1,"KyNang150", "VuotAi28"} },
	},
}
tbConfig[3] = --Viªm ®Õ
{
	nId = 3,
	szMessageType = "YDBZguoguan",
	szName = "V­ît qua ¶i Viªm §Õ thø 5",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {5},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:VngAddWeeklyTask", {nTSK_VIEMDE_WEEKLY_MATCH_COUNT, 1}},
		--{"PlayerFunLib:GetItem",	{{tbProp={6,1,30163,1,0,0}, nExpiredTime=24*60,},1,"KyNang150", "VuotAiViemDe5"} },
	},
}
tbConfig[4] =		--V­ît ¶i 17
{
	nId = 4,
	szMessageType = "Chuanguan",
	szName = "V­ît qua ¶i 17",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		--{"PlayerFunLib:GetItem",	{{tbProp={6,1,30162,1,0,0}, nExpiredTime=24*60,},1,"KyNang150", "VuotAi17"} },
	},
}
tbConfig[5] = --Viªm ®Õ - v­ît ¶i thø 10
{
	nId = 5,
	szMessageType = "YDBZguoguan",
	szName = "V­ît qua ¶i Viªm §Õ thø 10",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {10},
	tbCondition = 
	{
	},
	tbActition = 
	{
		--{"PlayerFunLib:GetItem",	{{tbProp={6,1,30163,1,0,0}, nExpiredTime=24*60,},1,"KyNang150", "VuotAiViemDe10"} },
	},
}
tbConfig[6] = --Sè trËn tèng kim 3000 ®iÓm trong tuÇn
{
	nId = 6,
	szMessageType = "FinishSongJin",
	szName = "Tèng kim cao cÊp 3000 ®iÓm",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{3000,">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"nomsg"} },
	},
	tbActition = 
	{
		
		--{"PlayerFunLib:GetItem",	{{tbProp={6,1,30228,1,0,0},nBindState=-2},2,"KinhMach", "TongKim3000NhanNguyenLieu"} }, --Nguyªn lÞªu hÖ thèng kinh m¹ch
	},
}
tbConfig[7] = 
{
	nId = 7,
	szMessageType = "FinishFengLingDu",
	szName = "Hoµn thµnh Phong L¨ng §é tÝnh phÝ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:IsPaidBoat", {nil}},
	},
	tbActition = 
	{
	},
}
tbConfig[8] =		--V­ît ¶i 10 nhËn nguyªn liÖu kinh m¹ch
{
	nId = 8,
	szMessageType = "Chuanguan",
	szName = "V­ît qua ¶i 10",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"10"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{1,"nomsg"} },
	},
	tbActition = 
	{
		--{"PlayerFunLib:GetItem",	{{tbProp={6,1,30228,1,0,0},nBindState=-2},4,"KinhMach", "VuotAi10NhanNguyenLieu"} }, --Nguyªn lÞªu hÖ thèng kinh m¹ch
	},
}
tbConfig[9] = --Viªm ®Õ
{
	nId = 9,
	szMessageType = "YDBZguoguan",
	szName = "V­ît qua ¶i Viªm §Õ thø 6",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {6},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{1,"nomsg"} },
	},
	tbActition = 
	{		
		--{"PlayerFunLib:GetItem",	{{tbProp={6,1,30228,1,0,0},nBindState=-2},4,"KinhMach", "VuotAi6ViemDeNhanNguyenLieu"} }, --Nguyªn lÞªu hÖ thèng kinh m¹ch
	},
}
tbConfig[10] = --Hoµn thµnh KiÕm Gia nhËn nguyªn liÖu kinh m¹ch
{
	nId = 10,
	szMessageType = "MazeTaskFinish",
	szName = "maze task",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
--		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"PlayerFunLib:CheckTaskDaily",	{nTSK_MAZE_FINISH_TASK_GET_MERIDAN_DAILY_LIMIT,10,"nomsg","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"nomsg"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddTaskDaily",	{nTSK_MAZE_FINISH_TASK_GET_MERIDAN_DAILY_LIMIT,1} },
		--{"PlayerFunLib:GetItem",	{{tbProp={6,1,30228,1,0,0},nBindState=-2},1,"KinhMach", "KiemGiaMeCungNhanNguyenLieu"} },
	},
}
tbConfig[11] = --Boss Hoµng Kim nhËn nguyªn liÖu kinh m¹ch
{
	nId = 11,
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
		--{"PlayerFunLib:GetItem",	{{tbProp={6,1,30228,1,0,0},nBindState=-2},2,"KinhMach", "BossHKNhanNguyenLieu"} },
	},
}
