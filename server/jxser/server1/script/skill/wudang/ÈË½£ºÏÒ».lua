function GetSkillLevelData(levelname, data, level)


if (levelname == "lightingdamage_v") then
return Getlightingdamage_v(level)
end;

if (levelname == "skill_cost_v") then
return Getskill_cost_v(level)
end;

if (levelname == "statuslasttime_v") then
return Getstatuslasttime_v(level)
end;

str1 = ""
return str1
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;

function Getlightingdamage_v(level)
result = 120+level*38
return Param2String(result,0,result)
end;

function Getskill_cost_v(level)
result = 80
return Param2String(result,0,0)
end;

function Getstatuslasttime_v(level)
result = 60+level*10
return Param2String(result,0,0)
end;