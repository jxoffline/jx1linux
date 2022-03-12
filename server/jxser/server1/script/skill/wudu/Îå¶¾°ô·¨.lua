function GetSkillLevelData(levelname, data, level)

if (levelname == "addphysicsdamage_p") then
return Getaddphysicsdamage_p(level)
end;

if (levelname == "attackrating_p") then
return Getattackrating_p(level)
end;

if (levelname == "deadlystrike_p") then
return Getdeadlystrike_p(level)
end;

str1 = ""
return str1
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;

function Getaddphysicsdamage_p(level)
result = 10+2*level
return Param2String(result,-1,2)
end;

function Getattackrating_p(level)
result = 20+5*level
return Param2String(result,-1,0)
end;

function Getdeadlystrike_p(level)
result = 5+level
return Param2String(result,-1,0)
end;