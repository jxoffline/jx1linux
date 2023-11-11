Include("\\script\\activitysys\\config\\19\\variables.lua")
tbConfig = {}
tbConfig[1] = --Ò»¸öÏ¸½Ú
{
	nId = 1,
	szMessageType = "ClickNpc",
	szName = "Click NguyÖt L·o",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"NguyÖt H¹ l·o nh©n"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"T¬ Hång Thiªn Lý Nh©n Duyªn",3} },
	},
}
tbConfig[2] = --Ò»¸öÏ¸½Ú
{
	nId = 2,
	szMessageType = "ClickNpc",
	szName = "BÊm vµo ch­ëng ®¨ng cung n÷",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Ch­ëng §¨ng Cung N÷"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"T¬ Hång Thiªn Lý Nh©n Duyªn",4} },
	},
}
tbConfig[3] = --Ò»¸öÏ¸½Ú
{
	nId = 3,
	szMessageType = "CreateDialog",
	szName = "T¬ HångThiªn Lý Nh©n Duyªn cña NguyÖt L·o",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"B¸ch Niªn Tu §¾c §ång ThuyÒn §é, Thiªn Niªn Tu Lai Céng ChÈm Miªn, Ta sö dông D©y Hång nµy ®Ó rµng buéc nh©n duyªn trªn thÕ gian nµy"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"§¼ng cÊp cña Ng­¬i kh«ng ®ñ, kh«ng thÓ tham gia ho¹t ®éng",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Giíi thiÖu ho¹t ®éng'T¬ Hång Thiªn Lý Nh©n Duyªn'",5} },
		{"AddDialogOpt",	{"NhËn 'D©y Hång'",6} },
	},
}
tbConfig[4] = --Ò»¸öÏ¸½Ú
{
	nId = 4,
	szMessageType = "CreateDialog",
	szName = "T¬ Hång Thiªn Lý Nh©n Duyªn cña Ch­ëng §¨ng Cung N÷",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"H¹t Gièng C©y Hoa Hång vµ §Ëu T­¬ng T­ ng­¬i chØ ®ùoc nhËn mét trong 2 lo¹i"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"§¼ng cÊp cña Ng­¬i kh«ng ®ñ, kh«ng thÓ tham gia ho¹t ®éng",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Giíi thiÖu ho¹t ®éng'T¬ Hång Thiªn Lý Nh©n Duyªn'",5} },
		{"AddDialogOpt",	{"NhËn H¹t Gièng Hoa Hång",7} },
		{"AddDialogOpt",	{"NhËn §Ëu T­¬ng T­",8} },
	},
}
tbConfig[5] = --Ò»¸öÏ¸½Ú
{
	nId = 5,
	szMessageType = "CreateDialog",
	szName = "Giíi ThiÖu ho¹t ®éng T¬ Hång Thiªn Lý Nh©n Duyªn",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Vµo lóc 0h/13/02/2011 ®Õn 24h/23/02/2011, nh÷ng hiÖp sü cã ®¼ng c¸p 150 vµ 150 trë lªn cã thÓ mua H¹t Gièng C©y T×nh Nh©n t¹i shop Tinh Lùc, HiÖp sü ng­¬i cã thÓ ®em H¹t Gièng C©y T×nh Nh©n trång C©y T×nh Nh©n ë ngoµi ThÊt §¹i Thµnh ThÞ vµ B¸t §¹i T©n Thñ Th«n, khi H¹t Gièng C©y T×nh Nh©n lín lªn trë thµnh C©y T×nh Nh©n, HiÖp Sü cã thÓ thu ho¹ch LÔ Hép T×nh Nh©n ë trªn C©y T×nh Nh©n, mçi ngµy HiÖp Sü cã thÓ ®Õn chç cña NguyÖt H¹ L·o Nh©n ®Ó nhËn mét D©y Hång, trªn mçi D©y Hång ®Òu cã mét Sè Nh©n Duyªn , khi Ng­¬i nhËn xong D©y Hång th× cã thÓ ®Õn chç cña Ch­ëng §¨ng Cung N÷ nhËn §Ëu T­¬ng T­ hoÆc lµ H¹t Gièng Hoa Hång, mçi ngµy HiÖp Sü cã  2 c¬ héi nhËn H¹t Gièng Hoa Hång hoÆc §Ëu T­¬ng T­, mçi mét c¬ héi ng­¬i cã thÓ lùa chän nhËn 1 H¹t Gièng Hoa Hång hoÆc §Ëu T­¬ng T­, nÕu nh­ trong ngµy c¬ héi nhËn H¹t Gièng Hoa Hång hoÆc §Ëu T­¬ng T­ cña Ng­¬i ch­a dïng hÕt , nh­ vËy ng­¬i cã thÓ tÝch lòy c¬ héi nhËn ®Õn ngµy h«m sau tiÕp tôc nhËn, mçi HiÖp Sü chØ ®­îc tÝch lòy c¬ héi nhËn H¹t Gièng Hoa Hång hoÆc §Ëu T­¬ng T­ tèi ®a lµ 6 lÇn, v­ît qu¸ 6 lÇn th× kh«ng thÓ tiÕp tôc tÝch lòy ®­îc n÷a, vËt phÈm Quúnh T­¬ng Ngäc DÞch t¹i shop Tinh Lùc cã thÓ gióp Ng­¬i t¨ng thªm mét lÇn c¬ héi nhËn H¹t Gièng Hoa Hång hoÆc §Ëu T­¬ng T­, nhËn vµ trång §Ëu T­¬ng T­ kh«ng cã h¹n chÕ, nhËn vµ trång H¹t Gièng Hoa Hång yªu cÇu ph¶i tháa m·n 1 trong hai ®iÒu kiÖn d­íi ®©y.\n1. hai ng­êi ch¬i kh¸c giíi tÝnh cïng tæ ®éi víi nhau sè Nh©n Duyªn trªn D©y Hång cña 2 ng­êi ch¬i cïng tæ ®éi ph¶i hîp thµnh ®«i ( sè cÆp ch½n ). \n2.Phu thª 2 ng­êi tæ ®éi \nhiÖp sü ng­¬i cã thÓ cïng víi ng­êi b¹n kh¸c giíi cña m×nh cïng nhau ®Õn bªn ngoµi ThÊt §¹i Thµnh ThÞ vµ B¸t §¹i T©n Thñ Th«n ®Ó trång H¹t Gièng Hoa Hång, hai ng­êi kh¸c giíi tÝnh cïng tæ ®éi sÏ cïng nhau ch¨m sãc MÇm C©y Hoa Hång mµ ng­êi kia trång xuèng, trong thêi gian MÇm C©y Hoa Hång lín lªn thµnh C©y Hoa Hång Në §Çy Hoa, HiÖp sü ph¶i kÞp thêi tiÕn hµnh t­íi n­íc, bãn ph©n, b¾t s©u, nhæ cá , viÖc mµ ng­¬i b¾t s©u t­íi n­íc, nhæ cá, bãn ph©n cµng kÞp thêi nhanh chãng th× trªn C©y Hoa Hång cuèi cïng ®­îc ch¨m sãc sÏ cho cµng nhiÒu LÔ Hép Hoa Hång, khi C©y Hoa Hång lín lªn thµnh C©y Hoa Hång Në §Çy Hoa, Ng­¬i cã thÓ thu ho¹ch LÔ Hép Hoa Hång ë trªn C©y Hoa Hång cña ng­¬i trång, trång §Ëu T­¬ng T­ kh«ng cÇn tæ ®éi , trång C©y T­¬ng T­ còng ph¶i t­íi n­íc, b¾t s©u, nhæ cá, bãn ph©n, nÕu viÖc Ng­¬i t­íi n­íc, nhæ cá, bãn ph©n, b¾t s©u cµng kÞp thêi ®óng lóc th× phÇn th­ëng nhËn ®ùoc cuèi cïng cµng phong phó, sau khi C©y T­¬ng T­ tr­ëng thµnh , HiÖp sü ng­¬i cã thÓ thu ho¹ch LÔ Hép T­¬ng T­ víi sè l­îng t­¬ng øng."},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[6] = --Ò»¸öÏ¸½Ú
{
	nId = 6,
	szMessageType = "nil",
	szName = "NhËn D©y Hång ë chç NguyÖt L·o",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckTaskDaily",	{GetHongXian,0,"H«m nay ng­¬i ®· nhËn D©y Hång råi","=="} },
		{"ThisActivity:CheckHongXian",	{nil} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"Hµnh trang kh«ng ®ñ, kh«ng thÓ nhËn ®¹o cô"} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveHongXian",	{nil} },
		{"ThisActivity:SetValentineRandNumber",	{ValentineNumber} },
		{"ThisActivity:AddTaskDaily",	{GetHongXian,1} },
	},
}
tbConfig[7] = --Ò»¸öÏ¸½Ú
{
	nId = 7,
	szMessageType = "CreateDialog",
	szName = "NhËn H¹t Gièng Hoa Hång ë chç Ch­ëng §¨ng Cung N÷",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"§Ëu T­¬ng T­ vµ H¹t Gièng C©y Hoa Hång tiÓu hiÖp ng­¬i chØ ®­îc nhËn 1 trong hai lo¹i, tiÓu hiÖp nÕu ng­¬i muèn nhËn H¹t Gièng C©y Hoa Hång, cÇn ph¶i tháa m·n 1 trong 2 ®iÒu kiÖn d­íi ®©y<enter>1. Hai ng­êi ch¬i kh¸c giíi tÝnh tæ ®éi víi nhau, Sè Nh©n Duyªn cña 2 ng­êi ch¬i cïng tæ ®éi ph¶i lµ sè ch½n ( sè cÆp ch½n )<enter>2. Phu thª 2 ng­êi tæ ®éi víi nhau"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Ta muèn nhËn H¹t Gièng Hoa Hång",9} },
		{"AddDialogOpt",	{"§Ó ta suy nghÜ kü l¹i xem",4} },
	},
}
tbConfig[8] = --Ò»¸öÏ¸½Ú
{
	nId = 8,
	szMessageType = "CreateDialog",
	szName = "NhËn §Ëu T­¬ng T­ ë chç Ch­ëng §¨ng Cung N÷",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"§Ëu T­¬ng T­ vµ H¹t Gièng C©y Hoa Hång tiÓu hiÖp ng­¬i chØ cã thÓ nhËn 1 trong 2 lo¹i nµy, tiÓu hiÖp ng­¬i ch­a t×m ®­îc nh©n duyªn cña m×nh ­, ng­¬i cã thÓ nhËn 1 §Ëu T­¬ng T­ ë chç cña ta råi ®i trång, chØ cã ®iÒu phÇn th­ëng trång §Ëu T­¬ng T­ kh«ng phong phó b»ng trång C©y Hoa Hång, tiÓu hiÖp hay lµ ng­¬i nhanh chãng ®i t×m nh©n duyªn cña m×nh ®i."},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Ta muèn nhËn §Ëu T­¬ng T­",10} },
		{"AddDialogOpt",	{"§Ó ta suy nghÜ kü l¹i xem",4} },
	},
}
tbConfig[9] = --Ò»¸öÏ¸½Ú
{
	nId = 9,
	szMessageType = "nil",
	szName = "NhËn H¹t Gièng Hoa Hång",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckGetMeiGuiHuaZiCondition",	{nil} },
		{"ThisActivity:CheckValentineSeedTime",	{ValentineGetSeedTime,0,"Sè lÇn nhËn ®· dïng hÕt",">",2,6,QJYY_ExGetSeedTime} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"Hµnh trang kh«ng ®ñ, kh«ng thÓ nhËn ®¹o cô"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2697,1,0,0},nBindState = -2,nExpiredTime=1440,},1,"LÔ T×nh Nh©n n¨m 2011, nhËn ®­îc H¹t Gièng Hoa Hång"} },
		{"ThisActivity:SubSeedTime",	{ValentineGetSeedTime,QJYY_ExGetSeedTime} },
	},
}
tbConfig[10] = --Ò»¸öÏ¸½Ú
{
	nId = 10,
	szMessageType = "nil",
	szName = "NhËn §Ëu T­¬ng T­",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckValentineSeedTime",	{ValentineGetSeedTime,0,"Sè lÇn nhËn ®· dïng hÕt",">",2,6,QJYY_ExGetSeedTime} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"Hµnh trang kh«ng ®ñ, kh«ng thÓ nhËn ®¹o cô"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2698,1,0,0},nBindState = -2,nExpiredTime=1440,},1,"LÔ T×nh Nh©n n¨m 2011, nhËn ®­îc §Ëu T­¬ng T­"} },
		{"ThisActivity:SubSeedTime",	{ValentineGetSeedTime,QJYY_ExGetSeedTime} },
	},
}
tbConfig[11] = --Ò»¸öÏ¸½Ú
{
	nId = 11,
	szMessageType = "ItemScript",
	szName = "Sö dông Quúnh T­¬ng Ngäc DiÖp",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2703,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckQJYYTime",	{nil} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"§¼ng cÊp cña ng­¬i ch­a ®ñ",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{QJYY_ExGetSeedTime,1} },
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
tbConfig[15] = --Ò»¸öÏ¸½Ú
{
	nId = 15,
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
tbConfig[16] = --Ò»¸öÏ¸½Ú
{
	nId = 16,
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
