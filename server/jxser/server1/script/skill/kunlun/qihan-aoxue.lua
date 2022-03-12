function GetSkillLevelData(levelname, data, level)

if (levelname == "fasthitrecover_v") then
return Getfasthitrecover_v(level)
end;

str1 = ""
return str1
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;

function Getfasthitrecover_v(level)
result = 4+floor(level*0.8)
return Param2String(result,-1,0)
end;
