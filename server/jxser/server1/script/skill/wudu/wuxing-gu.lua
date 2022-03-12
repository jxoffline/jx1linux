function GetSkillLevelData(levelname, data, level)

--if (levelname == "poisondamage_v") then
--return Getpoisondamage_v(level)
--end;

if (levelname == "fastwalkrun_p") then
return Getfastwalkrun_p(level)
end;

if (levelname == "skill_cost_v") then
return Getskill_cost_v(level)
end;

if (levelname == "skill_eventskilllevel") then
return Getskill_eventskilllevel(level)
end;

str1 = ""
return str1
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;

--function Getpoisondamage_v(level)
--result1 = 5+level
--result2 = 20
--result3 = 25
--return Param2String(result1,result2,result3)
--end;

function Getfastwalkrun_p(level)
result1 = -5-level
result2 = -20
result3 = -25
return Param2String(result1,result2,result3)
end;

function Getskill_cost_v(level)
result = floor(0.2*level + 8.3)
return Param2String(result,0,0)
end;

function Getskill_eventskilllevel(level)
result = level
return Param2String(result,0,0)
end;