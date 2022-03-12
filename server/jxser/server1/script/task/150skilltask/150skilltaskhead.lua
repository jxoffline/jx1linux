
function Check150SkillTaskCondition(tbFactSkill)
	tbFactSkill[10] = {[90] = {1364, 1382}, [120] = {1365},}
	tbFactSkill[11] = {[90] = {1967, 1969}, [120] = {1984},}
	if GetLevel() < 150 then
		return
	end
	local nFact = GetLastFactionNumber()
	if nFact == nil then
		return
	end
	local tbFact = tbFactSkill[nFact]
	if tbFact == nil then
		return
	end
	local nFlag = 0
	for i = 1, getn(tbFact[90]) do
		if HaveMagic(tbFact[90][i]) >= 0 then
			nFlag = 1
			break
		end
	end
	if nFlag == 0 then
		return
	end
	if HaveMagic(tbFact[120][1]) < 0 then
		return
	end
	return 1
end

