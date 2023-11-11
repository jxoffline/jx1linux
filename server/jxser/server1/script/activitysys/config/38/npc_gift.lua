
Include("\\script\\activitysys\\playerfunlib.lua")

Include("\\script\\lib\\progressbar.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\config\\38\\award.lua")
Include("\\script\\activitysys\\config\\38\\extend.lua")

local AWARD_TABLE = tbAwardList["Gift_npc"] 
local nHideTime = 30

local _limit = function()
	if PlayerFunLib:CheckTotalLevel(150, "default", ">=") ~= 1 then
		return 1
	end
	
	if pActivity:CheckGifeGetDaily() ~= 1 then
		return 1
	end
end

local _OnBreak = function()
	Msg2Player("Thu thÀp Æ∑ bﬁ gi∏n Æoπn.")
end


local _GetAward = function(nNpcIndex, dwNpcId)
	if nNpcIndex <= 0 or GetNpcId(nNpcIndex) ~= dwNpcId then
		return
	end
	
	if IsNpcHide(nNpcIndex) == 1 then
--		Msg2Player("ƒ„µƒ≤…ºØ ß∞‹¡À°£")
		return 0
	end

	if PlayerFunLib:CheckFreeBagCell(1,"default") ~= 1 then
		return
	end
	if %_limit() then
		return
	end
	
	pActivity:GetNewYearGift()
	tbAwardTemplet:Give(%AWARD_TABLE, 1, {EVENT_LOG_TITLE, "get gift award by npc"})
	
	HideNpc(nNpcIndex, %nHideTime * 18)
	
end 


function main()

	local nNpcIndex = GetLastDiagNpc()
	local dwNpcId = GetNpcId(nNpcIndex)
	
	if pActivity:ExpiredTime() == 1 then
		DelNpc(nNpcIndex)
		return 
	end
	
	if %_limit() then
		return
	end
	tbProgressBar:OpenByConfig(13, %_GetAward, {nNpcIndex, dwNpcId}, %_OnBreak)
end



