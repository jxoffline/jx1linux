function GetSkillLevelData(levelname, data, level)

if (levelname == "lightingres_p") then
return Getlightingres_p(level)
end;


str1 = ""
return str1
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;

function Getlightingres_p(level)
result = floor(log10(level+1)/2*60)
return Param2String(result,-1,0)
end;

