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
result = 6+floor(level*3)
return Param2String(result,20,0)
end;