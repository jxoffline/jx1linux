function GetSkillLevelData(levelname, data, level)

if (levelname == "physicsdamage_v") then
return Getphysicsdamage_v(level)
end;

if (levelname == "poisondamage_v") then
return Getpoisondamage_v(level)
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
result1 = 30+level*2
result2 = 50+level*5
return Param2String(result1,0,result2)
end;

function Getpoisondamage_v(level)
result1 = 3+level
result2 = 200
result3 = 10
return Param2String(result1,result2,result3)
end;

function Getskill_cost_v(level)
result = 20
return Param2String(result,0,0)
end;