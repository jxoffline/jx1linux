IncludeLib("SETTING");

--退出游戏后的重生点ID,也就是报名的那个地方吧
CS_RevId = 176;
CS_RevData = 67;

FACTIONTAB = {"少林","天王","唐门","五毒","峨嵋","翠烟","丐帮","天忍","武当","昆仑"}

MapTab = 335;

FRAME2TIME = 18;
--游戏的最大人数
MAX_MEMBER_COUNT = 200;
FIGHTS = 3;		-- 比赛论数
JOINTONGTIME = 1;	-- 入帮时间限制


MS_STATE = 1;
MS_LUN = 2; 		-- 第多少轮的比赛
TOTALNUMBER = 3 	-- 参赛人员总数
FACTIONS = 4; 		-- 门派ID
FIGHT_MODE = 5;		-- 0 积分模式，1 淘汰模式
TOTALNUMBER1 = 6;

OL_KEY = 7; 		-- 0-100000000的随机数
MS_NEWSVALUE = 9; 	-- 任务中存放新闻变量的地方

TIME_NO1 = 23;		-- 定时触发器
TIME_NO2 = 24;		-- 帮会定时触发器

TIMER_1 = 60 * FRAME2TIME; -- 1分钟提示一次报名
TIMER_2 = 20 * FRAME2TIME; -- 20秒提示一次比赛时间
TIMER_3 = 20 * FRAME2TIME; -- 20秒提示一次入场
TIMER_4 = 60 * FRAME2TIME; -- 1分钟等待时间
TIMER_5 = 60 * FRAME2TIME; -- 1分钟提示一次帮会报名时间


END_TIME = 1 ; 		-- 报名时间为1分钟
GO_TIME = 6 ; 		-- 入场时间2分钟
FIGHT_TIME = 6;		-- 比赛时间2分钟
END_TONG_TIME = 1;	-- 帮会报名时间1分钟

JOINSTATE = 242;
MISSIONID = 12;

TASKFLAG = 623;		-- 任务变量，表示已经报名
SCORE = 624;   		-- 存放成绩
TONGSCORE = 625;	-- 存放帮会比赛的结果
AREAID = 626;		-- 进赛场的标记
OLYMPICFLAG = 630;	-- 参赛资格


function GetLeavePos()
	return GetTask(300), GetTask(301), GetTask(302);
end;


-------------------------------------------------------------------------
--玩家要求离开游戏
function LeaveGame(leavetype)
--leavetype = 0表示，将位置设在地图的场外区域（非战斗区域）
--leavetype = 1表示，将位置设在另一个地图，即彻底离开战场
	camp = GetCamp();--恢复原始阵营
	SetRevPos(CS_RevId, CS_RevData);

	SetFightState(0);
	SetPunish(1); --设置PK惩罚
	SetPKFlag(0); --关闭PK开关
--	SetTaskTemp(JOINSTATE, 0);
	ForbidChangePK(0);
	ForbitTrade(0);
	SetCurCamp(camp);
	SetLogoutRV(0);--设置重生点
	SetCreateTeam(1);
	SetDeathScript("");--设置死亡脚本为空
	NewWorld(GetLeavePos());
end;

function CalcScore()
	OldPlayer = PlayerIndex;
	maxn = floor((GetMissionV(TOTALNUMBER) + 1) / 2);
	for i = 1,maxn do
		j = i*2
		idx , pidx = GetNextPlayer(MISSIONID, 0, j-1);
		idy , pidy = GetNextPlayer(MISSIONID, 0, j);

		if (pidx > 0) and (pidy > 0) then
			if (GetMissionV(FIGHT_MODE) == 0) then
			   	PlayerIndex = pidx;
				AddScore(1);
			   	PlayerIndex = pidy;
				AddScore(1);
			else
			   	PlayerIndex = pidx;
				lv1 = GetLevel();
			   	PlayerIndex = pidy;
				lv2 = GetLevel();
				if (lv2 > lv1) then 
					AddScore(3);
				else
			   		PlayerIndex = pidx;
					AddScore(3);
				end
			end
		elseif (pidx > 0) then
		   	PlayerIndex = pidx;
			AddScore(3);
		elseif (pidy > 0) then
		   	PlayerIndex = pidy;
			AddScore(3);
		end;	
	end;
	SortScore();
end;

-- 按成绩排序

function SortScore()
--	maxn = GetMissionV(TOTALNUMBER) - 1;
	maxn = TableSDD_Search("olympictab","") - 1;
	for i = 1,maxn do
		pname,px,py = TableSDD_GetValue("olympictab",i);
		for j = i+1,maxn+1 do
			qname,qx,qy = TableSDD_GetValue("olympictab",j);
			if (px < qx) then 
				TableSDD_SetValue("olympictab",i,qname,qx,qy);
				TableSDD_SetValue("olympictab",j,pname,px,py);
				px = qx;
			end;
		end;
	end;
	PlayerIndex = OldPlayer;
end;

function AddScore(pscore)
	if (GetMissionV(FIGHT_MODE) ~= 0) then
		pscore = FIGHTS * pscore
	end;
	k = GetTask(SCORE);
	SetTask(SCORE,k+pscore);
	pname = GetName();
	Msg2Player("你在本轮比赛中得分"..pscore.."分，现在累计总分"..GetTask(SCORE).."分。")
	pn = TableSDD_Search("olympictab",pname);
	pname,px,py = TableSDD_GetValue("olympictab",pn);
	px = pscore * 256 + px
	TableSDD_SetValue("olympictab",pn,pname,px,py);
	LeaveGame(1);
end;

-------------------------------------------------------------------------

function JoinCamp(Camp)
	
	LeaveTeam()
	
	AddMSPlayer(MISSIONID, Camp);
--	SetTaskTemp(JOINSTATE, 1);

	Camp1 = Camp - 1;
	Camp1 = mod(Camp1,2) + 2;
	SetCurCamp(Camp1);
	
	--设置与帮会有关的变量，不允许在竞技场战改变某个帮会阵营的操作
	SetTaskTemp(200,1);

	--设置战斗状态
	SetFightState(0);

	--玩家退出时，保存RV并，在下次等入时用RV(城市重生点，非退出点)
	SetLogoutRV(1);

	--无死亡惩罚
	SetPunish(0);
	
	--关闭组队功能
	SetCreateTeam(0);
	
	--打开PK开关 不准交易
	SetPKFlag(1)
	ForbidChangePK(1);
	
	--设置重生点，一般是选择进入该区的城市
	SetRevPos(CS_RevId, CS_RevData);
	
	--设置当前玩家的死亡脚本
	SetDeathScript("\\script\\missions\\olympic\\death.lua");
	
	--设置下次死亡的重生点

	x = GetTask(300);
	y = GetTask(301);
	z = GetTask(302);
	SetTempRevPos(x, y * 32, z * 32);

	--入场
	Camp1 = floor((Camp - 1) / 2);
	nx = floor(Camp1 / 10) + 1;
	ny = mod(Camp1,10) + 1;
	GotoMap(nx,ny);

	str = GetName().."<#>已经进入了比赛赛场。";
	Msg2MSAll(MISSIONID, str);
end;


---------------------------------------------------------------------------

function GotoMap(nx,ny)
	nnx = (nx + ny) * 43 + 1187;
	nny = (ny - nx) * 44 + 3465;
	NewWorld(MapTab,nnx,nny);
end;

function RandomCamp()
	Ptab = {};
	maxn = GetMissionV(TOTALNUMBER);
	if (GetMissionV(FIGHT_MODE) == 1) then
		if (maxn > 16) then
			maxn = 16
			k1 = 0
		elseif (maxn > 8) then
			k1 = 16 - maxn
		elseif (maxn > 4) then
			k1 = 8 - maxn
		elseif (maxn > 2) then
			k1 = 4 - maxn
		else
			k1 = 0
		end;

		for i = 1,k1 do
			qname,qx,qy = TableSDD_GetValue("olympictab",i);
			qx = qx + FIGHTS * 256 * 3;
			TableSDD_SetValue("olympictab",i,qname,qx,0);
		end;
		n = maxn - k1;

	elseif (GetMissionV(FIGHT_MODE) > 1) then
		k1 = 0;
		if (GetMissionV(TOTALNUMBER) == GetMissionV(TOTALNUMBER1)) then
			maxn = maxn / 2;
		end;
		n = maxn;
	else
		n = maxn;
		k1 = 0;
	end;

	SetMissionV(TOTALNUMBER1,maxn);
	if (n == maxn) then
		SetMissionV(TOTALNUMBER,n);
	else
		SetMissionV(TOTALNUMBER,maxn - n / 2);
	end;

	for i = 1,n do
		Ptab[i] = i
	end;

	for i = 1,n do
		x = random(n-i+1);
		m = Ptab[x];
		Ptab[x] = Ptab[n-i+1];
		qname,qx,qy = TableSDD_GetValue("olympictab",k1+i);
		TableSDD_SetValue("olympictab",k1+i,qname,qx,m);
	end;
end;

function DisplayMsg()
	for i = 1,16 do
		qname,qx,qy = TableSDD_GetValue("olympictab",i);
		Msg2Player(qname..","..qx..","..qy);
	end;
end;

function SortTong()
	qname,qx,qy = TableSDD_GetValue("olympictab",2);
	if (qname == "") then 
		qname,qx,qy = TableSDD_GetValue("olympictab",1);
		str = "奥运预选赛帮会资格赛比赛至此已经全部结束，帮会"..qname.."最终获得组建代表队资格，请"..qname.."帮主尽快到临安皇宫门口获取资格证。";
		AddGlobalNews(str);
		SetMissionV(MS_STATE,9);
		StopMissionTimer(MISSIONID, TIME_NO2);
--		CloseMission(MISSIONID);
	else
		maxn = TableSDD_Search("olympictab","") - 1;
		if (maxn > 8) then
			k1 = 16 - maxn
		elseif (maxn > 4) then
			k1 = 8 - maxn
		elseif (maxn > 2) then
			k1 = 4 - maxn
		else
			k1 = 0
		end
		if (k1 > 0) then
			for i = 1,k1 do
				qname,qx,qy = TableSDD_GetValue("olympictab",i);
				TableSDD_SetValue("olympictab",i,qname,1,0);
			end
		end
--		k2 = maxn - 1;
		j = 2;
		for i = k1+1,maxn do
			qname,qx,qy = TableSDD_GetValue("olympictab",i);
			TableSDD_SetValue("olympictab",i,qname,0,j);
			j = j + 1;
		end;
	end;
end;

