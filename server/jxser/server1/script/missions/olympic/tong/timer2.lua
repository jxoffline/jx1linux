IncludeLib("SETTING");
Include("\\script\\missions\\olympic\\head.lua");

function OnTimer()
	timestate = GetMissionV(MS_STATE);
	V = GetMissionV(MS_NEWSVALUE) + 1;
	SetMissionV(MS_NEWSVALUE, V);


	--报名阶段
	if (timestate == 5) then 
		ReportMemberState(V);
	elseif (timestate == 6) then 	-- 入场了
		ReportEntry(V);
	elseif (timestate == 7) then 	-- 战斗中
		ReportBattle(V);
	elseif (timestate == 8) then
		WaitTime(V);	 	-- 战斗结束,等待下一轮
	else
		StopMissionTimer(MISSIONID, TIME_NO2);
	end;
end;

function WaitTime(V)
		n = GetMissionV(MS_LUN) + 1;
		SetMissionV(MS_LUN,n);
		n = n+1;
		str = "奥运预选赛帮会资格赛现在开始进入第"..n.."轮的比赛入场，请参赛者尽快入场。";
		AddGlobalNews(str);
--		SortTong();
		SetMissionV(MS_STATE,6);
		StopMissionTimer(MISSIONID, TIME_NO2);
		StartMissionTimer(MISSIONID, TIME_NO2, TIMER_3);  --开始入场计时
		SetMissionV(MS_NEWSVALUE, 0);
end;

function ReportMemberState(V)
	--在报名期间，系统定期通知玩家当前的报名情况

	if (V == END_TIME) then 
		maxn = TableSDD_Search("olympictab","");
		if (maxn < 2) then
			str = "奥运预选赛帮会资格赛报名时间到，由于无帮会报名求，因此比赛取消。";
			AddGlobalCountNews(str);
			CloseMission(MISSIONID);
		elseif (maxn == 2) then
			qname,qx,qy = TableSDD_GetValue("olympictab",1);
			str = "奥运预选赛帮会资格赛报名时间到，由于只有一个帮会"..qname.."报名，因此直接获得组建代表队资格，请"..qname.."帮主尽快到临安皇宫门口获取资格证。";
			AddGlobalCountNews(str);
			SetMissionV(MS_STATE,9);
			StopMissionTimer(MISSIONID, TIME_NO2);
		else
			SetMissionV(TOTALNUMBER,maxn-1);
			str = "奥运预选赛帮会资格赛报名时间到，现在开始进入第1轮的比赛入场，请参赛者尽快入场。";
			AddGlobalNews(str);
			SortTong();
			SetMissionV(MS_STATE,6);
			StopMissionTimer(MISSIONID, TIME_NO2);
			StartMissionTimer(MISSIONID, TIME_NO2, TIMER_3);  --开始入场计时
			SetMissionV(MS_NEWSVALUE, 0);
		end;
	else 
		RestMin = END_TIME - V;
		str ="奥运预选赛帮会资格赛报名时间还有"..RestMin.."分钟，请还没报名的帮派帮主尽快到临安皇宫门口报名。";
		AddGlobalCountNews(str);
	end;
end;

function ReportEntry(V)				-- 入场时间
	n = GetMissionV(MS_LUN) + 1;
	if (V == GO_TIME) then
		str = "第"..n.."轮奥运预选赛帮会资格赛入场时间已截止，比赛马上开始!";
		AddGlobalCountNews(str);
		SetMissionV(MS_STATE,7);
		StopMissionTimer(MISSIONID, TIME_NO1);
	else
		if ((GO_TIME - V) == 3) then 
			str = "第"..n.."轮奥运预选赛帮会资格赛入场时间还有最后1分钟，请未入场者尽快入场。";
			AddGlobalCountNews(str)
		elseif ((GO_TIME - V) == 15) then
			str = "第"..n.."轮奥运预选赛帮会资格赛入场时间还剩下5分钟，请未入场者尽快入场。";
			AddGlobalCountNews(str)
		end;
	end;
end;

function ReportBattle(V)

end;
