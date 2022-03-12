-- 增加血量、内力等状态量上限的技能级别公式
-- 状态量上限增加（数值）公式：逐级递增100点状态量

Include("\\script\\skill\\param2string.lua")

DEFAULT_ENHANCE_TIME = 5*60*18;	-- 默认状态量提高状态维持时间（300秒），可根据具体使用需要在调用AddSkillState时指定时间

function GetSkillLevelData(levelname, data, level)
	if (levelname == "lifemax_p") then
		return GetLife_P(level);
	end
	if (levelname == "allres_p") then
		return GetRes_P(level);
	end
	strNull = "";
	return strNull
end

-- 状态量增加（数值）公式
function GetLife_P(level)
	local life_add = 10 + 10*level
	return Param2String(life_add, DEFAULT_ENHANCE_TIME, 0);
end

function GetRes_P(level)
	local res_add = 5*(level-1)
	return Param2String(res_add, DEFAULT_ENHANCE_TIME, 0);
end