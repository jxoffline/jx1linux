function GetSkillLevelData(levelname, data, level)

if (levelname == "lifereplenish_v") then
return Getlifereplenish_v(level)
end;

if (levelname == "manareplenish_v") then
return Getmanareplenish_v(level)
end;


str1 = ""
return str1
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;

function Getlifereplenish_v(level)
result = floor(level/2)+1
return Param2String(result,20,0)
end;

function Getmanareplenish_v(level)
result = floor(level/3)+1
return Param2String(result,25,0)
end;