Include("\\script\\task\\150skilltask\\tangmen\\register.lua")
Include("\\script\\task\\150skilltask\\150skilltaskhead.lua")

pTask.tbFactSkill = {
	[2] = {[90] = {339, 302, 342, 351,}, [120] = {710},},
}

function pTask:CheckMissionCondition()
	return %Check150SkillTaskCondition(self.tbFactSkill)
end