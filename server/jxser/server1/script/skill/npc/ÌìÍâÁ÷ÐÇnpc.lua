function GetSkillLevelData(levelname, data, level)



if (levelname == "firedamage_v") then
return Getfiredamage_v(level)
end;



if (levelname == "seriesdamage_p") then
return Getseriesdamage_p(level)
end;




str1 = ""
return str1
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;



function Getfiredamage_v(level)
result = 1
return Param2String(result,0,result)
end;



function Getseriesdamage_p(level)
result = level
return Param2String(result,0,0)
end;








