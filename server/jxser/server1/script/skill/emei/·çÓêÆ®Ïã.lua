function GetSkillLevelData(levelname, data, level)

if (levelname == "slowmissle_b") then
return Getslowmissle_b(level)
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

function Getslowmissle_b(level)
result = 450+level*150
return Param2String(0,result,0)
end;

function Getskill_cost_v(level)
result = 40+2*level
return Param2String(result,0,0)
end;