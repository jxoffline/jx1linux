function GetSkillLevelData(levelname, data, level)
if(levelname=="stun_p") then
	return Param2String(30,18,0)
end
if (levelname == "physicsdamage_v") then
return Getphysicsdamage_v(level)
end;

if (levelname == "poisondamage_v") then
return Getpoisondamage_v(level)
end;

if (levelname == "colddamage_v") then
return Getcolddamage_v(level)
end;

if (levelname == "firedamage_v") then
return Getfiredamage_v(level)
end;

if (levelname == "lightingdamage_v") then
return Getlightingdamage_v(level)
end;

if (levelname == "seriesdamage_p") then
return Getseriesdamage_p(level)
end;




str1 = ""
return str1
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;

function Getphysicsdamage_v(level)
result = 1
return Param2String(result,0,result)
end;


function Getpoisondamage_v(level)
result = 1
return Param2String(result,60,10)
end;

function Getcolddamage_v(level)
result = 1
return Param2String(result,18,result)
end;

function Getfiredamage_v(level)
result = 1
return Param2String(result,0,result)
end;

function Getlightingdamage_v(level)
result = 1
return Param2String(result,0,result)
end;

function Getseriesdamage_p(level)
result = level
return Param2String(result,0,0)
end;








