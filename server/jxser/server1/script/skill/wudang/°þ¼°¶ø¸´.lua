function GetSkillLevelData(levelname, data, level)

if (levelname == "lightingdamage_v") then
return Getlightingdamage_v(level)
end;

if (levelname == "skill_cost_v") then
return Getskill_cost_v(level)
end;

if (levelname == "stun_p") then
return Getstun_p(level)
end;

str1 = ""
return str1
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;

function Getlightingdamage_v(level)
result1 = 12+level*1
result2 = 388+level*80
return Param2String(result1,0,result2)
end;

function Getstun_p(level)
result1 = 19+floor(level*1.8)
result2 = level
return Param2String(result1,result2,0)
end;

function Getskill_cost_v(level)
result = 110
return Param2String(result,0,0)
end;

