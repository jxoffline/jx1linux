Include("\\script\\missions\\olympic\\tong\\head.lua");

function OnTimer()
	timestate = GetMissionV(MS_STATE);
	V = GetMissionV(MS_NEWSVALUE) + 1;
	SetMissionV(MS_NEWSVALUE, V);


	--报名阶段
	if (timestate == 3) then 	-- 入场了
		ReportEntry(V);
	elseif (timestate == 4) then 	-- 战斗中
		ReportBattle(V);
	else
		StopMissionTimer(MISSIONID, TIME_NO3);
	end;
end;

function ReportEntry(V)				-- 入场时间
	if (V == GO_TIME) then
		Msg2MSAll(MISSIONID, "奥运预选赛帮会资格赛入场已截止，战斗正式开始!");
		RunMission(MISSIONID);
		StopMissionTimer(MISSIONID, TIME_NO3);
		StartMissionTimer(MISSIONID, TIME_NO3, TIMER_1);  --开始比赛计时
		SetMissionV(MS_NEWSVALUE, 0);
	else
		RestMin = floor((GO_TIME - V) / 3);
		RestSec = mod((GO_TIME - V),3) * 20;

		if (RestMin > 0) and (RestSec == 0) then
			str = "奥运预选赛帮会资格赛入场时间还有"..RestMin.."分钟。现在双方人数为：绿方"..GetMSPlayerCount(MISSIONID, 3).."，紫方"..GetMSPlayerCount(MISSIONID, 2);
			Msg2MSAll(MISSIONID, str);
		elseif (RestMin == 0) then
			str = "奥运预选赛帮会资格赛入场时间还有"..RestSec.."秒。现在双方人数为：绿方"..GetMSPlayerCount(MISSIONID, 3).."，紫方"..GetMSPlayerCount(MISSIONID, 2);
			Msg2MSAll(MISSIONID, str);
		end;
	end;
end;

function ReportBattle(V)		--战斗进行过程中

	if (GetMSPlayerCount(MISSIONID, 3) <= 0 ) then 
		Msg2MSAll(MISSIONID, "<#>战斗结束，"..GetMissionS(2).."<#>赢得了最终的胜利!");
		SetMissionV(V_ID,2);
		CloseMission(MISSIONID);
		return
	end;
	
	if (GetMSPlayerCount(MISSIONID, 2) <= 0 ) then 
		Msg2MSAll(MISSIONID, "<#>战斗结束，"..GetMissionS(1).."<#>赢得了最终的胜利!");
		SetMissionV(V_ID,3);
		CloseMission(MISSIONID);
		return
	end;

	if (V == END_TIME) then
		Rest1 = GetMSPlayerCount(MISSIONID, 3);
		Rest2 = GetMSPlayerCount(MISSIONID, 2);

		if (Rest1 > Rest2) then 
			Msg2MSAll(MISSIONID, "<#>比赛已结束，"..GetMissionS(1).."<#>赢得了这场比赛！");
			str = "<#>比赛结束时间到！"..GetMissionS(1).."<#>赢了"..GetMissionS(2).."<#>！";
			SetMissionV(V_ID,3);
		elseif (Rest2 > Rest1) then 
			Msg2MSAll(MISSIONID, "<#>比赛已结束，"..GetMissionS(2).."<#>赢得了这场比赛！")
			str = "<#>比赛结束时间到！"..GetMissionS(2).."<#>赢了"..GetMissionS(1).."<#>！";
			SetMissionV(V_ID,2);
		else
			if (GetTotalLevel() == 1) then
				Msg2MSAll(MISSIONID, "<#>比赛已结束，"..GetMissionS(1).."<#>赢得了这场比赛！")
				str = "<#>比赛结束时间到！"..GetMissionS(1).."<#>赢了"..GetMissionS(2).."<#>！";
				SetMissionV(V_ID,3);
			else
				Msg2MSAll(MISSIONID, "<#>比赛已结束，"..GetMissionS(2).."<#>赢得了这场比赛！")
				str = "<#>比赛结束时间到！"..GetMissionS(2).."<#>赢了"..GetMissionS(1).."<#>！";
				SetMissionV(V_ID,2);
			end;
		end;
		CloseMission(MISSIONID);
	else
		RestMin = floor((END_TIME - V) / 3);
		RestSec = mod((END_TIME - V),3) * 20;

		if (RestMin == 0) then
			Msg2MSAll(MISSIONID, "<#>战斗阶段，双方人数为：绿方"..GetMSPlayerCount(MISSIONID, 3).."<#>，紫方"..GetMSPlayerCount(MISSIONID, 2).."<#>。比赛剩余时间"..RestSec.."<#>秒。");
		elseif (RestSec == 0) then
			Msg2MSAll(MISSIONID, "<#>战斗阶段，双方人数为：绿方"..GetMSPlayerCount(MISSIONID, 3).."<#>，紫方"..GetMSPlayerCount(MISSIONID, 2).."<#>。比赛剩余时间"..RestMin.."<#>分钟。");
		else
			Msg2MSAll(MISSIONID, "<#>战斗阶段，双方人数为：绿方"..GetMSPlayerCount(MISSIONID, 3).."<#>，紫方"..GetMSPlayerCount(MISSIONID, 2).."<#>。比赛剩余时间"..RestMin.."<#>分"..RestSec.."<#>秒。");
		end;
	end;
end;

function GetTotalLevel()
idx = 0;
nTotalLevel1 = 0;
nTotalLevel2 = 0;
	
	for i = 1 , 500 do 
 		idx, pidx = GetNextPlayer(MISSIONID,idx, 3);
 
 		if (idx == 0) then 
 			break
 		end;
 
 		if (pidx > 0) then
   			PlayerIndex = pidx;
   			nTotalLevel1 = nTotalLevel1 + GetLevel();
		end
 	end;
 	
 	idx = 0;
 	for i = 1 , 500 do 
 		idx, pidx = GetNextPlayer(MISSIONID,idx, 2);
 
 		if (idx == 0) then 
 			break
 		end;
 
 		if (pidx > 0) then
   			PlayerIndex = pidx;
   			nTotalLevel2 = nTotalLevel2 + GetLevel();
		end
 	end;

 	if (nTotalLevel1 < nTotalLevel2) then 
 		return 1
 	else 
 		return 0
 	end;
end;

