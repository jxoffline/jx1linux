-- 增加血量、内力等状态量的技能级别公式
-- 状态量增加（数值）公式：逐级递增500点状态量（一次增加）

Include("\\script\\skill\\param2string.lua")

DEFAULT_ENHANCE_TIME = 12;	-- 默认状态量提高状态维持时间（半秒），可根据具体使用需要在调用AddSkillState时指定时间
VALUE_ENHANCE_PER_LEVEL = 500;			-- 一级技能对应的状态量提高的数值

function GetSkillLevelData(levelname, data, level)
	if (levelname == "lifereplenish_v") then
		return GetStatusEnhance_V(level);
	end
	if (levelname == "manareplenish_v") then
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
