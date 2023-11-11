function GetSkillLevelData(levelname, data, level)

if (levelname == "attackratingenhance_p") then
return Getattackratingenhance_p(level)
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

function Getattackratingenhance_p(level)
result1 = 26+level*17
result2 = 960+level*195
return Param2String(result1,result2,0)
end;

function Getskill_cost_v(level)
result = 20
return Param2String(result,0,0)
end;

