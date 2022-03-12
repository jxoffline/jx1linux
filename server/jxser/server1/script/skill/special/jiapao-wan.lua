function GetSkillLevelData(levelname, data, level)
	if (levelname == "fastwalkrun_p") then
		return Getfastwalkrun_p()
	end;

	return ""
end;

function Getfastwalkrun_p()
	return Param2String(20,5400,0)
end;

function Param2String(Param1, Param2, Param3)
	return Param1..","..Param2..","..Param3
end;
