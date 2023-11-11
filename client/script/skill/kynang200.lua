Include("\\script\\skill\\head.lua")

SKILLS ={
	thietsachuong={ --Thieu Lam
		physicsenhance_p={{{1,250},{10,400},{15,600},{20,800},{30,1200}}},
		magicenhance_p={{{1,10},{10,20},{15,30},{30,60}}},
		ignoredefense_p={{{1,9},{10,20},{15,21},{20,22},{30,23},{50,50},{55,50}}},
		colddamage_v={
			[1]={{1,100},{10,200},{15,300},{30,600}},
			[3]={{1,100},{10,200},{15,300},{30,600}}
		},
		deadlystrike_p={{{1,5},{20,40}}},
		skill_cost_v={{{1,50},{20,50}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_startevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,1750},{20,1750}}
		},
		skill_showevent={{{1,0},{10,0},{10,1},{20,1}}},
	},	
	thietsachuong_2={ --Thieu Lam
		physicsenhance_p={{{1,25},{10,100},{15,1500},{20,200},{30,300}}},
		physicsdamage_v={
			[1]={{1,100},{20,500},{40,1000},{55,2000}},
			[3]={{1,100},{20,500},{40,1000},{55,2000}}
		},
		stun_p={{{1,1},{20,20},{50,50}},{{1,16},{25,36},{50,72}}},
	},
	dailuctranthien={ --Thien Vuong
		physicsenhance_p={{{1,150},{10,200},{15,200},{20,400},{30,600}}},
		magicenhance_p={{{1,10},{10,20},{15,30},{30,60}}},
		ignoredefense_p={{{1,12},{10,20},{15,21},{20,22},{30,40},{50,50},{55,50}}},
		colddamage_v={
			[1]={{1,100},{10,200},{15,300},{30,600}},
			[3]={{1,100},{10,200},{15,300},{30,600}}
		},
		deadlystrike_p={{{1,1},{50,50}}},
		skill_cost_v={{{1,50},{20,50}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_startevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,1752},{20,1752}}
		},
		skill_showevent={{{1,0},{10,0},{10,1},{20,1}}},
	},
	dailuctranthien_2={ --Thien Vuong
		physicsenhance_p={{{1,150},{10,200},{15,200},{20,400},{30,600}}},
		magicenhance_p={{{1,10},{10,20},{15,30},{30,60}}},
		ignoredefense_p={{{1,50},{20,50},{21,50},{22,50},{23,50},{24,50}}},
		colddamage_v={
			[1]={{1,100},{10,200},{15,300},{30,600}},
			[3]={{1,100},{10,200},{15,300},{30,600}}
		},
		deadlystrike_p={{{1,10},{20,40}}},
		skill_cost_v={{{1,0},{20,0}}}
	},
	ngocnutamkinh={ --Nga Mi
		physicsenhance_p={{{1,100},{15,300},{20,1000},{50,5000},{55,10000}}},
		magicenhance_p={{{1,10},{10,20},{15,30},{30,60}}},
		colddamage_v={
			[1]={{1,200},{10,700},{15,2500},{20,3800},{30,5000}},
			[3]={{1,200},{10,700},{15,2500},{20,3800},{30,5000}}
		},
		skill_cost_v={{{1,50},{20,50}}},
	},
	bangtamtuyettien={ --Thuy Yen
		physicsdamage_v={
			[1]={{1,380},{10,800},{15,1000},{20,1500},{30,2000}},
			[3]={{1,380},{10,800},{15,1000},{20,1500},{30,2000}}
		},
		physicsenhance_p={{{1,25},{25,505},{49,10015},{50,15000},{55,30000}}},
		magicenhance_p={{{1,10},{10,20},{15,30},{30,60}}},
		colddamage_v={
			[1]={{1,280},{10,700},{15,1200},{20,2500},{30,4000}},
			[3]={{1,280},{10,700},{15,1200},{20,2500},{30,4000}}
		},
		skill_cost_v={{{1,50},{20,50}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_startevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,1753},{20,1753}}
		},
		skill_showevent={{{1,0},{10,0},{10,1},{20,1}}},
	},
	bangtamtuyettien_2={ --Thuy Yen
		physicsenhance_p={{{1,25},{25,505},{49,10015},{50,15000},{55,30000}}},
		magicenhance_p={{{1,10},{10,20},{15,30},{30,60}}},
		colddamage_v={
			[1]={{1,150},{25,5000},{40,35000},{50,50000},{55,100000}},
			[3]={{1,150},{25,5000},{40,35000},{50,50000},{55,100000}}
		},
	},
	docamhoacot={ --Ngu Doc
		magicenhance_p={{{1,10},{10,20},{15,30},{30,60}}},
		physicsenhance_p={{{1,20},{15,200},{20,300},{40,1000},{50,2000},{55,7500}}},
		poisondamage_v={{{1,200},{15,350},{20,600}},{{1,60},{10,60},{15,60},{20,60},{30,60}},{{1,10},{20,10}}},
		skill_cost_v={{{1,50},{20,50}}},	
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_startevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,1754},{20,1754}}
		},
		skill_showevent={{{1,0},{10,0},{10,1},{20,1}}},
	},
	docamhoacot_2={ --Ngu Doc
		magicenhance_p={{{1,10},{10,20},{15,30},{30,60}}},
		physicsenhance_p={{{1,20},{15,200},{20,300},{40,1000},{50,2000},{55,7500}}},
		poisondamage_v={{{1,200},{15,350},{20,600}},{{1,60},{10,60},{15,60},{20,60},{30,60}},{{1,10},{20,10}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_vanishedevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,1755},{20,1755}}
		},
		skill_showevent={{{1,0},{10,0},{10,8},{20,8}}},
	},
	docamhoacot_3={ --Ngu Doc
		magicenhance_p={{{1,10},{10,20},{15,30},{30,60}}},
		physicsenhance_p={{{1,20},{15,200},{20,300},{40,1000},{50,2000},{55,7500}}},
		poisondamage_v={{{1,200},{15,350},{20,600}},{{1,60},{10,60},{15,60},{20,60},{30,60}},{{1,10},{20,10}}},
	},
	nhatthichdoanhon={ --Duong Mon
		physicsenhance_p={{{1,100},{10,200},{15,300},{20,500},{30,1000}}},
		magicenhance_p={{{1,10},{10,20},{15,30},{30,60}}},
		poisondamage_v={{{1,40},{10,100},{20,300},{30,400}},{{1,60},{20,60}},{{1,10},{20,10}}},
		deadlystrike_p={{{1,1},{30,18}}},
		colddamage_v={
			[1]={{1,5},{10,100},{15,101},{20,200},{30,1000}},
			[3]={{1,5},{10,100},{15,101},{20,200},{30,1000}},
		},
		skill_cost_v={{{1,50},{20,50}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_startevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,1756},{20,1756}}
		},
		skill_showevent={{{1,0},{10,0},{10,1},{20,1}}},
	},
	nhatthichdoanhon_2={ --Duong Mon
		physicsenhance_p={{{1,100},{10,200},{15,300},{20,500},{30,1000}}},
		magicenhance_p={{{1,10},{10,20},{15,30},{30,60}}},
		poisondamage_v={{{1,40},{10,100},{20,300},{30,400}},{{1,60},{20,60}},{{1,10},{20,10}}},
		deadlystrike_p={{{1,1},{30,18}}},
		colddamage_v={
			[1]={{1,5},{10,100},{15,101},{20,200},{30,1000}},
			[3]={{1,5},{10,100},{15,101},{20,200},{30,1000}},
		},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_startevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,1757},{20,1757}}
		},
		skill_showevent={{{1,0},{10,0},{10,1},{20,1}}},
	},
	nhatthichdoanhon_3={ --Duong Mon
		physicsenhance_p={{{1,100},{10,200},{15,300},{20,500},{30,1000}}},
		magicenhance_p={{{1,10},{10,20},{15,30},{30,60}}},
		poisondamage_v={{{1,40},{10,100},{20,300},{30,400}},{{1,60},{20,60}},{{1,10},{20,10}}},
		deadlystrike_p={{{1,1},{30,18}}},
		colddamage_v={
			[1]={{1,5},{10,100},{15,101},{20,200},{30,1000}},
			[3]={{1,5},{10,100},{15,101},{20,200},{30,1000}},
		},
	},
	nhatthichdoanhon_5={ --Duong Mon
		physicsenhance_p={{{1,10},{10,20},{15,30},{20,50},{30,50}}},
		magicenhance_p={{{1,10},{10,20},{15,30},{30,60}}},
		poisondamage_v={{{1,40},{10,100},{20,300},{30,400}},{{1,60},{20,60}},{{1,10},{20,10}}},
		deadlystrike_p={{{1,1},{30,18}}},
		colddamage_v={
			[1]={{1,5},{10,100},{15,101},{20,200},{30,1000}},
			[3]={{1,5},{10,100},{15,101},{20,200},{30,1000}},
		},
	},
	cuonglongvocautran={ --Cai Bang
		magicenhance_p={{{1,10},{10,20},{15,30},{30,60}}},
		physicsenhance_p={{{1,500},{10,1500},{15,2300},{20,3000},{30,5000}}},
		colddamage_v={
			[1]={{1,25},{10,70},{15,200},{20,350},{30,500}},
			[3]={{1,25},{10,70},{15,200},{20,350},{30,500}}
		},
		skill_cost_v={{{1,50},{20,50}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_startevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,1758},{20,1758}}
		},
		skill_showevent={{{1,0},{10,0},{10,1},{20,1}}},
	},
	cuonglongvocautran_2={ --Cai Bang
		magicenhance_p={{{1,10},{10,20},{15,30},{30,60}}},
		physicsenhance_p={{{1,12},{15,50},{40,250},{50,2000},{55,4000}}},
		firedamage_v={
			[1]={{1,250},{10,700},{15,2000},{20,3500},{30,5000}},
			[3]={{1,250},{10,700},{15,2000},{20,3500},{30,5000}}
		},
	},
	nguchoatamvan={ --Thien Nhan
		physicsenhance_p={{{1,450},{10,1200},{15,2000},{20,4000},{30,6000}}},
		magicenhance_p={{{1,10},{10,20},{15,30},{30,60}}},
		deadlystrike_p={{{1,4},{20,45}}},
		colddamage_v={
			[1]={{1,25},{10,70},{15,200},{20,350},{30,500}},
			[3]={{1,25},{10,70},{15,200},{20,350},{30,500}}
		},
		steallife_p={{{1,1},{20,16}}},
		stealmana_p={{{1,1},{20,16}}},
		skill_cost_v={{{1,50},{20,50}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_vanishedevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,1759},{20,1759}}
		},
		skill_showevent={{{1,0},{10,0},{10,8},{20,8}}},
	},	
	nguchoatamvan_2={ --Thien Nhan
		magicenhance_p={{{1,10},{10,20},{15,30},{30,60}}},
		firedamage_v={
			[1]={{1,250},{10,700},{15,2000},{20,3500},{30,5000}},
			[3]={{1,250},{10,700},{15,2000},{20,3500},{30,5000}}
		},
	},
	batkiemvocuc={ --Vo Dang
		magicenhance_p={{{1,10},{10,20},{15,30},{30,60}}},
		lightingdamage_v={
			[1]={{1,250},{10,700},{15,2000},{20,3500},{30,5000}},
			[3]={{1,250},{10,700},{15,2000},{20,3500},{30,5000}}
		},
		stun_p={{{1,10},{20,20},{21,21}},{{1,1},{20,8},{50,36}}},
		skill_cost_v={{{1,50},{20,50}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_startevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,1760},{20,1760}}
		},
		skill_showevent={{{1,0},{10,0},{10,1},{20,1}}},
	},
	batkiemvocuc_2={ --Vo Dang
		magicenhance_p={{{1,10},{10,20},{15,30},{30,60}}},
		lightingdamage_v={
			[1]={{1,250},{10,700},{15,2000},{20,3500},{30,5000}},
			[3]={{1,250},{10,700},{15,2000},{20,3500},{30,5000}}
		},
		stun_p={{{1,10},{20,20},{21,21}},{{1,1},{20,8},{50,36}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_startevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,1761},{20,1761}}
		},
		skill_showevent={{{1,0},{10,0},{10,1},{20,1}}},
	},	
	batkiemvocuc_3={ --Vo Dang
		magicenhance_p={{{1,10},{10,20},{15,30},{30,60}}},
		lightingdamage_v={
			[1]={{1,250},{10,700},{15,2000},{20,3500},{30,5000}},
			[3]={{1,250},{10,700},{15,2000},{20,3500},{30,5000}}
		},
		stun_p={{{1,10},{20,20},{21,21}},{{1,1},{20,8},{50,36}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_vanishedevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,1762},{20,1762}}
		},
		skill_showevent={{{1,0},{10,0},{10,8},{20,8}}},
	},	
	batkiemvocuc_4={ --Vo Dang
		magicenhance_p={{{1,10},{10,20},{15,30},{30,60}}},
		lightingdamage_v={
			[1]={{1,250},{10,700},{15,2000},{20,3500},{30,5000}},
			[3]={{1,250},{10,700},{15,2000},{20,3500},{30,5000}}
		},
		stun_p={{{1,10},{20,20},{21,21}},{{1,1},{20,8},{50,36}}},
	},	
	giangloidietthe={ --Con Lon
		magicenhance_p={{{1,10},{10,20},{15,30},{30,60}}},
		physicsenhance_p={{{1,200},{10,400},{15,600},{20,1000},{30,2000}}},
		lightingdamage_v={
			[1]={{1,100},{15,2000},{30,4000}},
			[3]={{1,200},{15,3000},{30,6000}}
		},
		stun_p={{{1,5},{20,50},{21,50}},{{1,1},{20,12},{21,12}}},
		skill_cost_v={{{1,50},{20,50}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_startevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,1763},{20,1763}}
		},
		skill_showevent={{{1,0},{10,0},{10,1},{20,1}}},
	},	
	giangloidietthe_2={ --Con Lon
		magicenhance_p={{{1,10},{10,20},{15,30},{30,60}}},
		physicsenhance_p={{{1,200},{10,400},{15,600},{20,1000},{30,2000}}},
		lightingdamage_v={
			[1]={{1,100},{15,2000},{30,4000}},
			[3]={{1,200},{15,3000},{30,6000}}
		},
		stun_p={{{1,5},{20,50},{21,50}},{{1,1},{20,12},{21,12}}},
	},
	tanthu={ --buff tan thu
		lifemax_p={{{1,10},{30,300}},{{1,-1},{30,-1}}},
		lifereplenish_v={{{1,100},{30,3000}},{{1,-1},{30,-1}}},
		manareplenish_v={{{1,100},{30,3000}},{{1,-1},{30,-1}}},
		--allres_p={{{1,10},{30,300}},{{1,-1},{30,-1}}},
		attackspeed_v={{{1,10},{30,300}},{{1,-1},{30,-1}}},
		castspeed_v={{{1,10},{30,300}},{{1,-1},{30,-1}}},
		lucky_v={{{1,10},{30,300}},{{1,-1},{30,-1}}},
		sorbdamage_p={{{1,1000},{30,30000}},{{1,-1},{30,-1}}}, -- TriÖt tiªu s¸t th­¬ng
		block_rate={{{1,10},{20,100}},{{1,-1},{30,-1}}}, -- X¸c suÊt hãa gi¶i s¸t th­¬ng
		--skill_cost_v={{{1,10},{30,50}}}
	},
	badao={ --buff
		expenhance_p={{{1,10000},{30,300000}},{{1,-1},{30,-1}}},  --S¸t th­¬ng ®~ch nhËn ®­îc kinh nghiÖm
		lifereplenish_v={{{1,10000},{30,300000}},{{1,-1},{30,-1}}},  --Phôc håi sinh lùc mçi nöa gi©y
		manareplenish_v={{{1,10000},{30,300000}},{{1,-1},{30,-1}}}, --Phôc håi néi lùc mçi nöa gi©y
		allres_p={{{1,10000},{30,300000}},{{1,-1},{30,-1}}},
		attackspeed_v={{{1,10},{30,300}},{{1,-1},{30,-1}}},
		castspeed_v={{{1,10},{30,300}},{{1,-1},{30,-1}}},
		lucky_v={{{1,10},{30,300}},{{1,-1},{30,-1}}},
		sorbdamage_p={{{1,1000},{30,30000}},{{1,-1},{30,-1}}}, -- TriÖt tiªu s¸t th­¬ng
		block_rate={{{1,100},{30,100}},{{1,-1},{30,-1}}}, -- X¸c suÊt hãa gi¶i s¸t th­¬ng
		visionradius_p={{{1,10},{30,300}},{{1,-1},{30,-1}}}, --Ph¹m vi s¸t th­¬ng: #d1-%
		ignoredefense_p={{{1,100},{30,100}},{{1,-1},{30,-1}}},
		strength_v={{{1,10000},{30,300000}},{{1,-1},{30,-1}}},
		dexterity_v={{{1,10000},{30,300000}},{{1,-1},{30,-1}}},
		vitality_v={{{1,10000},{30,300000}},{{1,-1},{30,-1}}},
		energy_v={{{1,10000},{30,300000}},{{1,-1},{30,-1}}},
		add_boss_damage={{{1,10000},{30,300000}},{{1,-1},{30,-1}}},
		do_hurt_p={{{1,10000},{30,300000}},{{1,-1},{30,-1}}},
		skill_enhance={{{1,10000},{30,300000}},{{1,-1},{30,-1}}},
		deadlystrike_p={{{1,100},{30,100}},{{1,-1},{30,-1}}}, --TÊn c«ng chU m¹ng: #d1-%
		fatallystrike_p={{{1,100},{30,100}},{{1,-1},{30,-1}}}, --TÊn c«ng chU t? #d1-%
	},
}

function Line(x,x1,y1,x2,y2)
	if(x2==x1) then
		return y2
	end
	return (y2-y1)*(x-x1)/(x2-x1)+y1
end

function Conic(x,x1,y1,x2,y2)
	if((x1 < 0) or (x2<0))then 
		return 0
	end
	if(x2==x1) then
		return y2
	end
	return (y2-y1)*x*x/(x2*x2-x1*x1)-(y2-y1)*x1*x1/(x2*x2-x1*x1)+y1
end

function Extrac(x,x1,y1,x2,y2)
	if((x1 < 0) or (x2<0))then 
		return 0
	end
	if(x2==x1) then
		return y2
	end
	return (y2-y1)*(x-x1)/(x2-x1)+y1
end

function Link(x,points)
	num = getn(points)
	if(num<2) then
		return -1
	end
	for i=1,num do
		if(points[i][3]==nil) then
			points[i][3]=Line
		end
	end
	if(x < points[1][1]) then
		return points[1][3](x,points[1][1],points[1][2],points[2][1],points[2][2])
	end
	if(x > points[num][1]) then
		return points[num][3](x,points[num-1][1],points[num-1][2],points[num][1],points[num][2])
	end
	
	c = 2
	for i=2,num do
		if((x >= points[i-1][1]) and (x <= points[i][1])) then
			c = i
			break
		end
	end
	return points[c][3](x,points[c-1][1],points[c-1][2],points[c][1],points[c][2])
end

function GetSkillLevelData(levelname, data, level)
	if(data==nil) then
		return ""
	end
	if(data == "") then
		return ""
	end
	if(SKILLS[data]==nil) then
		return ""
	end
	if(SKILLS[data][levelname]==nil) then
		return ""
	end
	if(type(SKILLS[data][levelname]) == "function") then
		return SKILLS[data][levelname](level)
	end
	if(SKILLS[data][levelname][1]==nil) then
		SKILLS[data][levelname][1]={{0,0},{20,0}}
	end
	if(SKILLS[data][levelname][2]==nil) then
		SKILLS[data][levelname][2]={{0,0},{20,0}}
	end
	if(SKILLS[data][levelname][3]==nil) then
		SKILLS[data][levelname][3]={{0,0},{20,0}}
	end
	p1=floor(Link(level,SKILLS[data][levelname][1]))
	p2=floor(Link(level,SKILLS[data][levelname][2]))
	p3=floor(Link(level,SKILLS[data][levelname][3]))
	return Param2String(p1,p2,p3)
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;
