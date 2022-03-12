function GetSkillLevelData(levelname, data, level)

if (levelname == "fastwalkrun_p") then
return Getfastwalkrun_p(level)
end;


str1 = ""
return str1
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;

function Getfastwalkrun_p(level)
result = floor(10+2.5*level)
return Param2String(result,-1,0)
end;