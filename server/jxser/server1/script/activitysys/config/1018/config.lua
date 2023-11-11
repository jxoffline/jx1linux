Include("\\script\\activitysys\\config\\1018\\variables.lua")
tbConfig = {}
tbConfig[1] =
{
	nId = 1,
	szMessageType = "FinishSongJin",
	szName = "songjin 1000",
	nStartDate = 201304080000,
	nEndDate  = 201304142400,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{"751",1000,"",">="} },		
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_1,30,EVENT_LOG_TITLE,"TongKim1000"} },
	},
}
tbConfig[2] =
{
	nId = 2,
	szMessageType = "Chuanguan",
	szName = "KÕt thóc mçi ¶i",
	nStartDate = 201304080000,
	nEndDate  = 201304142400,
	tbMessageParam = {nil},
	tbCondition = 
	{		
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_1,1, EVENT_LOG_TITLE, "VuotQuaMoiAiCOT"} },
	},
}
tbConfig[3] =
{
	nId = 3,
	szMessageType = "NpcOnDeath",
	szName = "kill_boat_boss",
	nStartDate = 201304080000,
	nEndDate  = 201304142400,
	tbMessageParam = {nil},
	tbCondition = 
	{		
		{"NpcFunLib:CheckBoatBoss",	{nil} },		
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_1,10,EVENT_LOG_TITLE,"ThuyTacDauLinh"} },
	},
}
tbConfig[4] =
{
	nId = 4,
	szMessageType = "NpcOnDeath",
	szName = "kill_boat_big_boss",
	nStartDate = 201304080000,
	nEndDate  = 201304142400,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckId",	{"1692"} },		
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_1,20,EVENT_LOG_TITLE,"ThuyTacDaiDauLinh"} },
	},
}
tbConfig[5] =
{
	nId = 5,
	szMessageType = "YDBZguoguan",
	szName = "YanDi",
	nStartDate = 201304080000,
	nEndDate  = 201304142400,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MATERIAL_1,5,EVENT_LOG_TITLE,"VuotQuaMoiAiVD"} },
	},
}
tbConfig[6] =
{
	nId = 6,
	szMessageType = "ClickNpc",
	szName = "BÊm vµo Ch­ëng §¨ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Ch­ëng §¨ng Cung N÷"},
	tbCondition = 
	{
	},
	tbActition = 
	{		
		{"AddDialogOpt",	{"Nép LÖnh Bµi TiÕn Cö",7} },
	},
}
tbConfig[7] =
{
	nId = 7,
	szMessageType = "CreateDialog",
	szName = "§èi tho¹i nép lÖnh bµi",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Ta phô tr¸ch sù kiÖn tiÕn cö cö bang héi cho gi¶i ®Êu Thiªn H¹ §Ö NhÊt Bang 13, ng­êi t×m ta cã ph¶i lµ muèn tham gia?",0},
	tbCondition = 
	{
	},
	tbActition = 
	{		
		{"AddDialogOpt",	{"Ta muèn nép LÖnh Bµi TiÕn Cö cho bang",8} },
		{"AddDialogOpt",	{"Xem b¶ng xÕp h¹ng 10 bang ®øng ®Çu",9} },			
	},
}
tbConfig[8] =
{
	nId = 8,
	szMessageType = "CreateCompose",
	szName = "giao nép lÖnh bµi",
	nStartDate = 201304080000,
	nEndDate  = 201304142400,
	tbMessageParam = {"<npc>Nép vËt phÈm",1,1,1,0},
	tbCondition = 
	{			
		{"AddOneMaterial",	{"LÖnh Bµi TiÕn Cö THDNB 13",{tbProp={6,1,30407,1,0,0},},1} },		
		{"ThisActivity:GiveItemCheckTime",	{nil} },
		{"ThisActivity:CheckTong",	{nil} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveItem",	{nil} },
	},
}
tbConfig[9] =
{
	nId = 9,
	szMessageType = "nil",
	szName = "xem b¶ng xÕp h¹ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{				
	},
	tbActition = 
	{
		{"ThisActivity:ShowTopList",	{nil} },
	},
}