function GetSkillLevelData(levelname, data, level)

if (levelname == "lifemax_p") then
return Getlifemax_p(level)
end;

if (levelname == "manamax_p") then
return Getmanamax_p(level)
end;


if (levelname == "addfiremagic_v") then
return Getaddfiremagic_v(level)
end;

str1 = ""
return str1
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;

function Getlifemax_p(level)
result = -floor(1.5*level)
return Param2String(result,-1,0)
end;

function Getmanamax_p(level)
result = 10+2*level
return Param2String(result,-1,0)
end;

function Getaddfiremagic_v(level)
result = level*21
return Param2String(result,-1,0)
end;
