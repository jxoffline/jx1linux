function GetSkillLevelData(levelname, data, level)

if (levelname == "coldenhance_p") then
return Getcoldenhance_p(level)
end;


str1 = ""
return str1
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;

function Getcoldenhance_p(level)
result = 1+floor(level/3)
return Param2String(result,-1,0)
end;