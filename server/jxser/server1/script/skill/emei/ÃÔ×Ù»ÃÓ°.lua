function GetSkillLevelData(levelname, data, level)

if (levelname == "summondata_v") then
return Getsummondata_v(level)
end;

str1 = ""
return str1
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;

function Getsummondata_v(level)
result = 35+floor(level*9.5)
return Param2String(result,25,0)
end;