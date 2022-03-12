function GetSkillLevelData(levelname, data, level)

if (levelname == "deadlystrikeenhance_p") then
return Getdeadlystrikeenhance_p(level)
end;

if (levelname == "attackspeed_v") then
return Getattackspeed_v(level)
end;

str1 = ""
return str1
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;

function Getdeadlystrikeenhance_p(level)
result = 5+3*level
return Param2String(result,-1,0)
end;

function Getattackspeed_v(level)
result =20+level*4
return Param2String(result,-1,0)
end;