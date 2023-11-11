-- 持续增加防御的技能级别公式
-- 持续状态量增加公式：逐级递增10点百分比（持续增加）

Include("\\script\\skill\\param2string.lua")

DEFAULT_ENHANCE_TIME = 60*18;	-- 默认状态量提高状态维持时间（1分钟），可根据具体使用需要在调用AddSkillState时指定时间
VALUE_ENHANCE_PER_LEVEL = 10;			-- 一级技能对应的状态量提高的百分比数值

function GetSkillLevelData(levelname, data, level)
	if (levelname == "physicsres_p")	then
			return GetStatus_V(level);
	end
	if (levelname == "poisonres_p")	then
			return GetStatus_V(level);
	end
	if (levelname == "coldres_p")	then
			return GetStatus_V(level);
	end
	if (levelname == "fireres_p")	then
			return GetStatus_V(level);
	end
	if (levelname == "lightingres_p") then
			return GetStatus_V(level);
	end
	if (levelname == "allres_p") then
			return GetStatus_V(level);
	end
	
	if (levelname == "physicsres_yan_p")	then
			return GetStatus_V(level);
	end
	if (levelname == "poisonres_yan_p")	then
			return GetStatus_V(level);
	end
	if (levelname == "coldres_yan_p")	then
			return GetStatus_V(level);
	end
	if (levelname == "fireres_yan_p")	then
			return GetStatus_V(level);
	end
	if (levelname == "lightingres_yan_p") then
			return GetStatus_V(level);
	end
	if (levelname == "allres_yan_p") then
			return GetStatus_V(level);
	end
	strNull = "";
	return strNull
end

-- 状态量增加（数值）公式
function GetStatus_V(level)
	local enhance_value = VALUE_ENHANCE_PER_LEVEL * level;
	return Param2String(enhance_value, DEFAULT_ENHANCE_TIME, 0);
end