function GetSkillLevelData(levelname, data, level)

if (levelname == "staminareplenish_v") then
return Getstaminareplenish_v(level)
end;

str1 = ""
return str1
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;

function Getstaminareplenish_v(level)
result = floor(level/3)+1
return Param2String(result,20,0)
end;