function GetSkillLevelData(levelname, data, level)

if (levelname == "firedamage_v") then
return Getfiredamage_v(level)
end;

if (levelname == "skill_cost_v") then
return Getskill_cost_v(level)
end;

if (levelname == "skill_eventskilllevel") then
return skill_eventskilllevel(level)
end;

if(levelname == "fatallystrike_p") then
return GetFatallystrike_p(level)
end;

str1 = ""
return str1
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;

function Getfiredamage_v(level)
result1 = 50+level*18
result2 = 260+level*42
return Param2String(result1,0,result2)
end;

function Getskill_cost_v(level)
result = 60
return Param2String(result,0,0)
end;

function Getskill_eventskilllevel(level)
result = level
return Param2String(result,0,0)
end;

function GetFatallystrike_p(level)
result = 10+level*2
return Param2String(result,0,0)
end;