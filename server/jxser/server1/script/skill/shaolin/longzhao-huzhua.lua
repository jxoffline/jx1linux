function GetSkillLevelData(levelname, data, level)

if (levelname == "physicsenhance_p") then
return Getphysicsenhance_p(level)
end;

if (levelname == "deadlystrike_p") then
return Getdeadlystrike_p(level)
end;

if (levelname == "ignoredefense_p") then
return Getignoredefense_p(level)
end;

if (levelname == "stun_p") then
return Getstun_p(level)
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
result = 50+level*25
return Param2String(result,0,9)
end;

function Getdeadlystrike_p(level)
result = 5+floor(level/2)
return Param2String(result,0,0)
end;

function Getskill_cost_v(level)
result = 1+floor(level/4)
return Param2String(result,0,0)
end;

function Getignoredefense_p(level)
result = 5+level*4
return Param2String(result,0,0)
end;

function Getstun_p(level)
result = 1+floor(level/5)
time = floor(level/4)+4
return Param2String(result,time,0)
end;
