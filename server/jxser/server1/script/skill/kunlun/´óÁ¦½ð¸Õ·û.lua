function GetSkillLevelData(levelname, data, level)

if (levelname == "addphysicsdamage_p") then
return Getaddphysicsdamage_p(level)
end;

if (levelname == "adddefense_v") then
return Getadddefense_v(level)
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

function Getaddphysicsdamage_p(level)
result1 = 20+8*level
result2 = 720+720*level
return Param2String(result1,result2,0)
end;

function Getadddefense_v(level)
result1 = 20+5*level
result2 = 720+720*level
return Param2String(result1,result2,0)
end;


function Getskill_cost_v(level)
result = 80
return Param2String(result,0,0)
end;