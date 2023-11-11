--½ð¶§ºÍÒø¶§½Å±¾ÎÄ¼þ£¬Íæ¼ÒÊ¹ÓÃ½ð¶§¡¢Òø¶§ºóÄÜ¹»»ñµÃ¿ç·þÒøÁ½

Include("\\script\\trip\\define.lua")
Include("\\script\\lib\\log.lua")
local nMaxMoney = 1000000000

local tbItem2Jxb = 
{
	["6,1,3037"] = 10000000,
	["6,1,3036"] = 1000000,
}

function main(nItemIndex)
	
	local nTripMode = GetTripMode()
	if nTripMode ~= TRIP_MODE_CLIENT then--²»ÔÚÔ­·þ¾Í²»ÄÜÓÃ
		return 1
	end
	
	local szItemName = GetItemName(nItemIndex)
	local szKey = format("%d,%d,%d", GetItemProp(nItemIndex))
	local nJxb = %tbItem2Jxb[szKey]
	if not nJxb then
		return
	end
	local tbItem = {}
	tbItem.tbProp = {nG, nD, nParticulType, -1, -1, 0}
	local nCurJxb = GetTask(TSK_TRIP_MONEY) + nJxb
	if nCurJxb > %nMaxMoney then
		Talk(1, "", "Xin ®¹i hiÖp l­îng thø ng©n l­îng l­u tr÷ cña server liªn kÕt v­ît qu¸ 100.000 v¹n l­îng lµ qu¸ giíi h¹n")
		return 1
	end
	SetTask(TSK_TRIP_MONEY, nCurJxb)
	Msg2Player(format("Ng­¬i sö dông 1 c¸i %s nhËn ®­îc %d ng©n l­îng server liªn kÕt", szItemName, nJxb))
	tbLog:PlayerAwardLog("Trip", format("use %s", szItemName), "TRIP_MONEY", "", nJxb)	
end