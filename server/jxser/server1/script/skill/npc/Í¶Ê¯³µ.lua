function GetSkillLevelData(levelname, data, level)

if (levelname == "physicsdamage_v") then
return Getphysicsdamage_v(level)
end;

if (levelname == "colddamage_v") then
return Getcolddamage_v(level)
end;

if (levelname == "firedamage_v") then
return Getfiredamage_v(level)
end;

if (levelname == "poisondamage_v") then
return Getpoisondamage_v(level)
end;

str1 = ""
return str1
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;

function Getphysicsdamage_v(level)
result1 = 5000
return Param2String(result1,0,result1)
end;

function Getcolddamage_v(level)
result1 = 5000
return Param2String(result1,0,result1)
end;

function Getfiredamage_v(level)
result1 = 5000
return Param2String(result1,0,result1)
end;

function Getpoisondamage_v(level)
result1 = 5000
return Param2String(result1,0,result1)
end; 