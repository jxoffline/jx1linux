Include("\\script\\missions\\exptree\\exptree.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\npcdailog.lua")

function main()
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	
	local tbDailog = DailogClass:new(szNpcName)
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog)
	tbDailog:Show()
end

function OnTimer(nNpcIndex, nTimeOut)
	local TreeClass = ExpTree:GetClassByNpcIndex(nNpcIndex)
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	if TreeClass.nEndDate and TreeClass.nEndDate <= nCurDate then
		ExpTree:UnRegNpc(nNpcIndex)
		DelNpc(nNpcIndex)
		return
	end
	local nTime = TreeClass:GetNpcTimeInterval(nNpcIndex)
	TreeClass:ExecAction(nNpcIndex, nTime)
	if nTime then
		SetNpcTimer(nNpcIndex, 18*nTime)
	end
end