-- 增加内功伤害的技能级别公式
-- 内功伤害增加（百分比）公式：逐级递增10%内功伤害
-- 内功伤害增加（数值）公式：逐级递增10点内功伤害

Include("\\script\\skill\\param2string.lua")

DEFAULT_ENHANCE_TIME = 10 * 60 * 18;	-- 默认内功伤害增加状态维持时间（10分钟），可根据具体使用需要在调用AddSkillState时指定时间
PERCENT_ENHANCE_PER_LEVEL = 10;			-- 一级技能对应的内功伤害提高的百分比
VALUE_ENHANCE_PER_LEVEL = 10;			-- 一级技能对应的内功伤害提高的数值

function GetSkillLevelData(levelname, data, level)
	if (levelname == "addphysicsmagic_p" or levelname == "addpoisonmagic_p" or levelname == "addcoldmagic_p" or levelname == "addfiremagic_p" or levelname == "addlightingmagic_p") then
		return GetStatusEnhance_P(level);
	end
	if (levelname == "addphysicsmagic_v" or levelname == "addpoisonmagic_v" or levelname == "addcoldmagic_v" or levelname == "addfiremagic_v" or levelname == "addlightingmagic_v") then
		return GetStatusEnhance_V(level);
	end
	strNull = "";
	return strNull
end

-- 内功伤害增加（百分比）公式
function GetStatusEnhance_P(level)
	local enhance_percent = PERCENT_ENHANCE_PER_LEVEL * level;
	return Param2String(enhance_percent, DEFAULT_ENHANCE_TIME, 0);
end

-- 内功伤害增加（数值）公式
function GetStatusEnhance_V(level)
	local enhance_value = VALUE_ENHANCE_PER_LEVEL * level;
	return Param2String(enhance_value, DEFAULT_ENHANCE_TIME, 0);
end