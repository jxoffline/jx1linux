function GetSkillLevelData(levelname, data, level)

if (levelname == "castspeed_v") then
return Getcastspeed_v(level)
end;


str1 = ""
return str1
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;

function Getcastspeed_v(level)
result = floor(log10(level+1)*80)
return Param2String(result,-1,0)
end;