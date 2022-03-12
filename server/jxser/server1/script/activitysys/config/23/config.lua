Include("\\script\\activitysys\\config\\23\\variables.lua")
tbConfig = {}
tbConfig[1] = --Ò»¸öÏ¸½Ú
{
	nId = 1,
	szMessageType = "FinishYesou",
	szName = "Trong ngµy ®· hoµn thµnh 10 nhiÖm vô D· TÈu",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {10},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_YeSou,0,"","=="} },
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_XinXiaLinMax,25,"","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"Hµnh trang cña b¹n kh«ng cßn chç trèng, phÇn th­ëng lÇn nµy kh«ng nhËn ®­îc"} },
	},
	tbActition = 
	{
		--{"PlayerFunLib:GetItem",	{{tbProp={6,1,2566,1,0,0},},2,"Trong ngµy ®· hoµn thµnh 10 nhiÖm vô D· TÈu"} },
		--{"PlayerFunLib:AddTaskDaily",	{TaskVarIdx_YeSou,2} },
		--{"PlayerFunLib:AddTaskDaily",	{TaskVarIdx_XinXiaLinMax,2} },
	},
}
tbConfig[2] = --Ò»¸öÏ¸½Ú
{
	nId = 2,
	szMessageType = "LeagueResult",
	szName = "Trong ngµy cã trËn liªn ®Êu th¾ng ®Çu tiªn",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {2,1},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_LeagueMatch,0,"","=="} },
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_XinXiaLinMax,25,"","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"Hµnh trang cña b¹n kh«ng cßn chç trèng, phÇn th­ëng lÇn nµy kh«ng nhËn ®­îc"} },
	},
	tbActition = 
	{
		--{"PlayerFunLib:GetItem",	{{tbProp={6,1,2566,1,0,0},},2,"Trong ngµy cã trËn liªn ®Êu th¾ng ®Çu tiªn"} },
		--{"PlayerFunLib:AddTaskDaily",	{TaskVarIdx_LeagueMatch,2} },
		--{"PlayerFunLib:AddTaskDaily",	{TaskVarIdx_XinXiaLinMax,2} },
	},
}
tbConfig[3] = --Ò»¸öÏ¸½Ú
{
	nId = 3,
	szMessageType = "FinishSongJin",
	szName = "Trong ngµy lÇn ®Çu tiªn ®­îc 3000 ®iÓm tÝch lòy Tèng Kim",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{"751",3000,"",">="} },
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_SongJin,0,"","=="} },
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_XinXiaLinMax,25,"","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"Hµnh trang cña b¹n kh«ng cßn chç trèng, phÇn th­ëng lÇn nµy kh«ng nhËn ®­îc"} },
	},
	tbActition = 
	{
		--{"PlayerFunLib:GetItem",	{{tbProp={6,1,2566,1,0,0},},2,"Trong ngµy lÇn ®Çu tiªn ®­îc 3000 ®iÓm tÝch lòy Tèng Kim"} },
		--{"PlayerFunLib:AddTaskDaily",	{TaskVarIdx_SongJin,2} },
		--{"PlayerFunLib:AddTaskDaily",	{TaskVarIdx_XinXiaLinMax,2} },
	},
}
tbConfig[4] = --Ò»¸öÏ¸½Ú
{
	nId = 4,
	szMessageType = "nil",
	szName = "Trong ngµy lÇn ®Çu tiªn hoµn thµnh tÝn sø Phong Chi Kú",
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
tbConfig[5] = --Ò»¸öÏ¸½Ú
{
	nId = 5,
	szMessageType = "FinishFengLingDu",
	szName = "Trong ngµy lÇn ®Çu tiªn hoµn thµnh Phong L¨ng §é",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_FengLingDu,0,"","=="} },
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_XinXiaLinMax,25,"","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"Hµnh trang cña b¹n kh«ng cßn chç trèng, phÇn th­ëng lÇn nµy kh«ng nhËn ®­îc"} },
	},
	tbActition = 
	{
		--{"PlayerFunLib:GetItem",	{{tbProp={6,1,2566,1,0,0},},2,"Trong ngµy lÇn ®Çu tiªn hoµn thµnh Phong L¨ng §é"} },
		--{"PlayerFunLib:AddTaskDaily",	{TaskVarIdx_FengLingDu,2} },
		--{"PlayerFunLib:AddTaskDaily",	{TaskVarIdx_XinXiaLinMax,2} },
	},
}
tbConfig[6] = --Ò»¸öÏ¸½Ú
{
	nId = 6,
	szMessageType = "NpcOnDeath",
	szName = "Trong ngµy giÕt ®­îc 3 con qu¸i xanh ®Çu tiªn cÊp 95",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckNpcPower",	{2} },
		{"NpcFunLib:CheckNpcLevel",	{"95"} },
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_LanGuai,3,"","<"} },
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_XinXiaLinMax,25,"","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"Hµnh trang cña b¹n kh«ng cßn chç trèng, phÇn th­ëng lÇn nµy kh«ng nhËn ®­îc"} },
	},
	tbActition = 
	{
		--{"PlayerFunLib:GetItem",	{{tbProp={6,1,2566,1,0,0},},1,"Trong ngµy giÕt ®­îc 3 con qu¸i xanh ®Çu tiªn cÊp 95"} },
		--{"PlayerFunLib:AddTaskDaily",	{TaskVarIdx_LanGuai,1} },
		--{"PlayerFunLib:AddTaskDaily",	{TaskVarIdx_XinXiaLinMax,1} },
	},
}
tbConfig[7] = --Ò»¸öÏ¸½Ú
{
	nId = 7,
	szMessageType = "Chuanguan",
	szName = "Trong ngµy hoµn thµnh 1 lÇn v­ît ¶i ®Çu tiªn",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28", 2},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_ChuangGuan,0,"","=="} },
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_XinXiaLinMax,25,"","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"Hµnh trang cña b¹n kh«ng cßn chç trèng, phÇn th­ëng lÇn nµy kh«ng nhËn ®­îc"} },
	},
	tbActition = 
	{
		--{"PlayerFunLib:GetItem",	{{tbProp={6,1,2566,1,0,0},},2,"Trong ngµy hoµn thµnh 1 lÇn v­ît ¶i ®Çu tiªn"} },
	--	{"PlayerFunLib:AddTaskDaily",	{TaskVarIdx_ChuangGuan,2} },
		--{"PlayerFunLib:AddTaskDaily",	{TaskVarIdx_XinXiaLinMax,2} },
	},
}
tbConfig[8] = --Ò»¸öÏ¸½Ú
{
	nId = 8,
	szMessageType = "nil",
	szName = "É±ÊÖÈÎÎñ(ÔÝÎÞ)",
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
	szMessageType = "nil",
	szName = "Ñ×µÛ±¦²Ø(ÔÝÎÞ)",
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
tbConfig[10] = --Ò»¸öÏ¸½Ú
{
	nId = 10,
	szMessageType = "nil",
	szName = "ÁúÂöÈÎÎñ(ÔÝÎÞ)",
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
tbConfig[11] = --Ò»¸öÏ¸½Ú
{
	nId = 11,
	szMessageType = "FinishCangBaoTu",
	szName = "Trong ngµy 3 lÇn v­ît ¶i Tµng B¶o §å ®Çu tiªn",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_CangBaoTu,3,"","<"} },
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_XinXiaLinMax,25,"","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"Hµnh trang cña b¹n kh«ng cßn chç trèng, phÇn th­ëng lÇn nµy kh«ng nhËn ®­îc"} },
	},
	tbActition = 
	{
	--	{"PlayerFunLib:GetItem",	{{tbProp={6,1,2566,1,0,0},},1,"Trong ngµy 3 lÇn v­ît ¶i Tµng B¶o §å ®Çu tiªn"} },
	--	{"PlayerFunLib:AddTaskDaily",	{TaskVarIdx_CangBaoTu,1} },
	--	{"PlayerFunLib:AddTaskDaily",	{TaskVarIdx_XinXiaLinMax,1} },
	},
}
tbConfig[12] = --Ò»¸öÏ¸½Ú
{
	nId = 12,
	szMessageType = "nil",
	szName = "É±ËÀBOSS(ÔÝÎÞ)",
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
	szMessageType = "ClickNpc",
	szName = "Mçi ngµy lªn m¹ng lÜnh th­ëng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"LÔ Quan"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		--{"AddDialogOpt",	{"NhËn hµnh hiÖp lÖnh",14} },
	},
}
tbConfig[14] = --Ò»¸öÏ¸½Ú
{
	nId = 14,
	szMessageType = "nil",
	szName = "NhËn hµnh hiÖp lÖnh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_GetEveryDay,0,"Ng­¬i ®· nhËn råi!","=="} },
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_XinXiaLinMax,25,format("Mçi ngµy chØ ®­îc nhËn nhiÒu nhÊt %d Hµnh hiÖp kú, h«m ng­¬i ®· nhËn ®ñ råi, ngµy mai l¹i ®Õn nhÐ.", 25),"<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"Hµnh trang cña b¹n kh«ng cßn chç trèng, phÇn th­ëng lÇn nµy kh«ng nhËn ®­îc"} },
	},
	tbActition = 
	{
		--{"PlayerFunLib:GetItem",	{{tbProp={6,1,2566,1,0,0},},2,"Mçi ngµy lªn m¹ng lÜnh th­ëng"} },
	--	{"PlayerFunLib:AddTaskDaily",	{TaskVarIdx_GetEveryDay,2} },
		--{"PlayerFunLib:AddTaskDaily",	{TaskVarIdx_XinXiaLinMax,2} },
	},
}
