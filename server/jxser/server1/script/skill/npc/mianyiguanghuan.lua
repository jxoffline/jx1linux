function GetSkillLevelData(levelname, data, level)

if (levelname == "fasthitrecover_v") then
return Getfasthitrecover_v(level)
end;

if (levelname == "fatallystrikeres_p") then
return Getfatallystrikeres_p(level)
end;

if (levelname == "freezetimereduce_p") then
return Getfreezetimereduce_p(level)
end;

if (levelname == "poisontimereduce_p") then
return Getpoisontimereduce_p(level)
end;

if (levelname == "stuntimereduce_p") then
return Getstuntimereduce_p(level)
end;

str1 = ""
return str1
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;

function Getfasthitrecover_v(level)
return Param2String(100,10,0)
end;

function Getfreezetimereduce_p(level)
return Param2String(200,10,0)
end;

function Getpoisontimereduce_p(level)
return Param2String(200,10,0)
end;

function Getstuntimereduce_p(level)
return Param2String(200,10,0)
end;

function Getfatallystrikeres_p(level)
return Param2String(99,10,0)
end