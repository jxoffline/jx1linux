function InitMission()
	SetMissionV(1,1);--允许报名了
end;

function RunMission()

end;

function EndMission()
	for i = 1, 20 do 
		SetMissionV(i , 0);
	end;
	GameOver();
end;

function OnLeave(RoleIndex)
	PlayerIndex = RoleIndex;
	str2 = GetName().."R阨 kh醝 chi課 trng, ";
	-- SetLogoutRV(0);  玩家掉线也会从Mission中OnLeave，因此不能在此调用SetLogoutRV(0)，必须在把玩家NewWorld出Mission地图的地方调用 Fanghao_Wu 2006-3-21
	SetCreateTeam(1);
	SetDeathScript("");--设置死亡脚本为空
	SetPKFlag(0)--关闭PK开关
	ForbidChangePK(0);
	Msg2MSAll(1, str2);
	SetTaskTemp(200, 0);
end;