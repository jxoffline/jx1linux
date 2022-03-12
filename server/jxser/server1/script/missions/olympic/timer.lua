IncludeLib("SETTING");
Include("\\script\\missions\\olympic\\head.lua");

function OnTimer()
	timestate = GetMissionV(MS_STATE);
	V = GetMissionV(MS_NEWSVALUE) + 1;
	SetMissionV(MS_NEWSVALUE, V);


	--报名阶段
	if (timestate == 1) then 
		ReportMemberState(V);
	elseif (timestate == 2) then 	-- 入场了
		ReportEntry(V);
	elseif (timestate == 3) then 	-- 战斗中
		ReportBattle(V);
	elseif (timestate == 4) then
		WaitTime(V);	 	-- 战斗结束,等待下一轮
	else
		StopMissionTimer(MISSIONID, TIME_NO1);
	end;
end;

function WaitTime(V)
		str1 = GetMissionS(FACTIONS);
		n = GetMissionV(MS_LUN) + 1;
		SetMissionV(MS_LUN,n);
		n = n+1;
		str = str1.."排位赛现在开始进入第"..n.."轮的比赛入场，请参赛者尽快入场。";
		AddGlobalNews(str);
--		RandomCamp()
		SetMissionV(MS_STATE,2);
		StopMissionTimer(MISSIONID, TIME_NO1);
		StartMissionTimer(MISSIONID, TIME_NO1, TIMER_3);  --开始入场计时
		SetMissionV(MS_NEWSVALUE, 0);
end;

function ReportMemberState(V)
	--在报名期间，系统定期通知玩家当前的报名情况

	str1 = GetMissionS(FACTIONS);
	if (V == END_TIME) then 
		maxn = TableSDD_Search("olympictab","");
		if (maxn < 3) then
			str = str1.."排位赛报名时间到，由于报名人数不够比赛要求，因此比赛取消。";
			AddGlobalCountNews(str);
			CloseMission(MISSIONID);
		else
			SetMissionV(TOTALNUMBER,maxn-1);
			str = str1.."排位赛报名时间到，现在开始进入第1轮的比赛入场，请参赛者尽快入场。";
			AddGlobalNews(str);
			RandomCamp();
			SetMissionV(MS_STATE,2);
			StopMissionTimer(MISSIONID, TIME_NO1);
			StartMissionTimer(MISSIONID, TIME_NO1, TIMER_3);  --开始入场计时
			SetMissionV(MS_NEWSVALUE, 0);
		end;
	else 
		RestMin = END_TIME - V;
		str =str1.."排位赛报名时间还有"..RestMin.."分钟，请81级以上的"..str1.."人士尽快到临安皇宫门口报名。";
		AddGlobalCountNews(str);
	end;
end;

function ReportEntry(V)				-- 入场时间
	str1 = GetMissionS(FACTIONS);
	n = GetMissionV(MS_LUN) + 1;
	if (V == GO_TIME) then
		str = "第"..n.."轮"..str1.."排位赛入场时间已截止，比赛正式开始!";
		AddGlobalCountNews(str);
		Msg2MSAll(MISSIONID,str);
		RunMission(MISSIONID);
		StopMissionTimer(MISSIONID, TIME_NO1);
		StartMissionTimer(MISSIONID, TIME_NO1, TIMER_2);  --开始比赛计时
		SetMissionV(MS_NEWSVALUE, 0);
	else
		RestMin = floor((GO_TIME - V) / 3);
		RestSec = mod((GO_TIME - V),3) * 20;

--		str = "第"..n.."轮"..str1.."排位赛入场时间还有"..RestMin.."分钟，请未入场者尽快入场。";
--		AddGlobalCountNews(str);

		if (RestMin > 0) and (RestSec == 0) then
			str = "第"..n.."轮"..str1.."排位赛入场时间还有"..RestMin.."分钟，请未入场者尽快入场。";
			Msg2MSAll(MISSIONID, str);
			if ((GO_TIME - V) == 3) then 
				str = "第"..n.."轮"..str1.."排位赛入场时间还有最后1分钟，请未入场者尽快入场。";
				AddGlobalCountNews(str)
			elseif ((GO_TIME - V) == 15) then
				str = "第"..n.."轮"..str1.."排位赛入场时间还剩下5分钟，请未入场者尽快入场。";
				AddGlobalCountNews(str)
			end
		elseif (RestMin == 0) then
			str = "第"..n.."轮"..str1.."排位赛入场时间还有"..RestSec.."秒。";
			Msg2MSAll(MISSIONID, str);
		end;
	end;
end;

function ReportBattle(V)		--战斗进行过程中

	if (V == FIGHT_TIME) then
		CalcScore();
		EndFight();
	else
		if ScanFight() == 0 then
			SortScore()
			EndFight()
		else
			RestMin = floor((FIGHT_TIME - V) / 3);
			RestSec = mod((FIGHT_TIME - V),3) * 20;

			if (RestMin == 0) then
				Msg2MSAll(MISSIONID, "<#>战斗阶段，比赛剩余时间"..RestSec.."<#>秒。");
			elseif (RestSec == 0) then
				Msg2MSAll(MISSIONID, "<#>战斗阶段，比赛剩余时间"..RestMin.."<#>分钟。");
			else
				Msg2MSAll(MISSIONID, "<#>战斗阶段，比赛剩余时间"..RestMin.."<#>分"..RestSec.."<#>秒。");
			end;
		end;
	end;
end;

function ScanFight()
	OldPlayer = PlayerIndex;
	maxn = floor((GetMissionV(TOTALNUMBER) + 1) / 2);
	kflag = 0;
	for i = 1,maxn do
		j = i*2;
		idx , pidx = GetNextPlayer(MISSIONID, 0, j-1);
		idy , pidy = GetNextPlayer(MISSIONID, 0, j);

		if (pidx > 0) and (pidy == 0) then
		   	PlayerIndex = pidx;
			AddScore(3);
		elseif (pidy > 0) and (pidx == 0) then
		   	PlayerIndex = pidy;
			AddScore(3);
		elseif (pidx > 0) and (pidy > 0) then
			kflag = 1;
		end;	
	end;
	PlayerIndex = OldPlayer;
	return kflag;
end;

function EndFight()
	str1 = GetMissionS(FACTIONS);
	n = GetMissionV(MS_LUN) + 1;
	if (n >= FIGHTS) then
		maxn = GetMissionV(TOTALNUMBER1);
		SetMissionV(FIGHT_MODE,GetMissionV(FIGHT_MODE) + 1);		

		if (maxn < 5) then
			for i = 1,maxn do
				pname,px,py = TableSDD_GetValue("olympictab",i);
				px = px + 65536;
				TableSDD_SetValue("olympictab",i,pname,px,py);
			end;
		end;

		if (maxn == 2) then
			pname,px,py = TableSDD_GetValue("olympictab",1);
			str = str1.."排位赛第"..n.."轮比赛结束，至此所有比赛已经全部结束。冠军是："..pname;
			AddGlobalNews(str);
			CloseMission(MISSIONID);
		else
			maxn = TableSDD_Search("olympictab","") - 1;
			for i = 1,maxn do
				qname,qx,qy = TableSDD_GetValue("olympictab",i);
				TableSDD_SetValue("olympictab",i,qname,qx,0);
			end;
			str = str1.."排位赛第"..n.."轮比赛结束，请参赛者准备下一场比赛，比赛将在5分钟之后入场。";
			AddGlobalNews(str);
			SetMissionV(MS_STATE,4);
			StopMissionTimer(MISSIONID, TIME_NO1);
			StartMissionTimer(MISSIONID, TIME_NO1, TIMER_4);  --开始入场计时
			SetMissionV(MS_NEWSVALUE,0);
			RandomCamp();
		end;
	else
		str = str1.."排位赛第"..n.."轮比赛结束，请参赛者准备下一场比赛，比赛将在5分钟之后入场。";
		AddGlobalNews(str);
		SetMissionV(MS_STATE,4);
		StopMissionTimer(MISSIONID, TIME_NO1);
		StartMissionTimer(MISSIONID, TIME_NO1, TIMER_4);  --开始入场计时
		SetMissionV(MS_NEWSVALUE,0);
		RandomCamp();
	end;
end;

