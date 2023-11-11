

-------¾Ö²¿±äÁ¿¶¨Òå ¿ªÊ¼---------
local fn		= function(nItemIndex) local szMsg=format("Chóc mõng cao thñ %s ®· nhËn ®­îc %s",GetName(),GetItemName(nItemIndex)) AddGlobalNews(szMsg) Msg2SubWorld(szMsg) end
-------¾Ö²¿±äÁ¿¶¨Òå ½áÊø---------

tbConfig = {}
tbConfig[1] = --Ò»¸öÏ¸½Ú
{
	nId = 1,
	szMessageType = "CreateDialog",
	szName = "§æi hoµn mü hång ¶nh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>C¸c h¹ muèn ®æi lo¹i trang bÞ nµo?"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"§æi [Hoµn mü] Hång ¶nh hång tô chiªu",2} },
		{"AddDialogOpt",	{"§æi [Hoµn mü] Hång ¶nh qua kiÕm t©y ph­¬ng",3} },
		{"AddDialogOpt",	{"§æi [Hoµn mü] Hång ¶nh thÈm viªn uyÓn",4} },
		{"AddDialogOpt",	{"Ta muèn ®æi [Hoµn Mü] Hång ¶nh Môc Tóc",5} },
	},
}
tbConfig[2] = --Ò»¸öÏ¸½Ú
{
	nId = 2,
	szMessageType = "CreateCompose",
	szName = "§æi [Hoµn mü] Hång ¶nh hång tô chiªu",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"[Hoµn Mü] Hång ¶nh Hång Tô Chiªu",0,0,0,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Hoµn Mü Kim Bµi",{tbProp={6,1,2129,1,0,0},},50} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,437},nQuality=1,},1,"MidAutumn,Exchange"} },
	},
}
tbConfig[3] = --Ò»¸öÏ¸½Ú
{
	nId = 3,
	szMessageType = "CreateCompose",
	szName = "§æi [Hoµn mü] Hång ¶nh qua kiÕm t©y ph­¬ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"[Hoµn Mü] Hång ¶nh KiÕm Qua T©y Ph­¬ng",0,0,0,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Hoµn Mü Kim Bµi",{tbProp={6,1,2129,1,0,0},},50} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,435},nQuality=1,},1,"MidAutumn,Exchange"} },
	},
}
tbConfig[4] = --Ò»¸öÏ¸½Ú
{
	nId = 4,
	szMessageType = "CreateCompose",
	szName = "§æi [Hoµn mü] Hång ¶nh thÈm viªn uyÓn",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"[Hoµn Mü] Hång ¶nh TrÇm Viªn V·n Tóy",0,0,0,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Hoµn Mü Kim Bµi",{tbProp={6,1,2129,1,0,0},},50} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,434},nQuality=1,},1,"MidAutumn,Exchange"} },
	},
}
tbConfig[5] = --Ò»¸öÏ¸½Ú
{
	nId = 5,
	szMessageType = "CreateCompose",
	szName = "Ta muèn ®æi [Hoµn Mü] Hång ¶nh Môc Tóc",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"[Hoµn Mü] Hång ¶nh Môc Tóc T­¬ng Vong",0,0,0,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Hoµn Mü Kim Bµi",{tbProp={6,1,2129,1,0,0},},50} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,436},nQuality=1,},1,"MidAutumn,Exchange"} },
	},
}
tbConfig[6] = --Ò»¸öÏ¸½Ú
{
	nId = 6,
	szMessageType = "nil",
	szName = "§æi kim bµi thµnh trang bÞ hoµng kim",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ex_goldequp_coin",	{nil} },
	},
}
tbConfig[7] = --Ò»¸öÏ¸½Ú
{
	nId = 7,
	szMessageType = "CreateDialog",
	szName = "§æi cùc phÈm hång ¶nh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>C¸c h¹ muèn ®æi lo¹i trang bÞ nµo?"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Ta muèn ®æi [Cùc phÈm] Hång ¶nh Hång Tô Chiªu",8} },
		{"AddDialogOpt",	{"Ta muèn ®æi [Cùc phÈm] Hång ¶nh KiÕm Qua T©y Ph­¬ng",9} },
		{"AddDialogOpt",	{"Ta muèn ®æi [Cùc phÈm] Hång ¶nh TrÇm Viªn V·n Tóy",10} },
		{"AddDialogOpt",	{"Ta muèn ®æi [Cùc phÈm] Hång ¶nh Môc Tóc T­¬ng Vong",11} },
	},
}
tbConfig[8] = --Ò»¸öÏ¸½Ú
{
	nId = 8,
	szMessageType = "CreateCompose",
	szName = "Ta muèn ®æi [Cùc phÈm] Hång ¶nh Hång Tô Chiªu",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"[Cùc phÈm] Hång ¶nh Hång Tô Chiªu",0,0,0,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Hoµn Mü Kim Bµi",{tbProp={6,1,2129,1,0,0},},50} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,535},nQuality=1,CallBack=fn},1,"duihuan_jipinhongyin"} },
	},
}
tbConfig[9] = --Ò»¸öÏ¸½Ú
{
	nId = 9,
	szMessageType = "CreateCompose",
	szName = "Ta muèn ®æi [Cùc phÈm] Hång ¶nh KiÕm Qua T©y Ph­¬ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"[Cùc phÈm]Hång ¶nh KiÕm Qua T©y Ph­¬ng",0,0,0,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Hoµn Mü Kim Bµi",{tbProp={6,1,2129,1,0,0},},50} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,533},nQuality=1,CallBack=fn},1,"duihuan_jipinhongyin"} },
	},
}
tbConfig[10] = --Ò»¸öÏ¸½Ú
{
	nId = 10,
	szMessageType = "CreateCompose",
	szName = "Ta muèn ®æi [Cùc phÈm] Hång ¶nh TrÇm Viªn V·n Tóy",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"[Cùc phÈm] Hång ¶nh TrÇm Viªn V·n Tóy",0,0,0,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Hoµn Mü Kim Bµi",{tbProp={6,1,2129,1,0,0},},50} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,532},nQuality=1,CallBack=fn,},1,"duihuan_jipinhongyin"} },
	},
}
tbConfig[11] = --Ò»¸öÏ¸½Ú
{
	nId = 11,
	szMessageType = "CreateCompose",
	szName = "Ta muèn ®æi [Cùc phÈm] Hång ¶nh Môc Tóc T­¬ng Vong",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"[Cùc phÈm] Hång ¶nh Môc Tóc T­¬ng Vong",0,0,0,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Hoµn Mü Kim Bµi",{tbProp={6,1,2129,1,0,0},},50} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,534},nQuality=1,CallBack=fn,},1,"duihuan_jipinhongyin"} },
	},
}
tbConfig[12] = --Ò»¸öÏ¸½Ú
{
	nId = 12,
	szMessageType = "ClickNpc",
	szName = "BÊm vµo LÔ Quan",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"LÔ Quan"},
	tbCondition = 
	{
		{"NpcFunLib:IsInCity",	{nil} },
	},
	tbActition = 
	{
--Change request 04/06/2011, ®ãng chÕ t¹o trang bÞ b¹ch kim - Modified by DinhHQ - 20110605
--		{"AddDialogOpt",	{"§æi kim bµi thµnh trang bÞ hoµng kim",6} },
--		{"AddDialogOpt",	{"§æi cùc phÈm hång ¶nh",7} },
--		{"AddDialogOpt",	{"§æi hoµn mü hång ¶nh",1} },
--		{"AddDialogOpt",	{"§æi kim bµi trang bÞ hoµng kim (tiÕp theo)",13} },
	},
}
tbConfig[13] = --Ò»¸öÏ¸½Ú
{
	nId = 13,
	szMessageType = "nil",
	szName = "§æi kim bµi trang bÞ hoµng kim (tiÕp theo)",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ex_goldequp_coin_2",	{nil} },
	},
}
