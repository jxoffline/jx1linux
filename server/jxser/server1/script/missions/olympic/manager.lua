IncludeLib("SETTING");
Include("\\script\\missions\\olympic\\head.lua");

function main()

	--设置返回点
	x,y,z = GetWorldPos();
	SetTask(300, x);
	SetTask(301, y);
	SetTask(302, z);

	idx = SubWorldID2Idx(MapTab);
	if (idx == -1) then
		ErrorMsg(3) 
		return
	end;

	OldSubWorld = SubWorld;
	SubWorld = idx;
	ms_state = GetMissionV(MS_STATE);
	fs = GetMissionS(FACTIONS);

	if (ms_state == 0) then 
		Say("禁卫统领：现在没有任何比赛，你需要启动比赛吗？", 4, "启动比赛单挑排位赛/StartReady","启动帮会资格赛/StartTong","查看上一阶段的比赛结果/Result", "不需要了/OnCancel");
	elseif (ms_state == 1) then
		Say("禁卫统领：这里是同门派高手排位赛的赛场，现在正举行"..fs.."排位比赛，阁下是否有兴趣参加？", 3, "好呀，我参加/OnRegister", "排位赛的规则是什么？/OnHelp", "我再准备一下/OnCancel");
	elseif (ms_state == 2) then
		OnReady();	-- 准备入场
	elseif (ms_state == 3) then 
		ErrorMsg(1)
	elseif (ms_state == 4) then
		Result()
	elseif (ms_state == 5) then 
		Say("禁卫统领：这里正举行奥运预选赛之帮会资格赛，贵帮是否有兴趣参加？", 4, "好呀，我参加/OnRegister1", "比赛的规则是什么？/OnHelp1", "查询一下有哪些帮派报名了/LookRegister", "我再准备一下/OnCancel");
	elseif (ms_state == 6) then
		OnEntry()	-- 帮会入场
	elseif (ms_state == 7) then
		ErrorMsg(1)	-- 帮会战斗中
	elseif (ms_state == 8) then
		TongWait()	-- 帮会帮会下一轮
	elseif (ms_state == 9) then
		EndTong()	-- 帮会结束
	else
		ErrorMsg(3)
	end;
	SubWorld = OldSubWorld;
end;

function LookRegister()
	str = "帮会资格赛已经报名的名单如下：<enter><enter>";
	maxn = TableSDD_Search("olympictab","") - 1;
	for i = 1,maxn do
		qname,qx,qy = TableSDD_GetValue("olympictab",i);
		str = str.."  "..qname
	end;
	Say(str,0);
end;

function EndTong()
	qname,qx,qy = TableSDD_GetValue("olympictab",1);
	if (GetTong() == qname) and (GetName() == GetTongMaster()) then
		SetTask(OLYMPICFLAG,30);
		Say("你已经取得领队的资格，需要领取其他队员的入场券吗？",0);
		CloseMission(MISSIONID);
	else
		Say("帮会"..qname.."已经取得了领队的资格。",0)
	end;
end;

function StartTong()
	OldSubWorld = SubWorld;
	idx = SubWorldID2Idx(MapTab);
	SubWorld = idx;
	ms_state = GetMissionV(MS_STATE);

	if (ms_state == 0) then
		OpenMission(MISSIONID);

		str = "现在奥运预选赛帮会资格赛开始报名，欢迎所有帮会的帮主前来临安皇宫门口报名参赛，报名费100万。";
		AddGlobalNews(str);
		SetMissionV(MS_STATE,5);
		StartMissionTimer(MISSIONID, TIME_NO2, TIMER_5);  --开始报名计时
	end;

	SubWorld = OldSubWorld;
end;

function TongWait()
	str = "帮会资格赛进入下一轮比赛名单如下：<enter><enter>";
	maxn = TableSDD_Search("olympictab","") - 1;
	for i = 1,maxn do
		qname,qx,qy = TableSDD_GetValue("olympictab",i);
		if (qy == 0) then
			str = str.."    "..qname.."：轮空<enter>"
		elseif (mod(qy,2) == 0) then
			str = str.."    "..qname.."   VS"
		else
			str = str.."  "..qname.."<enter>"
		end;
	end;
	Say(str,0);
end;

function Result()
	if (GetMissionV(FIGHT_MODE) == 0) then
		maxn = TableSDD_Search("olympictab","");
		maxn = maxn - 1;
		if (maxn > 16) then
			maxn = 16
		end;
		str = "现阶段排位赛前"..maxn.."名积分如下：<enter><enter>";
	else
		str = "现阶段淘汰赛进入下轮比赛名单及积分如下：<enter><enter>";
		maxn = GetMissionV(TOTALNUMBER1);
	end;
	if (maxn < 2) then
		str = "现在还没有任何比赛的积分。"
	else
--		Msg2Player("maxn="..maxn);

		for i = 1,maxn do
			qname,qx,qy = TableSDD_GetValue("olympictab",i);
			px = floor(qx / 256);
			px = mod(px,256);
			if (qy == 0) then
				px = px - FIGHTS * 3
				str = str.."第"..i.."名："..qname.."："..px.."分，轮空<enter>"
			else
				str = str.."第"..i.."名："..qname.."："..px.."分<enter>"
			end;
		end;
		m = TableSDD_Search("olympictab","") - 1;
		if (GetMissionV(FIGHT_MODE) ~= 0) and (maxn < m) then
			for i = maxn+1,m do
				qname,qx,qy = TableSDD_GetValue("olympictab",i);
				px = floor(qx / 256);
				px = mod(px,256);
				str = str.."第"..i.."名："..qname.."："..px.."分，结束<enter>"
			end;
		end;
	end;
	Say(str,0);
end;

function OnHelp1()
	Talk(7, "","禁卫统领：奥运预选赛帮会资格赛是为了参加全区全服所举行的大型比赛而进行的预选赛，预选赛通过帮会的形式统一参加。", "禁卫统领：要参加预选赛，首先在我这边进行报名，报名费为100万。报名限额为最多16个帮会，报名截止时间到中午12点结束。", "禁卫统领：每个帮会允许有16个人参加比赛，但是入帮时间必须要满1天以上。", "禁卫统领：报名结束之后，即开始比赛入场时间，入场时间为5分钟，待入场准备时间结束后，比赛便正式开始。" , 	"禁卫统领：比赛时间为10分钟，采用淘汰制，比赛时间结束之后看双方剩下人数多少判定胜负。胜方进入下一轮比赛。",	"禁卫统领：另外，如果比赛阶段中任何时刻某一方掉线或者回城即判为死亡！","禁卫统领：比赛最终取胜的帮会帮主将作为领队另外再挑选29名其他任何队员带领十大高手及其他单项比赛前4名代表本服参加全区全服的奥运会。");
end;

function OnHelp()
	Talk(6, "","禁卫统领：排位赛是为所有81级以上的同门派的武林人士举行大型单挑比赛的地方，排位赛总共举行10轮，在每一轮中系统将随机分配对手。",	"禁卫统领：要进行排位赛，首先在我这边进行报名，报名费为100万。报名截止时间到中午12点结束。",	"禁卫统领：报名结束之后，即开始比赛入场时间，入场时间为5分钟，待入场准备时间结束后，比赛便正式开始。" , 	"禁卫统领：比赛的时间为10分钟，如果在10分钟之内双方未分胜负，则判为平手。",	"禁卫统领：另外，如果比赛阶段中任何时刻某一方掉线或者回城即判为失败！","禁卫统领：比赛计分规则：胜方得3分，负方得0分，平局各得1分。待10轮比赛全部结束之后将给出总排名。");
end;


function StartReady()
	OldSubWorld = SubWorld;
	idx = SubWorldID2Idx(MapTab);
	SubWorld = idx;
	ms_state = GetMissionV(MS_STATE);

	if (GetLevel() > 80) and (GetLastFactionNumber() ~= -1) and (ms_state == 0) then
		OpenMission(MISSIONID);
		n = GetLastFactionNumber();
		str1 = FACTIONTAB[n+1];
		SetMissionV(FACTIONS,n);
		SetMissionS(FACTIONS,str1);

		str = "现在"..str1.."排位赛开始报名，欢迎所有81级以上的"..str1.."高手前来临安皇宫门口报名参赛，报名费100万。";
		AddGlobalNews(str);
	end;

	SubWorld = OldSubWorld;
end;

function OnRegister()

	OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(MapTab);
	factionx = GetMissionV(FACTIONS);
	r = GetMissionV(OL_KEY);
	SubWorld = OldSubWorld;

	if (GetLevel() < 81) or (GetLastFactionNumber() ~= factionx) then
		ErrorMsg(5)
		return
	end;

	if GetTask(TASKFLAG) == r then
		ErrorMsg(4)
		return
	end;

	n = TableSDD_Search("olympictab","");
	if (n == 0) or (n > MAX_MEMBER_COUNT) then 
		ErrorMsg(7)
		return
	end;

	if GetCash() < 1000000 then 
		ErrorMsg(2)
		return
	end;

	Pay(1000000);
	SetTask(TASKFLAG,r);
	SetTask(SCORE,0);
	SetTask(OLYMPICFLAG,0);
	x = GetName();
	TableSDD_SetValue("olympictab",n,x,0,0)

	SubWorld = OldSubWorld;
	Msg2Player("你已经报名了比赛，请耐心等候入场通知。");
	Say("禁卫统领：你已经报名了比赛，请耐心等候入场通知。",0);
end;



function OnRegister1()			-- 帮会报名
	if (GetName() ~= GetTongMaster()) then
		ErrorMsg(9)
		return
	end

	OldSubWorld = SubWorld;

--	if GetTask(TASKFLAG) == r then
--		ErrorMsg(4)
--		return
--	end;

	tname,tt = GetTong();
	if (TableSDD_Search("olympictab",tname) ~= 0) then 
		ErrorMsg(4)
		return
	end;

	n = TableSDD_Search("olympictab","");
	if (n == 0) or (n > 16) then 
		ErrorMsg(7)
		return
	end;

	if GetCash() < 1000000 then 
		ErrorMsg(2)
		return
	end;

	Pay(1000000);
	TableSDD_SetValue("olympictab",n,tname,0,0)

	SubWorld = OldSubWorld;
	Msg2Player("你的帮会已经报名了比赛，请耐心等候入场通知。");
	Say("禁卫统领：你的帮会已经报名了比赛，请耐心等候入场通知。",0);
end;

function OnReady()

	OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(MapTab);
	r = GetMissionV(OL_KEY);
	SubWorld = OldSubWorld

	if GetTask(TASKFLAG) == r then 
		OnJoin()
	else
		ErrorMsg(8)
	end;
end;

function OnEntry()		-- 帮会入场

	tname,tt = GetTong();
	n = TableSDD_Search("olympictab",tname)
	if (n == 0) then 
		str = "你的帮会没有报名参赛或者已被淘汰，现在帮会资格赛参赛名单如下：<enter><enter>";
		maxn = TableSDD_Search("olympictab","") - 1;
		for i = 1,maxn do
			qname,qx,qy = TableSDD_GetValue("olympictab",i);
			if (qy == 0) then
				str = str.."    "..qname.."：轮空<enter>"
			elseif (mod(qy,2) == 0) then
				str = str.."    "..qname.."   VS"
			else
				str = str.."  "..qname.."<enter>"
			end;
		end;
		Say(str,0);
		return
	end

	ny,n1,n2 = TableSDD_GetValue("olympictab",n)
	if (n2 == 0) then 
		str = "你的帮会本轮比赛轮空，现在帮会资格赛参赛名单如下：<enter><enter>";

		maxn = TableSDD_Search("olympictab","") - 1;
		for i = 1,maxn do
			qname,qx,qy = TableSDD_GetValue("olympictab",i);
			if (qy == 0) then
				str = str.."    "..qname.."：轮空<enter>"
			elseif (mod(qy,2) == 0) then
				str = str.."    "..qname.."   VS"
			else
				str = str.."  "..qname.."<enter>"
			end;
		end;
		Say(str,0);
		return
	end;

	if (GetJoinTongTime() < JOINTONGTIME) then 
		ErrorMsg(12)
		return
	end;

	SetTask(300, 334);
	SetTask(301, 1480);
	SetTask(302, 3048);
	SetTask(AREAID,n2);
	n3 = floor(n2/2) + 212;
	NewWorld(n3,1633,3292);
end;


function ErrorMsg(ErrorId)
--	Msg2Player("ErrorId="..ErrorID)
if (ErrorId == 1) then 
	Say("禁卫统领：现在比赛正在进行中，不能入场。",0)
elseif (ErrorId == 2) then
	Say("禁卫统领：你身上所带的银两不够。",0)
elseif (ErrorId == 3) then 
	Say("禁卫统领：报名出现问题，请与官方联系！",0);
elseif (ErrorId == 4) then 
	Say("禁卫统领：你已经报名了比赛，请耐心等候入场通知。", 0);
elseif (ErrorId == 5) then 
	Say("禁卫统领：你的门派不符合要求或者等级不够81级。",0);
elseif (ErrorId == 6) then 
	Say("禁卫统领：现在下一轮比赛马上就要开始，请等候片刻。",0);
elseif (ErrorId == 7) then 
	Say("禁卫统领：对不起，报名名额已满。",0);
elseif (ErrorId == 8) then
	Say("禁卫统领：你没有报名比赛，因此不能进入比赛场地。",0);
elseif (ErrorId == 9) then 
	Say("禁卫统领：帮会比赛必须是帮主才能报名。",0);
elseif (ErrorId == 10) then
	Say("禁卫统领：你的帮会没有报名参加比赛。",0)
elseif (ErrorId == 11) then
	Say("禁卫统领：你的帮会本轮比赛轮空。",0)
elseif (ErrorId == 12) then
	Say("禁卫统领：你加入帮会的时间不够1天，不能参加比赛。",0)
elseif (ErrorId == 13) then
	Say("禁卫统领：你本轮比赛轮空或已被比赛淘汰。",0)
else
	
end;
return
end;


function OnJoin()
	idx = SubWorldID2Idx(MapTab);
	
	OldSubWorld = SubWorld;
	SubWorld = idx;

--	DisplayMsg();

	nx = GetName();
	n = TableSDD_Search("olympictab",nx);
	if n ~= 0 then 
		ny,n1,n2 = TableSDD_GetValue("olympictab",n)
		if (n2 == 0) then
			ErrorMsg(13)
		else
			if (n1 > 65536) then
				SetTask(OLYMPICFLAG,1);
				Msg2Player("恭喜你，你已经取得了参加全区全服奥运会比赛的资格。",0)
			end
			JoinCamp(n2)
		end
	else
		ErrorMsg(3)
	end;
	SubWorld=OldSubWorld;
end;


function OnCancel()
end;
