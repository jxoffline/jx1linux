function GetSkillLevelData(levelname, data, level)

if (levelname == "physicsenhance_p") then
return Getphysicsenhance_p(level)
end;

if (levelname == "skill_cost_v") then
return Getskill_cost_v(level)
end;

if (levelname == "poisondamage_v") then
return Getpoisondamage_v(level)
end;

str1 = ""
return str1
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;

function Getphysicsenhance_p(level)
result = 50+level*25
return Param2String(result,0,0)
end;

function Getskill_cost_v(level)
result = 16
return Param2String(result,0,0)
end;

function Getpoisondamage_v(level)
result1 = 1+floor(level/2)
result2 = 100
result3 = 10
return Param2String(result1,result2,result3)
end;