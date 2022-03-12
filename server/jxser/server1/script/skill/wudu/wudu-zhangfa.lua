function GetSkillLevelData(levelname, data, level)

if (levelname == "addphysicsdamage_p") then
return Getaddphysicsdamage_p(level)
end;

if (levelname == "attackratingenhance_p") then
return Getattackratingenhance_p(level)
end;

if (levelname == "deadlystrikeenhance_p") then
return Getdeadlystrikeenhance_p(level)
end;

if (levelname == "addpoisonmagic_v") then
return Getaddpoisonmagic_v(level)
end;

str1 = ""
return str1
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;

function Getaddphysicsdamage_p(level)
result = 13+7*level
return Param2String(result,-1,9)
end;

function Getattackratingenhance_p(level)
result = 12+3*level
return Param2String(result,-1,0)
end;

function Getdeadlystrikeenhance_p(level)
result = 5+level
return Param2String(result,-1,0)
end;

function Getaddpoisonmagic_v(level)
result = 5+level*2
return Param2String(result,-1,0)
end;