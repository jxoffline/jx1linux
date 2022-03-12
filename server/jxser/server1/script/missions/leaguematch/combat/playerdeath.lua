Include( "\\script\\missions\\leaguematch\\head.lua" )


function OnDeath( Launcher )
	local org_player = PlayerIndex
	local org_name = GetName() --ËÀÕßÃû×Ö
	PlayerIndex = NpcIdx2PIdx( Launcher )
	Msg2Player("B¹n ®· ®¸nh b¹i ®èi ph­¬ng<color=yellow>"..org_name.."<color>")
	PlayerIndex = org_player
	
	DelMSPlayer(WLLS_MSID_COMBAT, 0)	--Ç¿ÖÆ¸ÃÍæ¼ÒÀë¿ªMission
	SetLogoutRV(0);
	NewWorld(wlls_get_mapid(1), WLLS_MAPPOS_SIGN[1], WLLS_MAPPOS_SIGN[2])	--½«Ê¬ÌåÍÏµ½±¨Ãû³¡=.=
	if (GetTask(WLLS_TASKID_ORGCAMP) > 0) then
		Msg2Player("<color=yellow>Chó ý!!!<color> §éi ngò chiÕn ®Êu cña b¹n ch­a kÕt thóc, b¹n ph¶i trë l¹i n¬i b¸o danh ®îi. Trong thêi gian nµy b¹n bÞ ®øt m¹ng hoÆc rêi khái héi tr­êng thi ®Êu sÏ kh«ng nhËn ®­îc phÇn th­ëng.")
	end
end
