-- 增加血量、内力等状态量上限的技能级别公式
-- 状态量上限增加（数值）公式：逐级递增100点状态量

Include("\\script\\skill\\param2string.lua")

DEFAULT_ENHANCE_TIME = 30*18;	-- 默认状态量提高状态维持时间（30秒），可根据具体使用需要在调用AddSkillState时指定时间
VALUE_ENHANCE_PER_LEVEL = 100;			-- 一级技能对应的状态量提高的数值

function GetSkillLevelData(levelname, data, level)
	if (levelname == "lifemax_v") then
		return GetStatusEnhance_V(level);
	end
	if (levelname == "manamax_v") then
		return GetStatusEnhance_V(level);
	end
	if (levelname == "lifemax_yan_v") then
		return GetStatusEnhance_V(level);
	end
	if (levelname == "manamax_v") then
		return GetStatusEnhance_V(level);
	end
	strNull = "";
	return strNull
end

-- 状态量增加（数值）公式
function GetStatusEnhance_V(level)
	local enhance_value = VALUE_ENHANCE_PER_LEVEL * level;
	return Param2String(enhance_value, DEFAULT_ENHANCE_TIME, 0);
end
