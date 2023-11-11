Include("\\script\\activitysys\\config\\25\\variables.lua")
tbConfig = {}
tbConfig[1] = --Ò»¸öÏ¸½Ú
{
	nId = 1,
	szMessageType = "nil",
	szName = "nil",
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
tbConfig[2] = --Ò»¸öÏ¸½Ú
{
	nId = 2,
	szMessageType = "ClickNpc",
	szName = "Click vµo Nguyªn §¶n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Nguyªn §¶n"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Giíi thiÖu ho¹t ®éng ®Ëp trøng vui vÎ",3} },
		{"AddDialogOpt",	{"Dïng Chïy Vµng Nguyªn §¶n ®Ëp trøng",21} },
		{"AddDialogOpt",	{"Dïng Chïy B¹c Nguyªn §¶n ®Ëp trøng",22} },
		{"AddDialogOpt",	{"Dïng Chïy §ång Nguyªn §¶n ®Ëp trøng",23} },
		{"AddDialogOpt",	{"NhËn phÇn th­ëng sö dông Chïy B¹c vµ Chïy Vµng Nguyªn §¶n ®¹t ®Õn 200 lÇn",7} },
		{"SetDialogTitle",	{"<lua random(1,100) < 100 and [[ ®au ]] or [[ ®¹i hiÖp xin ®õng …]]/>"} },
	},
}
tbConfig[3] = --Ò»¸öÏ¸½Ú
{
	nId = 3,
	szMessageType = "CreateDialog",
	szName = "Giíi thiÖu ho¹t ®éng ®Ëp trøng vui vÎ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tõ 0h ngµy 21 th¸ng 12 n¨m 2010 ®Õn 24h ngµy 10 th¸ng 1 n¨m 2011,®¹i hiÖp ng­¬i cã thÓ cÇm Chïy §ång Nguyªn §¶n, Chïy B¹c Nguyªn §¶n, Chïy Vµng Nguyªn §¶n ®Õn chç cña 'Nguyªn §¶n' ®Ó ®Ëp trøng, ng­¬i sÏ nhËn ®­îc niÒm vui bÊt ngê, ®¹i hiÖp nÕu ng­¬i muèn dïng Chïy B¹c Nguyªn §¶n, Chïy §ång Nguyªn §¶n ®Ó ®Ëp trøng, ngoµi viÖc ng­¬i cÇn cã chïy t­¬ng øng ra, cßn cÇn ph¶i tháa m·n 2 ®iÒu kiÖn d­íi ®©y<enter>1, cÇn ph¶i tæ ®éi víi 3 ng­êi, tæ ®éi 3 ng­êi cÇn ph¶i ®eo MÆt N¹ DÞ Dung nhËn ë LÔ Quan t¹i BiÖn Kinh, T­¬ng D­¬ng hoÆc L©m An<enter>2, tæ ®éi 3 ng­êi cÇn ph¶i ®eo MÆt N¹ DÞ Dung cã mµu s¾c gièng nhau, h×nh d¸ng bªn ngoµi th× kh«ng gièng nhau <enter> dïng Chïy Vµng Nguyªn §¶n th× kh«ng cÇn ®iÒu kiÖn g× c¶, trong ®ã Chïy §ång Nguyªn §¶n ng­¬i cã thÓ nhËn ë LÔ Quan, Chïy B¹c Nguyªn §¶n ®¹i hiÖp cã thÓ tham gia c¸c hÖ thèng trß ch¬i trong game th× nhËn ®­îc, Chïy Vµng Nguyªn §¶n b¹n cã thÓ lÊy nã ë Kú Tr©n C¸c."},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[4] = --Ò»¸öÏ¸½Ú
{
	nId = 4,
	szMessageType = "nil",
	szName = "Dïng Chïy Vµng Nguyªn §¶n ®Ëp trøng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{80,"default",">="} },
		{"ThisActivity:CheckTask",	{TaskVarIdx_UseSilverHammerTime,200,"Chïy B¹c vµ Chïy Vµng Nguyªn §¶n sö dông trong ho¹t ®éng lÇn nµy nhiÒu nhÊt 200 lÇn","<"} },
		{"PlayerFunLib:CheckItemInBag",	{{tbProp={6,1,2608,1,0,0},},1,format("Kh«ng cã <color=yellow>%s<color> kh«ng thÓ ®Ëp trøng","Chïy Vµng Nguyªn §¶n")} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ItemGoldAward,1,format("PhÇn th­ëng sö dông %s ®Ëp trøng","Chïy Vµng Nguyªn §¶n")} },
		{"ThisActivity:GetGoldExp",	{GoldExpAward,1,format("PhÇn th­ëng sö dông %s ®Ëp trøng","Chïy Vµng Nguyªn §¶n"),TaskVarIdx_GetGoldExpSum,GoldExpLimit} },
		{"PlayerFunLib:ConsumeEquiproomItem",	{{tbProp={6,1,2608,1,0,0},},1} },
		{"ThisActivity:AddTask",	{TaskVarIdx_UseSilverHammerTime,1} },
	},
}
tbConfig[5] = --Ò»¸öÏ¸½Ú
{
	nId = 5,
	szMessageType = "nil",
	szName = "Dïng Chïy B¹c Nguyªn §¶n ®Ëp trøng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{80,"default",">="} },
		{"ThisActivity:CheckTask",	{TaskVarIdx_UseSilverHammerTime,200,"Chïy B¹c vµ Chïy Vµng Nguyªn §¶n sö dông trong ho¹t ®éng lÇn nµy nhiÒu nhÊt 200 lÇn","<"} },
		{"ThisActivity:CheckCondition",	{nil} },
		{"PlayerFunLib:CheckItemInBag",	{{tbProp={6,1,2607,1,0,0},},1,format("Kh«ng cã <color=yellow>%s<color> kh«ng thÓ ®Ëp trøng","Chïy B¹c Nguyªn §¶n")} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ItemSilverAward,1,format("PhÇn th­ëng sö dông %s ®Ëp trøng","Chïy B¹c Nguyªn §¶n")} },
		{"PlayerFunLib:AddExp",	{SilverExpAward,1,format("PhÇn th­ëng sö dông %s ®Ëp trøng","Chïy B¹c Nguyªn §¶n")} },
		{"PlayerFunLib:ConsumeEquiproomItem",	{{tbProp={6,1,2607,1,0,0},},1} },
		{"ThisActivity:AddTask",	{TaskVarIdx_UseSilverHammerTime,1} },
	},
}
tbConfig[6] = --Ò»¸öÏ¸½Ú
{
	nId = 6,
	szMessageType = "nil",
	szName = "Dïng Chïy §ång Nguyªn §¶n ®Ëp trøng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{80,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TaskVarIdx_UseBronzeHammerTime,5,"Chïy §ång Nguyªn §¶n mçi ngµy chØ sö dông nhiÒu nhÊt 5 lÇn","<"} },
		{"ThisActivity:CheckCondition",	{nil} },
		{"PlayerFunLib:CheckItemInBag",	{{tbProp={6,1,2606,1,0,0},},1,format("Kh«ng cã <color=yellow>%s<color> kh«ng thÓ ®Ëp trøng","Chïy §ång Nguyªn §¶n")} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ItemBronzeAward,1,format("PhÇn th­ëng sö dông %s ®Ëp trøng","Chïy §ång Nguyªn §¶n")} },
		{"PlayerFunLib:AddExp",	{BronzeExpAward,1,format("PhÇn th­ëng sö dông %s ®Ëp trøng","Chïy §ång Nguyªn §¶n")} },
		{"PlayerFunLib:ConsumeEquiproomItem",	{{tbProp={6,1,2606,1,0,0},},1} },
		{"ThisActivity:AddTaskDaily",	{TaskVarIdx_UseBronzeHammerTime,1} },
	},
}
tbConfig[7] = --Ò»¸öÏ¸½Ú
{
	nId = 7,
	szMessageType = "nil",
	szName = "NhËn phÇn th­ëng sö dông Chïy B¹c vµ Chïy Vµng Nguyªn §¶n ®¹t ®Õn 200 lÇn",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{80,"default",">="} },
		{"ThisActivity:CheckTask",	{TaskVarIdx_UseSilverHammerTime,200,"§¹i hiÖp ng­¬i ch­a sö dông ®ñ 200 lÇn Chïy B¹c vµ Chïy Vµng Nguyªn §¶n, TiÕp tôc cè g¾ng nhÐ!",">="} },
		{"ThisActivity:CheckTask",	{TaskVarIdx_IsGet300Award,0,"B¹n ®·  lÜnh th­ëng råi","=="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{Get300Award,1,"NhËn phÇn th­ëng sö dông Chïy B¹c Nguyªn §¶n ®¹t ®Õn 200 lÇn"} },
		{"ThisActivity:AddTask",	{TaskVarIdx_IsGet300Award,1} },
	},
}
tbConfig[8] = --Ò»¸öÏ¸½Ú
{
	nId = 8,
	szMessageType = "Chuanguan",
	szName = format("PhÇn th­ëng v­ît ¶i ®¹t ®Õn %d ¶i",17),
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2607,1,0,0},nExpiredTime=20110121,},1,format("PhÇn th­ëng v­ît ¶i ®¹t ®Õn %d ¶i",17)} },
	},
}
tbConfig[9] = --Ò»¸öÏ¸½Ú
{
	nId = 9,
	szMessageType = "FinishSongJin",
	szName = format("PhÇn th­ëng ®iÓm tÝch lòy Tèng Kim cao cÊp ®¹t ®Õn %d",3000),
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{"751",3000,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2607,1,0,0},nExpiredTime=20110121,},1,format("PhÇn th­ëng ®iÓm tÝch lòy Tèng Kim cao cÊp ®¹t ®Õn %d",3000)} },
	},
}
tbConfig[10] = --Ò»¸öÏ¸½Ú
{
	nId = 10,
	szMessageType = "ClickNpc",
	szName = "BÊm vµo thÝ luyÖn ®­êng tr­ëng l·o",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr­ëng l·o ThÝ LuyÖn §­êng"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Ho¹t ®éng §Ëp Trøng vui vÎ",25} },
	},
}
tbConfig[11] = --Ò»¸öÏ¸½Ú
{
	nId = 11,
	szMessageType = "NpcOnDeath",
	szName = "Phong L¨ng ®é",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckBoatBoss",	{nil} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{{tbProp={6,1,2607,1,0,0},nExpiredTime=20110121,},10,"100"} },
	},
}
tbConfig[12] = --Ò»¸öÏ¸½Ú
{
	nId = 12,
	szMessageType = "NpcOnDeath",
	szName = "NhiÖm vô S¸t thñ ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckKillerdBoss",	{90} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2607,1,0,0},nExpiredTime=20110121,},2,format("%s phÇn th­ëng","NhiÖm vô S¸t thñ ")} },
	},
}
tbConfig[13] = --Ò»¸öÏ¸½Ú
{
	nId = 13,
	szMessageType = "CaiJiHuiHuangZhiGuo",
	szName = "NhÆt qu¶ huy hoµng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2607,1,0,0},nExpiredTime=20110121,},1,format("%s phÇn th­ëng","NhÆt qu¶ huy hoµng")} },
	},
}
tbConfig[14] = --Ò»¸öÏ¸½Ú
{
	nId = 14,
	szMessageType = "NpcOnDeath",
	szName = "Boss ThÕ Giíi r¬i ra",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckWorldBoss",	{nil} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{{tbProp={6,1,2607,1,0,0},nExpiredTime=20110121,},15,"100"} },
	},
}
tbConfig[15] = --Ò»¸öÏ¸½Ú
{
	nId = 15,
	szMessageType = "nil",
	szName = "NhËn Chïy B¹c Nguyªn §¶n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{80,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TaskVarIdx_ShiLianTangYinChui,0,format("H«m nay ng­¬i ®· nhËn ë chç cña ta %s råi","Chïy B¹c Nguyªn §¶n"),"=="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2607,1,0,0},nExpiredTime=20110121,},2,"NhËn ë ThÝ LuyÖn §­êng"} },
		{"ThisActivity:AddTaskDaily",	{TaskVarIdx_ShiLianTangYinChui,1} },
	},
}
tbConfig[16] = --Ò»¸öÏ¸½Ú
{
	nId = 16,
	szMessageType = "Chuanguan",
	szName = format("PhÇn th­ëng v­ît ¶i ®¹t ®Õn %d ¶i",28),
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2607,1,0,0},nExpiredTime=20110121,},2,format("PhÇn th­ëng v­ît ¶i ®¹t ®Õn %d ¶i",28)} },
	},
}
tbConfig[17] = --Ò»¸öÏ¸½Ú
{
	nId = 17,
	szMessageType = "ClickNpc",
	szName = "BÊm vµo LÔ Quan",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"LÔ Quan"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Ho¹t ®éng §Ëp Trøng vui vÎ",24} },
	},
}
tbConfig[18] = --Ò»¸öÏ¸½Ú
{
	nId = 18,
	szMessageType = "nil",
	szName = "NhËn MÆt N¹ DÞ Dung",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{80,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TaskVarIdx_GetYiRongMianJu,0,format("H«m nay ng­¬i ®· nhËn ë chç cña ta %s råi","MÆt N¹ DÞ Dung Nguyªn §¶n"),"=="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTaskDaily",	{TaskVarIdx_GetYiRongMianJu,1} },
		{"PlayerFunLib:GetItem",	{ItemMianJuAward,1,"NhËn tõ LÔ Quan"} },
	},
}
tbConfig[19] = --Ò»¸öÏ¸½Ú
{
	nId = 19,
	szMessageType = "nil",
	szName = "NhËn Chïy §ång Nguyªn §¶n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{80,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TaskVarIdx_GetTongChui,0,format("H«m nay ng­¬i ®· nhËn ë chç cña ta %s råi","Chïy §ång Nguyªn §¶n"),"=="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTaskDaily",	{TaskVarIdx_GetTongChui,1} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2606,1,0,0},nExpiredTime=20110121,},5,"NhËn tõ LÔ Quan"} },
	},
}
tbConfig[20] = --Ò»¸öÏ¸½Ú
{
	nId = 20,
	szMessageType = "ServerStart",
	szName = "Khëi ®éng sever",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:AddYuanDanDialogNpc",	{nil} },
	},
}
tbConfig[21] = --Ò»¸öÏ¸½Ú
{
	nId = 21,
	szMessageType = "CreateDialog",
	szName = "Ph¶i ch¨ng sö dông Chïy Vµng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {format("Ng­¬i x¸c ®Þnh muèn sö dông <color=yellow>%s<color> kh«ng?","Chïy Vµng Nguyªn §¶n")},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"X¸c nhËn",4} },
	},
}
tbConfig[22] = --Ò»¸öÏ¸½Ú
{
	nId = 22,
	szMessageType = "CreateDialog",
	szName = "Ph¶i ch¨ng sö dông Chïy B¹c",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {format("Ng­¬i x¸c ®Þnh muèn sö dông <color=yellow>%s<color> kh«ng?","Chïy B¹c Nguyªn §¶n")},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"X¸c nhËn",5} },
	},
}
tbConfig[23] = --Ò»¸öÏ¸½Ú
{
	nId = 23,
	szMessageType = "CreateDialog",
	szName = "Ph¶i ch¨ng sö dông Chïy §ång",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {format("Ng­¬i x¸c ®Þnh muèn sö dông <color=yellow>%s<color> kh«ng?","Chïy §ång Nguyªn §¶n")},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"X¸c nhËn",6} },
	},
}
tbConfig[24] = --Ò»¸öÏ¸½Ú
{
	nId = 24,
	szMessageType = "CreateDialog",
	szName = "§èi tho¹i LÔ Quan",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Huan nghªnh tham gia ho¹t ®éng §Ëp Trøng vui vÎ"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"NhËn MÆt N¹ DÞ Dung",18} },
		{"AddDialogOpt",	{"NhËn Chïy §ång Nguyªn §¶n",19} },
	},
}
tbConfig[25] = --Ò»¸öÏ¸½Ú
{
	nId = 25,
	szMessageType = "CreateDialog",
	szName = "§èi tho¹i Tr­ëng L·o ThÝ LuyÖn §­êng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Hoan nghªnh tham gia ho¹t ®éng §Ëp Trøng vui vÎ"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"NhËn Chïy B¹c Nguyªn §¶n",15} },
	},
}
