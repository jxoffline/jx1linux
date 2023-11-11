function GetSkillLevelData(levelname, data, level)

if (levelname == "magic_summonnpclife_v") then
return Getmagic_summonnpclife_v(level)
end;

if (levelname == "magic_summonnpctime_v") then
return Getmagic_summonnpctime_v(level)
end;

if (levelname == "magic_skill_cost_v") then
return Getmagic_skill_cost_v(level)
end;


str1 = ""
return str1
end;


function Getmagic_summonnpclife_v(level)
result = 180+20*level
str1 = ""..result
return str1
end;

function Getmagic_summonnpctime_v(level)
result = 120+5*level
str1 = ""..result
return str1
end;

function Getmagic_skill_cost_v(level)
result = 50
str1 = ""..result
return str1
end;