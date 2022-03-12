function GetSkillLevelData(levelname, data, level)

if (levelname == "physicsenhance_p") then
return Getphysicsenhance_p(level)
end;

if (levelname == "stun_p") then
return Getstun_p(level)
end;

if (levelname == "skill_cost_v") then
return Getskill_cost_v(level)
end;

if (levelname == "skill_param1_v") then
return Getskill_param1_v(level)
end;

if (levelname == "skill_param2_v") then
return Getskill_param2_v(level)
end;

if (levelname == "deadlystrike_p") then
return Getdeadlystrike_p(level)
end;

str1 = ""
return str1
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;

function Getphysicsenhance_p(level)
result = 0
return Param2String(result,0,0)
end;

function Getskill_cost_v(level)
result = 10+floor(level/2)
return Param2String(result,0,0)
end;

function Getdeadlystrike_p(level)
result = level*4
return Param2String(result,0,0)
end;

function Getskill_param1_v(level)
result = 24
return Param2String(result,0,0)
end;

function Getskill_param2_v(level)
result = 5
return Param2String(result,0,0)
end;

function Getstun_p(level)
result = 15+level
time = 9
return Param2String(result,time,0)
end;
