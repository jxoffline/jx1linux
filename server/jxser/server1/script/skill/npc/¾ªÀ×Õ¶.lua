function GetSkillLevelData(levelname, data, level)

if (levelname == "physicsenhance_p") then
return Getphysicsenhance_p(level)
end;

if (levelname == "skill_cost_v") then
return Getskill_cost_v(level)
end;

if (levelname == "lightingdamage_v") then
return Getlightingdamage_v(level)
end;

str1 = ""
return str1
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;

function Getphysicsenhance_p(level)
result = 5+2*level
return Param2String(result,0,0)
end;

function Getskill_cost_v(level)
result = 3+floor(level/3)
return Param2String(result,0,0)
end;

function Getlightingdamage_v(level)
result = 7+level*6
return Param2String(result,0,result)
end;