function GetSkillLevelData(levelname, data, level)

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

function Getadddefense_v(level)
result1 = -100-level*50
result2 = 480+480*level
return Param2String(result1,result2,0)
end;


function Getskill_cost_v(level)
result = 25
return Param2String(result,0,0)
end;