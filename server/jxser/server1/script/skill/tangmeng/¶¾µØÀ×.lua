function GetSkillLevelData(levelname, data, level)

if (levelname == "magic_rangephysicsdamagemin_v") then
return Getmagic_rangephysicsdamagemin_v(level)
end;

if (levelname == "magic_rangephysicsdamagemax_v") then
return Getmagic_rangephysicsdamagemax_v(level)
end;

if (levelname == "magic_poisondamage_v") then
return Getmagic_poisondamage_v(level)
end;

if (levelname == "magic_poisondegree_v") then
return Getmagic_poisondegree_v(level)
end;

if (levelname == "magic_poisonspace_v") then
return Getmagic_poisonspace_v(level)
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

function Getmagic_poisondamage_v(level)
result = 4+floor(level/2)
str1 = ""..result
return str1
end;

function Getmagic_poisondegree_v(level)
result = 20
str1 = ""..result
return str1
end;

function Getmagic_poisonspace_v(level)
result = 12
str1 = ""..result
return str1
end;

function Getmagic_summonnpctime_v(level)
result = 300
str1 = ""..result
return str1
end;

function Getmagic_skill_cost_v(level)
result = 39+level
str1 = ""..result
return str1
end;