function GetSkillLevelData(levelname, data, level)
	if (levelname == "lifemax_v") then
		return Getlifemax_v()
	end;
	
	if (levelname == "lifemax_yan_v") then
		return Getlifemax_v()
	end;
	
	return ""
end;

function Getlifemax_v()
	return Param2String(500,5400,0)
end;

function Param2String(Param1, Param2, Param3)
	return Param1..","..Param2..","..Param3
end;
