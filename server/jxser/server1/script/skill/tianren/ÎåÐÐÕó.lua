function GetSkillLevelData(levelname, data, level)

if (levelname == "adddefense_v") then
return Getadddefense_v(level)
end;


str1 = ""
return str1
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;

function Getadddefense_v(level)
result = 60+20*level
return Param2String(result,20,0)
end;