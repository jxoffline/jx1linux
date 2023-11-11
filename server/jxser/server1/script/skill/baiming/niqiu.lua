function GetSkillLevelData(levelname, data, level)

if (levelname == "fastwalkrun_p") then
return Getfastwalkrun_p(level)
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

function Getfastwalkrun_p(level)
result = 6+level*2
time = 810+ 122*level
return Param2String(result,time,0)
end;



function Getskill_cost_v(level)
result = 20+floor(level*1.5)
return Param2String(result,0,0)
end;
