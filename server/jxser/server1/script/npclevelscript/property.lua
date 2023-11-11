Include("\\script\\npclevelscript\\lib.lua");

--设置生命
function SetLife(level,param1,param2,param3)
	return Quadratic(level,param1,param2,param3);
end;

--设置经验值
function SetExp(level,param1,param2,param3)
	return Quadratic(level,param1,param2,param3);
end;

--设置命中
function SetAR(level,param1,param2,param3)
	return Quadratic(level,param1,param2,param3);
end;

--设置闪避
function SetDP(level,param1,param2,param3)
	return Quadratic(level,param1,param2,param3);
end;

--设置基础普伤下限
function SetMinDamage(level,param1,param2,param3)
	return Quadratic(level,param1,param2,param3);
end;

--设置基础普伤上限
function SetMaxDamage(level,param1,param2,param3)
	return Quadratic(level,param1,param2,param3);
end;

--设置火防
function SetFireResist(level,param1,param2)
	return Linear(level,param1,param2);
end;

--设置普防
function SetPhysicsResist(level,param1,param2)
	return Linear(level,param1,param2);
end;

--设置冰防
function SetColdResist(level,param1,param2)
	return Linear(level,param1,param2);
end;

--设置雷防
function SetLightResist(level,param1,param2)
	return Linear(level,param1,param2);
end;

--设置毒防
function SetPoisonResist(level,param1,param2)
	return Linear(level,param1,param2);
end;

--设置普攻基数
function SetPhysicalDamageBase(level,param1,param2)
	return Linear(level,param1,param2);
end;

--设置毒攻基数
function SetPoisonDamageBase(level,param1,param2)
	return Linear(level,param1,param2);
end;

--设置冰攻基数
function SetColdDamageBase(level,param1,param2)
	return Linear(level,param1,param2);
end;

--设置火攻基数
function SetFireDamageBase(level,param1,param2)
	return Linear(level,param1,param2);
end;

--设置雷攻基数
function SetLightingDamageBase(level,param1,param2)
	return Linear(level,param1,param2);
end;

--设置技能1等级
function SetSkillLevel1(level,param1,param2)
	local nLevel = Linear(level,param1,param2);
	if nLevel >= 64 then
		nLevel = 63
	end
	return nLevel
end;

--设置技能2等级
function SetSkillLevel2(level,param1,param2)
	local nLevel = Linear(level,param1,param2);
	if nLevel >= 64 then
		nLevel = 63
	end
	return nLevel
end;

--设置技能3等级
function SetSkillLevel3(level,param1,param2)
	local nLevel = Linear(level,param1,param2);
	if nLevel >= 64 then
		nLevel = 63
	end
	return nLevel
end;

--设置技能4等级
function SetSkillLevel4(level,param1,param2)
	local nLevel = Linear(level,param1,param2);
	if nLevel >= 64 then
		nLevel = 63
	end
	return nLevel
end;

--设置光环技能等级
function SetAuraSkillLevel(level,param1,param2)
	local nLevel = Linear(level,param1,param2);
	if nLevel >= 64 then
		nLevel = 63
	end
	return nLevel
end;

--设置被动技能等级
function SetPasstSkillLevel(level,param1,param2)
	local nLevel = Linear(level,param1,param2);
	if nLevel >= 64 then
		nLevel = 63
	end
	return nLevel
end;

--设置生命回复数值
function SetLifeReplenish(level,param1,param2)
	return Linear(level,param1,param2);
end;
