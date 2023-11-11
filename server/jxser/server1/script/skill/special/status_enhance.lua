-- 增加血量、内力、体力等状态量的技能级别公式
-- 状态量增加（百分比）公式：逐级递增50%状态量
-- 状态量增加（数值）公式：逐级递增50点状态量

Include("\\script\\skill\\param2string.lua")

DEFAULT_ENHANCE_TIME = 10 * 60 * 18;	-- 默认状态量提高状态维持时间（10分钟），可根据具体使用需要在调用AddSkillState时指定时间
PERCENT_ENHANCE_PER_LEVEL = 50;			-- 一级技能对应的状态量提高的百分比
VALUE_ENHANCE_PER_LEVEL = 50;			-- 一级技能对应的状态量提高的数值

function GetSkillLevelData(levelname, data, level)
	if (levelname == "lifemax_p" or levelname == "manamax_p") then
		return GetStatusEnhance_P(level);
	end
	if (levelname == "lifemax_v" or levelname == "manamax_v") then
		return GetStatusEnhance_V(level);
	end
	strNull = "";
	return strNull
end

-- 状态量增加（百分比）公式
function GetStatusEnhance_P(level)
	local enhance_percent = PERCENT_ENHANCE_PER_LEVEL * level;
	return Param2String(enhance_percent, DEFAULT_ENHANCE_TIME, 0);
end

-- 状态量增加（数值）公式
function GetStatusEnhance_V(level)
	local enhance_value = VALUE_ENHANCE_PER_LEVEL * level;
	return Param2String(enhance_value, DEFAULT_ENHANCE_TIME, 0);
end