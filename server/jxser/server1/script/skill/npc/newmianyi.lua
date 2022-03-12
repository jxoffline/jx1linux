function GetSkillLevelData(levelname, data, level)


--受伤动作时间
if (levelname == "fasthitrecover_v") then
return Getfasthitrecover_v(level)
end;

--受伤动作时间：#d1~（阳）
if (levelname == "fasthitrecover_yan_v") then
return Getfasthitrecover_v(level)
end;

--致命一击抵抗力：#d1+%
if (levelname == "fatallystrikeres_p") then
return Getfatallystrikeres_p(level)
end;

--迟缓时间：#d1~%
if (levelname == "freezetimereduce_p") then
return Getfreezetimereduce_p(level)
end;

--中毒时间：#d1~%（中毒时间减少）
if (levelname == "poisontimereduce_p") then
return Getpoisontimereduce_p(level)
end;

--眩晕时间：#d1~%
if (levelname == "stuntimereduce_p") then
return Getstuntimereduce_p(level)
end;

--受近身攻击时伤害反弹：#d1+%
if (levelname == "meleedamagereturn_p") then
return Getmeleedamagereturn_p(level)
end;

--受远程攻击时伤害反弹：#d1+%
if (levelname == "rangedamagereturn_p") then
return Getrangedamagereturn_p(level)
end;

--减少来自金系的伤害：#d1-%
if (levelname == "metal2medamage_p") then
return Getrangemetal2medamage_p(level)
end;

--减少来自木系的伤害：#d1-%
if (levelname == "wood2medamage_p") then
return Getrangewood2medamage_p(level)
end;

--减少来自水系的伤害：#d1-%
if (levelname == "water2medamage_p") then
return Getrangewater2medamage_p(level)
end;

--减少来自火系的伤害：#d1-%
if (levelname == "fire2medamage_p") then
return Getrangefire2medamage_p(level)
end;

--减少来自土系的伤害：#d1-%
if (levelname == "earth2medamage_p") then
return Getrangeearth2medamage_p(level)
end;

str1 = ""
return str1
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;

function Getrangemetal2medamage_p(level)
return Param2String(50,-1,0)
end;

function Getrangewood2medamage_p(level)
return Param2String(50,-1,0)
end;

function Getrangewater2medamage_p(level)
return Param2String(50,-1,0)
end;

function Getrangefire2medamage_p(level)
return Param2String(50,-1,0)
end;

function Getrangeearth2medamage_p(level)
return Param2String(50,-1,0)
end;


function Getfasthitrecover_v(level)
return Param2String(1000,-1,0)
end;

function Getfatallystrikeres_p(level)
return Param2String(1000,-1,0)
end

function Getfreezetimereduce_p(level)
return Param2String(2000,-1,0)
end;

function Getpoisontimereduce_p(level)
return Param2String(3000,-1,0)
end;

function Getstuntimereduce_p(level)
return Param2String(2000,-1,0)
end;

function Getmeleedamagereturn_p(level)
return Param2String(80,-1,0)
end

function Getrangedamagereturn_p(level)
return Param2String(80,-1,0)
end

