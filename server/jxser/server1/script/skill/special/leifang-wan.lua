function GetSkillLevelData(levelname, data, level)
	if (levelname == "lightingres_p") then
		return Getlightingres_p()
	end;
	if (levelname == "lightingres_yan_p") then
		return Getlightingres_p()
	end;

	return ""
end;

function Getlightingres_p()
	return Param2String(50,5400,0)
end;

function Param2String(Param1, Param2, Param3)
	return Param1..","..Param2..","..Param3
end;
