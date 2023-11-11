function GetSkillLevelData(levelname, data, level)

if (levelname == "magic_changecamp_b") then
return Getmagic_changecamp_b(level)
end;

if (levelname == "magic_skill_cost_v") then
return Getmagic_skill_cost_v(level)
end;


str1 = ""
return str1
end;


function Getmagic_changecamp_b(level)
result = 30+level*3
str1 = ""..result
return str1
end;

function Getmagic_skill_cost_v(level)
result = 50
str1 = ""..result
return str1
end;