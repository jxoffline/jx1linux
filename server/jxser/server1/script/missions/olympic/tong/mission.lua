Include("\\script\\missions\\olympic\\tong\\head.lua")
function InitMission()
	for i = 1, 40 do 
		SetMissionV(i,0);
	end;
	
	for i = 1, 10 do 
		SetMissionS(i, "")
	end;

	SetMissionV(MS_STATE, 3);
	StartMissionTimer(MISSIONID, TIME_NO3, TIMER_1);  --开始报名计时

end;

function RunMission()
	idx = 0;
	for i = 1 , 500 do 
 		idx, pidx = GetNextPlayer(MISSIONID,idx, 0);
 
 		if (idx == 0) then 
 			break
 		end;
 
 		if (pidx > 0) then
   			PlayerIndex = pidx;
   			SetFightState(1);
		end
 	end;
 	SetMissionV(MS_STATE, 4);--开始战斗了
end;

function EndMission()
	GameOver();
	for i = 1, 40 do 
		SetMissionV(i , 0);
	end;
	
	for i  = 1, 10 do 
		SetMissionS(i, "")
	end;
	StopMissionTimer(MISSIONID, TIME_NO3);
end;

function OnLeave(RoleIndex)
	PlayerIndex = RoleIndex;
	str2 = GetName().."<#>退出了战场";
	SetCurCamp(GetCamp())
	-- SetLogoutRV(0);  玩家掉线也会从Mission中OnLeave，因此不能在此调用SetLogoutRV(0)，必须在把玩家NewWorld出Mission地图的地方调用 Fanghao_Wu 2006-3-21
	SetCreateTeam(1);
	SetDeathScript("");--设置死亡脚本为空
	SetPunish(1)--设置PK惩罚
	SetPKFlag(0)--关闭PK开关
	ForbidChangePK(0);
	ForbitTrade(0);
	SetFightState(0);
	Msg2MSAll(MISSIONID, str2);
	SetTaskTemp(JOINSTATE, 0);
end;