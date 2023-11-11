Include("\\script\\task\\150skilltask\\emei\\register.lua")
Include("\\script\\task\\150skilltask\\150skilltaskhead.lua")

pTask.tbFactSkill = {
	[4] = {[90] = {380, 328, 332}, [120] = {712},},
}

function pTask:CheckMissionCondition()
	return %Check150SkillTaskCondition(self.tbFactSkill)
end

function pTask:Talk(szMsg)
	Talk(1, "", szMsg)
end

local _OnBreak = function(nNpcIndex)
	Msg2Player("Thu thËp ®øt ®o¹n")
end

local _GetAward = function(nNpcIndex, dwNpcID, nAddStepNum, nTaskId, szTaskName, nGotoDetailId)
	if nNpcIndex == nil then
		Msg2Player("Ng­¬i thu thËp thÊt b¹i.")
		return 0
	end
	
	if nNpcIndex <= 0 or GetNpcId(nNpcIndex) ~= dwNpcID then
		Msg2Player("Ng­¬i thu thËp thÊt b¹i.")
		return 0
	end	
	
	if IsNpcHide(nNpcIndex) == 1 then
		Msg2Player("Ng­¬i thu thËp thÊt b¹i.")
		return 0
	end
	
	if PlayerFunLib:CheckFreeBagCell(1,"Hµnh trang kh«ng ®ñ") ~= 1 then
		return 0
	end
	
	Msg2Player("Thu thËp kÕt thóc!")
	
	local tbAward = {}
	tbAward = {
		{szName = "Triªm TuyÕt B¨ng Liªn", tbProp = {6, 1, 2911, 1, 0, 0}, nBindState = -2,},
	}
	tbAwardTemplet:GiveAwardByList(tbAward, "NhiÖm vô kü n¨ng cÊp 150 ph¸i Nga My thu thËp nhËn ®­îc ®¹o cô Triªm TuyÕt B¨ng Liªn")
	G_TASK:ExecEx(szTaskName, nGotoDetailId, nAddStepNum, nTaskId)
	HideNpc(nNpcIndex, 20 * 18)
end 

function pTask:GetBingLian(nAddStepNum, nTaskId, szTaskName, nGotoDetailId)
	local nNpcIndex = GetLastDiagNpc()
	local dwNpcIndex = GetNpcId(nNpcIndex)
	
	Msg2Player("B¾t ®Çu thu ho¹ch")
	tbProgressBar:OpenByConfig(2, %_GetAward, {nNpcIndex, dwNpcIndex, nAddStepNum, nTaskId, szTaskName, nGotoDetailId}, %_OnBreak, {nNpcIndex})
end