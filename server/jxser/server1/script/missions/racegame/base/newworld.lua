Include("\\script\\maps\\newworldscript_default.lua")
function OnNewWorld(szParam)
	tbMissionClass:JoinGame(PlayerIndex, 0)
	OnNewWorldDefault(szParam)
end

function OnLeaveWorld(szParam)
	tbMissionClass:LeaveGame() --会自动调用 OnLevel，但当没有mission的时候不会调用
	OnLeaveWorldDefault(szParam)
end