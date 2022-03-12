Include("\\script\\activitysys\\config\\32\\variables.lua")
tbConfig = {}
tbConfig[1] = --Ò»¸öÏ¸½Ú
{
	nId = 1,
	szMessageType = "ClickNpc",
	szName = "§èi tho¹i Vâ L©m Minh Chñ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Minh chñ -  *Nh­ ý*"},
	tbCondition = 
	{
		{"ThisActivity:IsOpen",	{nil} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"NhiÖm vô Vâ L©m Minh Chñ",2} },
	},
}
tbConfig[2] = --Ò»¸öÏ¸½Ú
{
	nId = 2,
	szMessageType = "CreateDialog",
	szName = "NhiÖm vô hµng ngµy",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"'HiÖp Chi §¹i Gi¶, V× N­íc V× D©n'. LÇn nµy ta phông mÖnh s­ phô, ®Õn ®©y ®Ó t×m c¸c ch­ vÞ anh hïng hµo kiÖt. S­ phô ta nãi r»ng chØ cÇn chóng ta ®ång t©m hiÖp lùc, ¾t sÏ cã 1 ngµy sÏ ®¸nh ®uæi ®­îc Th¸t Tö. Nhµ ng­¬i cã ph¶i lµ ng­êi mµ ta muèn t×m kh«ng?",0},
	tbCondition = 
	{
		{"ThisActivity:IsOpen",	{nil} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Ta ®Õn nhËn nhiÖm vô Vâ L©m Minh Chñ",3} },
		{"AddDialogOpt",	{"Ta ®Õn nhËn th­ëng nhiÖm vô",4} },
	},
}
tbConfig[3] = --Ò»¸öÏ¸½Ú
{
	nId = 3,
	szMessageType = "CreateDialog",
	szName = "Ta ®Õn nhËn nhiÖm vô hµng ngµy",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"nh÷ng ®¹i hiÖp cÊp 120 trë lªn hoÆc ®· trïng sinh mçi ngµy cã thÓ ®Õn chç cña ta ®©y nhËn nhiÖm vô Vâ L©m Minh Chñ, mçi lo¹i nhiÖm vô mçi ngµy cã thÓ hoµn thµnh 1 lÇn, sau khi hoµn thµnh nhiÖm vô ta sÏ cho ng­¬i phÇn th­ëng xøng ®¸ng!",0},
	tbCondition = 
	{
		{"ThisActivity:IsOpen",	{nil} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"NhËn nhiÖm vô giÕt qu¸i",5} },
		{"AddDialogOpt",	{"NhËn nhiÖm vô ®èi tho¹i",6} },
		{"AddDialogOpt",	{"NhËn nhiÖm vô thu thËp",7} },
		{"AddDialogOpt",	{"Ta kh«ng cÈn thËn lÇm mÊt th­ cña ng­¬i råi",11} },
	},
}
tbConfig[4] = --Ò»¸öÏ¸½Ú
{
	nId = 4,
	szMessageType = "CreateDialog",
	szName = "Ta ®Õn nhËn th­ëng nhiÖm vô",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"nh÷ng ®¹i hiÖp cÊp 120 trë lªn hoÆc ®· trïng sinh mçi nagyf cã thÓ ®Õn chç cña ta ®©y nhËn nhiÖm vô hµng ngµy, mçi lo¹i nhiÖm vô mçi ngµy cã thÓ hoµn thµnh 1 lÇn, sau khi hoµn thµnh nhiÖm vô ta sÏ cho ng­¬i phÇn th­ëng xøng ®¸ng!",0},
	tbCondition = 
	{
		{"ThisActivity:IsOpen",	{nil} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"NhËn phÇn th­ëng nhiÖm vô giÕt qu¸i",8} },
		{"AddDialogOpt",	{"NhËn phÇn th­ëng nhiÖm vô ®èi tho¹i",9} },
		{"AddDialogOpt",	{"NhËn phÇn th­ëng nhiÖm vô thu thËp",10} },
	},
}
tbConfig[5] = --Ò»¸öÏ¸½Ú
{
	nId = 5,
	szMessageType = "nil",
	szName = "NhËn nhiÖm vô giÕt qu¸i",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{120,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:AcceptKillTask",	{nil} },
	},
}
tbConfig[6] = --Ò»¸öÏ¸½Ú
{
	nId = 6,
	szMessageType = "nil",
	szName = "NhËn nhiÖm vô ®èi tho¹i",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{120,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:AcceptTalkTask",	{nil} },
	},
}
tbConfig[7] = --Ò»¸öÏ¸½Ú
{
	nId = 7,
	szMessageType = "nil",
	szName = "NhËn nhiÖm vô thu thËp",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{120,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:AcceptGatherTask",	{nil} },
	},
}
tbConfig[8] = --Ò»¸öÏ¸½Ú
{
	nId = 8,
	szMessageType = "nil",
	szName = "NhËn phÇn th­ëng nhiÖm vô giÕt qu¸i",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:CompletKillTask",	{nil} },
	},
}
tbConfig[9] = --Ò»¸öÏ¸½Ú
{
	nId = 9,
	szMessageType = "nil",
	szName = "NhËn phÇn th­ëng nhiÖm vô ®èi tho¹i",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:CompletTalkTask",	{nil} },
	},
}
tbConfig[10] = --Ò»¸öÏ¸½Ú
{
	nId = 10,
	szMessageType = "nil",
	szName = "NhËn phÇn th­ëng nhiÖm vô thu thËp",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:CompletGatherTask",	{nil} },
	},
}
tbConfig[11] = --Ò»¸öÏ¸½Ú
{
	nId = 11,
	szMessageType = "nil",
	szName = "Ta kh«ng cÈn thËn lÇm mÊt th­ cña ng­¬i råi",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{TSK_TALK_TASK_ID,0,"VÞ <lua GetSex() == 1 and \"Tû Tû nµy\" or \"Ca Ca\"/> ta vÉn ch­a cÇn ng­¬i gióp ta ®­a th­.",">"} },
		{"PlayerFunLib:CheckTask",	{TSK_TALK_TASK_STATE,0,"VÞ <lua GetSex() == 1 and \"Tû Tû nµy\" or \"Ca Ca\"/> ng­¬i ®· gióp ta ®­a th­ ®Õn n¬i råi, thËt lµ c¶m t¹.","=="} },
		{"PlayerFunLib:CheckItemInPlayer",	{{tbProp={6,1,2571,1,-1,0},},1,"VÞ <lua GetSex() == 1 and \"Tû Tû nµy\" or \"Ca Ca\"/> trong ng­êi ng­¬i hoÆc trong r­¬ng chøa ®å cña ng­¬i ®· cã th­ cña ta råi, ng­¬i t×m kü l¹i xem." } },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2571,1,0,0},},1,"NhËn l¹i th­ cña Long Nhi",""} },
		{"Talk",	{1,"","§­îc råi , vËy ®Ó ta viÕt l¹i cho ng­¬i, còng nh­ lµ luyÖn ch÷ th«i mµ."} },
	},
}
tbConfig[12] = --Ò»¸öÏ¸½Ú
{
	nId = 12,
	szMessageType = "ClickNpc",
	szName = "§èi tho¹i Tèng Kim TiÓu Kú Nhi",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"TiÓu Kú Nhi"},
	tbCondition = 
	{
		{"ThisActivity:IsOpen",	{nil} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Ta ®Õn trao th­ cho ng­¬i",15} },
	},
}
tbConfig[13] = --Ò»¸öÏ¸½Ú
{
	nId = 13,
	szMessageType = "ClickNpc",
	szName = "§èi tho¹i Phông Phông v­ît ¶i",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Phông Phông"},
	tbCondition = 
	{
		{"ThisActivity:IsOpen",	{nil} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Ta ®Õn trao th­ cho ng­¬i",15} },
	},
}
tbConfig[14] = --Ò»¸öÏ¸½Ú
{
	nId = 14,
	szMessageType = "ClickNpc",
	szName = "§èi tho¹i TiÓu Chiªu Phong L¨ng §é",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"TiÓu Chiªu"},
	tbCondition = 
	{
		{"ThisActivity:IsOpen",	{nil} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Ta ®Õn trao th­ cho ng­¬i",15} },
	},
}
tbConfig[15] = --Ò»¸öÏ¸½Ú
{
	nId = 15,
	szMessageType = "nil",
	szName = "Ta ®Õn trao th­ cho ng­¬i",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:TalkToNpc",	{nil} },
	},
}
tbConfig[16] = --Ò»¸öÏ¸½Ú
{
	nId = 16,
	szMessageType = "ServerStart",
	szName = "Khëi ®éng sever",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:IsOpen",	{nil} },
	},
	tbActition = 
	{
		{"ThisActivity:Init",	{nil} },
	},
}
tbConfig[17] = --Ò»¸öÏ¸½Ú
{
	nId = 17,
	szMessageType = "ClickNpc",
	szName = "§èi tho¹i Tiªu TrÊn Thiªn B¶o Khè",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tiªu TrÊn"},
	tbCondition = 
	{
		{"ThisActivity:IsOpen",	{nil} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Ta ®Õn trao th­ cho ng­¬i",15} },
	},
}
