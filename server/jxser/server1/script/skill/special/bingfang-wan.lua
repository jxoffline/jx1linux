function GetSkillLevelData(levelname, data, level)
	if (levelname == "coldres_p") then
		return Getcoldres_p()
	end;
	if (levelname == "coldres_yan_p") then
		return Getcoldres_p()
	end;

	return ""
end;

function Getcoldres_p()
	return Param2String(50,5400,0)
end;

function Param2String(Param1, Param2, Param3)
	return Param1..","..Param2..","..Param3
end;
