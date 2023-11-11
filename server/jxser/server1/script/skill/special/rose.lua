function GetSkillLevelData(levelname, data, level)

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