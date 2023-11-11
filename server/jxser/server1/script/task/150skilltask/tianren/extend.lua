Include("\\script\\task\\150skilltask\\tianren\\register.lua")
Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\task\\150skilltask\\150skilltaskhead.lua")

pTask.tbFactSkill = {
	[7] = {[90] = {361, 362, 391}, [120] = {715},},
}

function pTask:CheckMissionCondition()
	return %Check150SkillTaskCondition(self.tbFactSkill)
end

function pTask:Talk(szMsg)
	Talk(1, "", szMsg)
end

function pTask:CheckNoItem(nG, nD, nP)
	local nItemCount = CalcItemCount(-1, nG, nD, nP, -1)
	if nItemCount > 0 then
		return 
	end
	return 1
end

function pTask:CheckItemNoMsg(tbParam)
	local tbItemList = tbParam
	for i = 1, getn(tbItemList) do
		local tbItem = tbItemList[i]
		local nCount = tbItem.nCount or 1
		local nItemCount = CalcItemCount(3, tbItem.tbProp[1], tbItem.tbProp[2], tbItem.tbProp[3], -1)
		if nItemCount < nCount then
			return
		end
	end
	return 1
end

function pTask:GotoDetailEX(szTaskName, nGotoDetailId, nAddStepNum, nTaskId)
	G_TASK:ExecEx(szTaskName, nGotoDetailId, nAddStepNum, nTaskId)
end