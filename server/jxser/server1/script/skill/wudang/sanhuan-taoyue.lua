function GetSkillLevelData(levelname, data, level)

if (levelname == "physicsenhance_p") then
return Getphysicsenhance_p(level)
end;

if (levelname == "lightingdamage_v") then
return Getlightingdamage_v(level)
end;

if (levelname == "skill_cost_v") then
return Getskill_cost_v(level)
end;

if (levelname == "attackrating_v") then
return Getattackrating_v(level)
end;

if (levelname == "deadlystrike_p") then
return Getdeadlystrike_p(level)
end;

if (levelname == "stun_p") then
return Getstun_p(level)
end;


str1 = ""
return str1
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;

function Getphysicsenhance_p(level)
result = 15*level+35
return Param2String(result,0,0)
end;

function Getskill_cost_v(level)
result = 12+level
return Param2String(result,0,0)
end;

function Getattackrating_v(level)
result = level*55+100
return Param2String(result,0,0)
end;

function Getdeadlystrike_p(level)
result = level+15
return Param2String(result,0,0)
end;

function Getlightingdamage_v(level)
result = level*15+50
return Param2String(result,0,result)
end;

function Getstun_p(level)
result = floor((level+1)/2)
time = floor(level/4)+4
return Param2String(result,time,0)
end;
