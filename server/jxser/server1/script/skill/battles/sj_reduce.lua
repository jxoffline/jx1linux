-- 减受伤动作、减中毒时间、减迟缓时间、减眩晕时间、增加致命一击抵抗的技能级别公式
-- 减受伤动作、减中毒时间、减迟缓时间、减眩晕时间、增加致命一击抵抗公式：逐级递增10点数值

Include("\\script\\skill\\param2string.lua")

DEFAULT_ENHANCE_TIME =60 * 18;	-- 默认增加状态维持时间（1分钟），可根据具体使用需要在调用AddSkillState时指定时间
VALUE_ENHANCE_PER_LEVEL = 10;			-- 一级技能对应的提高的数值

function GetSkillLevelData(levelname, data, level)
	if (levelname == "fasthitrecover_v") then
			return GetStatus_V(level);
	end
	if (levelname == "poisontimereduce_p") then
			return GetStatus_V(level);
	end
	if (levelname == "freezetimereduce_p") then
			return GetStatus_V(level);
	end
	if (levelname == "stuntimereduce_p") then
			return GetStatus_V(level);
	end
	if (levelname == "fatallystrikeres_p") then
			return GetStatus_V(level);
	end
	strNull = "";
	return strNull
end

-- 状态增加（数值）公式
function GetStatus_V(level)
	local enhance_value = VALUE_ENHANCE_PER_LEVEL * level;
	return Param2String(enhance_value, DEFAULT_ENHANCE_TIME, 0);
end

