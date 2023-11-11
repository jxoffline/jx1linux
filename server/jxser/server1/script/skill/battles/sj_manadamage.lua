-- 增加内功伤害的技能级别公式
-- 内功伤害增加（数值）公式：逐级递增10点内功伤害

Include("\\script\\skill\\param2string.lua")

DEFAULT_ENHANCE_TIME = 60 * 18;	-- 默认内功伤害增加状态维持时间（1分钟），可根据具体使用需要在调用AddSkillState时指定时间
VALUE_ENHANCE_PER_LEVEL = 10;			-- 一级技能对应的内功伤害提高的数值

function GetSkillLevelData(levelname, data, level)
	if (levelname == "addphysicsmagic_v") then
	 		return GetStatusEnhance_V(level);
	end
	if (levelname == "addpoisonmagic_v") then
	 		return GetStatusPoisonEnhance_V(level);
	end
	if (levelname == "addcoldmagic_v") then
	 		return GetStatusEnhance_V(level);
	end
	if (levelname == "addfiremagic_v") then
	 		return GetStatusEnhance_V(level);
	end
	if (levelname == "addlightingmagic_v") then
	 		return GetStatusEnhance_V(level);
	end
	strNull = "";
	return strNull
end

-- 内普、内火、内冰、内雷伤害增加（数值）公式
function GetStatusEnhance_V(level)
	local enhance_value = VALUE_ENHANCE_PER_LEVEL * level;
	return Param2String(enhance_value, DEFAULT_ENHANCE_TIME, enhance_value);
end

-- 内毒伤害增加（数值）公式
function GetStatusPoisonEnhance_V(level)
	local enhance_value = VALUE_ENHANCE_PER_LEVEL * level;
	return Param2String(enhance_value, DEFAULT_ENHANCE_TIME, 10);
end