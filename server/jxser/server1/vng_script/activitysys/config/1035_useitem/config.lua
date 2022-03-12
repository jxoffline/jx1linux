Include("\\vng_script\\activitysys\\config\\1035_useitem\\variables.lua")
Include("\\vng_script\\activitysys\\config\\1035_useitem\\extend.lua")
Include("\\vng_script\\activitysys\\config\\1035_useitem\\awardlist.lua")
Include("\\vng_script\\vng_lib\\extpoint.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")

tbConfig = {}

tbConfig[1] = 
{
	nId = 1,
	szMessageType = "ItemScript",
	szName = "Sö dông ",
	nStartDate = nil,
	nEndDate  = 201601312400,
	tbMessageParam = {ITEM_HOPTMM},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },			
		{"PlayerFunLib:CheckFreeBagCell",{5,"Ph¶i cã Ýt nhÊt 5 « trèng míi cã thÓ nhËn th­ëng."} },			
	},
	tbActition = 
	{			
		{"PlayerFunLib:GetItem",	{ITEM_THAMMAYMAN,100,EVENT_LOG_TITLE,"USE - ITEM_HOPTMM"} },	
	},
}