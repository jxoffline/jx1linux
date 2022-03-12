Include("\\vng_script\\activitysys\\config\\1032_questdaily\\extend.lua")
Include("\\script\\lib\\log.lua")

tbConfig = {}

tbConfig[1] = --§¸nh qu¸i
{
	nId = 1,
	szMessageType = "NpcOnDeath",
	szName = "Tiªu diÖt qu¸i",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckInMapQuestDaily",	{nil} },
	},
	tbActition = 
	{
		{"ThisActivity:AddNumKillNPC",	{nil} },
	},
}
tbConfig[2] = 
{
	nId = 2,
	szMessageType = "ItemScript",
	szName = "Sö dông ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_LB_NANGDONG},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_LB_NANG_DONG, MAX_USE_LB, "Mçi ngµy chØ sö dông ®­îc 2 lÇn.", "<"}},	
	},
	tbActition = 
	{			
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_LIMIT_USE_LB_NANG_DONG, 1}},
		{"tbLog:PlayerActionLog",{EVENT_LOG_TITLE,"USE_ITEM_LB_NANGDONG"}}	,
		{"Talk",{1,"","Sö dông LÖnh bµi n¨ng ®éng t¨ng giíi h¹n nhiÖm vô h»ng ngµy thªm 10 nhiÖm vô."}},
		{"Msg2Player",{"Sö dông LÖnh Bµi N¨ng §éng thµnh c«ng."}},
	},
}
tbConfig[3] = 
{
	nId = 3,
	szMessageType = "ItemScript",
	szName = "Sö dông ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_HOAN_THANH_NHIEM_VU},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {TASK_INFO_QUEST, 1, "Ch­a nhËn nhiÖm vô kh«ng thÓ sö dông.", "=="}},	
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {TASK_INFO_QUEST, 2, "§· hoµn thµnh nhiÖm vô, sö dông sÏ bÞ l·ng phÝ.", "<= "}},	
	},
	tbActition = 
	{			
		{"tbVNG_BitTask_Lib:setBitTask", {TASK_INFO_QUEST, 2}},
		{"tbLog:PlayerActionLog",{EVENT_LOG_TITLE,"USE_ITEM_HOAN_THANH_NHIEM_VU"}}	,
		{"Talk",{1,"","Hoµn thµnh nhiÖm vô ®­îc giao, nhanh chãng vÒ nhËn th­ëng.."}},
		{"Msg2Player",{"Hoµn thµnh nhiÖm vô ®­îc giao."}},
	},
}
