function GetSkillLevelData(levelname, data, level)

if (levelname == "physicsdamage_v") then
return Getphysicsdamage_v(level)
end;

if (levelname == "poisondamage_v") then
return GetPoisondamage_v(level)
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
result1 = 38+level*12
result2 = 241+level*47
return Param2String(result1,0,result2)
end;

function GetPoisondamage_v(level)
result1 = 3+level*1
return Param2String(result1,180,18)
end;

function Getskill_cost_v(level)
result = 40
return Param2String(result,0,0)
end;

