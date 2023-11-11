function GetSkillLevelData(levelname, data, level)

if (levelname == "lightingenhance_p") then
return Getlightingenhance_p(level)
end;


str1 = ""
return str1
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;

function Getlightingenhance_p(level)
result = floor(log10(level+1)*50)
return Param2String(result,-1,0)
end;