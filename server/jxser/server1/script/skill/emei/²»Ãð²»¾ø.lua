function GetSkillLevelData(levelname, data, level)

if (levelname == "physicsenhance_p") then
return Getphysicsenhance_p(level)
end;

if (levelname == "deadlystrike_p") then
return Getdeadlystrike_p(level)
end;

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

function Getphysicsenhance_p(level)
result = 75+floor(8.5*level)
return Param2String(result,0,0)
end;

function Getdeadlystrike_p(level)
result = floor(log10(level+1)/2*100)
return Param2String(result,0,0)
end;

function Getcolddamage_v(level)
result = 10+level
return Param2String(result,0,result)
end;

function Getskill_cost_v(level)
result = 30
return Param2String(result,0,0)
end;