function GetSkillLevelData(levelname, data, level)

if (levelname == "firedamage_v") then
return Getfiredamage_v(level)
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

function Getfiredamage_v(level)
result1 = 4+level*2
result2 = 10+level*6
return Param2String(result1,0,result2)
end;

function Getskill_cost_v(level)
result = 30+2*level
return Param2String(result,0,0)
end;