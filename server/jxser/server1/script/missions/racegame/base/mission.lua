


function InitMission()
	
	tbMissionClass:Init();
	
end;

function EndMission()
	
	tbMissionClass:Close();
	
end;


function RunMission()
	tbMissionClass:Run();
end

function OnLeave(nPlayerIndex)
	doFunByPlayer(nPlayerIndex, tbMissionClass.LeaveGame, tbMissionClass)
end