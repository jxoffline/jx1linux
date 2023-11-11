Include("\\script\\activitysys\\config\\1009\\variables.lua")
tbConfig = {}
tbConfig[1] =
{
	nId = 1,
	szMessageType = "NpcOnDeath",
	szName = "B¶n ®å ®¸nh qu¸i nhËn m¶nh chiÕn c«ng lÖnh",
	nStartDate = 201204260000,
	nEndDate  = 201205092400,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckInMap",	{"321,322,340,225,226,227"} },
	},
	tbActition = 
	{
		--{"NpcFunLib:DropSingleItem",	{ITEM_COMMAND_PIECE_2,1,"20"} },
		{"ThisActivity:DropItemRandom",	{nil} },
	},
}

tbConfig[2] = --Ò»¸öÏ¸½Ú
{
	nId = 2,
	szMessageType = "ClickNpc",
	szName = "click npc name lingfan",
	nStartDate = 201204260000,
	nEndDate  = 201205092400,
	tbMessageParam = {"Hµng rong"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Mua m¶nh ChiÕn C«ng LÖnh",3} },
	},
}
tbConfig[3] = --Ò»¸öÏ¸½Ú
{
	nId = 3,
	szMessageType = "CreateCompose",
	szName = "compose shijin",
	nStartDate = 201204260000,
	nEndDate  = 201205092400,
	tbMessageParam = {"M¶nh chiÕn c«ng lÖnh 1",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"AddOneMaterial",	{"Ng©n l­îng",{nJxb=1},10000} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_COMMAND_PIECE_1,1,EVENT_LOG_TITLE,"MuaManhChienCongLenh1"} },
	},
}
tbConfig[4] = --§èi tho¹i Ch­ëng §¨ng Cung N÷
{
	nId = 4,
	szMessageType = "ClickNpc",
	szName = "BÊm vµo Ch­ëng §¨ng Cung N÷",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Ch­ëng §¨ng Cung N÷"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Ta muèn ®æi ChiÕc Mò Hßa B×nh",5} },		
		{"AddDialogOpt",	{"Ta muèn ®æi ChiÕc Mò Tai BÌo",6} },		
		{"AddDialogOpt",	{"Ta muèn ®æi ChiÕc Mò Tù Do",7} },		
	},
}
tbConfig[5] = 
{
	nId = 5,
	szMessageType = "CreateCompose",
	szName = "§æi ChiÕc Mò Hßa B×nh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"ChiÕc Mò Hßa B×nh",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"§¼ng cÊp cña ng­¬i kh«ng ®ñ, lÇn sau h·y ®Õn nhÐ!",">="} },
		{"AddOneMaterial",	{"M¶nh chiÕn c«ng 1",ITEM_COMMAND_PIECE_1,5} },
		{"AddOneMaterial",	{"M¶nh chiÕn c«ng 2",ITEM_COMMAND_PIECE_2,5} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_HAT_PEACE,1,EVENT_LOG_TITLE,"DoiChiecMuHoaBinh"} },
	},
}
tbConfig[6] = 
{
	nId = 6,
	szMessageType = "CreateCompose",
	szName = "§æi ChiÕc Mò Tai BÌo",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"ChiÕc Mò Tai BÌo",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"§¼ng cÊp cña ng­¬i kh«ng ®ñ, lÇn sau h·y ®Õn nhÐ!",">="} },
		{"AddOneMaterial",	{"M¶nh chiÕn c«ng 1",ITEM_COMMAND_PIECE_1,5} },
		{"AddOneMaterial",	{"M¶nh chiÕn c«ng 2",ITEM_COMMAND_PIECE_2,5} },
		{"AddOneMaterial",	{"Tói mõng chiÕn th¾ng",ITEM_BAG_VICTORY,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_EAR_HAT_DIRT,1,EVENT_LOG_TITLE,"DoiChiecMuTaiBeo"} },
	},
}
tbConfig[7] = 
{
	nId = 7,
	szMessageType = "CreateCompose",
	szName = "§æi ChiÕc Mò Tù Do",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"ChiÕc Mò Tù Do",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"§¼ng cÊp cña ng­¬i kh«ng ®ñ, lÇn sau h·y ®Õn nhÐ!",">="} },
		{"AddOneMaterial",	{"M¶nh chiÕn c«ng 1",ITEM_COMMAND_PIECE_1,5} },
		{"AddOneMaterial",	{"M¶nh chiÕn c«ng 2",ITEM_COMMAND_PIECE_2,5} },
		{"AddOneMaterial",	{"Tói mõng chiÕn th¾ng",ITEM_BAG_VICTORY,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_HAT_FREEDOM,1,EVENT_LOG_TITLE,"DoiChiecMuTuDo"} },
	},
}
tbConfig[8] = 
{
	nId = 8,
	szMessageType = "ItemScript",
	szName = "Sö dông ChiÕc Mò Tai BÌo",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30197,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCellWH",	{1, 1, 1,"default"} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "ChØ cã thÓ sö dông t¹i c¸c thµnh thÞ vµ c¸c t©n thñ th«n."} },		
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_HAT_USING, 2000, "Mçi nh©n vËt chØ ®­îc sö dông vËt phÈm nµy 2000 lÇn.", "<"}},	
		--{"ThisActivity:UseLimitHat", {1}},
	},
	tbActition = 
	{		
		{"PlayerFunLib:AddExp",	{6e6,0,EVENT_LOG_TITLE,"SuDungMuTaiBeo"} },
		{"ThisActivity:UseHatDirt",	{nil} },
	},
}
tbConfig[9] = 
{
	nId = 9,
	szMessageType = "ItemScript",
	szName = "Sö dông ChiÕc Mò Tù Do",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30199,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCellWH",	{1, 1, 1,"default"} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "ChØ cã thÓ sö dông t¹i c¸c thµnh thÞ vµ c¸c t©n thñ th«n."} },		
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_HAT_USING, 2000, "Mçi nh©n vËt chØ ®­îc sö dông vËt phÈm nµy 2000 lÇn.", "<"}},	
		--{"ThisActivity:UseLimitHat", {1}},
	},
	tbActition = 
	{		
		{"PlayerFunLib:AddExp",	{12e6,0,EVENT_LOG_TITLE,"SuDungMuTuDo"} },
		{"ThisActivity:UseHatFreedom",	{nil} },
	},
}
tbConfig[10] = 
{
	nId = 10,
	szMessageType = "ItemScript",
	szName = "Sö dông ChiÕc Mò Hßa B×nh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30198,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCellWH",	{1, 1, 1,"default"} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "ChØ cã thÓ sö dông t¹i c¸c thµnh thÞ vµ c¸c t©n thñ th«n."} },		
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_HAT_PEACE_USING, 1000, "Mçi nh©n vËt chØ ®­îc sö dông vËt phÈm nµy 1000 lÇn.", "<"}},	
	},
	tbActition = 
	{		
		{"PlayerFunLib:AddExp",	{1e6,0,EVENT_LOG_TITLE,"SuDungMuHoaBinh"} },
		--{"ThisActivity:UseHatPeace",	{nil} },
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_LIMIT_HAT_PEACE_USING, 1}},
	},
}
