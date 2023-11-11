function GetSkillLevelData(levelname, data, level)
	if (levelname == "fireres_p") then
		return Getfireres_p()
	end;
	if (levelname == "fireres_yan_p") then
		return Getfireres_p()
	end;

	return ""
end;

function Getfireres_p()
	return Param2String(50,5400,0)
end;

function Param2String(Param1, Param2, Param3)
	return Param1..","..Param2..","..Param3
end;
