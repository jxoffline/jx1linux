function GetSkillLevelData(levelname, data, level)

if (levelname == "attackratingenhance_p") then
return Getattackratingenhance_p(level)
end;

if (levelname == "deadlystrikeenhance_p") then
return Getdeadlystrikeenhance_p(level)
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
result1 = 15+level*13
result2 = 960+level*195
return Param2String(result1,result2,0)
end;

function Getdeadlystrikeenhance_p(level)
result1 = 5+floor(level/2)
result2 = 960+level*195
return Param2String(result1,result2,0)
end;

function Getskill_cost_v(level)
result = 25+level
return Param2String(result,0,0)
end;


