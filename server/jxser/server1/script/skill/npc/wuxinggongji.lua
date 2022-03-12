--迭代函数，用于计算技能熟练度
--具体方法：
--根据1级熟练度，升级加速度，级数，重复伤害次数，范围，计算出相应等级熟练度
-- SkillExp(i) = Exp1*a^(i-1)*time*range

function GetSkillLevelData(levelname, data, level)

if (levelname == "physicsenhance_p") then
return Getphysicsdamage_p(level)
end;

if (levelname == "attackrating_p") then
return Getackrating_p(level)
end;

if (levelname == "addskillexp1") then
return Getaddskillexp1(level)
end;

if (levelname == "skill_skillexp_v") then
return Getskill_skillexp_v(level)
end;

if (levelname == "seriesdamage_p") then
return Getseriesdamage_p(level)
end;

str1 = ""
return str1
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;

function Getphysicsdamage_p(level)
	if (level < 40) then
	result = 99+level;
	return Param2String(result,0,0);
	else
	result = level*15;
	return Param2String(result,0,0);
	end;
end;

function Getackrating_p(level)
	if (level < 40) then
	result = 99+level;
	return Param2String(result,0,0);
	else
	result = level*10;
	return Param2String(result,0,0);
	end;
end;

function Getaddskillexp1(level)
	result = 1;
	return Param2String(0,result,0);
end;

function Getskill_skillexp_v(level)
	result = 6000*(1.25^(level-1));
	return Param2String(result,0,0);
end;

function Getseriesdamage_p(level)
	result = 30+floor(level/2);
	return Param2String(result,0,0);
end;
