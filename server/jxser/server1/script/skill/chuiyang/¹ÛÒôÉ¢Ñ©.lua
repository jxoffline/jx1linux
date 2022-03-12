function GetSkillLevelData(levelname, data, level)

if (levelname == "colddamage_v") then
return Getcolddamage_v(level)
end;

if (levelname == "freeze_v") then
return Getfreeze_v(level)
end;

if (levelname == "skill_cost_v") then
return Getskill_cost_v(level)
end;

if (levelname == "EventSkillLevel") then
return EventSkillLevel(level)
end;

str1 = ""
return str1
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;

function Getcolddamage_v(level)
result1 = 120+level*22
result2 = 200+level*33
return Param2String(result1,0,result2)
end;


function Getskill_cost_v(level)
result = 80
return Param2String(result,0,0)
end;

function GetEventSkillLevel(level)
result = level
return Param2String(result,0,0)
end;