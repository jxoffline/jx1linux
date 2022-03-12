tbConfig = {}
tbConfig[1] = --Ò»¸öÏ¸½Ú
{
	nId = 1,
	szMessageType = "ItemScript",
	szName = "Sö dông thÇn bÝ b¶o r­¬ng cña d· tÈu",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2374,1,-1,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckItemInBag",	{{tbProp={6,1,2348,1,-1,0},},6,"CÇn %d HuyÒn Thiªn Chïy, c¸c h¹ ®em kh«ng ®ñ sè l­îng!"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetAward",	{71,1,"B¶o r­¬ng thÇn bÝ cña D· TÈu"} },
		{"PlayerFunLib:ConsumeEquiproomItem",	{{tbProp={6,1,2348,1,-1,0},},6} },
		{"ThisActivity:Jiluxiaohao_yesou",	{nil} },
	},
}
tbConfig[2] = --Ò»¸öÏ¸½Ú
{
	nId = 2,
	szMessageType = "ItemScript",
	szName = "Sö dông lÔ bao c«ng thµnh chiÕn",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2377,1,-1,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetAward",	{72,1,"C«ng Thµnh ChiÕn LÔ Bao"} },
		{"ThisActivity:Jiluxiaohao_chengzhan",	{nil} },
	},
}
tbConfig[3] = --Ò»¸öÏ¸½Ú
{
	nId = 3,
	szMessageType = "ItemScript",
	szName = "Sö dông chÝ t«n mËt b¶o",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2375,-1,-1,-1},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"PlayerFunLib:CheckItemInBag",	{{tbProp={6,1,2348,1,-1,0},},12,"CÇn %d HuyÒn Thiªn Chïy, c¸c h¹ ®em kh«ng ®ñ sè l­îng!"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetAward",	{73,1,"ChÝ T«n BÝ B¶o"} },
		{"PlayerFunLib:ConsumeEquiproomItem",	{{tbProp={6,1,2348,1,-1,0},},12} },
		{"ThisActivity:Jiluxiaohao_zhizun",	{nil} },
	},
}
tbConfig[4] = --Ò»¸öÏ¸½Ú
{
	nId = 4,
	szMessageType = "ItemScript",
	szName = "Ê¹ÓÃË®ÔôµÄ²Æ±¦(¾É)",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2376,1,-1,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetAward",	{74,1,"Tµi B¶o Thñy TÆc"} },
	},
}
tbConfig[5] = --Ò»¸öÏ¸½Ú
{
	nId = 5,
	szMessageType = "ItemScript",
	szName = "Sö dông phong háa cÈm nang",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2373,1,-1,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetAward",	{75,1,"Phong Háa CÈm Nang"} },
	},
}
tbConfig[6] = --Ò»¸öÏ¸½Ú
{
	nId = 6,
	szMessageType = "NpcOnDeath",
	szName = "§éc c« thiªn phong chÕt",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckName",	{"§éc C« Thiªn Phong"} },
	},
	tbActition = 
	{
	},
}
tbConfig[7] = --Ò»¸öÏ¸½Ú
{
	nId = 7,
	szMessageType = "NpcOnDeath",
	szName = "BOSS chÕt",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckWorldBoss",	{nil} },
	},
	tbActition = 
	{
	},
}
tbConfig[8] = --Ò»¸öÏ¸½Ú
{
	nId = 8,
	szMessageType = "nil",
	szName = "Ë®ÔôÍ·ÁìËÀÍö(·Ï)",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[9] = --Ò»¸öÏ¸½Ú
{
	nId = 9,
	szMessageType = "NpcOnDeath",
	szName = "Ë®Ôô´óÍ·ÁìËÀÍö´¬1",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckId",	{"1692"} },
		{"NpcFunLib:CheckInMap",	{337} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{{tbProp={6,1,2743,1,0,0},},9,"100"} },
		{"ThisActivity:VnFFBigBossDrop",	{nil}}
	},
}
tbConfig[10] = --Ò»¸öÏ¸½Ú
{
	nId = 10,
	szMessageType = "NpcOnDeath",
	szName = "Ë®Ôô´óÍ·ÁìËÀÍö´¬23",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckId",	{"1692"} },
		{"NpcFunLib:CheckInMap",	{"338,339"} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{{tbProp={6,1,2743,1,0,0},},3,"100"} },
		{"ThisActivity:VnFFBigBossDrop",	{nil},}
	},
}
tbConfig[11] = --Ò»¸öÏ¸½Ú
{
	nId = 11,
	szMessageType = "nil",
	szName = "null",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[12] = --Ò»¸öÏ¸½Ú
{
	nId = 12,
	szMessageType = "ItemScript",
	szName = "Ê¹ÓÃË®Ôô±¦Ïä",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2743,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:VnUsePirateBox",	{nil}}
	},
	tbActition = 
	{
	},
}
