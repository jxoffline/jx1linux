function GetSkillLevelData(levelname, data, level)

if (levelname == "staminamax_p") then
return Getstaminamax_p(level)
end;


str1 = ""
return str1
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;

function Getstaminamax_p(level)
result = 20+10*level
return Param2String(result,-1,0)
end;

