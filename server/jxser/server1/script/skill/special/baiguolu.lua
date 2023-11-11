function GetSkillLevelData(levelname, data, level)

if (levelname == "allres_p") then
	return Param2String(15,64800,0)
end;

if (levelname == "allres_yan_p") then
	return Param2String(15,64800,0)
end;

str1 = ""
return str1
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;
