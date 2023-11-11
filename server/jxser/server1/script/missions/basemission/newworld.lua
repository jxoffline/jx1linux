Include("\\script\\maps\\newworldscript_default.lua")
function OnNewWorld(szParam)
	
	tbMissionClass:JoinGame(PlayerIndex, tbMissionClass:GetGroupId(), SubWorldIdx2ID(SubWorld))
	OnNewWorldDefault(szParam)
end

function OnLeaveWorld(szParam)
	if tbMissionClass:GetMissionState(SubWorldIdx2ID(SubWorld)) == 0 then
		tbMissionClass:LeaveGame() --会自动调用 OnLevel，但当没有mission的时候不会调用
	end
	OnLeaveWorldDefault(szParam)
end