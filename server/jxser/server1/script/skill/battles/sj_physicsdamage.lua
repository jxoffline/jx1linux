-- 增加外功伤害的技能级别公式
-- 外功伤害增加（数值）公式：逐级递增10点外功伤害
--	外功伤害增加（百分比）公式:逐级递增10%外功伤害

Include("\\script\\skill\\param2string.lua")

DEFAULT_ENHANCE_TIME = 60 * 18;	-- 默认外功伤害增加状态维持时间（1分钟），可根据具体使用需要在调用AddSkillState时指定时间
VALUE_ENHANCE_PER_LEVEL = 10;			-- 一级技能对应的内功伤害提高的数值和百分比

function GetSkillLevelData(levelname, data, level)
	if (levelname == "addphysicsdamage_v") then
			return GetStatusEnhance_V(level);
	end
	if (levelname == "addfiredamage_v") then
			return GetStatusEnhance_V(level);
	end
	if (levelname == "addlightingdamage_v") then
			return GetStatusEnhance_V(level);
	end
	if (levelname == "addpoisondamage_v") then
			return GetStatusPoisonEnhance_V(level);
	end
	if (levelname == "addcolddamage_v") then
			return GetStatusColdEnhance_V(level);
	end
	if (levelname == "addphysicsdamage_p") then
			return GetStatusEnhance_P(level);
	end
	strNull = "";
	return strNull
end

-- 外火、外雷伤害增加（数值）公式
function GetStatusEnhance_V(level)
	local enhance_value = VALUE_ENHANCE_PER_LEVEL * level;
	return Param2String(enhance_value, DEFAULT_ENHANCE_TIME, enhance_value);
end
--外普伤害增加（百分比）公式
function GetStatusEnhance_P(level)
	local enhance_value = VALUE_ENHANCE_PER_LEVEL * level;
	return Param2String(enhance_value, DEFAULT_ENHANCE_TIME, 6);
end

-- 外毒伤害增加（数值）公式
function GetStatusPoisonEnhance_V(level)
	local enhance_value = VALUE_ENHANCE_PER_LEVEL * level;
	return Param2String(enhance_value, DEFAULT_ENHANCE_TIME, 10);
end

-- 外冰伤害增加（数值）公式
function GetStatusColdEnhance_V(level)
	local enhance_value = VALUE_ENHANCE_PER_LEVEL * level;
	return Param2String(enhance_value, DEFAULT_ENHANCE_TIME, 0);
end