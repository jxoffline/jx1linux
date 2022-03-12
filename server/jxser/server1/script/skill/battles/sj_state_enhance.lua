-- 增加跑速、攻速、闪避、命中等状态量的技能级别公式
-- 状态量增加（百分比）公式：逐级递增50%状态量
-- 状态量增加（数值）公式：逐级递增50点状态量

Include("\\script\\skill\\param2string.lua")

DEFAULT_ENHANCE_TIME = 3* 60 * 18;	-- 默认内功伤害增加状态维持时间（3分钟），可根据具体使用需要在调用AddSkillState时指定时间
VALUE_ENHANCE_PER_LEVEL = 10;			-- 一级技能对应的内功伤害提高的数值
PERCENT_ENHANCE_PER_LEVEL = 10;			-- 一级技能对应的状态量提高的百分比

function GetSkillLevelData(levelname, data, level)
	if (levelname == "fastwalkrun_p") then
	 		return GetStatusEnhance_P(level);
	end
	if (levelname == "adddefense_v") then
	 		return GetStatusEnhance_V(level);
	end
	if (levelname == "attackratingenhance_v") then
	 		return GetStatusEnhance_V(level);
	end
	if (levelname == "attackspeed_v") then
	 		return GetStatusEnhance_V(level);
	end
	if (levelname == "castspeed_v") then
	 		return GetStatusEnhance_V(level);
	end	
	if (levelname == "attackspeed_yan_v") then
	 		return GetStatusEnhance_V(level);
	end
	if (levelname == "castspeed_yan_v") then
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