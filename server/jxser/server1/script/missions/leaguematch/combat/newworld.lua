Include( "\\script\\missions\\leaguematch\\head.lua" )
Include("\\script\\maps\\newworldscript_default.lua")

function OnNewWorld(szParam)
	if (not wlls_get_mapinfo()) then
		wlls_error_log("V祇 nh莔 u trng thi u")
		wlls_transback()
		return
	end
	OnNewWorldDefault(szParam)
end

function OnLeaveWorld(szParam)
	DelMSPlayer(WLLS_MSID_COMBAT, 0)	--强制该玩家离开Mission
	OnLeaveWorldDefault(szParam)
end
