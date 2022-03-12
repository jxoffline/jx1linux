function GetSkillLevelData(levelname, data, level)

if (levelname == "coldres_p") then
return Getcoldres_p(level)
end;

if (levelname == "physicsres_p") then
return Getphysicsres_p(level)
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

function Getcoldres_p(level)
result1 = 12+level
result2 = 1080+level*135
return Param2String(result1,result2,0)
end;

function Getphysicsres_p(level)
result1 = 8+level
result2 = 1080+level*135
return Param2String(result1,result2,0)
end;

function Getskill_cost_v(level)
result = 10+2*level
return Param2String(result,0,0)
end;