Include("\\script\\activitysys\\config\\1029\\variables.lua")
tbConfig = {}
tbConfig[1] =
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
		{"ThisActivity:ServerStart",	{} },
	},
}

tbConfig[2] = 
{
	nId = 2,
	szMessageType = "ClickNpc",
	szName = "",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Th»ng Cuéi "},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"SetDialogTitle",	{"<npc>Trung Thu, ng­êi nguyÖt ®oµn viªn. TÕt Trung Thu l¹i ®Õn, ta chóc c¸c vÞ hiÖp sÜ hîp gia hoan tô l¹c ®oµn viªn! Trong thêi gian diÔn ra ho¹t ®éng, c¸c vÞ ®¹i hiÖp cã thÓ tham gia hai ho¹t ®éng Th­ëng NguyÖt §oµn Viªn vµ Thá Tiªn KÕt Duyªn."}},
		{"AddDialogOpt",	{"Giíi thiÖu ho¹t ®éng",	3} },
		{"AddDialogOpt",	{"Ta muèn ghÐp b¸nh Trung Thu  ®Ëu xanh",	10} },
		{"AddDialogOpt",	{"Ta muèn th¨ng cÊp b¸nh Trung Thu h¹t sen",	11} },
		{"AddDialogOpt",	{"Ta muèn th¨ng cÊp b¸nh Trung Thu gµ n­íng ",	12} },
		{"AddDialogOpt",	{"Ta muèn mua ®Ëu xanh ",	6} },
	},
}

tbConfig[3] = 
{
	nId = 3,
	szMessageType = "CreateDialog",
	szName = "",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc> Ho¹t ®éng lÇn nµy cã Th­ëng NguyÖt §oµn Viªn vµ Thá Tiªn KÕt Duyªn, hiÖp sÜ muèn tham gia ho¹t ®éng nµo?"},
	tbCondition = 
	{
	},
	tbActition = {
		{"AddDialogOpt",	{"Th­ëng NguyÖt §oµn Viªn ",	4} },
		{"AddDialogOpt",	{"Thá Tiªn KÕt Duyªn ",	5} },
	},
}

tbConfig[4] = 
{
	nId = 4,
	szMessageType = "CreateDialog",
	szName = "",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc> Trong thêi gian diÔn ra ho¹t ®éng, hiÖp sÜ ®Õn b¶n ®å cÊp 5x ®¸nh qu¸i sÏ cã mét l­îng bét mú, ®­êng tr¨ng vµ trøng r¬i ra, NPC Th»ng Cuéi b¸n ®Ëu xanh, sö dông 5 tói ®­êng tr¾ng, 5 tói bét mú, 5 qu¶ trøng vµ 1 tói ®Ëu xanh, cã thÓ ®Õn chç NPC Th»ng Cuéi ghÐp b¸nh Trung Thu ®Ëu xanh, sö dông b¸nh Trung Thu ®Ëu xanh cã thÓ nhËn th­ëng. Cã thÓ ë chç NPC Th»ng Cuéi sö dông 3 b¸nh Trung Thu ®Ëu xanh ®Ó th¨ng cÊp thµnh b¸nh Trung Thu h¹t sen, sö dông 3 b¸nh Trung Thu h¹t sen th¨ng cÊp thµnh b¸nh Trung Thu gµ n­íng, sö dông b¸nh Trung Thu h¹t sen cã thÓ nhËn ®­îc phÇn th­ëng hÊp dÉn, sö dông b¸nh Trung Thu gµ n­íng cã thÓ nhËn ®­îc phÇn th­ëng cã gi¸ trÞ. Th¨ng cÊp cã x¸c suÊt thÊt b¹i, c¸c hiÖp sÜ ph¶i cÈn thËn. "},
	tbCondition = 
	{
	},
	tbActition =
	{
	},
}

tbConfig[5] = 
{
	nId = 5,
	szMessageType = "CreateDialog",
	szName = "",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc> TÕt Trung Thu, Thá Ngäc kh«ng chÞu næi c« ®¬n ®Õn nh©n gian h­ëng l¹c cïng mäi ng­êi. Mçi ngµy tõ 12:00 ®Õn 24:00, Vâ L©m kh¾p n¬i ®Òu cã kh¶ n¨ng xuÊt hiÖn Thá Ngäc, cã thÓ ë trªn ®­êng L©m An, còng cã thÓ ë bªn cæ ®¹o hoang v¾ng ngoµi rõng, hoÆc còng thÕ lµ mét n¬i nµo ®ã ë mét trÊn nhá...NÕu hiÖp sÜ cã duyªn trªn ®­êng gÆp ®­îc Thá Ngäc Tiªn Tö, cã thÓ nãi chuyÖn, chØ cÇn tr¶ lêi chÝnh x¸c mét c©u hái nhá, sÏ nhËn ®­îc quµ cña Thá Ngäc Tiªn Tö hoÆc 1 giê hiÖu qu¶ TuyÕt Thá DÞch Viªn. Tr¶ lêi chÝnh x¸c c©u hái xong, Thá Ngäc Tiªn Tö lËp tøc biÕn mÊt, kh«ng l©u sau c« Êy sÏ xuÊt hiÖn ë mét n¬i kh¸c, tiÕp tôc ®îi ng­êi cã duyªn. "},
	tbCondition = 
	{
	},
	tbActition = {
	},
}

tbConfig[6] = --Ò»¸öÏ¸½Ú
{
	nId = 6,
	szMessageType = "CreateCompose",
	szName = "",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Mua ®Ëu xanh ",1,1,1,0.004,0,250},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{pActivity.MIN_LEVEL,"default",">="} },
		{"AddOneMaterial",	{"Ng©n l­îng",		{nJxb=5000},	1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{pActivity.ITEM.LvDou, 1, pActivity.EVENT_LOG_TITLE, "Goumailvdou"} },
	},
}

tbConfig[7] = --Ò»¸öÏ¸½Ú
{
	nId = 7,
	szMessageType = "NpcOnDeath",
	szName = "",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{pActivity.MIN_LEVEL,"",">="} },
		{"NpcFunLib:CheckNormalMonster",	{"70"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1, ""}},
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{pActivity.AWARD["7xMap"], 1, pActivity.EVENT_LOG_TITLE, "DropItemIn7xMap"} },
	},
}

tbConfig[8] = --Ò»¸öÏ¸½Ú
{
	nId = 8,
	szMessageType = "NpcOnDeath",
	szName = "",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{pActivity.MIN_LEVEL,"",">="} },
		{"NpcFunLib:CheckNormalMonster",	{"80"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1, ""}},
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{pActivity.AWARD["8xMap"], 1, pActivity.EVENT_LOG_TITLE, "DropItemIn8xMap"} },
	},
}

tbConfig[9] = --Ò»¸öÏ¸½Ú
{
	nId = 9,
	szMessageType = "NpcOnDeath",
	szName = "",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{pActivity.MIN_LEVEL,"",">="} },
		{"NpcFunLib:CheckNormalMonster",	{"90"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1, ""}},
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{pActivity.AWARD["9xMap"], 1, pActivity.EVENT_LOG_TITLE, "DropItemIn9xMap"} },
	},
}

tbConfig[10] = --Ò»¸öÏ¸½Ú
{
	nId = 10,
	szMessageType = "CreateCompose",
	szName = "",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {pActivity.ITEM.LvDouMoonCake.szName,1,1,1,0.004,0,250},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{pActivity.MIN_LEVEL,"default",">="} },
		{"AddOneMaterial",	{pActivity.ITEM.Tang.szName,	{tbProp = pActivity.ITEM.Tang.tbProp},	5} },
		{"AddOneMaterial",	{pActivity.ITEM.Fen.szName,		{tbProp = pActivity.ITEM.Fen.tbProp},	5} },
		{"AddOneMaterial",	{pActivity.ITEM.Egg.szName,		{tbProp = pActivity.ITEM.Egg.tbProp},	5} },
		{"AddOneMaterial",	{pActivity.ITEM.LvDou.szName,	{tbProp = pActivity.ITEM.LvDou.tbProp},	1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{pActivity.AWARD["CompseLvDouMoonCake"], 1, pActivity.EVENT_LOG_TITLE, "Hechenglvdouyuebing"} },
	},
}

tbConfig[11] = --Ò»¸öÏ¸½Ú
{
	nId = 11,
	szMessageType = "CreateCompose",
	szName = "",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {pActivity.ITEM.LianZiMoonCake.szName,1,1,1,0.004,0,250},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{pActivity.MIN_LEVEL,"default",">="} },
		{"AddOneMaterial",	{pActivity.ITEM.LvDouMoonCake.szName,	{tbProp = pActivity.ITEM.LvDouMoonCake.tbProp},	3} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{pActivity.AWARD["CompseLianZiMoonCake"], 1, pActivity.EVENT_LOG_TITLE, "Shengjilianziyuebing"} },
	},
}

tbConfig[12] = --Ò»¸öÏ¸½Ú
{
	nId = 12,
	szMessageType = "CreateCompose",
	szName = "",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {pActivity.ITEM.JiRouMoonCake.szName,1,1,1,0.004,0,250},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{pActivity.MIN_LEVEL,"default",">="} },
		{"AddOneMaterial",	{pActivity.ITEM.LianZiMoonCake.szName,	{tbProp = pActivity.ITEM.LianZiMoonCake.tbProp},	3} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{pActivity.AWARD["CompseJiRouMoonCake"], 1, pActivity.EVENT_LOG_TITLE, "Shengjikaojiyuebing"} },
	},
}

tbConfig[13] = --Ò»¸öÏ¸½Ú
{
	nId = 13,
	szMessageType = "ItemScript",
	szName = "LvDouMoonCake",
	nStartDate = pActivity.nStartDate,
	nEndDate  = pActivity.nEndDate,
	tbMessageParam = {pActivity.ITEM.LvDouMoonCake},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{pActivity.MIN_LEVEL, "default", ">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{2,"default"} },
		{"ThisActivity:CheckTask",	{pActivity.TASK.LvDouMoonCake, pActivity.MaxLvDouMoonCake, "§· ®¹t ®Õn giíi h¹n, kh«ng thÓ sö dông tiÕp","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{pActivity.TASK.LvDouMoonCake, 1} },
		{"PlayerFunLib:GetItem",	{pActivity.AWARD["UseLvDouMoonCake"], 1, pActivity.EVENT_LOG_TITLE, "Lingqvlvdouyuebingjiangli"} },
	},
}

tbConfig[14] = --Ò»¸öÏ¸½Ú
{
	nId = 14,
	szMessageType = "ItemScript",
	szName = "LianZiMoonCake",
	nStartDate = pActivity.nStartDate,
	nEndDate  = pActivity.nEndDate,
	tbMessageParam = {pActivity.ITEM.LianZiMoonCake},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{pActivity.MIN_LEVEL, "default", ">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{2,"default"} },
		{"ThisActivity:CheckTask",	{pActivity.TASK.LianZiMoonCake, pActivity.MaxLianZiMoonCake, "§· ®¹t ®Õn giíi h¹n, kh«ng thÓ sö dông tiÕp","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{pActivity.TASK.LianZiMoonCake, 1} },
		{"PlayerFunLib:GetItem",	{pActivity.AWARD["UseLianZiMoonCake"], 1, pActivity.EVENT_LOG_TITLE, "Lingqvlianziyuebingjiangli"} },
	},
}

tbConfig[15] = --Ò»¸öÏ¸½Ú
{
	nId = 15,
	szMessageType = "ItemScript",
	szName = "JiRouMoonCake",
	nStartDate = pActivity.nStartDate,
	nEndDate  = pActivity.nEndDate,
	tbMessageParam = {pActivity.ITEM.JiRouMoonCake},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{pActivity.MIN_LEVEL, "default",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{2,"default"} },
		{"ThisActivity:CheckTask",	{pActivity.TASK.JiRouMoonCake, pActivity.MaxJiRouMoonCake, "§· ®¹t ®Õn giíi h¹n, kh«ng thÓ sö dông tiÕp","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{pActivity.TASK.JiRouMoonCake, 1} },
		{"PlayerFunLib:GetItem",	{pActivity.AWARD["UseJiRouMoonCake"], 1, pActivity.EVENT_LOG_TITLE, "Lingqvkaojiyuebingjiangli"} },
	},
}
tbConfig[16] = --Ò»¸öÏ¸½Ú
{
	nId = 16,
	szMessageType = "NpcOnDeath",
	szName = "",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{pActivity.MIN_LEVEL,"",">="} },
		{"NpcFunLib:CheckNormalMonster",	{"50"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1, ""}},
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{pActivity.AWARD["5xMap"], 1, pActivity.EVENT_LOG_TITLE, "DropItemIn5xMap"} },
	},
}

tbConfig[17] = --Ò»¸öÏ¸½Ú
{
	nId = 17,
	szMessageType = "NpcOnDeath",
	szName = "",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{pActivity.MIN_LEVEL,"",">="} },
		{"NpcFunLib:CheckNormalMonster",	{"60"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1, ""}},
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{pActivity.AWARD["6xMap"], 1, pActivity.EVENT_LOG_TITLE, "DropItemIn6xMap"} },
	},
}