function GetSkillLevelData(levelname, data, level)

if (levelname == "physicsres_p") then
return Getphysicsres_p(level)
end;


str1 = ""
return str1
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;

function Getphysicsres_p(level)
result = floor(log10(level+5)/2*50)
return Param2String(result,-1,0)
end;