Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\progressbar.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\config\\40\\head.lua")

nHideTime = 60
nHideTimeParam = 1

local _limit = function()
	if PlayerFunLib:CheckTotalLevel(150, "default", ">=") ~= 1 then
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

	if GetNpcParam(nNpcIndex, %nHideTimeParam) + %nHideTime > GetCurServerTime() then
		return 0
	end
	
	if IsNpcHide(nNpcIndex) == 1 then
		return 0
	end

	if PlayerFunLib:CheckFreeBagCell(1,"default") ~= 1 then
		return
	end
	
	if %_limit() then
		return
	end
	
	HideNpc(nNpcIndex, %nHideTime * 18)
	SetNpcParam(nNpcIndex, %nHideTimeParam, GetCurServerTime())
	
	givegrassaward()
end 

function givegrassaward()
	tbAward = {
		{szName="C· Xanh",tbProp={6,1,3124,1,0,0},nExpiredTime=20120401,},
	}
	tbAwardTemplet:Give(tbAward, 1, {%EVENT_LOG_TITLE, "click_npc_named_grass"})
end

function main()

	local nNpcIndex = GetLastDiagNpc()
	local dwNpcId = GetNpcId(nNpcIndex)
	
	if pActivity:IsExpired() == 1 then
		DelNpc(nNpcIndex)
		return 
	end
	
	if %_limit() then
		return
	end
	
	tbProgressBar:OpenByConfig(7, %_GetAward, {nNpcIndex, dwNpcId}, %_OnBreak)
end



