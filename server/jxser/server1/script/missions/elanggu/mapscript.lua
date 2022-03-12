Include("\\script\\maps\\newworldscript_default.lua")

function OnNewWorld(szParam)
	SetFightState(1)
	OnNewWorldDefault(szParam)
end
function OnLeaveWorld(szParam)
	SetFightState(0)
	OnLeaveWorldDefault(szParam)
end

