--迭代函数，用于计算技能熟练度
--具体方法：
--根据1级熟练度，升级加速度，级数，重复伤害次数，范围，计算出相应等级熟练度
-- SkillExp(i) = Exp1*a^(i-1)*time*range


SKILLS={
	
	mohe_wuliang={ --摩诃无量
		--普攻伤害：#d1-到#d3-点
		physicsenhance_p={{{1,52},{20,372}}},
		--五行相克：#d1-%
		seriesdamage_p={{{1,50},{20,50},{21,50}}},
		--冰攻伤害：#d1-到#d3-点
		colddamage_v={
			[1]={{1,56},{20,56}},
			[3]={{1,112},{20,112}}
		},
		--子弹飞行速度
		missle_speed_v={{{1,32},{20,32}}},
		--技能释放范围
		skill_attackradius={{{1,700},{20,700}}},
		--施法消耗[SkillCostType]（skills表中）类型的值
		skill_cost_v={{{1,0},{20,0}}},
		--技能冷却时间
		skill_mintimepercast_v={{{1,450},{20,450}}},
		skill_mintimepercastonhorse_v={{{1,450},{20,450}}},
	},
	
	jiugong_feixing={ --九宫飞星
		--五行相克：#d1-%
		seriesdamage_p={{{1,50},{15,50},{20,50},{21,50}}},
		--普攻伤害：#d1-到#d3-点
		physicsenhance_p={{{1,10},{15,100},{20,294}}},
		--攻击会心一击率：#d1-%
		deadlystrike_p={{{1,50},{20,50}}},
		--外功系毒攻伤害：#d1+点/次
		poisondamage_v={{{1,1},{20,30}},{{1,60},{20,60}},{{1,10},{20,10}}},
		--子弹飞行速度
		missle_speed_v={{{1,32},{20,32},{21,32}}},
		--技能释放范围
		skill_attackradius={{{1,700},{20,700}}},
		skill_cost_v={{{1,0},{20,0}}},
		--技能冷却时间
		skill_mintimepercast_v={{{1,450},{20,450}}},
		skill_mintimepercastonhorse_v={{{1,450},{20,450}}},
	},
	
	tiangang_disha={ --天罡地煞
		seriesdamage_p={{{1,50},{20,50},{21,50}}},
		poisondamage_v={{{1,50},{20,135}},{{1,60},{20,60}},{{1,10},{20,10}}},
		--子弹飞行速度
		missle_speed_v={{{1,16},{20,16}}},
		skill_attackradius={{{1,700},{20,700}}},
		skill_cost_v={{{1,0},{20,0}}},
		--技能冷却时间
		skill_mintimepercast_v={{{1,450},{20,450}}},
		skill_mintimepercastonhorse_v={{{1,450},{20,450}}},
	},
	
	bumie_bujue={ --不灭不绝
		physicsenhance_p={{{1,80},{20,385}}},
		seriesdamage_p={{{1,50},{20,50}}},
		colddamage_v={
			[1]={{1,10},{20,282}},
			[3]={{1,10},{20,282}}
		},
		deadlystrike_p={{{1,80},{20,80}}},
		missle_speed_v={{{1,32},{20,32},{21,32}}},
		skill_attackradius={{{1,700},{20,700}}},
		skill_cost_v={{{1,0},{20,0}}},
		--技能冷却时间
		skill_mintimepercast_v={{{1,450},{20,450}}},
		skill_mintimepercastonhorse_v={{{1,450},{20,450}}},
	},
	
	bihai_chaosheng={ --碧海潮生
		seriesdamage_p={{{1,50},{20,50},{21,50}}},
		physicsdamage_v={
			[1]={{1,20},{20,200}},
			[3]={{1,20},{20,200}},
		},
		colddamage_v={
			[1]={{1,43},{20,704}},
			[3]={{1,43},{20,1214}}
		},
		skill_attackradius={{{1,700},{20,700}}},
		skill_cost_v={{{1,0},{20,0}}},
		--技能冷却时间
		skill_mintimepercast_v={{{1,450},{20,450}}},
		skill_mintimepercastonhorse_v={{{1,450},{20,450}}},
	},
	
	bangda_egou={ --棒打恶狗
		physicsenhance_p={{{1,10},{20,179}}},
		seriesdamage_p={{{1,50},{20,50},{21,50}}},
		firedamage_v={
			[1]={{1,70},{20,360}},
			[3]={{1,70},{20,420}}
		},
		missle_speed_v={{{1,32},{20,32}}},
		skill_attackradius={{{1,700},{20,700}}},
		skill_cost_v={{{1,0},{20,0}}},
		--技能冷却时间
		skill_mintimepercast_v={{{1,450},{20,450}}},
		skill_mintimepercastonhorse_v={{{1,450},{20,450}}},
	},
	
	liehuo_qingtian={ --烈火情天
		seriesdamage_p={{{1,50},{20,50}}},
		physicsenhance_p={{{1,15},{20,75}}},
		firedamage_v={
			[1]={{1,8},{20,150}},
			[3]={{1,8},{20,150}}
		},
		missle_speed_v={{{1,32},{20,32}}},
		skill_attackradius={{{1,700},{20,700}}},
		skill_cost_v={{{1,0},{20,0}}},
		--技能冷却时间
		skill_mintimepercast_v={{{1,450},{20,450}}},
		skill_mintimepercastonhorse_v={{{1,450},{20,450}}},
	},
	

	wuwo_wujian={ --无我无剑
		lightingdamage_v={
			[1]={{1,1},{20,5}},
			[3]={{1,5},{20,752}}
		},
		seriesdamage_p={{{1,50},{20,50},{21,50}}},
		--攻击致昏对手几率：#d1-%
		stun_p={{{1,20},{20,20}},{{1,10},{20,10},{21,10}}},
		--同时发出#d1-个子弹数
		skill_misslenum_v={{{1,64},{20,64},{21,64}}},
		missle_speed_v={{{1,32},{20,32},{21,32}}},
		skill_attackradius={{{1,700},{20,700},{21,700}}},
		skill_cost_v={{{1,70},{20,130}}},
		--技能冷却时间
		skill_mintimepercast_v={{{1,450},{20,450}}},
		skill_mintimepercastonhorse_v={{{1,450},{20,450}}},
	},
	
	wulei_zhengfa={ --五雷正法
		seriesdamage_p={{{1,50},{20,50},{21,50}}},
		lightingdamage_v={
			[1]={{1,25},{20,937}},
			[3]={{1,25},{20,937}}
		},
		--子弹飞行速度
		missle_speed_v={{{1,16},{20,16}}},
		skill_attackradius={{{1,700},{20,700},{21,700}}},
		skill_cost_v={{{1,0},{20,0}}},
		--技能冷却时间
		skill_mintimepercast_v={{{1,450},{20,450}}},
		skill_mintimepercastonhorse_v={{{1,450},{20,450}}},
	},
		qingxing_zhen={ --七星阵
		attackratingenhance_p={{{1,24},{20,500}},{{1,18},{2,18}}},
		adddefense_v={{{1,97},{20,800}},{{1,18},{20,18}}},
		anti_block_rate={{{1,1},{20,100}},{{1,-1},{2,-1}}},
		block_rate={{{1,1},{20,100},{21,100}},{{1,-1},{20,-1}}},
		enhancehit_rate={{{1,300},{2,300}},{{1,-1},{20,-1}}},
		anti_allres_yan_p={{{1,40},{20,70},{21,70}},{{1,18},{2,18}}}, --忽略对方全抗
		anti_sorbdamage_yan_p={{{1,200},{10,200}},{{1,18},{2,18}}}, --加深伤害
		allres_yan_p={{{1,10},{20,60},{40,70},{40,70}},{{1,18},{2,18}}}, --所有抗性增加
		sorbdamage_yan_p={{{1,200},{20,200},{40,250},{41,250}},{{1,-1},{20,-1}}},--抵消伤害 
	},
		luohan_zhen={ --罗汉阵
		addphysicsdamage_p={{{1,11},{20,135}},{{1,18},{2,18}},{{1,6},{2,6}}},
		meleedamagereturn_p={{{1,1},{20,20},{25,25},{26,25}},{{1,18},{2,18}}},
		rangedamagereturn_p={{{1,1},{20,20},{25,25},{26,25}},{{1,18},{2,18}}},
		adddefense_v={{{1,40},{20,800}},{{1,18},{2,18}}},
		anti_block_rate={{{1,1},{30,100},{31,100}},{{1,-1},{2,-1}}},
		block_rate={{{1,1},{20,100},{21,100}},{{1,-1},{20,-1}}},
		enhancehit_rate={{{1,300},{2,300}},{{1,-1},{20,-1}}},
		anti_allres_yan_p={{{1,40},{20,70},{21,70}},{{1,18},{2,18}}}, --忽略对方全抗
		anti_sorbdamage_yan_p={{{1,200},{10,200}},{{1,18},{2,18}}}, --加深伤害
		allres_yan_p={{{1,10},{20,60},{40,70},{40,70}},{{1,18},{2,18}}}, --所有抗性增加
		sorbdamage_yan_p={{{1,200},{20,200},{40,250},{41,250}},{{1,-1},{20,-1}}},--抵消伤害 
		attackratingenhance_p={{{1,1000},{20,1000}},{{1,18},{2,18}}},--加命中
	},
		liushui={--流水
		fastwalkrun_p={{{1,5},{20,33}},{{1,18},{2,18}}},--降低一半移动速度
		anti_block_rate={{{1,1},{20,100}},{{1,18},{2,18}}},
		block_rate={{{1,1},{20,100},{21,100}},{{1,18},{2,18}}},
		enhancehit_rate={{{1,300},{2,300}},{{1,18},{2,18}}},
		anti_allres_yan_p={{{1,40},{20,70},{21,70}},{{1,18},{2,18}}}, --忽略对方全抗
		anti_sorbdamage_yan_p={{{1,200},{10,200}},{{1,18},{2,18}}}, --加深伤害
		allres_yan_p={{{1,10},{20,70},{40,75},{41,75}},{{1,18},{2,18}}}, --所有抗性增加
		sorbdamage_yan_p={{{1,200},{20,200},{40,400},{41,400}},{{1,18},{2,18}}},--抵消伤害 
		attackratingenhance_p={{{1,1000},{20,1000}},{{1,18},{2,18}}},--加命中
		enhancehiteffect_rate={{{1,1},{20,50},{21,50}},{{1,18},{2,18}}},--重击效果
	},
		bangda_egou1={ --棒打恶狗
		physicsdamage_v={
			[1]={{1,200},{20,500000*10}},--普攻伤害提升到500000%
			[3]={{1,200},{20,500000*10}},
		},
		firedamage_v={
			[1]={{1,43},{20,5000000*10}},--冰攻伤害提升到5000000-5000000
			[3]={{1,43},{20,5000000*10}}
		},
		seriesdamage_p={{{1,50},{20,100},{21,100}}},
		deadlystrike_p={{{1,200},{20,200}}},
		--anti_block_rate={{{1,1},{30,200},{31,200}},{{1,-1},{2,-1}}},
		missle_speed_v={{{1,50},{20,50}}},
		skill_attackradius={{{1,900},{20,900}}},
		skill_cost_v={{{1,0},{20,0}}},
		--技能冷却时间
		skill_mintimepercast_v={{{1,18*30},{20,18*30}}},
		skill_mintimepercastonhorse_v={{{1,18*30},{20,18*30}}},
	},
		yuan_run={ --圆润
		block_rate=
		{
		[1]={{1,-30},{2,-40},{3,-50}},
		[2]={{1,-1},{10,-1}},
		}
	},
}
-----------------------------------------------
--Create by yfeng 2004-05-20
-----------------------------------------------

-----------------------------------------------
--根据2个点，求线形函数f(x)=k*x+b
--y= (y2-y1)*(x-x1)/(x2-x1)+y1
--当x2=x1, 有x=c,该直线是一条垂直于x轴的直线
--这是可以取得y=任意值
--因此，如果已知两点(x1,y1),(x2,y2)可求得过此2点的
--函数为：
function Line(x,x1,y1,x2,y2)
	if(x2==x1) then
		return y2
	end
	return (y2-y1)*(x-x1)/(x2-x1)+y1
end

-----------------------------------------------
--根据2个点，求2次形函数f(x)=a*x2+c
--y= (y2-y1)*x*x/(x2*x2-x1*x1)-(y2-y1)*x1*x1/(x2*x2-x1*x1)+y1
--当x1或者x2 < 0 ,y =0
--当x2=x1, 有x=c,是一条垂直于x轴的直线
--这是可以取得y=任意值
--因此，如果已知两点(x1,y1),(x2,y2)可求得过此2点的
--函数为：extrac
function Conic(x,x1,y1,x2,y2)
	if((x1 < 0) or (x2<0))then 
		return 0
	end
	if(x2==x1) then
		return y2
	end
	return (y2-y1)*x*x/(x2*x2-x1*x1)-(y2-y1)*x1*x1/(x2*x2-x1*x1)+y1
end

-----------------------------------------------
--根据2个点，求-2次形函数f(x)=a*sqrt(x2)+c
--y=(y2-y1)*x/(sqrt(x2)-sqrt(x1))+y1-(y2-y1)/((sqrt(x2)-sqrt(x1))
--当x2或者x1<0, y=0,
--当x1=x2,有x=c,是一条垂直于x轴的直线
--这是可以取得y=任意值
--因此，如果已知两点(x1,y1),(x2,y2)可求得过此2点的
--函数为：extrac
function Extrac(x,x1,y1,x2,y2)
	if((x1 < 0) or (x2<0))then 
		return 0
	end
	if(x2==x1) then
		return y2
	end
	return (y2-y1)*(x-x1)/(x2-x1)+y1
end

-----------------------------------------------
--描绘连接线:Link(x,points)
--根据points提供的一系列点，用相邻的两个点描绘曲线
--return y值
--x 输入值
--points 点集合
--形如：points是形如{{x1,y1,func=xxx},{x2,y2,func=xxx},...{xn,yn,func=xxx}}的映射
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

------------------------------------------------------
--技能设定格式如下：
--SKILLS={
--	技能名称=	{
--		魔法属性=	{
--			[1]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，
--			[2]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，
--			[3]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，	
--		}，
--		魔法属性=	{
--			[1]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，
--			[2]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，
--			[3]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，	
--		}，
--		。。。。。
--	}，
--	技能名称=	{
--		魔法属性=	{
--			[1]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，
--			[2]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，
--			[3]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，	
--		}，
--		魔法属性=	{
--			[1]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，
--			[2]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，
--			[3]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，	
--		}，
--		。。。。。
--	}，
--	。。。。。
--}
--如：
--SKILLS={
--	Sanhuan-taoyue={
--		physicsenhance_p={
--			[1]={{1,50},{20,335}},--魔法属性physicsenhance_p参数1，1级时为35，20级时为335，曲线不填，默认线形
--			[2]={{1,0},{20,0}},
--		},--没有[3]，表示魔法属性physicsenhance_p参数2，默认为任何时候都是0
--		lightingdamage_v={
--			[1]={{1,65},{20,350}},
--			[3]={{1,65},{20,350}},
--		}
--	}
--}
--以上描述技能“三环套月”的魔法属性和数值
-----------------------------------------------------------
--函数GetSkillLevelData(levelname, data, level)
--levelname：魔法属性名称
--data：技能名称
--level：技能等级
--return：当技能名称为data，技能等级为level
--			时的魔法属性levelname所需求的三个参数的具体值
-----------------------------------------------------------
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
