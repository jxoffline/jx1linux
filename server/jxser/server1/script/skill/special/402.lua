function GetSkillLevelData(levelname, data, level)
	if (levelname == "lifemax_p") then
		return Getlifemax_p()
	end;
	
	if (levelname == "manamax_p") then
		return Getmanamax_p()
	end;


	return ""
	end;

function Getlifemax_p()
	return Param2String(100,10800,0)
end;

function Getmanamax_p()
	return Param2String(100,10800,0)
end;

function Param2String(Param1, Param2, Param3)
	return Param1..","..Param2..","..Param3
end;

