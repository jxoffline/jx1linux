function GetSkillLevelData(levelname, data, level)

if (levelname == "magic_invisibletime_v") then
return Getmagic_invisibletime_v(level)
end;

if (levelname == "magic_skill_cost_v") then
return Getmagic_skill_cost_v(level)
end;


str1 = ""
return str1
end;


function Getmagic_invisibletime_v(level)
result = 30+5*level
str1 = ""..result
return str1
end;

function Getmagic_skill_cost_v(level)
result = 80
str1 = ""..result
return str1
end;