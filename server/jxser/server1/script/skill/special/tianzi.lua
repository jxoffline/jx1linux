TAB_SKILL = {
	-- 天子技能
	emperor =
	{
		allres_p 	= {5, -1, -1},		-- 提高全抗5%（无限时）
		allskill_v  = {1, -1, 0},		-- 全系技能＋1
	},
	-- 皇帝（国主）技能
	king =
	{
		allskill_v = {1, -1, 0},		-- 全系技能＋1
	},
	-- 大丞相技能
	minister =
	{
		lifemax_p = {3, -1, -1},		-- 血量提升3%
		manamax_p = {3, -1, -1},		-- 内力提升3%
	},
	-- 兵马大元帅技能
	marshal =
	{
		physicsres_p = {20, -1, -1},	-- 提高普防20%
		allskill_v	 = {1, -1, 0},		-- 全系技能＋1
	},
	-- 先锋官技能
	pioneer =
	{
		allskill_v	= {1, -1, 0},		-- 全系技能＋1
	},
}

-----------------------------------------------------------
--函数GetSkillLevelData(levelname, data, level)
--levelname：魔法属性名称
--data：技能名称
--level：技能等级
--return：当技能名称为data，技能等级为level
--			时的魔法属性levelname所需求的三个参数的具体值
-----------------------------------------------------------
function GetSkillLevelData(levelname, data, level)
	local skill = TAB_SKILL[data]
	if (not skill) then
		return ""
	end
	local tb = skill[levelname]
	if (not tb) then
		return ""
	end
	return format("%d,%d,%d", tb[1], tb[2], tb[3])
end
