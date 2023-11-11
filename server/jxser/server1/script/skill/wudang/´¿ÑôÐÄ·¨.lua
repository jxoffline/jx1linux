function GetSkillLevelData(levelname, data, level)

if (levelname == "manamax_p") then
return Getmanamax_p(level)
end;


str1 = ""
return str1
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;

function Getmanamax_p(level)
result = 25+11*level
return Param2String(result,-1,0)
end;