function GetSkillLevelData(levelname, data, level)

if (levelname == "allres_p") then
return Getallres_p(level)
end;

if (levelname == "skill_cost_v") then
return Getskill_cost_v(level)
end;

if (levelname == "meleedamagereturn_p") then
return Getmeleedamagereturn_p(level)
end;

str1 = ""
return str1
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;

function Getallres_p(level)
result1 = floor(level*1.5)
result2 = 810+176*level
return Param2String(result1,result2,0)
end;

function Getmeleedamagereturn_p(level)
result1 = 2+floor(level*2.2)
result2 = 810+176*level
return Param2String(result1,result2,0)
end;

function Getskill_cost_v(level)
result = 50
return Param2String(result,0,0)
end;