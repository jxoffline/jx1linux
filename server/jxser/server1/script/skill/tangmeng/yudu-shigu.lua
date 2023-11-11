function GetSkillLevelData(levelname, data, level)

if (levelname == "poisonenhance_p") then
return Getpoisonenhance_p(level)
end;


str1 = ""
return str1
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;

function Getpoisonenhance_p(level)
result = 10+2*level
return Param2String(result,-1,0)
end;