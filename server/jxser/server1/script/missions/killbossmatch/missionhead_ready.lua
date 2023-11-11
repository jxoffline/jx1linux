Include("\\script\\missions\\killbossmatch\\ready.lua")
Include("\\script\\maps\\newworldscript_default.lua")

function OnNewWorld(szParam)
	
	tbKillBossMatch_ready:JoinGame(PlayerIndex, tbKillBossMatch_ready:GetGroupId(), SubWorldIdx2ID(SubWorld))
	OnNewWorldDefault(szParam)
end

function OnLeaveWorld(szParam)
	if tbKillBossMatch_ready:GetMissionState(SubWorldIdx2ID(SubWorld)) == 0 then
		tbKillBossMatch_ready:LeaveGame() --会自动调用 OnLevel，但当没有mission的时候不会调用
	end
	OnLeaveWorldDefault(szParam)
end


function OnTimer()
	tbKillBossMatch_ready:OnTimer()
end;

function InitMission()
	
	tbKillBossMatch_ready:Init();
	
end;

function EndMission()
	
	tbKillBossMatch_ready:Close();
	
end;


function RunMission()
	tbKillBossMatch_ready:Run();
end

function OnLeave(nPlayerIndex)
	doFunByPlayer(nPlayerIndex, tbKillBossMatch_ready.LeaveGame, tbKillBossMatch_ready)
end

