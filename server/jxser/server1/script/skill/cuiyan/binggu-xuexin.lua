function GetSkillLevelData(levelname, data, level)

if (levelname == "coldenhance_p") then
return Getcoldenhance_p(level)
end;

if (levelname == "addcolddamage_v") then
return Getaddcolddamage_v(level)
end;

if (levelname == "addcoldmagic_v") then
return Getaddcoldmagic_v(level)
end;

str1 = ""
return str1
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;

function Getcoldenhance_p(level)
result = 7+level
return Param2String(result,-1,0)
end;

function Getaddcoldmagic_v(level)
result = 50+10*level
time = 820+level*40
return Param2String(result,time,0)
end;

function Getaddcolddamage_v(level)
result = 50+10*level
time = 820+level*40
return Param2String(result,time,0)
end;
