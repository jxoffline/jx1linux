function GetSkillLevelData(levelname, data, level)

if (levelname == "addphysicsdamage_p") then
return Getaddphysicsdamage_p(level)
end;

if (levelname == "lifemax_p") then
return Getlifemax_p(level)
end;

if (levelname == "skill_cost_v") then
return Getskill_cost_v(level)
end;

if (levelname == "deadlystrikeenhance_p") then
return Getdeadlystrikeenhance_p(level)
end;

if (levelname == "addcolddamage_v") then
return Getaddcolddamage_v(level)
end;

str1 = ""
return str1
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;

function Getaddphysicsdamage_p(level)
result = 60+32*level
time = 1080 + 189*level
return Param2String(result,time,9)
end;

function Getlifemax_p(level)
result = 1+floor(level*2.5)
time = 1080 + 189*level
return Param2String(result,time,0)
end;

function Getaddcolddamage_v(level)
if (level<20) then
	return Param2String(0,0,0)
end;
result = level*15
time = 1080 + 189*level
return Param2String(result,time,0)
end;

function Getskill_cost_v(level)
result = level+5
return Param2String(result,0,0)
end;

function Getdeadlystrikeenhance_p(level)
result = 5+level
time = 1080 + 189*level
return Param2String(result,time,0)
end;
