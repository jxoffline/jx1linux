Include("\\vng_script\\activitysys\\config\\1021\\variables.lua")
Include("\\vng_script\\activitysys\\config\\1021\\awardlist.lua")
Include("\\vng_script\\activitysys\\config\\1021\\extend.lua")
Include("\\script\\lib\\awardtemplet.lua")

tbConfig = {}

tbConfig[1] = 
{
	nId = 1,
	szMessageType = "ClickNpc",
	szName = "click npc",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Thu«n H„a M∑ ßπi S≠"},
	tbCondition = 
	{
	},
	tbActition = 
	{		
		{"AddDialogOpt",	{"Thu«n h„a Phi V©n th«n m∑",2} },					
	},
}
tbConfig[2] =
{
	nId = 2,
	szMessageType = "nil",
	szName = "Thu«n h„a ng˘a phi v©n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCellWH",	{2,3,1,"default"} }
	},
	tbActition = 
	{		
		{"ThisActivity:ComposeHorse",{ID_PhiVan}},	
	},
}