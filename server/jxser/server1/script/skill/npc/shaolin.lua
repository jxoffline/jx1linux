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


local SKILLS={

	dachengrulaizhou={ --大乘如来咒
		poisondamagereturn_p={{{1,5},{15,40},{20,45},{21,45}},{{1,-1},{2,-1}}},
		returnskill_p={{{1,5},{15,50},{20,56},{21,57}},{{1,-1},{2,-1}}},
		autoreplyskill={{{1,20 * 256 + 1},{20,20 * 256 + 20},{21,20*256 + 21}},{{1,-1},{2,-1}},{{1,10*18*256 + 1},{19,4*18*256 + 3},{20,5*18*256 + 3},{21,5*18*256 + 3}}},
		skill_skillexp_v={{	{1,17851239},
							{2,19487603},
							{3,22760330},
							{4,27669421},
							{5,34214875},
							{6,42396694},
							{7,52214875},
							{8,63669421},
							{9,76760330},
							{10,91487603},
							{11,107851239},
							{12,135669421},
							{13,174942148},
							{14,225669421},
							{15,274418181},
							{16,344618181},
							{17,425738181},
							{18,517778181},
							{19,620738181},
							{20,620738181},
							}},	
	},
}



function GetSkillLevelData(levelname, data, level)



	if (data == "dachengrulaizhou") then
		return GetSkillLevelDataByTable(levelname, data, level)
	end
	
	if (levelname == "fasthitrecover_v") then
		return Getfasthitrecover_v(level)
	end;

	if (levelname == "fatallystrikeres_p") then
		return Getfatallystrikeres_p(level)
	end;
	
	if (levelname == "freezetimereduce_p") then
		return Getfreezetimereduce_p(level)
	end;

	if (levelname == "poisontimereduce_p") then
		return Getpoisontimereduce_p(level)
	end;

	if (levelname == "stuntimereduce_p") then
		return Getstuntimereduce_p(level)
	end;

	str1 = ""
	return str1
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;

function Getfasthitrecover_v(level)
return Param2String(100,-1,0)
end;

function Getfreezetimereduce_p(level)
return Param2String(200,-1,0)
end;

function Getpoisontimereduce_p(level)
return Param2String(300,-1,0)
end;

function Getstuntimereduce_p(level)
return Param2String(200,-1,0)
end;

function Getfatallystrikeres_p(level)
return Param2String(99,-1,0)
end







function GetSkillLevelDataByTable(levelname, data, level)
	if(data==nil) then
		return ""
	end
	if(data == "") then
		return ""
	end
	if(%SKILLS[data]==nil) then
		return ""
	end
	if(%SKILLS[data][levelname]==nil) then
		return ""
	end
	if(%SKILLS[data][levelname][1]==nil) then
		%SKILLS[data][levelname][1]={{0,0},{20,0}}
	end
	if(%SKILLS[data][levelname][2]==nil) then
		%SKILLS[data][levelname][2]={{0,0},{20,0}}
	end
	if(%SKILLS[data][levelname][3]==nil) then
		%SKILLS[data][levelname][3]={{0,0},{20,0}}
	end
	p1=floor(Link(level,%SKILLS[data][levelname][1]))
	p2=floor(Link(level,%SKILLS[data][levelname][2]))
	p3=floor(Link(level,%SKILLS[data][levelname][3]))
	return Param2String(p1,p2,p3)
end;


