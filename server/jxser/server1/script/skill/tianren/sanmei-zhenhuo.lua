function GetSkillLevelData(levelname, data, level)

if (levelname == "fireenhance_p") then
return Getfireenhance_p(level)
end;

str1 = ""
return str1
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;

function Getfireenhance_p(level)
result1 = 28+floor(level*3.5)
return Param2String(result1,-1,0)
end;

