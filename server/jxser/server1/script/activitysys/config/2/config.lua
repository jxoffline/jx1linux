Include("\\script\\activitysys\\config\\2\\variables.lua")
tbConfig = {}
tbConfig[1] = --Ò»¸öÏ¸½Ú
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "CreateBigTree",
	nStartDate = 201212170000,
	nEndDate  = 201301010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"NpcFunLib:AddObjNpc",	{BIG_TREE_NAME,BIG_TREE_ID,BIG_TREE_POS,BIG_TREE_SCRIPT} },
	},
}
tbConfig[2] = --Ò»¸öÏ¸½Ú
{
	nId = 2,
	szMessageType = "ClickNpc",
	szName = "OnClickNpc",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"¤ng Giµ Noel"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"SetDialogTitle", {"<npc>Gi¸ng sinh ®· ®Õn, chóc c¸c ®¹i hiÖp cã mét mïa gi¸ng sinh vui vÎ. <enter>1. Trong thêi gian diÔn ra ho¹t ®éng, mçi ngµy vµo lóc 19:00 - 24:00, c¸c vÞ ®¹i hiÖp cã thÓ ®Õn <color=yellow> Tr­êng B¹ch S¬n <color> thu thËp C©y Gi¸ng Sinh Nhá sÏ nhËn ®­îc phÇn th­ëng. <enter>2. Mçi ngµy vµo lóc 19:00 - 24:00, sÏ cã Tinh Linh Th¸nh §¶n ngÉu nhiªn xuÊt hiÖn t¹i bªn ngoµi c¸c thµnh thÞ nh­ Thµnh §«, §¹i Lý, Ph­îng T­êng, D­¬ng Ch©u. Ng­êi ch¬i cã thÓ ®èi tho¹i víi C©y Gi¸ng Sinh t¹i Tr­êng B¹ch S¬n §Ønh sÏ d­îc biÕt ®¹i kh¸i vÞ trÝ cña Tinh Linh Th¸nh §·n xuÊt hiÖn. Mçi lÇn xuÊt hiÖn, sÏ cã phÇn th­ëng cho 30 ng­êi t×m ®­îc Tinh Linh Th¸nh §¶n nhanh nhÊt. Cø 30 phót Tinh Linh Th¸nh §¶n sÏ xuÊt hiÖn 1 lÇn. <enter>3. TuyÕt Nh©n §¹i ChiÕn. Nh÷ng th«ng tin liªn quan xin h·y nhÊn vµo dßng chän bªn d­íi."}},
		--{"AddDialogOpt", {"Giao nép KÑo Gi¸ng Sinh", 4}},
		--{"AddDialogOpt", {"Giao nép T¸o Gi¸ng Sinh", 5}},
		{"AddDialogOpt", {"TuyÕt Nh©n §¹i ChiÕn", 10}},
	},
}
tbConfig[3] = --Ò»¸öÏ¸½Ú
{
	nId = 3,
	szMessageType = "ServerStart",
	szName = "creatSanta",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:InitAddNpc",	{nil} },
	},
}
tbConfig[4] = --Ò»¸öÏ¸½Ú
{
	nId = 4,
	szMessageType = "nil",
	szName = "hand in Christmas candy",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150, "default", ">="} },
		{"PlayerFunLib:CheckItemInBag", {ITEM_CHRISTMAS_CANDY, 1, "Ng­¬i kh«ng cã KÑo Gi¸ng Sinh"}},
		{"PlayerFunLib:CheckTaskDaily", {TSK_CANDY_LIMIT, MAX_CANDY, "H«m nay ng­¬i ®· giao nép sè l­îng ®¹t ®Õn giíi h¹n.", "<"}},
		{"PlayerFunLib:CheckFreeBagCell", {1, "default"}},
		
	},
	tbActition = 
	{
		--{"PlayerFunLib:ConsumeEquiproomItem", {ITEM_CHRISTMAS_CANDY, 1}},
		--{"PlayerFunLib:AddTaskDaily", {TSK_CANDY_LIMIT, 1,}},
		--{"PlayerFunLib:GetItem", {tbCandyAward, 1, EVENT_LOG_TITLE, "hand_in_Christmas_candy"}},
	},
}
tbConfig[5] = --Ò»¸öÏ¸½Ú
{
	nId = 5,
	szMessageType = "nil",
	szName = "hand in Christmas apple",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150, "default", ">="} },
		{"PlayerFunLib:CheckItemInBag", {ITEM_CHRISTMAS_APPLE, 1, "Ng­¬i kh«ng cã T¸o Gi¸ng Sinh"}},
		{"PlayerFunLib:CheckFreeBagCell", {1, "default"}},
		
	},
	tbActition = 
	{
		--{"PlayerFunLib:ConsumeEquiproomItem", {ITEM_CHRISTMAS_APPLE, 1}},
		--{"PlayerFunLib:GetItem", {tbAppleAward, 1, EVENT_LOG_TITLE, "hand_in_Christmas_apple"}},
	},
}
tbConfig[6] = --Ò»¸öÏ¸½Ú
{
	nId = 6,
	szMessageType = "nil",
	szName = "to snowman",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		--{"PlayerFunLib:CheckTotalLevel",	{150, "default", ">="} },
	},
	tbActition = 
	{
		{"ThisActivity:SB_ChangeToSnowman",	{} },
	},
}
tbConfig[7] = --Ò»¸öÏ¸½Ú
{
	nId = 7,
	szMessageType = "nil",
	szName = "to human",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		--{"PlayerFunLib:CheckTotalLevel",	{150, "default", ">="} },
	},
	tbActition = 
	{
		{"ThisActivity:SB_RestoreToHuwman",	{} },
	},
}
tbConfig[8] = --Ò»¸öÏ¸½Ú
{
	nId = 8,
	szMessageType = "nil",
	szName = "get award",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150, "default", ">="} },
	},
	tbActition = 
	{
		{"ThisActivity:SB_GetAward",	{0} },
	},
}
tbConfig[9] = --Ò»¸öÏ¸½Ú
{
	nId = 9,
	szMessageType = "nil",
	szName = "join battle",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150, "default", ">="} },
	},
	tbActition = 
	{
		{"ThisActivity:SB_AskForEnter",	{} },
	},
}
tbConfig[10] = --Ò»¸öÏ¸½Ú
{
	nId = 10,
	szMessageType = "CreateDialog",
	szName = "nil",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>§¹i hiÖp cã thÓ nhËn TuyÕt CÇu t¹i ®©y, sö dông TuyÕt CÇu sÏ lµm cho nh÷ng ng­êi ch¬i kh¸c biÕn thµnh Ng­êi TuyÕt, ng­êi sö dông sÏ nhËn ®­îc phÇn th­ëng. Mçi ngµy vµo lóc 10:15, 12:15, 20:35, 22:15 cã thÓ ®Õn t¹i ®©y ®Ó tham gia TuyÕt Nh©n §¹i ChiÕn, c¸c ®¹i hiÖp tham gia TuyÕt Nh©n §¹i ChiÕn ®Òu ph¶i bÞ nÐm tróng TuyÕt CÇu tr­íc, khi ng­êi ch¬i tham gia TuyÕt Nh©n §¹i ChiÕn chØ cã thÓ tÊn c«ng nh÷ng Ng­êi TuyÕt vµ ¤ng Giµ Noel cã mµu s¾c kh«ng gièng víi b¶n th©n. Sau khi kÕt thóc, c¸c ®¹i hiÖp cã thÓ ®èi tho¹i víi ta ®Ó nhËn phÇn th­ëng. Mçi vÞ ®¹i hiÖp mçi ngµy nhiÒu nhÊt chØ tham gia ®­îc 2 lÇn.",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt", {"NhËn TuyÕt CÇu", 11}},
		{"AddDialogOpt", {"Tr¹ng th¸i biÕn thµnh Ng­êi TuyÕt", 6}},
		{"AddDialogOpt", {"Kh«i phôc nguyªn tr¹ng", 7}},
		{"AddDialogOpt", {"Tham gia TuyÕt Nh©n §¹i ChiÕn", 9}},
		{"AddDialogOpt", {"NhËn l·nh phÇn th­ëng", 8}},		
	},
}
tbConfig[11] = --Ò»¸öÏ¸½Ú
{
	nId = 11,
	szMessageType = "nil",
	szName = "GetSnowBall",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		--ITEM_SNOW_BALL
		{"PlayerFunLib:CheckTotalLevel",	{150, "default", ">="} },
		{"ThisActivity:CheckTaskDaily", {TSK_GET_SNOW_BALL, 1, "H«m nay ng­¬i ®· nhËn TuyÕt CÇu råi.", "<"}},
		{"PlayerFunLib:CheckFreeBagCell", {1, "default"}},
	},
	tbActition = 
	{
		{"ThisActivity:AddTaskDaily", {TSK_GET_SNOW_BALL, 1}},
		{"PlayerFunLib:GetItem", {ITEM_SNOW_BALL, 20, EVENT_LOG_TITLE, "GetSnowBall"}},
	},
}
tbConfig[12] = --Ò»¸öÏ¸½Ú
{
	nId = 12,
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
tbConfig[13] = --Ò»¸öÏ¸½Ú
{
	nId = 13,
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
tbConfig[14] = --Ò»¸öÏ¸½Ú
{
	nId = 14,
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
