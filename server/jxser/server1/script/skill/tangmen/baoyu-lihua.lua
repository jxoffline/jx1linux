function GetSkillLevelData(levelname, data, level)

if (levelname == "physicsdamage_v") then
return Getphysicsdamage_v(level)
end;

if (levelname == "poisondamage_v") then
return Getpoisondamage_v(level)
end;


if (levelname == "skill_eventskilllevel") then
return Getskill_eventskilllevel(level)
end;


str1 = ""
return str1
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;

function Getskill_eventskilllevel(level)
result = level
return Param2String(result,0,0)
end;

function Getphysicsdamage_v(level)
	result1 = level * 30
	result2 = level * 50
	return Param2String(result1,0,result2)
end;

function Getpoisondamage_v(level)
	result = 5+level
	dur = 18
	time = 360
	return Param2String(result,time,dur)
end;