function GetSkillLevelData(levelname, data, level)

if (levelname == "lifemax_p") then
return Getlifemax_p(level)
end;

str1 = ""
return str1
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;

function Getlifemax_p(level)
result = 25+level*5
return Param2String(result,100,0)
end;