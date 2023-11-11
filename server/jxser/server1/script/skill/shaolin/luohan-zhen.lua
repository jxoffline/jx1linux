function GetSkillLevelData(levelname, data, level)

if (levelname == "meleedamagereturn_p") then
return Getmeleedamagereturn_p(level)
end;

if (levelname == "rangedamagereturn_p") then
return Getrangedamagereturn_p(level)
end;

if (levelname == "adddefense_v") then
return Getadddefense_v(level)
end;

if (levelname == "addphysicsdamage_p") then
return Getaddphysicsdamage_p(level)
end;

str1 = ""
return str1
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;

function Getmeleedamagereturn_p(level)
if(level<10) then
	return Param2String(1,20,0)
end;
result = 5+2*level
return Param2String(result,20,0)
end;

function Getrangedamagereturn_p(level)
if(level<10) then
	return Param2String(1,20,0)
end;
result = 5+2*level
return Param2String(result,20,0)
end;

function Getadddefense_v(level)
result = level*40
return Param2String(result,20,0)
end;

function Getaddphysicsdamage_p(level)
result = 5+6*level
return Param2String(result,20,6)
end;


