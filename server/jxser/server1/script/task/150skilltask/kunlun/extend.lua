Include("\\script\\task\\150skilltask\\kunlun\\register.lua")
Include("\\script\\task\\150skilltask\\150skilltaskhead.lua")

pTask.tbFactSkill = {
	[9] = {[90] = {372, 375, 394}, [120] = {717},},
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
