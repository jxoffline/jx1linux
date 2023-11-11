function GetSkillLevelData(levelname, data, level)
	if (levelname == "attackratingenhance_v") then
		return Getattackratingenhance_v()
	end;

	return ""
end;

function Getattackratingenhance_v()
	return Param2String(500,5400,0)
end;

function Param2String(Param1, Param2, Param3)
	return Param1..","..Param2..","..Param3
end;
