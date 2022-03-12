function GetSkillLevelData(levelname, data, level)

if (levelname == "physicsenhance_p") then
return Getphysicsenhance_p(level)
end;

if (levelname == "skill_cost_v") then
return Getskill_cost_v(level)
end;

if (levelname == "skill_eventskilllevel") then
return Getskill_eventskilllevel(level)
end;

if (levelname == "missle_speed_v") then
return Getmissle_speed_v(level)
end;

if (levelname == "missle_lifetime_v") then
return Getmissle_lifetime_v(level)
end;

str1 = ""
return str1
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;

function Getphysicsenhance_p(level)
result = 50+level*15
return Param2String(result,0,0)
end;

function Getskill_cost_v(level)
result = 45
return Param2String(result,0,0)
end;

function Getmissle_speed_v(level)
result = 12+floor(level/2)
if(result >=31) then
result = 31
end;
return Param2String(result,0,0)
end;

function Getmissle_lifetime_v(level)
result = 10+floor(level*1.3)
return Param2String(result,0,0)
end;

function Getskill_eventskilllevel(level)
result = level
return Param2String(result,0,0)
end;