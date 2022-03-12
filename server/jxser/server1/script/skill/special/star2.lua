-- renbin 

function GetSkillLevelData(levelname, data, level)

	if (levelname == "lucky_v") then
		return Getlucky_v(level)
	end;

	str1 = ""
	return str1
	
end

function Param2String(Param1, Param2, Param3)
	
	return Param1..","..Param2..","..Param3

end;

function Getlucky_v(level)

	return Param2String(0,64800,0)

end;
