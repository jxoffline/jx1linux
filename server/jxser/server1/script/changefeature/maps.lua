Include("\\script\\maps\\newworldscript_default.lua")
function OnNewWorld(szParam)
	
	
	OnNewWorldDefault(szParam)
end

function OnLeaveWorld(szParam)
	RestoreOwnFeature()
	OnLeaveWorldDefault(szParam)
end