Include("\\script\\task\\150skilltask\\wudu\\register.lua")
Include("\\script\\task\\150skilltask\\150skilltaskhead.lua")

pTask.tbFactSkill = {
	[3] = {[90] = {353, 355, 390}, [120] = {711},},
}

function pTask:CheckMissionCondition()
	return %Check150SkillTaskCondition(self.tbFactSkill)
end