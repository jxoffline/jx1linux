function GetSkillLevelData(levelname, data, level)

if (levelname == "stun_p") then
return Getstun_p(level)
end;

if (levelname == "skill_eventskilllevel") then
return Getskill_eventskilllevel(level)
end;

if (levelname == "skill_cost_v") then
return Getskill_cost_v(level)
end;

if (levelname == "physicsdamage_v") then
return Getphysicsdamage_v(level)
end;

str1 = ""
return str1
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;


function Getstun_p(level)
result = 18+level
time = 10+floor(level/2)
return Param2String(result,time,0)
end;

function Getskill_cost_v(level)
result = 60
return Param2String(result,0,0)
end;

function Getskill_eventskilllevel(level)
result = level
return Param2String(result,0,0)
end;

function Getphysicsdamage_v(level)
result = 40+level*5
return Param2String(result,0,result)
end;