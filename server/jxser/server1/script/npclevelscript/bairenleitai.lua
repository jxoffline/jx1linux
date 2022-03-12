Include("\\script\\npclevelscript\\property.lua")

function GetNpcLevelData(Series,Level, StyleName, ParamStr)
	if(ParamStr=="") then
		print(StyleName)
	end
	if(StyleName=="FireResist") then
		param1=GetParam(ParamStr,1);
		param2=GetParam(ParamStr,2);
		return SetFireResist(Level,param1,param2);
	end;
	if(StyleName=="PhysicsResist") then
		param1=GetParam(ParamStr,1);
		param2=GetParam(ParamStr,2);
		return SetPhysicsResist(Level,param1,param2);
	end;
	if(StyleName=="ColdResist") then
		param1=GetParam(ParamStr,1);
		param2=GetParam(ParamStr,2);
		return SetColdResist(Level,param1,param2);
	end;
	if(StyleName=="LightResist") then
		param1=GetParam(ParamStr,1);
		param2=GetParam(ParamStr,2);
		return SetLightResist(Level,param1,param2);
	end;
	if(StyleName=="PoisonResist") then
		param1=GetParam(ParamStr,1);
		param2=GetParam(ParamStr,2);
		return SetPoisonResist(Level,param1,param2);
	end;
	if(StyleName=="PhysicalDamageBase") then
		param1=GetParam(ParamStr,1);
		param2=GetParam(ParamStr,2);
		return SetPhysicalDamageBase(Level,param1,param2);
	end;
	if(StyleName=="PoisonDamageBase") then
		param1=GetParam(ParamStr,1);
		param2=GetParam(ParamStr,2);
		return SetPoisonDamageBase(Level,param1,param2);
	end;
	if(StyleName=="ColdDamageBase") then
		param1=GetParam(ParamStr,1);
		param2=GetParam(ParamStr,2);
		return SetColdDamageBase(Level,param1,param2);
	end;
	if(StyleName=="FireDamageBase") then
		param1=GetParam(ParamStr,1);
		param2=GetParam(ParamStr,2);
		return SetFireDamageBase(Level,param1,param2);
	end;
	if(StyleName=="LightingDamageBase") then
		param1=GetParam(ParamStr,1);
		param2=GetParam(ParamStr,2);
		return SetLightingDamageBase(Level,param1,param2);
	end;
	if(StyleName=="PhysicalMagicBase") then
		param1=GetParam(ParamStr,1);
		param2=GetParam(ParamStr,2);
		return SetPhysicalDamageBase(Level,param1,param2);
	end;
	if(StyleName=="PoisonMagicBase") then
		param1=GetParam(ParamStr,1);
		param2=GetParam(ParamStr,2);
		return SetPoisonDamageBase(Level,param1,param2);
	end;
	if(StyleName=="ColdMagicBase") then
		param1=GetParam(ParamStr,1);
		param2=GetParam(ParamStr,2);
		return SetColdDamageBase(Level,param1,param2);
	end;
	if(StyleName=="FireMagicBase") then
		param1=GetParam(ParamStr,1);
		param2=GetParam(ParamStr,2);
		return SetFireDamageBase(Level,param1,param2);
	end;
	if(StyleName=="LightingMagicBase") then
		param1=GetParam(ParamStr,1);
		param2=GetParam(ParamStr,2);
		return SetLightingDamageBase(Level,param1,param2);
	end;
	if(StyleName=="Level1") then
		param1=GetParam(ParamStr,1);
		param2=GetParam(ParamStr,2);
		return SetSkillLevel1(Level,param1,param2);
	end;
	if(StyleName=="Level2") then
		param1=GetParam(ParamStr,1);
		param2=GetParam(ParamStr,2);
		return SetSkillLevel2(Level,param1,param2);
	end;
	if(StyleName=="Level3") then
		param1=GetParam(ParamStr,1);
		param2=GetParam(ParamStr,2);
		return SetSkillLevel3(Level,param1,param2);
	end;
	if(StyleName=="Level4") then
		param1=GetParam(ParamStr,1);
		param2=GetParam(ParamStr,2);
		return SetSkillLevel4(Level,param1,param2);
	end;
	if(StyleName=="AuraSkillLevel") then
		param1=GetParam(ParamStr,1);
		param2=GetParam(ParamStr,2);
		return SetAuraSkillLevel(Level,param1,param2);
	end;
	if(StyleName=="AuraSkillId") then
		return ParamStr
	end
	if(StyleName=="PasstSkillLevel") then
		param1=GetParam(ParamStr,1);
		param2=GetParam(ParamStr,2);
		return SetPasstSkillLevel(Level,param1,param2);
	end;
	if(StyleName=="PasstSkillId") then
		return ParamStr
	end
	if(StyleName=="LifeReplenish") then
		param1=GetParam(ParamStr,1);
		param2=GetParam(ParamStr,2);
		return SetLifeReplenish(Level,param1,param2);
	end;
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
	return Linear(Level,1,1);
end;

function GetNpcKeyData(Series,Level, StyleName, Param1, Param2, Param3)
	if (StyleName == "Exp") then
		return SetExp(Level, Param1, Param2,Param3);
	end;
	if (StyleName == "Life") then
		if(Level == 90) then
			return Param3 * 1
		elseif(Level == 91) then
			return Param3 * 2
		elseif(Level == 92) then
			return Param3 * 3.5
		elseif(Level == 93) then
			return Param3 * 5.5
		elseif(Level == 94) then
			return Param3 * 9
		elseif(Level == 95) then
			return Param3 * 15
		elseif(Level == 96) then
			return Param3 * 22
		elseif(Level == 97) then
			return Param3 * 40
		elseif(Level == 98) then
			return Param3 * 70
		elseif(Level == 99) then
			return Param3 * 100
		end
		return Param3 * 100
	end;
	if (StyleName == "AttackRating") then
		return SetAR(Level, Param1, Param2,Param3);
	end;
	if (StyleName == "Defense") then
		return SetDP(Level, Param1, Param2,Param3);
	end;
	if (StyleName == "MinDamage") then
		return SetMinDamage(Level, Param1, Param2,Param3);
	end;
	if (StyleName == "MaxDamage") then
		return SetMaxDamage(Level, Param1, Param2,Param3);
	end;
	
	return Quadratic(Level,Param1,Param2,Param3);
end;