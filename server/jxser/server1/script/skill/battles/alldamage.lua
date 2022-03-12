-- 眩晕、冰冻、中毒、减速等状态量的技能级别公式
-- 状态量增加（数值）公式：根据不同状态数值不同

Include("\\script\\skill\\param2string.lua")

function GetSkillLevelData(levelname, data, level)
		if (levelname == "stun_p") then
		return Getstun_P(level);
	end
	if (levelname == "colddamage_v") then
		return Getcolddamage_V(level);
	end
	if (levelname == "poisondamage_v") then
		return Getpoisondamage_V(level);
	end
	if (levelname == "fastwalkrun_p") then
		return Getfastwalkrun_P(level);
	end
	if (levelname == "meleedamagereturn_p") then
		return Getmeleedamagereturn_P(level);
	end
	if (levelname == "rangedamagereturn_p") then
		return Getrangedamagereturn_P(level);
	end	
	strNull = "";
	return strNull
end

-- 状态量增加（数值）公式
function Getstun_P(level)
	return Param2String(100, 5*18, 0);
end

function Getcolddamage_V(level)
	return Param2String(10, 10*18, 10);
end

function Getpoisondamage_V(level)
	return Param2String(200, 10*18, 18);
end

function Getfastwalkrun_P(level)
	return Param2String(-40, 10*18, 0);
end

function Getmeleedamagereturn_P(level)
	return Param2String(-20, 3*60*18, 0);
end	

function Getrangedamagereturn_P(level)
	return Param2String(-20, 3*60*18, 0);
end	