function GetSkillLevelData(levelname, data, level)

if (levelname == "castspeed_v") then
return Getcastspeed_v(level)
end;

if (levelname == "attackspeed_v") then
return Getattackspeed_v(level)
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

function Getcastspeed_v(level)
result = 10+level*2
time = 1080+level*162
return Param2String(result,time,0)
end;

function Getattackspeed_v(level)
result =10+level*2
time = 1080+level*162
return Param2String(result,time,0)
end;

function Getskill_cost_v(level)
result = 40+level*4
return Param2String(result,0,0)
end;
