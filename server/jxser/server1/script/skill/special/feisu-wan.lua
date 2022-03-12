function GetSkillLevelData(levelname, data, level)
	if (levelname == "attackspeed_v") then
		return Getattackspeed_v()
	end;
	
	if (levelname == "attackspeed_yan_v") then
		return Getattackspeed_v()
	end;
	
	return ""
end;

function Getattackspeed_v()
	return Param2String(50,5400,0)
end;

function Param2String(Param1, Param2, Param3)
	return Param1..","..Param2..","..Param3
end;
