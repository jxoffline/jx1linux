function GetSkillLevelData(levelname, data, level)

if (levelname == "magic_rangephysicsdamagemin_v") then
return Getmagic_rangephysicsdamagemin_v(level)
end;

if (levelname == "magic_rangephysicsdamagemax_v") then
return Getmagic_rangephysicsdamagemax_v(level)
end;

if (levelname == "magic_firedamage_v") then
return Getmagic_firedamage_v(level)
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


function Getmagic_rangephysicsdamagemin_v(level)
result = 10+2*level
str1 = ""..result
return str1
end;

function Getmagic_rangephysicsdamagemax_v(level)
result = 30+4*level
str1 = ""..result
return str1
end;

function Getmagic_firedamage_v(level)
result = 40+5*level
str1 = ""..result
return str1
end;

function Getmagic_summonnpctime_v(level)
result = 300
str1 = ""..result
return str1
end;

function Getmagic_skill_cost_v(level)
result = 24+level
str1 = ""..result
return str1
end;