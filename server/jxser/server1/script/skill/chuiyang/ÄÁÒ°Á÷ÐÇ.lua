function GetSkillLevelData(levelname, data, level)

if (levelname == "colddamage_v") then
return Getcolddamage_v(level)
end;

if (levelname == "physicsenhance_p") then
return Getphysicsenhance_p(level)
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
result1 = 90+level*20
result2 = 160+level*30
return Param2String(result1,0,result2)
end;


function Getskill_cost_v(level)
result = 50
return Param2String(result,0,0)
end;

function Getphysicsenhance_p(level)
result = 25+level*10
return Param2String(result,0,0)
end;

function GetEventSkillLevel(level)
result = level
return Param2String(result,0,0)
end;