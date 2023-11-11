function GetSkillLevelData(levelname, data, level)

if (levelname == "rangedamagereturn_v") then
return Getrangedamagereturn_v(level)
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

function Getrangedamagereturn_v(level)
result1 = 25+3*level
result2 = 2500+500*level
return Param2String(result1,result2,0)
end;

function Getskill_cost_v(level)
result = 30
return Param2String(result,0,0)
end;