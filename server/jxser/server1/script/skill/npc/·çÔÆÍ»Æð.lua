function GetSkillLevelData(levelname, data, level)

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

function Getcolddamage_v(level)
result1 = 10+level*8
result2 = 40+level*20
return Param2String(result1,0,result2)
end;



function Getskill_cost_v(level)
result = 10
return Param2String(result,0,0)
end;