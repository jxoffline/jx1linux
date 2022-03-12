Include("\\script\\activitysys\\config\\29\\variables.lua")
tbConfig = {}
tbConfig[1] = --Ò»¸öÏ¸½Ú
{
	nId = 1,
	szMessageType = "ClickNpc",
	szName = "Click vµo ng­êi lÝnh",
	nStartDate = nil,
	nEndDate  = nil,
--Move soldier's action to soldier statue - Modified by DinhHQ - 20110425
	tbMessageParam = {"T­îng §µi"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"TÆng Hoa Lan",2} },
--		{"SetDialogTitle",	{"<npc>22/04/2011~22/05, Nh©n sü cÊp 120 trë lªn cã thÓ tÆng Hoa Lan Rõng, Tói G¹o, ChiÕc ¸o cho ta, ta sÏ hËu ®·I ng­¬i chu ®¸o."} },
	},
}
tbConfig[2] = --Ò»¸öÏ¸½Ú
{
	nId = 2,
	szMessageType = "CreateCompose",
	szName = "TÆng Hoa Lan",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"",1,1,1,0},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{120,"§¼ng cÊp ch­a ®ñ 120",">="} },
		{"ThisActivity:CheckTaskDaily",	{TSK_IDX_DAILY_GIVE_LANHUA,MAX_GIVE_LANHUA_PERDAY,"H«m nay ®· giao ®ñ Hoa Lan Rõng råi","<"} },
		{"PlayerFunLib:CheckItemInBag",	{{tbProp={6,1,1977,1,0,0},},1,"Kh«ng ®ñ hoa lan rõng"} },
		{"AddOneMaterial",	{"Hoa Lan",{tbProp={6,1,1977,1,0,0},},1} },
		{"ThisActivity:Vng_LanHua_Limit",	{nil} },
	},
	tbActition = 
	{
		{"ThisActivity:Vng_OnGiveLanHua",	{nil} },
	},
}
tbConfig[3] = --Ò»¸öÏ¸½Ú
{
	nId = 5,
	szMessageType = "ServerStart",
	szName = "Sever më sÏ ®¨ng t¶i NPC",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:AddInitNpc",	{nil} },
	},
}
