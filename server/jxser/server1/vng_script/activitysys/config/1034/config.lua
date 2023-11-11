Include("\\vng_script\\activitysys\\config\\1034\\variables.lua")
Include("\\vng_script\\activitysys\\config\\1034\\extend.lua")
Include("\\vng_script\\activitysys\\config\\1034\\awardlist.lua")
Include("\\vng_script\\vng_lib\\extpoint.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")

tbConfig = {}

tbConfig[1] = 
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "when ServerStart",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		--{"ThisActivity:OnServerStart", {}},
	},
}
tbConfig[2] =
{
	nId = 2,
	szMessageType = "ClickNpc",
	szName = "Sø Gi¶ Trao Th­ëng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Sø Gi¶ Trao Th­ëng"},
	tbCondition =
	{		
		{"ThisActivity:CheckIsAccTDB2", {}},
	},
	tbActition =
	{			
		{"AddDialogOpt",	{"NhËn Danh HiÖu TuyÖt §Ønh Bang",3} },		
	},
}

tbConfig[3] = 
{
	nId = 3,
	szMessageType = "nil",
	szName = "NhËn th­ëng Danh HiÖu",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition =
	{	
		{"ThisActivity:CheckIsAccTDB2", {}},
	},
	tbActition =
	{			
		{"ThisActivity:GetTitle_TDB_2", {}},
	},
}