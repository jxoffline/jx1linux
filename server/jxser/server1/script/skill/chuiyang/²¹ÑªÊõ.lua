function GetSkillLevelData(levelname, data, level)

if (levelname == "lifereplenish_v") then
return Getlifereplenish_v(level)
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

function Getlifereplenish_v(level)
result = 50+15*level
return Param2String(result,20,0)
end;

function Getskill_cost_v(level)
result = 20+level
return Param2String(result,0,0)
end;