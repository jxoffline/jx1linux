function GetSkillLevelData(levelname, data, level)

if (levelname == "meleedamagereturn_v") then
return Getmeleedamagereturn_v(level)
end;

if (levelname == "addphysicsdamage_p") then
return Getaddphysicsdamage_p(level)
end;

if (levelname == "attackratingenhance_p") then
return Getattackratingenhance_p(level)
end;

if (levelname == "adddefense_v") then
return Getadddefense_v(level)
end;

str1 = ""
return str1
end;


function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;


function Getaddphysicsdamage_p(level)
result = 30+level*6
return Param2String(result,18,0)
end;

function Getattackratingenhance_p(level)
result = 20+level*4
return Param2String(result,18,0)
end;

function Getadddefense_v(level)
result = 60+level*37
return Param2String(result,18,0)
end;

function Getmeleedamagereturn_v(level)
result = 5+2*level
return Param2String(result,18,0)
end;
