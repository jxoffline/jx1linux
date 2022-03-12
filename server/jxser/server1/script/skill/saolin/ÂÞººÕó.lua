function GetSkillLevelData(levelname, data, level)

if (levelname == "meleedamagereturn_p") then
return Getmeleedamagereturn_p(level)
end;

str1 = ""
return str1
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;

function Getmeleedamagereturn_p(level)
result = 15+floor(2.5*level)
return Param2String(result,20,0)
end;

