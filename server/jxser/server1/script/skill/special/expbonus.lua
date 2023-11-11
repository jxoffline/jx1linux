function GetSkillLevelData(levelname, data, level)

if (levelname == "expenhance_p") then
	return Param2String(level*100,64800,0);
end;

str1 = ""
return str1
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;
