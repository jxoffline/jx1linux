function GetSkillLevelData(levelname, data, level)
	if (levelname == "attackspeed_v") then
		return Getattackspeed_v()
	end;
	if (levelname == "castspeed_v") then
		return Getcastspeed_v()
	end;


	return ""
end;

function Getattackspeed_v()
	return Param2String(20,10800,0)
end;

function Getcastspeed_v()
	return Param2String(20,10800,0)
end;
function Param2String(Param1, Param2, Param3)
	return Param1..","..Param2..","..Param3
end;

