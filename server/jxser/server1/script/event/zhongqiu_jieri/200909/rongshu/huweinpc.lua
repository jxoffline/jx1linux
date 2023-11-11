Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
local _SetNpcAuraSkill = function(self)
	SetNpcAuraSkill(self.nNpcIndex, 964, self.nSkillLevel)
	
end
function OnTimer(nNpcIndex, nTimeOut)
	local tbSkill = 
	{
		{pFun = %_SetNpcAuraSkill, nNpcIndex = nNpcIndex, nSkillLevel = 1, nRate = 10},
		{pFun = %_SetNpcAuraSkill, nNpcIndex = nNpcIndex, nSkillLevel = 2, nRate = 20},
		{pFun = %_SetNpcAuraSkill, nNpcIndex = nNpcIndex, nSkillLevel = 3, nRate = 20},
		{pFun = %_SetNpcAuraSkill, nNpcIndex = nNpcIndex, nSkillLevel = 4, nRate = 20},
		{pFun = %_SetNpcAuraSkill, nNpcIndex = nNpcIndex, nSkillLevel = 5, nRate = 20},
		{pFun = %_SetNpcAuraSkill, nNpcIndex = nNpcIndex, nSkillLevel = 6, nRate = 10},
		{pFun = %_SetNpcAuraSkill, nNpcIndex = nNpcIndex, nSkillLevel = 7, nRate = 10},
	}
	local nJianGe = 5*60
	
	local nTt = 30*60
	
	if nTimeOut >= nTt * 18 then
		DelNpc(nNpcIndex)
		return 0
	end
	
	local nTimer = GetNpcParam(nNpcIndex, 1);
	local nCurTimer = nTimer + nJianGe + floor(nTimeOut / 18)
	
	
	if nCurTimer >= nTt then
		DelNpc(nNpcIndex)
		return 0
	end
	
	tbAwardTemplet:GiveAwardByList(tbSkill, "nil")
	while (nTimer + nJianGe <= nCurTimer) do
		nTimer = nTimer + nJianGe
	end
	SetNpcParam(nNpcIndex, 1, nTimer);
	SetNpcTimer(nNpcIndex, (nTimer + nJianGe - nCurTimer) * 18 )
	
end

function OnDeath(nNpcIndex)
	
	local nNpcId = GetNpcSettingIdx(nNpcIndex)
	local nX,nY,nMapIndex = GetNpcPos(nNpcIndex)
	local nTimeCount = GetNpcParam(nNpcIndex, 1)
	local tbNpc = {nNpcId = nNpcId, nLevel = 90, nIsboss = 1, szScriptPath = "\\script\\event\\zhongqiu_jieri\\200909\\rongshu\\huweinpc.lua", nTime = 5*60, tbNpcParam = {nTimeCount}, pCallBack = function (self, nNpcIndex) SetNpcAuraSkill(nNpcIndex, 964, random(1,7)) end}
	
	
	
	 basemission_CallNpc(tbNpc, SubWorldIdx2ID(nMapIndex), nX, nY)
end