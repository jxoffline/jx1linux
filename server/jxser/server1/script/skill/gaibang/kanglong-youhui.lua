function GetSkillLevelData(levelname, data, level)

if (levelname == "physicsdamage_v") then
return Getphysicsdamage_v(level)
end;

--if (levelname == "skill_eventskilllevel") then
--return Getskill_eventskilllevel(level)
--end;

if (levelname == "missle_speed_v") then
return Getmissle_speed_v(level)
end;

if (levelname == "missle_lifetime_v") then
return Getmissle_lifetime_v(level)
end;

if (levelname == "skill_param1_v") then
return Getskill_param1_v(level)
end;

if (levelname == "skill_param2_v") then
return Getskill_param2_v(level)
end;

if (levelname == "skill_misslenum_v") then
return Getskill_misslenum_v(level)
end;

if (levelname == "skill_misslesform_v") then
return Getskill_misslesform_v(level)
end;

if (levelname == "firedamage_v") then
return Getfiredamage_v(level)
end;

if (levelname == "skill_cost_v") then
return Getskill_cost_v(level)
end;

str1 = ""
return str1
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;

function Getphysicsdamage_v(level)
result1 = 20+level*5
result2 = 40+level*10
return Param2String(result1,0,result2)
end;

function Getfiredamage_v(level)
result1 = 130+level*36
result2 = 200+level*40
return Param2String(result1,0,result2)
end;

function Getskill_cost_v(level)
result = 10+level
return Param2String(result,0,0)
end;

function Getskill_eventskilllevel(level)
result = level
return Param2String(result,0,0)
end;

function Getskill_param1_v(level)
--10级以前，为0，11级开始，表示扇形的开口弧度
if(level<11) then
	result = 0
else
	result = floor(0.22*level-0.9)
end;
if(result > 2) then
	result = 2
end;
return Param2String(result,0,0)
end;

function Getskill_param2_v(level)
--10级以前，为0，11级开始，表示距玩家的距离
if(level<11) then
	result = 0
else
	result = floor(level/4)
end;
return Param2String(result,0,0)
end;

function Getskill_misslenum_v(level)
--10级以前，一条龙,misslenum=1，11级开始，随级递增，最多18条
if(level<11) then
	result = 1
else
	result = floor(level*0.84-6.76)
end;
if(result > 18) then
	result = 18
end;
return Param2String(result,0,0)
end;

function Getskill_misslesform_v(level)
--10级以前，是直线飞行,misslesform=1，11级开始，扇形飞行，misslesform=2
if(level<11) then
	result=1
else
	result=2
end;
return Param2String(result,0,0)
end;

function Getmissle_speed_v(level)
if(level < 11) then
	result = 20
else
	result = 20+floor(1.1*level-10.7)
end;
if(result > 31) then
	result = 31
end;
return Param2String(result,0,0)
end;

function Getmissle_lifetime_v(level)
result = 28+floor(level/2)
if(result > 48) then
	result = 48
end;
return Param2String(result,0,0)
end;
