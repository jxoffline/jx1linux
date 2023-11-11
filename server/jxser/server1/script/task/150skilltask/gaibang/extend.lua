Include("\\script\\task\\150skilltask\\gaibang\\register.lua")
Include("\\script\\task\\150skilltask\\150skilltaskhead.lua")

pTask.tbFactSkill = {
	[6] = {[90] = {357, 359}, [120] = {714},},
}

function pTask:CheckMissionCondition()
	return %Check150SkillTaskCondition(self.tbFactSkill)
end

function pTask:Talk(szMsg)
	Talk(1, "", szMsg)
end

local _OnBreak = function(nNpcIndex)
	Msg2Player("TrÞ th­¬ng cña ng­¬i bÞ ®øt ®o¹n")
end

local _GetAward = function(nNpcIndex, dwNpcID, nAddStepNum, nTaskId, szTaskName, nGotoDetailId)
	if nNpcIndex == nil then
		Msg2Player("TrÞ th­¬ng cña ng­¬i thÊt b¹i.")
		return 0
	end
	
	if nNpcIndex <= 0 or GetNpcId(nNpcIndex) ~= dwNpcID then
		Msg2Player("TrÞ th­¬ng cña ng­¬i thÊt b¹i.")
		return 0
	end	
	
	Msg2Player("TrÞ liÖu hoµn tÊt!")
	G_TASK:ExecEx(szTaskName, nGotoDetailId, nAddStepNum, nTaskId)
end 


function pTask:Treat(nAddStepNum, nTaskId, szTaskName, nGotoDetailId)
	local nNpcIndex = GetLastDiagNpc()
	local dwNpcIndex = GetNpcId(nNpcIndex)
	Msg2Player("B¾t ®Çu trÞ liÖu")
	tbProgressBar:OpenByConfig(9, %_GetAward, {nNpcIndex, dwNpcIndex, nAddStepNum, nTaskId, szTaskName, nGotoDetailId}, %_OnBreak, {nNpcIndex})
end