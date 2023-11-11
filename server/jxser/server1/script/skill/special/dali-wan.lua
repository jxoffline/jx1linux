function GetSkillLevelData(levelname, data, level)
	if (levelname == "addphysicsdamage_v") then
		return Getaddphysicsdamage_v()
	end;

	return ""
end;

function Getaddphysicsdamage_v()
	return Param2String(100,5400,0)
end;

function Param2String(Param1, Param2, Param3)
	return Param1..","..Param2..","..Param3
end;
