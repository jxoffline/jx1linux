function GetSkillLevelData(levelname, data, level)


if (levelname == "physicsdamage_v") then
return Getphysicsdamage_v(level)
end;


if (levelname == "colddamage_v") then
return Getcolddamage_v(level)
end;

if (levelname == "skill_cost_v") then
return Getskill_cost_v(level)
end;

str1 = ""
return str1
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;

function Getphysicsdamage_v(level)
result1 = 29+level*12
result2 = 108+level*25
return Param2String(result1,0,result2)
end;


function Getcolddamage_v(level)
result1 = 100+25*level
result2 = 100+45*level
return Param2String(result1,0,result2)
end;

function Getskill_cost_v(level)
result = 50
return Param2String(result,0,0)
end;

