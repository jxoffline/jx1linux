function GetSkillLevelData(levelname, data, level)


if (levelname == "lifemax_p") then
return Getlifemax_p(level)
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



function Getlifemax_p(level)
result1 = 20+level*4
result2 = 720+level*130
return Param2String(result1,result2,0)
end;

function Getskill_cost_v(level)
result = 40
return Param2String(result,0,0)
end;

