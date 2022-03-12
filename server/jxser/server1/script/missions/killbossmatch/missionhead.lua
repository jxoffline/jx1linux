Include("\\script\\missions\\killbossmatch\\class.lua")
Include("\\script\\maps\\newworldscript_default.lua")

function OnNewWorld(szParam)
	
	tbKillBossMatch:JoinGame(PlayerIndex, tbKillBossMatch:GetGroupId(), SubWorldIdx2ID(SubWorld))
	OnNewWorldDefault(szParam)
end

function OnLeaveWorld(szParam)
	if tbKillBossMatch:GetMissionState(SubWorldIdx2ID(SubWorld)) == 0 then
		tbKillBossMatch:LeaveGame() --会自动调用 OnLevel，但当没有mission的时候不会调用
	end
	OnLeaveWorldDefault(szParam)
end


function OnTimer()
	tbKillBossMatch:OnTimer()
end;

function InitMission()
	
	tbKillBossMatch:Init();
	
end;

function EndMission()
	
	tbKillBossMatch:Close();
	
end;


function RunMission()
	tbKillBossMatch:Run();
end

function OnLeave(nPlayerIndex)
	doFunByPlayer(nPlayerIndex, tbKillBossMatch.LeaveGame, tbKillBossMatch)
end

