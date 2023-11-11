
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\progressbar.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\config\\2\\variables.lua")
Include("\\script\\activitysys\\config\\2\\award.lua")
Include("\\script\\activitysys\\config\\2\\head.lua")

local _limit = function()
	if GetLevel() < 150 and ST_GetTransLifeCount() == 0 then
		 Talk(1, "", format("§¼ng cÊp cña ®¹i hiÖp kh«ng ®ñ ®Ó thu thËp C©y Gi¸ng Sinh!"))
		 return 1
    end
	if pActivity:GetTaskDaily(%TSK_TREE_LIMIT) >= %MAX_TREE_LIMT then 
		Talk(1, "", format("H«m nay ®¹i hiÖp ®· thu thËp %d c©y råi, ngµy mai l¹i ®Õn nhÐ.", %MAX_TREE_LIMT))
		return 1
	end
	if PlayerFunLib:CheckFreeBagCell(1,"default") ~= 1 then
		return 1
	end
end

local _OnBreak = function()
	Msg2Player("Qu¸ tr×nh thu thËp bÞ gi¸n ®o¹n.")
end

local _GetAward = function(nNpcIndex, dwNpcId)
	if nNpcIndex <= 0 or GetNpcId(nNpcIndex) ~= dwNpcId then
		return
	end
	if PlayerFunLib:CheckFreeBagCell(1,"default") ~= 1 then
		return
	end
	if %_limit() then
		return
	end
	
	if GetNpcParam(nNpcIndex, 4) == 1 then
		return 
	end
	SetNpcParam(nNpcIndex, 4, 1)
	pActivity:AddTaskDaily(%TSK_TREE_LIMIT,1)
	tbAwardTemplet:Give(%tbTreeAwardList, 1, {EVENT_LOG_TITLE, "get tree award"})
	DelNpc(nNpcIndex)
	
end 



function main()

	local nNpcIndex = GetLastDiagNpc()
	local dwNpcId = GetNpcId(nNpcIndex)
	local nHM = tonumber(GetLocalDate("%H%M"))
	if nHM < 1900 or nHM >= 2400 then
		Talk(1 , "", "Mçi ngµy chØ cã thÓ nhËn th­ëng trong kho¶ng thêi gian tõ 19h ®Õn 24h, ®· qu¸ thêi gian nhËn th­ëng c©y biÕn mÊt.")
		DelNpc(nNpcIndex)
		return
	end
	if %_limit() then
		return
	end
	-- pActivity:AddTaskDaily(%TSK_TREE_LIMIT,1)
	tbProgressBar:OpenByConfig(13, %_GetAward, {nNpcIndex, dwNpcId}, %_OnBreak)
end



