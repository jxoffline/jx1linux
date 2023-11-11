function GetSkillLevelData(levelname, data, level)

if (levelname == "physicsenhance_p") then
return Getphysicsenhance_p(level)
end;

if (levelname == "skill_cost_v") then
return Getskill_cost_v(level)
end;

if (levelname == "ignoredefense_p") then
return Getignoredefense_p(level)
end;

str1 = ""
return str1
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;

function Getphysicsenhance_p(level)
result = 50+15*level
return Param2String(result,0,0)
end;

function Getskill_cost_v(level)
result = 10+floor(level/5)
return Param2String(result,0,0)
end;

function Getignoredefense_p(level)
result = floor(log10(level+5)/2*100)
return Param2String(result,0,0)
end;