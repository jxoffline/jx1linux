
function OnTongJoin()
	OpenMission(13);
	OnTongJoin1();
end;

function OnTongJoin1()
	tname = GetTong()
	if (tname ~= "") then
		if (GetMissionS(1) == "") then 
			SetMissionS(1,tname)
		elseif (GetMissionS(1) ~= tname) and (GetMissionS(2) == "") then
			SetMissionS(2,tname)
		end;
	end;

	if (tname == GetMissionS(1)) and (GetTask(626) > 0) then 
		if (GetJoinTongTime() >= 1440) then
			JoinTongCamp(3);
		else
			Say("您加入帮会时间太短，不能参加战斗！", 0);
		end;
	elseif (tname == GetMissionS(2)) and (GetTask(626) > 0) then 
		if (GetJoinTongTime() >= 1440) then
			JoinTongCamp(2);
		else
			Say("您加入帮会时间太短，不能参加战斗！", 0);
		end;
	else
		Say("你不是比赛双方的成员，不能入场。",0)
	end;

end;

function OnTongFighting()
	Say("目前双方比赛正在进行之中，不能入场。",0)
end;

function JoinTongCamp(Camp)

	SetFightState(0);
	LeaveTeam();
	if (GetMSPlayerCount(13, Camp) >= 16) then
		Say("目前该方的人数已满，无法再加入了！",0)
		return
	end;
	
	AddMSPlayer(13, Camp);
	SetTaskTemp(242, 1);
	SetCurCamp(Camp);
	
	--设置与帮会有关的变量，不允许在战场中改变某个帮会阵营的操作
	SetTaskTemp(200, 1);
	
	--玩家退出时，保存RV并，在下次等入时用RV(城市重生点，非退出点)
	SetLogoutRV(1);
	
	--无死亡惩罚
	SetPunish(0);
	
	--关闭组队功能
	SetCreateTeam(0);
	
	--打开PK开关
	SetPKFlag(1)
	ForbidChangePK(1);
	
	--设置重生点，一般是选择进入该区的城市
	SetRevPos(176, 67);
	
	--设置当前玩家的死亡脚本
	SetDeathScript("\\script\\missions\\olympic\\tong\\death.lua");

	x = GetTask(300);
	y = GetTask(301);
	z = GetTask(302);
	SetTempRevPos(x, y * 32, z * 32);
	if (Camp == 3) then
		str = GetName().."<#>加入了"..GetMissionS(1).."<#>一方，目前总人数为"..GetMSPlayerCount(13,3);
		SetPos(CampPos1[1], CampPos1[2])
	elseif (Camp == 2) then
		str = GetName().."<#>加入了"..GetMissionS(2).."<#>一方，目前总人数为"..GetMSPlayerCount(13,2);
		SetPos(CampPos2[1], CampPos2[2])
	else 
		return
	end;
		
	Msg2MSAll(13, str);
end;
