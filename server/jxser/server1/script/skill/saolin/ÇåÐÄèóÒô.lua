function GetSkillLevelData(levelname, data, level)

if (levelname == "badstatustimereduce_v") then
return Getbadstatustimereduce_v(level)
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

function Getbadstatustimereduce_v(level)
result = 2+level
return Param2String(result,0,0)
end;

function Getskill_cost_v(level)
result = 5+floor(level/10)
return Param2String(result,0,0)
end;
