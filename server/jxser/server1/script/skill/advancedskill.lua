-- ?gm ds LoadClientScript("\\script\\skill\\advancedskill.lua")

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
--区分高位byte跟低8位的Line
function LineWith8Byte(x,x1,y1,x2,y2)
	if(x2==x1) then
		return y2
	end
	local y1_l = mod(y1, 256)		-- y1的低8位
	local y1_h = floor(y1/256)		-- y1的高位
	local y2_l = mod(y2, 256)		-- y2的低8位
	local y2_h = floor(y2/256)		-- y2的高位
	local y3_l = floor((y2_l-y1_l)*(x-x1)/(x2-x1)+y1_l)
	local y3_h = floor((y2_h-y1_h)*(x-x1)/(x2-x1)+y1_h)
	local y_result = y3_h*256 + y3_l
	return y_result
end

SKILLS=
{
	sl_adskill={ --少林进阶技能
		skill_desc=
			function(level)
				return "Khi thi tri觧 <color=water>[Minh K輓h V?Уi]<color> t╪g c玭g k輈h t莔 g莕 v?t莔 xa<color=orange>"..floor(Link(level,SKILLS.sl_adskill.meleedamagereturn_p[1])).."%<color>ph秐 s竧 thng, duy tr?color=orange>"..floor(Link(level,SKILLS.sl_adskill.meleedamagereturn_p[2]) / 18).." gi﹜<color>\n"
			end,
		autoreplyskill=
		{
			{{1,1230 * 256 + 1,LineWith8Byte},{20,1230 * 256 + 20,LineWith8Byte}},
			{{1,-1 },{20,-1 }},
			{{1,30*18*256 + 3,LineWith8Byte},{20,20*18*256 + 5,LineWith8Byte},{30,20*18*256 + 7,LineWith8Byte},{31,20*18*256 + 7,LineWith8Byte}}
		},
		meleedamagereturn_p={{{1,10},{20,50},{30,60},{31,60}},{{1,10*18},{20,15*18},{21,15*18}}},
		rangedamagereturn_p={{{1,10},{20,50},{30,60},{31,60}},{{1,10*18},{20,15*18},{21,15*18}}},
							},
	tw_adskill={ --天王进阶技能
		skill_desc=
			function(level)
				return "Thi tri觧 <color=water>[Du Long Ch﹏ Kh輂<color> c?color=orange>"..floor(100 - Link(level,SKILLS.tw_adskill.missle_missrate[1])).."%<color>t?l?mi詎 d辌h tr筺g th竔 ti猽 c鵦 c馻 b秐 th﹏, duy tr?color=orange>"..floor(Link(level,SKILLS.tw_adskill.ignorenegativestate_p[2]) / 18).." gi﹜<color>\n"
			end,
		autoreplyskill=
		{
			{{1,1231 * 256 + 1,LineWith8Byte},{20,1231 * 256 + 20,LineWith8Byte}},
			{{1,-1 },{20,-1 }},
			{{1,30*18*256 + 1,LineWith8Byte},{20,10*18*256 + 3,LineWith8Byte},{30,10*18*256 + 5,LineWith8Byte},{31,10*18*256 + 5,LineWith8Byte}}
		},
--		autoattackskill=
--		{
--			{{1,738*256 + 1},{20,738*256 + 20}},
--			{{1,10},{20,40}},
--			{{1,10*18*256 + 10},{20,4*18*256 + 50}}
--		},
		missle_missrate={{{1,80},{20,20},{30,10},{31,10}}},
		ignorenegativestate_p=
		{
			{{1,100},{15,100},{20,100},{21,100}},
			{{1,1*18},{20,3*18},{30,4*18},{31,4*18}},
		},
							},
	wu_adskill ={ --五毒进阶技能
		skill_desc=
			function(level)
				return "Tr髇g m鬰 ti猽 c?color=orange>"..floor(Link(level,SKILLS.wu_adskill.autoattackskill[3]) - 1*18*256).."%<color>t?l?b閏 ph竧 <color=water>[H錸 秐h T飊g Sinh]<color> c蕄 tng 鴑g\n"..
				"Sau m鏸 l莕 thi tri觧<color=orange>"..floor((Link(level,SKILLS.wu_adskill.autoattackskill[3]) / (18*256))).."gi﹜<color> s?kh玭g thi tri觧 l筰\n"
			end,
		autoattackskill=
		{
			{{1,1232*256 + 1,LineWith8Byte},{20,1232*256 + 20,LineWith8Byte}},
			{{1,-1 },{20,-1 }},
			{{1,1*18*256 + 20,LineWith8Byte},{20,1*18*256 + 80,LineWith8Byte},{30,1*18*256 + 95,LineWith8Byte},{31,1*18*256 + 95,LineWith8Byte}}
		},--增加触发几率
							},
	tm_adskill ={ --唐门进阶技能
		skill_desc=
			function(level)
				return "Khi sinh l鵦 th蕄 h琻 25% c?x竎 su蕋 <color=orange>"..floor(Link(level,SKILLS.tm_adskill.autorescueskill[3]) - 15*18*256).."%<color>t?l?thi tri觧 100% h鉧 gi秈 s竧 thng\n"..
				"Sau m鏸 l莕 thi tri觧<color=orange>"..floor((Link(level,SKILLS.tm_adskill.autorescueskill[3]) / (18*256))).."gi﹜<color> s?kh玭g thi tri觧 l筰\n"
			end,	
		block_rate={{{1,100},{2,100}},{{1,18*2},{20,18*4}}},
		autorescueskill=
		{
			{
				{1,1233*256 + 1,LineWith8Byte},{20,1233*256 + 20,LineWith8Byte},
			},
			{
				{1,-1},{20,-1}
			},
			{
				{1,15*18*256 + 5,LineWith8Byte},
				{20,15*18*256 + 20,LineWith8Byte},
				{30,15*18*256 + 25,LineWith8Byte},
			}
		},
								},
	em_adskill ={ --峨眉进阶技能
		skill_desc=
			function(level)
				return "Tr髇g m鬰 ti猽 c?color=orange>"..floor(Link(level,SKILLS.em_adskill.autoattackskill[3]) - 3*18*256).."%<color>t?l?thi tri觧 <color=water>[T?H祅g Ph?ч]<color> c蕄 tng 鴑g\n"..
				"Sau m鏸 l莕 thi tri觧<color=orange>"..floor((Link(level,SKILLS.em_adskill.autoattackskill[3]) / (18*256))).."gi﹜<color> s?kh玭g thi tri觧 l筰\n"
			end,
		autoattackskill=
		{
			{{1,1234*256 + 1,LineWith8Byte},{20,1234*256 + 20,LineWith8Byte}},
			{{1,-1 },{20,-1 }},
			{{1,3*18*256 + 10,LineWith8Byte},{20,3*18*256 + 30,LineWith8Byte},{30,3*18*256 + 35,LineWith8Byte}}
		},
							},
	cy_adskill ={ --翠烟进阶技能
		skill_desc=
			function(level)
				return "Thi tri觧 <color=water>[Dung Tuy誸 V?Tung]<color> l祄 萵 th﹏, m鏸 l莕 萵 th﹏ duy tr?color=orange>"..floor(Link(level,SKILLS.cy_adskill.hide[2]) / 18).." gi﹜<color>\n"
			end,
		autoreplyskill=
		{
			{{1,1235 * 256 + 1,LineWith8Byte},{20,1235 * 256 + 20,LineWith8Byte}},
			{{1,-1 },{20,-1 }},
			{{1,20*18*256 + 3,LineWith8Byte},{20,10*18*256 + 5,LineWith8Byte},{30,10*18*256 + 7,LineWith8Byte},{31,10*18*256 + 7,LineWith8Byte}}
		},
		hide=
		{
			{{1,2},{20,5},{30,6},{31,6}},
			{{1,2*18},{20,5*18},{30,6*18},{31,6*18}}
		},
								},				
	tr_adskill ={ --天忍进阶技能
		autoreplyskill=
		{
			{{1,1236 * 256 + 1,LineWith8Byte},{20,1236 * 256 + 20,LineWith8Byte}},
			{{1,-1 },{20,-1 }},
			{{1,30*18*256 + 1,LineWith8Byte},{20,20*18*256 + 3,LineWith8Byte},{30,20*18*256 + 5,LineWith8Byte},{31,20*18*256 + 5,LineWith8Byte}}
		},
								},
	gb_adskill={ --丐帮进阶技能
		skill_desc=
			function(level)
				return "Khi thi tri觧 <color=water>[Thi猲 H祅h Kh?C玭g]<color>c?th?t╪g t?l?b閏 ph竧 [H鏽 Thi猲 Kh?C玭g]<color=orange>"..floor(Link(level,SKILLS.gb_adskill.enhance_714_auto[1])).."%<color>, \n"..
				"v?b?qua h醓 ph遪g: <color=orange>"..floor(Link(level,SKILLS.gb_adskill.anti_fireres_yan_p[1])).."%(Dng)<color>, duy tr?color=orange>"..floor(Link(level,SKILLS.gb_adskill.enhance_714_auto[2])/18).." gi﹜<color>\n"
				end,
		autoreplyskill=
		{
			{{1,1237 * 256 + 1,LineWith8Byte},{20,1237 * 256 + 20,LineWith8Byte}},
			{{1,-1 },{20,-1 }},
			{{1,30*18*256 + 3,LineWith8Byte},{20,20*18*256 + 10,LineWith8Byte},{30,20*18*256 + 13,LineWith8Byte},{31,20*18*256 + 13,LineWith8Byte}}
		},
		enhance_714_auto=
		{
			{{1,2},{20,20},{30,25},{31,25}},
			{{1,5*18 },{20,15*18},{21,15*18}}
		},
		anti_fireres_yan_p=
		{
			{{1,6},{20,20},{30,25},{31,25}},
			{{1,5*18 },{20,15*18},{21,15*18}}
		},
								},
	wd_adskill ={ --武当进阶技能
		skill_desc=
			function(level)
				return "Khi thi tri觧 <color=water>[ Dng Khi Quy誸]<color> c?th?khi課<color=orange>"..floor(Link(level,SKILLS.wd_adskill.damage2addmana_p[1])).."%<color>s竧 thng chuy觧 h鉧 th祅h n閕 l鵦, duy tr?color=orange>"..floor(Link(level,SKILLS.wd_adskill.damage2addmana_p[2])/18).." gi﹜<color>\n"
				end,
		autoreplyskill=
		{
			{{1,1238 * 256 + 1,LineWith8Byte},{20,1238 * 256 + 20,LineWith8Byte}},
			{{1,-1 },{20,-1 }},
			{{1,30*18*256 + 3,LineWith8Byte},{20,20*18*256 + 10,LineWith8Byte},{30,20*18*256 + 13,LineWith8Byte},{31,20*18*256 + 13,LineWith8Byte}}
		},
		damage2addmana_p=
		{
			{{1,50},{20,200},{30,248},{31,248}},
			{{1,5*18 },{20,15*18},{21,15*18}}
		}
								},
	kl_adskill ={ --昆仑进阶技能
		skill_desc=
			function(level)
				return "Khi thi tri觧<color=water>[Ti猲 Thi猲 Cng Kh輂<color> c?th?t╪g t?l?b閏 ph竧 [Lng Nghi Ch﹏ Kh輂<color=orange>"..floor(Link(level,SKILLS.kl_adskill.enhance_717_auto[1])).."%<color>, \n"..
				"v?b?qua L玦 ph遪g: <color=orange>"..floor(Link(level,SKILLS.kl_adskill.anti_lightingres_yan_p[1])).."%(Dng)<color>, duy tr?color=orange>"..floor(Link(level,SKILLS.gb_adskill.enhance_714_auto[2])/18).." gi﹜<color>\n"
				end,
		autoreplyskill=
		{
			{{1,1239 * 256 + 1,LineWith8Byte},{20,1239 * 256 + 20,LineWith8Byte}},
			{{1,-1 },{20,-1 }},
			{{1,30*18*256 + 3,LineWith8Byte},{20,20*18*256 + 5,LineWith8Byte},{30,20*18*256 + 7,LineWith8Byte},{31,20*18*256 + 7,LineWith8Byte}}
		},
		enhance_717_auto=
		{
			{{1,3},{20,15},{30,20},{31,20}},
			{{1,5*18 },{20,15*18},{21,15*18}}
		},
		anti_lightingres_yan_p=
		{
			{{1,5},{20,15},{30,20},{31,20}},
			{{1,5*18 },{20,15*18},{21,15*18}}
		},
	},
	xy_adskill ={ --逍遥进阶技能
		skill_desc=
			function(level)
				return "<color=water>「拂衣」<color>状态：释放一个可抵御内力最大值<color=orange>"..floor(Link(level,SKILLS.xy_adskill.staticmagicshield_p[1])/100)..
				"倍<color>伤害的真气护盾\n护盾每<color=orange>"..floor(Link(level,SKILLS.xy_adskill.staticmagicshield_p[2])/18+1)..
				"秒<color>刷新一次，持续<color=orange>"..floor(Link(level,SKILLS.xy_adskill.fastwalkrun_p[2])/18).."秒<color>\n\n"
			end,
		autoreplyskill=
		{
			{{1,2102 * 256 + 1,LineWith8Byte},{20,2102 * 256 + 20,LineWith8Byte}},
			{{1,-1 },{20,-1 }},
			{{1,30*18*256 + 1,LineWith8Byte},{30,30*18*256 + 10,LineWith8Byte},{31,30*18*256 + 10,LineWith8Byte}}
		},
		fastwalkrun_p={{{1,0},{20,0}},{{1,5*18},{20,10*18},{21,10*18}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
		autocastskill = {
			{{1,1903*256 + 1},{20,1903*256 + 20}},--目标技能id * 256 + 等级
			{{1,-1},{20,-1}},-- 为1表示算CD，不算CD填-1
			{{1, (1*18*256 + 100)},{20, (1*18*256 + 100)}},-- 间隔帧数 * 256 + 发动几率
		},
		staticmagicshield_p={{{1,100},{20,1000},{21,1050}},{{1,17},{20,17}}},
	},
}

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
