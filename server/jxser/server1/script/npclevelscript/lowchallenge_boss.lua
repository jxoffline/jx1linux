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
		if(Series==0) then
			return 10
		elseif(Series==1) then
			return 10
		elseif(Series==2) then
			return 10
		elseif(Series==3) then
			return 10
		elseif(Series==4) then
			return 10
		end
		return 10
	end;
	
	if(StyleName=="Level2") then
		if(Series==0) then
			return 10
		elseif(Series==1) then
			return 10
		elseif(Series==2) then
			return 10
		elseif(Series==3) then
			return 10
		elseif(Series==4) then
			return 10
		end
		return 10	
	end;
	
	if(StyleName=="Level3") then
		if(Series==0) then
			return 10
		elseif(Series==1) then
			return 10
		elseif(Series==2) then
			return 10
		elseif(Series==3) then
			return 10
		elseif(Series==4) then
			return 10
		end
		return 10	
	end;
	
	if(StyleName=="Level4") then
		if(Series==0) then
			return 10
		elseif(Series==1) then
			return 10
		elseif(Series==2) then
			return 10
		elseif(Series==3) then
			return 10
		elseif(Series==4) then
			return 10
		end
		return 10	
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
	
	if(StyleName=="Skill1" ) then --近程五行攻击
		if(Series==0) then
			return 14
		elseif(Series==1) then
			return 58
		elseif(Series==2) then
			return 82
		elseif(Series==3) then
			return 125
		elseif(Series==4) then
			return 164
		end
		return 164
	end
	
	if(StyleName=="Skill2" ) then --近程五行攻击
		if(Series==0) then
			return 41
		elseif(Series==1) then
			return 71
		elseif(Series==2) then
			return 91
		elseif(Series==3) then
			return 128
		elseif(Series==4) then
			return 165
		end
		return 165
	end

	if(StyleName=="Skill3" ) then --近程五行攻击
		if(Series==0) then
			return 14
		elseif(Series==1) then
			return 341
		elseif(Series==2) then
			return 105
		elseif(Series==3) then
			return 141
		elseif(Series==4) then
			return 182
		end
		return 182
	end
	
	if(StyleName=="Skill4" ) then --近程五行攻击
		if(Series==0) then
			return 41
		elseif(Series==1) then
			return 74
		elseif(Series==2) then
			return 111
		elseif(Series==3) then
			return 138
		elseif(Series==4) then
			return 176
		end
		return 176
	end	
	return Linear(Level,1,1);
end;

function GetNpcKeyData(Series,Level, StyleName, Param1, Param2, Param3)
	if (StyleName == "Exp") then
		return SetExp(Level, Param1, Param2,Param3);
	end;
	if (StyleName == "Life") then
		return SetLife(Level, Param1, Param2,Param3);
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