function GetSkillLevelData(levelname, data, level)

if (levelname == "coldenhance_p") then
return Getcoldenhance_p(level)
end;

if (levelname == "addcolddamage_v") then
return Getaddcolddamage_v(level)
end;


str1 = ""
return str1
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;

function Getcoldenhance_p(level)
result = 1+4*floor(level/3)
result2=360+36*level
return Param2String(result,result2,0)
end;

function Getaddcolddamage_v(level)
result = 26+level*17
return Param2String(result,-1,0)
end;