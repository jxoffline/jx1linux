--计算NPC属性
--可以计算的属性包括：
--Exp、Life、LifeReplenish、AttackRating、Defense、MinDamage、MaxDamage；
--Level1、Level2、Level3、Level4。



--取得用|分割的参数的函数。

function GetParam(strParam, index)
nLastBegin = 1
for i=1, index - 1 do
nBegin = strfind(strParam, "|", nLastBegin)
nLastBegin = nBegin + 1
end;
num = 1

strnum = strsub(strParam, nLastBegin)
nEnd = strfind(strnum, "|")
if nEnd == nil then 
return strnum
end
str1 = strsub(strnum,1,nEnd -1);
return str1
end;



--入口主函数，第一个参数为NPC等级，等二个参数为数据类型，第三个参数是传入的npcs中的字符串。
--被一个npc单独用的脚本可以不考虑第三个参数的输入。
function GetNpcLevelData(Series,Level, StyleName, ParamStr)
	if(StyleName=="AIMode") then  
		return ParamStr
	end
	if(StyleName=="AIParam1") then 
		return ParamStr
	end
	if(StyleName=="AIParam2") then 
		return ParamStr
	end
	if(StyleName=="AIParam3") then 
		return ParamStr
	end
	if(StyleName=="AIParam4") then 	
		return ParamStr
	end
	if(StyleName=="AIParam5") then 
		return ParamStr
	end
	if(StyleName=="AIParam6") then 
		return ParamStr
	end
	if(StyleName=="AIParam7") then 
		return ParamStr
	end
	if(StyleName=="AIParam8") then 
		return ParamStr
	end
	if(StyleName=="AIParam9") then 
		return ParamStr
	end
	
	if(StyleName=="Skill1" or StyleName=="Skill2" or StyleName=="Skill3" or StyleName=="Skill4") then 
		return ParamStr
	end
	if(StyleName=="PhysicalDamageBase") then --外普攻击
		return 0
	end;
	if(StyleName=="PhysicalMagicBase") then --内普攻击
		return 0
	end;
	if(StyleName=="PoisonDamageBase") then --外毒攻击
		return 0
	end;
	if(StyleName=="PoisonMagicBase") then --内毒攻击
		return 0
	end;
	if(StyleName=="ColdDamageBase") then --外冰攻击
		return 0
	end;
	if(StyleName=="ColdMagicBase") then --内冰攻击
		return 0
	end;
	if(StyleName=="FireDamageBase") then --外火攻击
		return 0
	end;
	if(StyleName=="FireMagicBase") then --内火攻击
		return 0
	end;
	if(StyleName=="LightingDamageBase") then --外雷攻击
		return 0
	end;
	if(StyleName=="LightingMagicBase") then --内雷攻击
		return 0
	end;
	if(StyleName=="PhysicsResist") then --普抗
		if(Series==0) then
			return floor(Link(Level,{{1,10},{20,30},{60,70},{100,95}}))
		elseif(Series==1) then
			return floor(Link(Level,{{1,5},{20,15},{60,35},{100,45}}))
		elseif(Series==2) then
			return floor(Link(Level,{{1,5},{20,15},{60,35},{100,45}}))
		elseif(Series==3) then
			return floor(Link(Level,{{1,0},{20,-10},{60,-15},{100,-30}}))
		elseif(Series==4) then
			return floor(Link(Level,{{1,5},{20,15},{60,35},{100,45}}))
		end
		return 0
	end
	if(StyleName=="ColdResist") then --冰防
		if(Series==2) then
			return floor(Link(Level,{{1,10},{20,30},{60,70},{100,95}}))
		elseif(Series==3) then
			return floor(Link(Level,{{1,5},{20,15},{60,35},{100,45}}))
		elseif(Series==0) then
			return floor(Link(Level,{{1,5},{20,15},{60,35},{100,45}}))
		elseif(Series==4) then
			return floor(Link(Level,{{1,0},{20,-10},{60,-15},{100,-30}}))
		elseif(Series==1) then
			return floor(Link(Level,{{1,5},{20,15},{60,35},{100,45}}))
		end
		return 0
	end
	if(StyleName=="FireResist") then --火防
		if(Series==3) then
			return floor(Link(Level,{{1,10},{20,30},{60,70},{100,95}}))
		elseif(Series==0) then
			return floor(Link(Level,{{1,5},{20,15},{60,35},{100,45}}))
		elseif(Series==1) then
			return floor(Link(Level,{{1,5},{20,15},{60,35},{100,45}}))
		elseif(Series==2) then
			return floor(Link(Level,{{1,0},{20,-10},{60,-15},{100,-30}}))
		elseif(Series==4) then
			return floor(Link(Level,{{1,5},{20,15},{60,35},{100,45}}))
		end
		return 0
	end
	if(StyleName=="LightResist") then  --雷防
		if(Series==4) then
			return floor(Link(Level,{{1,10},{20,30},{60,70},{100,95}}))
		elseif(Series==3) then
			return floor(Link(Level,{{1,5},{20,15},{60,35},{100,45}}))
		elseif(Series==0) then
			return floor(Link(Level,{{1,5},{20,15},{60,35},{100,45}}))
		elseif(Series==1) then
			return floor(Link(Level,{{1,0},{20,-10},{60,-15},{100,-30}}))
		elseif(Series==2) then
			return floor(Link(Level,{{1,5},{20,15},{60,35},{100,45}}))
		end
		return 0
	end
	if(StyleName=="PoisonResist") then  --毒防
		if(Series==1) then
			return floor(Link(Level,{{1,10},{20,30},{60,70},{100,95}}))
		elseif(Series==3) then
			return floor(Link(Level,{{1,5},{20,15},{60,35},{100,45}}))
		elseif(Series==4) then
			return floor(Link(Level,{{1,5},{20,15},{60,35},{100,45}}))
		elseif(Series==0) then
			return floor(Link(Level,{{1,0},{20,-10},{60,-15},{100,-30}}))
		elseif(Series==2) then
			return floor(Link(Level,{{1,5},{20,15},{60,35},{100,45}}))
		end
		return 0
	end


Param1 = GetParam(ParamStr,1);
Param2 = GetParam(ParamStr,2);

result = GetData(Level, Param1, Param2);
return result;
end;

--关键数据的计算函数
function GetNpcKeyData(Series,Level, StyleName, Param1, Param2, Param3)


if (StyleName == "Exp") then
return floor(1.5*GetExp(Level, Param1, Param2))
end;

if (StyleName == "Life") then
return 2*GetLife(Level, Param1, Param2);
end;

if (StyleName == "AttackRating") then
return GetAttackRating(Level, Param1, Param2);
end;

if (StyleName == "Defense") then
return GetDefense(Level, Param1, Param2);
end;

if (StyleName == "MinDamage") then
return floor(GetMinDamage(Level, Param1, Param2)/2);
end;

if (StyleName == "MaxDamage") then
return floor(GetMaxDamage(Level, Param1, Param2)/2);
end;

result = Param1 * Level * Level + Param2 * Level + Param3;
return result;
end;

--通用的线性计算公式。
function GetData(Level, Param1, Param2)
result = Param2 * Level + Param1;
return floor(result);
end;

--以下的DataPara1表示线性函数y=kx+b中的b，DataPara2表示k。
--经验值计算公式
function GetExp(Level, Param1, Param2)

if (Level <= 10) then
DataPara1=40
DataPara2=5
return floor(GetData(Level, DataPara1, DataPara2)*1.5)
end;

if (Level <= 20) then
DataPara1=120
DataPara2=5
return floor(GetData(Level-10, DataPara1, DataPara2)*1.5)
end;

if (Level <= 30) then
DataPara1=240
DataPara2=5
return floor(GetData(Level-20, DataPara1, DataPara2)*1.5)
end;

if (Level <= 40) then
DataPara1=360
DataPara2=5
return floor(GetData(Level-30, DataPara1, DataPara2)*1.5)
end;

if (Level <= 50) then
DataPara1=480
DataPara2=5
return floor(GetData(Level-40, DataPara1, DataPara2)*1.5)
end;

if (Level <= 60) then
DataPara1=600
DataPara2=5
return floor(GetData(Level-50, DataPara1, DataPara2)*1.5)
end;

if (Level <= 70) then
DataPara1=720
DataPara2=5
return floor(GetData(Level-60, DataPara1, DataPara2)*1.5)
end;

if (Level <= 80) then
DataPara1=800
DataPara2=5
return floor(GetData(Level-70, DataPara1, DataPara2)*1.5)
end;

if (Level <= 90) then
DataPara1=900
DataPara2=5
return floor(GetData(Level-80, DataPara1, DataPara2)*1.5)
end;

if (Level <= 100) then
DataPara1=1000
DataPara2=5
return floor(GetData(Level-90, DataPara1, DataPara2)*1.5)
end;

result = Param2 * Level + Param1;
return floor(result);
end;


--生命值计算函数
function GetLife(Level, Param1, Param2)

if (Level <= 10) then
DataPara1=50
DataPara2=3
return floor(2*GetData(Level, DataPara1, DataPara2))
end;

if (Level <= 20) then
DataPara1=122
DataPara2=8
return floor(2*GetData(Level-10, DataPara1, DataPara2))
end;

if (Level <= 30) then
DataPara1=270
DataPara2=30
return floor(2*GetData(Level-20, DataPara1, DataPara2))
end;

if (Level <= 40) then
DataPara1=900
DataPara2=35
return floor(2*GetData(Level-30, DataPara1, DataPara2))
end;

if (Level <= 50) then
DataPara1=1450
DataPara2=60
return floor(2*GetData(Level-40, DataPara1, DataPara2))
end;

if (Level <= 60) then
DataPara1=2100
DataPara2=48
return floor(2*GetData(Level-50, DataPara1, DataPara2))
end;

if (Level <= 70) then
DataPara1=2950
DataPara2=54
return floor(2*GetData(Level-60, DataPara1, DataPara2))
end;

if (Level <= 80) then
DataPara1=3500
DataPara2=58
return floor(2*GetData(Level-70, DataPara1, DataPara2))
end;

if (Level <= 90) then
DataPara1=5050
DataPara2=11
return floor(2*GetData(Level-80, DataPara1, DataPara2))
end;

if (Level <= 100) then
DataPara1=6450
DataPara2=11
return floor(2*GetData(Level-90, DataPara1, DataPara2))
end;

result = Param2 * Level + Param1;
return floor(result);
end;



--命中率计算函数
function GetAttackRating(Level, Param1, Param2)

if (Level <= 10) then
DataPara1=10
DataPara2=3
return floor(2*GetData(Level, DataPara1, DataPara2))
end;

if (Level <= 20) then
DataPara1=50
DataPara2=4
return floor(2*GetData(Level-10, DataPara1, DataPara2))
end;

if (Level <= 30) then
DataPara1=100
DataPara2=5
return floor(2*GetData(Level-20, DataPara1, DataPara2))
end;

if (Level <= 40) then
DataPara1=250
DataPara2=5
return floor(2*GetData(Level-30, DataPara1, DataPara2))
end;

if (Level <= 50) then
DataPara1=400
DataPara2=5
return floor(2*GetData(Level-40, DataPara1, DataPara2))
end;

if (Level <= 60) then
DataPara1=500
DataPara2=5
return floor(2*GetData(Level-50, DataPara1, DataPara2))
end;

if (Level <= 70) then
DataPara1=600
DataPara2=5
return floor(2*GetData(Level-60, DataPara1, DataPara2))
end;

if (Level <= 80) then
DataPara1=700
DataPara2=5
return floor(2*GetData(Level-70, DataPara1, DataPara2))
end;

if (Level <= 90) then
DataPara1=800
DataPara2=5
return floor(2*GetData(Level-80, DataPara1, DataPara2))
end;

if (Level <= 100) then
DataPara1=900
DataPara2=5
return floor(2*GetData(Level-90, DataPara1, DataPara2))
end;

result = Param2 * Level + Param1;
return floor(result);
end;



--闪避率计算函数。
function GetDefense(Level, Param1, Param2)

if (Level <= 10) then
DataPara1=10
DataPara2=0
return floor(2*GetData(Level, DataPara1, DataPara2))
end;

if (Level <= 20) then
DataPara1=50
DataPara2=3
return floor(2*GetData(Level-10, DataPara1, DataPara2))
end;

if (Level <= 30) then
DataPara1=100
DataPara2=5
return floor(2*GetData(Level-20, DataPara1, DataPara2))
end;

if (Level <= 40) then
DataPara1=150
DataPara2=5
return floor(2*GetData(Level-30, DataPara1, DataPara2))
end;

if (Level <= 50) then
DataPara1=200
DataPara2=5
return floor(2*GetData(Level-40, DataPara1, DataPara2))
end;

if (Level <= 60) then
DataPara1=300
DataPara2=5
return floor(2*GetData(Level-50, DataPara1, DataPara2))
end;

if (Level <= 70) then
DataPara1=400
DataPara2=5
return floor(2*GetData(Level-60, DataPara1, DataPara2))
end;

if (Level <= 80) then
DataPara1=500
DataPara2=5
return floor(2*GetData(Level-70, DataPara1, DataPara2))
end;

if (Level <= 90) then
DataPara1=600
DataPara2=5
return floor(2*GetData(Level-80, DataPara1, DataPara2))
end;

if (Level <= 100) then
DataPara1=800
DataPara2=10
return floor(2*GetData(Level-90, DataPara1, DataPara2))
end;

result = Param2 * Level + Param1;
return floor(result);
end;


--最小伤害计算函数
function GetMinDamage(Level, Param1, Param2)

if (Level <= 10) then
DataPara1=3
DataPara2=0.3
return floor(GetData(Level, DataPara1, DataPara2)*1.2)
end;

if (Level <= 20) then
DataPara1=8
DataPara2=0.3
return floor(GetData(Level-10, DataPara1, DataPara2)*1.2)
end;

if (Level <= 30) then
DataPara1=13
DataPara2=0.4
return floor(GetData(Level-20, DataPara1, DataPara2)*1.2)
end;

if (Level <= 40) then
DataPara1=20
DataPara2=0.5
return floor(GetData(Level-30, DataPara1, DataPara2)*1.2)
end;

if (Level <= 50) then
DataPara1=29
DataPara2=0.5
return floor(GetData(Level-40, DataPara1, DataPara2)*1.2)
end;

if (Level <= 60) then
DataPara1=39
DataPara2=0.6
return floor(GetData(Level-50, DataPara1, DataPara2)*1.2)
end;

if (Level <= 70) then
DataPara1=50
DataPara2=0.7
return floor(GetData(Level-60, DataPara1, DataPara2)*1.2)
end;

if (Level <= 80) then
DataPara1=65
DataPara2=0.8
return floor(GetData(Level-70, DataPara1, DataPara2)*1.2)
end;

if (Level <= 90) then
DataPara1=85
DataPara2=0.9
return floor(GetData(Level-80, DataPara1, DataPara2)*1.2)
end;

if (Level <= 100) then
DataPara1=112
DataPara2=1
return floor(GetData(Level-90, DataPara1, DataPara2)*1.2)
end;

result = Param2 * Level + Param1;
return floor(result);
end;


--最大伤害计算函数
function GetMaxDamage(Level, Param1, Param2)

if (Level <= 10) then
DataPara1=3
DataPara2=0.3
return floor(GetData(Level, DataPara1, DataPara2)*1.2)
end;

if (Level <= 20) then
DataPara1=8
DataPara2=0.3
return floor(GetData(Level-10, DataPara1, DataPara2)*1.2)
end;

if (Level <= 30) then
DataPara1=13
DataPara2=0.4
return floor(GetData(Level-20, DataPara1, DataPara2)*1.2)
end;

if (Level <= 40) then
DataPara1=20
DataPara2=0.5
return floor(GetData(Level-30, DataPara1, DataPara2)*1.2)
end;

if (Level <= 50) then
DataPara1=29
DataPara2=0.5
return floor(GetData(Level-40, DataPara1, DataPara2)*1.2)
end;

if (Level <= 60) then
DataPara1=39
DataPara2=0.6
return floor(GetData(Level-50, DataPara1, DataPara2)*1.2)
end;

if (Level <= 70) then
DataPara1=50
DataPara2=0.7
return floor(GetData(Level-60, DataPara1, DataPara2)*1.2)
end;

if (Level <= 80) then
DataPara1=65
DataPara2=0.8
return floor(GetData(Level-70, DataPara1, DataPara2)*1.2)
end;

if (Level <= 90) then
DataPara1=85
DataPara2=0.9
return floor(GetData(Level-80, DataPara1, DataPara2)*1.2)
end;

if (Level <= 100) then
DataPara1=112
DataPara2=1
return floor(GetData(Level-90, DataPara1, DataPara2)*1.2)
end;

result = Param2 * Level + Param1;
return floor(result);
end;

