Include("\\script\\activitysys\\config\\7\\variables.lua")
tbConfig = {}
tbConfig[1] = --Ò»¸öÏ¸½Ú
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "server start",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"NpcFunLib:AddDialogNpc",	{NPC_SHIJIANZONGGUAN,NPCID_SHIJIANZONGGUAN,{POS_NPC_1, POS_NPC_2,POS_NPC_3}} },
	},
}
