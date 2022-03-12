Include("\\script\\activitysys\\config\\26\\variables.lua")
tbConfig = {}
tbConfig[1] = --Ò»¸öÏ¸½Ú
{
	nId = 1,
	szMessageType = "ClickNpc",
	szName = "Click vµo NPC Bµn TiÖc",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Bµn TiÖc"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Ta muèn ¨n thøc ¨n",2} },
		{"AddDialogOpt",	{"Ta muèn §Êu R­îu",3} },
		{"SetDialogTitle",	{"Chóc Mõng N¨m Míi!"} },
	},
}
tbConfig[2] = --Ò»¸öÏ¸½Ú
{
	nId = 2,
	szMessageType = "nil",
	szName = "Ta muèn ¨n thøc ¨n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{nPlayerLevel,"ChØ cã nh÷ng HiÖp Sü cã ®¼ng cÊp 150 vµ 150 trë lªn hoÆc lµ nh÷ng HiÖp Sü ®· trïng sinh míi cã thÓ tham gia ho¹t ®éng nµy.",">="} },
		{"ThisActivity:CheckTask",	{TSK_TotalEatExp,nTotalEatUpExp,"ThiÕu HiÖp ng­¬i ¨n thøc ¨n nhËn ®­îc kinh nghiÖm ®· ®¹t ®Õn giíi h¹n råi, kh«ng thÓ ¨n thªm ®­îc n÷a","<"} },
		{"ThisActivity:CheckTaskA",	{TSK_EatExp, TSK_EatExpDate, nEatUpExp,"Xin lçi, ThiÕu HiÖp h«m nay ng­¬i ¨n no qóa råi, ngµy mai l¹i ®Õn nhĞ.",nNumber} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveEatAward",	{TSK_EatExp, TSK_EatExpDate, TSK_TotalEatExp, nNumber} },
	},
}
tbConfig[3] = --Ò»¸öÏ¸½Ú
{
	nId = 3,
	szMessageType = "CreateDialog",
	szName = "Ta muèn §Êu R­îu",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"§Êu R­îu , §Êu chİnh lµ trİ tuÖ vµ vËn may"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{nPlayerLevel,"ChØ cã nh÷ng HiÖp Sü cã ®¼ng cÊp 150 vµ 150 trë lªn hoÆc lµ nh÷ng HiÖp Sü ®· trïng sinh míi cã thÓ tham gia ho¹t ®éng nµy.",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Giíi thiÖu quy t¾c §Êu R­îu",4} },
		{"AddDialogOpt",	{"Ta muèn b¾t ®Çu ®Êu r­îu",5} },
		{"AddDialogOpt",	{"Ta muèn kiÓm tra kÕt qu¶ ®Êu r­îu",12} },
		{"AddDialogOpt",	{"Ta muèn nhËn phÇn th­ëng §Êu R­îu",23} },
		{"AddDialogOpt",	{"§Ó ta suy nghÜ l¹i",0} },
	},
}
tbConfig[4] = --Ò»¸öÏ¸½Ú
{
	nId = 4,
	szMessageType = "CreateDialog",
	szName = "Giíi thiÖu quy t¾c §Êu R­îu",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"ThiÕu HiÖp, ng­¬i mçi ngµy cã thÓ tham gia 3 trËn §Êu R­îu, mçi trËn §Êu R­îu tæng céng cã 12 l­ît r­îu, ThiÕu HiÖp nÕu ng­¬i muèn th¾ng 1 trËn ®Êu r­îu thµnh c«ng, th× cÇn ph¶i uèng hÕt 12 luît r­îu cña trËn §Êu R­îu nµy, trong mçi l­ît §Êu R­îu, ThiÕu HiÖp cã thÓ lùa chän uèng B¸t R­îu Nhá, B¸t R­îu Trung, hay lµ B¸t R­îu Lín, uèng lo¹i r­îu kh«ng gièng nhau sÏ céng thªm  cho ng­¬i §é Say XØn vµ Töu L­îng kh«ng gièng nhau, ThiÕu HiÖp cÇn ph¶i ®¶m b¶o trong lóc §é Say XØn nhá h¬n 100 cè g¾ng t¨ng cao Töu L­îng cña m×nh. NÕu ng­¬i kh«ng thËn tränguèng cho Say XØn ®Õn 100 hoÆc 100 trë lªn, th× ng­¬i ®· uèng say råi, th× trËn ®Êu r­îu nµy xem nh­ lµ thÊt b¹i, nÕu ng­¬i uèng hÕt 12 l­ît r­îu mµ §é Say XØn cña ng­¬i vÉn nhá h¬n 100, th× trËn §Êu R­îu nµy ng­¬i ®· thµnh c«ng, ta sÏ lÊy tÊt c¶ Töu L­îng nhËn ®­îc cña nh÷ng lÇn §Êu R­îu thµnh c«ng trong ngµy céng l¹i vµ tiÕn hµnh xÕp h¹ng, XÕp h¹ng ë top 10 th× sÏ ®­îc nhËn phÇn th­ëng phong phó. Qu¸ tr×nh §Êu R­îu, B¸t R­îu Nhá céng thªm 3-6 §é Say XØn, 3 l­îng Töu L­îng, B¸t R­îu Trung céng thªm 2-12 §é Say XØn, 7 l­îng Töu L­îng, B¸t R­îu Lín céng thªm 3-18 §é Say XØn, 11 l­îng Töu L­îng."},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[5] = --Ò»¸öÏ¸½Ú
{
	nId = 5,
	szMessageType = "nil",
	szName = "Ta muèn b¾t ®Çu ®Êu r­îu",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:BeginDrink",	{nil} },
	},
}
tbConfig[6] = --Ò»¸öÏ¸½Ú
{
	nId = 6,
	szMessageType = "nil",
	szName = "Uèng mét b¸t r­îu nhá",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:DrinkOneRound",	{TSK_ZuiYi,TSK_JiuLiang,TSK_DrinkTimes,TSK_DrinkRound,TSK_WinDrink,TSK_AnWei,TSK_LastTimeDate,1020,"small",5} },
	},
}
tbConfig[7] = --Ò»¸öÏ¸½Ú
{
	nId = 7,
	szMessageType = "nil",
	szName = "Uèng 1 B¸t R­îu Trung",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:DrinkOneRound",	{TSK_ZuiYi,TSK_JiuLiang,TSK_DrinkTimes,TSK_DrinkRound,TSK_WinDrink,TSK_AnWei,TSK_LastTimeDate,1020,"middle",5} },
	},
}
tbConfig[8] = --Ò»¸öÏ¸½Ú
{
	nId = 8,
	szMessageType = "nil",
	szName = "Uèng mét b¸t r­îu lín",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:DrinkOneRound",	{TSK_ZuiYi,TSK_JiuLiang,TSK_DrinkTimes,TSK_DrinkRound,TSK_WinDrink,TSK_AnWei,TSK_LastTimeDate,1020,"big",5} },
	},
}
tbConfig[9] = --Ò»¸öÏ¸½Ú
{
	nId = 9,
	szMessageType = "nil",
	szName = "ChŞu thua",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:Lose",	{TSK_DrinkTimes,TSK_DrinkRound,TSK_ZuiYi,TSK_AnWei,TSK_JiuLiang} },
	},
}
tbConfig[10] = --Ò»¸öÏ¸½Ú
{
	nId = 10,
	szMessageType = "ServerStart",
	szName = "Khi më sever ®¨ng t¶i c¸i bµn",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:AddDialogNpc",	{"Bµn TiÖc", 1658, tbDeskPos} },
	},
}
tbConfig[11] = --Ò»¸öÏ¸½Ú
{
	nId = 11,
	szMessageType = "ServerStart",
	szName = "Khi më sever ®¨ng t¶i ThÈm Viªn Ngo¹i",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:AddDialogNpc",	{"ThÈm Viªn Ngo¹i", 1659, tbYuanWaiPos} },
	},
}
tbConfig[12] = --Ò»¸öÏ¸½Ú
{
	nId = 12,
	szMessageType = "CreateDialog",
	szName = "KiÓm tra kÕt qu¶ ®Êu r­îu",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"KiÓm tra kÕt qu¶ ®Êu r­îu",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"KiÓm tra töu l­îng nhËn ®­îc h«m nay  cña ta.",13} },
		{"AddDialogOpt",	{"KiÓm tra xÕp h¹ng top 10 cña Töu L­îng ngµy h«m tr­íc",15} },
		{"AddDialogOpt",	{"KiÓm tra xÕp h¹ng töu l­îng ngµy h«m tr­íc cña ta.",16} },
	},
}
tbConfig[13] = --Ò»¸öÏ¸½Ú
{
	nId = 13,
	szMessageType = "nil",
	szName = "KiÓm tra töu l­îng nhËn ®­îc h«m nay  cña ta.",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:DisplayCurJiuLiang",	{nil} },
	},
}
tbConfig[14] = --Ò»¸öÏ¸½Ú
{
	nId = 14,
	szMessageType = "nil",
	szName = "KiÓm tra xÕp h¹ng top 10 cña Töu L­îng hiÖn t¹i",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:DisplayCurTopTen",	{nil} },
	},
}
tbConfig[15] = --Ò»¸öÏ¸½Ú
{
	nId = 15,
	szMessageType = "nil",
	szName = "KiÓm tra xÕp h¹ng top 10 cña Töu L­îng ngµy h«m tr­íc",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:DisplayYTopTen",	{nil} },
	},
}
tbConfig[16] = --Ò»¸öÏ¸½Ú
{
	nId = 16,
	szMessageType = "nil",
	szName = "KiÓm tra xÕp h¹ng töu l­îng ngµy h«m tr­íc cña ta.",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:DisplayYPlayerPaiMing",	{nil} },
	},
}
tbConfig[17] = --Ò»¸öÏ¸½Ú
{
	nId = 17,
	szMessageType = "ClickNpc",
	szName = "Click vµo ThÈm Viªn Ngo¹i",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"ThÈm Viªn Ngo¹i"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{nPlayerLevel,"",">="} },
	},
	tbActition = 
	{
		{"SetDialogTitle",	{"<npc>C¸c ch­ vŞ vâ l©m hµo hiÖp, L·o ThÈm t«i ®· bµy lÔ råi, n¨m míi còng gÇn kÒ, Ta ë ®©y ®· bµy s½n s¬n hµo h¶i vŞ chiªu ®·i c¸c ch­ vŞ, xin c¸c vŞ cø tù nhiªn, ®õng kh¸ch s¸o, ¨n uèng no say tho¶i m¸i ®i!"} },
		{"AddDialogOpt",	{"Giíi thiÖu ho¹t ®éng §¹i YÕn QuÇn HiÖp",18} },
		{"AddDialogOpt",	{"NhËn hång bao",19} },
		{"AddDialogOpt",	{"§æi lÊy Gi¶i Töu Hoµn",20} },
	},
}
tbConfig[18] = --Ò»¸öÏ¸½Ú
{
	nId = 18,
	szMessageType = "CreateDialog",
	szName = "Giíi thiÖu ho¹t ®éng §¹i YÕn QuÇn HiÖp",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Thêi gian tõ 0h/23/01/2011 ®Õn 24h/20/02/2011, ThiÕu HiÖp ng­¬i cã thÓ t¹i chç Ta ë ®©y ®· bµy s½n s¬n hµo h¶i vŞ chiªu ®·i, ¨n uèng no say tho¶i m¸i ®i, Thêi gian tõ 09/02 ®Õn 11/02, ®Ó cÇu may cho con trai xa xø cña ta, ThiÕu HiÖp ng­¬i cã thÓ ®Õn chç cña ta ®©y nhËn 1 §¹i Hång Bao! ThÈm Viªn Ngo¹i ta ®©y kh«ng ph¶i lµ ng­êi keo kiÖt ®©u, ta ®· bá vµo Hång Bao ®Õn 300.000.000 kinh nghiÖm, ThiÕu HiÖp ng­¬i ®õng quªn ®Ğn nhËn Hång Bao nhĞ.",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[19] = --Ò»¸öÏ¸½Ú
{
	nId = 19,
	szMessageType = "nil",
	szName = "NhËn hång bao",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{TSK_LiBao,1,"ThiÕu HiÖp ng­¬i ®· nhËn Hång Bao ë chç cña ta råi, mçi ng­êi chØ ®­îc nhËn Hång Bao 1 lÇn ë chç cña ta!","<"} },
		{"lib:CheckDay",	{nGetLiBaoStartDate, nGetLiBaoEndDate, "Vµo kho¶ng ngµy 10 th¸ng 2, con trai cña ta ph¶i lªn ®­êng t×m kiÕm ph­¬ng trêi bu«n b¸n míi, ®Ó cÇu may cho nã, vµo ngµy 09 ®Õn ngµy 11 th¸ng 2, ThiÕu HiÖp ng­¬i cã thÓ ®Õn chç cña ta ®©y nhËn mét §¹i Hång Bao! ThÈm Viªn Ngo¹i ta ®©y kh«ng ph¶i lµ ng­êi keo kiÖt ®©u, ta ®· bá vµo Hång Bao ®Õn 300.000.000 kinh nghiÖm, ThiÕu HiÖp ng­¬i ®õng quªn ®Ğn nhËn Hång Bao nhĞ."} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"Hµnh trang kh«ng ®ñ chç trèng, İt nhÊt ph¶i 1 c¸i 1*1 kh«ng gian hµnh trang"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2694,1,0,0},nBindState = -2,nExpiredTime=20110221,},1,"§¹i YÕn QuÇn HiÖp n¨m 2011, Hång Bao ThÈm Viªn Ngo¹i"} },
		{"ThisActivity:AddTask",	{TSK_LiBao,1} },
	},
}
tbConfig[20] = --Ò»¸öÏ¸½Ú
{
	nId = 20,
	szMessageType = "CreateCompose",
	szName = "§æi lÊy Gi¶i Töu Hoµn",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Gi¶i Töu Hoµn",1,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Ng©n l­îng",{nJxb=1},100000} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2695,1,0,0},nExpiredTime=20110221,},1,"§¹i YÕn QuÇn HiÖp n¨m 2011, nhËn ®­îc Gi¶i Töu Hoµn"} },
	},
}
tbConfig[21] = --Ò»¸öÏ¸½Ú
{
	nId = 21,
	szMessageType = "ItemScript",
	szName = "Sö dông Gi¶i Töu Hoµn",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2695,-1,-1,-1},}},
	tbCondition = 
	{
		{"ThisActivity:CheckGetDrunk",	{1020,"Kh«ng cã say th× kh«ng cÇn dïng Gi¶i Töu Hoµn ®©u"} },
	},
	tbActition = 
	{
		{"ThisActivity:JieJiu",	{1020} },
	},
}
tbConfig[22] = --Ò»¸öÏ¸½Ú
{
	nId = 22,
	szMessageType = "ItemScript",
	szName = "Sö dông Hång Bao cña ThÈm Viªn Ngo¹i",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2694,-1,-1,-1},}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{TSK_UseLiBao,0,"","=="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{nLiBaoExp,1,"§¹i YÕn QuÇn HiÖp n¨m 2011, sö dông Hång Bao ThÈm Viªn Ngo¹i nhËn ®­îc kinh nghiÖm"} },
		{"ThisActivity:SetTask",	{TSK_UseLiBao,1} },
	},
}
tbConfig[23] = --Ò»¸öÏ¸½Ú
{
	nId = 23,
	szMessageType = "CreateDialog",
	szName = "NhËn phÇn th­ëng §Êu R­îu",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"NhËn phÇn th­ëng §Êu R­îu",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"NhËn phÇn th­ëng xÕp h¹ng §Êu R­îu",24} },
		{"AddDialogOpt",	{"NhËn phÇn th­ëng ®Êu r­îu thµnh c«ng",29} },
		{"AddDialogOpt",	{"NhËn phÇn th­ëng an ñi",30} },
	},
}
tbConfig[24] = --Ò»¸öÏ¸½Ú
{
	nId = 24,
	szMessageType = "nil",
	szName = "NhËn phÇn th­ëng xÕp h¹ng §Êu R­îu",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:GetPaiMingAward",	{nil} },
	},
}
tbConfig[25] = --Ò»¸öÏ¸½Ú
{
	nId = 25,
	szMessageType = "nil",
	szName = "NhËn phÇn th­ëng ®Êu r­îu xÕp h¹ng 1",
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
tbConfig[26] = --Ò»¸öÏ¸½Ú
{
	nId = 26,
	szMessageType = "nil",
	szName = "NhËn phÇn th­ëng ®Êu r­îu xÕp h¹ng 2",
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
tbConfig[27] = --Ò»¸öÏ¸½Ú
{
	nId = 27,
	szMessageType = "nil",
	szName = "NhËn phÇn th­ëng ®Êu r­îu xÕp h¹ng 3",
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
tbConfig[28] = --Ò»¸öÏ¸½Ú
{
	nId = 28,
	szMessageType = "nil",
	szName = "NhËn phÇn th­ëng ®Êu r­îu xÕp h¹ng tõ 4-10",
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
tbConfig[29] = --Ò»¸öÏ¸½Ú
{
	nId = 29,
	szMessageType = "nil",
	szName = "NhËn phÇn th­ëng ®Êu r­îu thµnh c«ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{TSK_WinDrink,1,"ThiÕu HiÖp ng­¬i kh«ng cã phÇn th­ëng ®Êu r­îu thµnh c«ng ®Ó nhËn","=="} },
	},
	tbActition = 
	{
		{"ThisActivity:GetDrinkAward",	{TSK_TotalDrinkExp, nTotalDrinkUpExp, nWinDrinkExp, "ThiÕu HiÖp ng­¬i tham gia ®Êu r­îu nhËn ®­îc kinh nghiÖm ®· ®¹t ®Õn giíi h¹n, kh«ng thÓ tiÕp tôc nhËn nh÷ng phÇn th­ëng cã liªn quan ®Õn ®Êu r­îu", "<", nNumber,"§¹i YÕn QuÇn HiÖp n¨m 2011, nhËn phÇn th­ëng ®Êu r­îu thµnh c«ng."} },
		{"ThisActivity:SetTask",	{TSK_WinDrink,0} },
	},
}
tbConfig[30] = --Ò»¸öÏ¸½Ú
{
	nId = 30,
	szMessageType = "nil",
	szName = "NhËn phÇn th­ëng an ñi",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{TSK_AnWei,1,"ThiÕu HiÖp, ng­¬i kh«ng cã phÇn th­ëng an ñi ®Ó nhËn","=="} },
	},
	tbActition = 
	{
		{"ThisActivity:GetDrinkAward",	{TSK_TotalDrinkExp, nTotalDrinkUpExp, nAnWeiExp, "ThiÕu HiÖp ng­¬i tham gia ®Êu r­îu nhËn ®­îc kinh nghiÖm ®· ®¹t ®Õn giíi h¹n, kh«ng thÓ tiÕp tôc nhËn nh÷ng phÇn th­ëng cã liªn quan ®Õn ®Êu r­îu", "<", nNumber,"§¹i YÕn QuÇn HiÖp n¨m 2011, nhËn phÇn th­ëng an ñi"} },
		{"ThisActivity:SetTask",	{TSK_AnWei,0} },
	},
}
tbConfig[31] = --Ò»¸öÏ¸½Ú
{
	nId = 31,
	szMessageType = "ServerStart",
	szName = "Khi më sever ®¨ng t¶i §Ìn Lång",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:AddMulNpc",	{tbNpcs,"§Ìn Lång",1592} },
	},
}
tbConfig[32] = --Ò»¸öÏ¸½Ú
{
	nId = 32,
	szMessageType = "ServerStart",
	szName = "Khi më sever ®¨ng t¶i Bóp Bª §Çu Bù",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:AddNpcFromFile",	{"§Çu «ng ®Şa", 1660, "\\settings\\maps\\dayanqunxia\\datouwawa.txt",176} },
	},
}
tbConfig[33] = --Ò»¸öÏ¸½Ú
{
	nId = 33,
	szMessageType = "ServerStart",
	szName = "Khi më sever ®¨ng t¶i Vò Nam S­",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:AddNpcFromFile",	{"Nam S­ ", 1661, "\\settings\\maps\\dayanqunxia\\wunanshi.txt",176} },
	},
}
tbConfig[34] = --Ò»¸öÏ¸½Ú
{
	nId = 34,
	szMessageType = "ServerStart",
	szName = "Khi më sever ®¨ng t¶i Vò B¾c S­",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:AddNpcFromFile",	{"B¾c S­ ", 1662, "\\settings\\maps\\dayanqunxia\\wubeishi.txt",176} },
	},
}
