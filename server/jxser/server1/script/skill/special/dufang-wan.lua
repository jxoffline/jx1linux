function GetSkillLevelData(levelname, data, level)
	if (levelname == "poisonres_p") then
		return Getpoisonres_p()
	end;
	if (levelname == "poisonres_yan_p") then
		return Getpoisonres_p()
	end;

	return ""
end;

function Getpoisonres_p()
	return Param2String(50,5400,0)
end;

function Param2String(Param1, Param2, Param3)
	return Param1..","..Param2..","..Param3
end;
