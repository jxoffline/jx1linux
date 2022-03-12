

-------¾Ö²¿±äÁ¿¶¨Òå ¿ªÊ¼---------
-------¾Ö²¿±äÁ¿¶¨Òå ½áÊø---------

tbConfig = {}
tbConfig[1] = --Ò»¸öÏ¸½Ú
{
	nId = 1,
	szMessageType = "NpcOnDeath",
	szName = "BigBoss tö vong",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckName",	{"§éc C« Thiªn Phong"} },
	},
	tbActition = 
	{
		{"BigBoss:BigBossDeath",	{nil} },
	},
}
tbConfig[2] = --Ò»¸öÏ¸½Ú
{
	nId = 2,
	szMessageType = "nil",
	szName = "PhÇn th­ëng toµn server cña [§éc C« Thiªn Phong]",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"lib:CheckTimeAndWeekDay",	{2000,2100,"0,1,2,3,4,5,6","HiÖn t¹i kh«ng ph¶i lµ thêi gian lÜnh th­ëng"} },
		{"PlayerFunLib:CheckLevel",	{90,format("CÊp %d trë lªn míi cã thÓ nhËn th­ëng!",90),">="} },
	},
	tbActition = 
	{
		{"dostring",	{"Include([[\\script\\missions\\boss\\bigboss.lua]]); BigBoss:BigBossGlobalReward()"} },
	},
}
tbConfig[3] = --Ò»¸öÏ¸½Ú
{
	nId = 3,
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
		{"AddDialogOpt",	{"PhÇn th­ëng toµn server cña [§éc C« Thiªn Phong]",2} },
	},
}
