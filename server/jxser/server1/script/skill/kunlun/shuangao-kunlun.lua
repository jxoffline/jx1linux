function GetSkillLevelData(levelname, data, level)

if (levelname == "addlightingdamage_v") then
return Getaddlightingdamage_v(level)
end;

if (levelname == "addphysicsdamage_p") then
return Getaddphysicsdamage_p(level)
end;

str1 = ""
return str1
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;

function Getaddlightingdamage_v(level)
result1 = 35+level*15
return Param2String(result1,-1,0)
end;

function Getaddphysicsdamage_p(level)
result = 15+6*level
return Param2String(result,-1,1)
end;
