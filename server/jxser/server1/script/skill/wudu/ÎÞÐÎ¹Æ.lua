function GetSkillLevelData(levelname, data, level)

if (levelname == "poisondamage_v") then
return Getpoisondamage_v(level)
end;

str1 = ""
return str1
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;

function Getpoisondamage_v(level)
result1 = 1+floor(level/5)
result2 = 20
result3 = 25
return Param2String(result1,result2,result3)
end;

