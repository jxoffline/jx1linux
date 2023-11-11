function GetSkillLevelData(levelname, data, level)

if (levelname == "addphysicsdamage_p") then
return Getaddphysicsdamage_p(level)
end;

if (levelname == "attackratingenhance_p") then
return Getattackratingenhance_p(level)
end;

str1 = ""
return str1
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;

function Getaddphysicsdamage_p(level)
result = 15+10*level
return Param2String(result,-1,7)
end;

function Getattackratingenhance_p(level)
result = 12+3*level
return Param2String(result,-1,0)
end;

