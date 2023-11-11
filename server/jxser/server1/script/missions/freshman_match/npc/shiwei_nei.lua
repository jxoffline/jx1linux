Include("\\script\\missions\\freshman_match\\head.lua")
--»á³¡ÊÌÎÀ
RUN_A_TIME = 5
UP_A_TIME = 20
function main()
	local mm = RUN_A_TIME - GetMissionV( 5 )
	if ( mm < 0 ) then
		local mm = UP_A_TIME - GetMissionV( 5 )
		Say("<#> ThŞ vÖ héi tr­êng: Vßng thi ®Êu nµy cßn"..mm.."<#> phót, ng­¬i cßn viÖc g× kh«ng?", 3,"Hç trî thi ®Êu Vâ l©m kiÖt xuÊt/help_freshmanmatch","Ta muèn rêi khái ®©y!/out_trap","Kh«ng cÇn!/OnCancel")
		return
	end
	Say("<#> ThŞ vÖ héi tr­êng: Vßng thi ®Êu nµy cßn"..mm.."<#> phót sÏ b¾t ®Çu, ng­¬i cßn viÖc g× kh«ng?", 3,"Hç trî thi ®Êu Vâ l©m kiÖt xuÊt/help_freshmanmatch","Ta muèn rêi khái ®©y!/out_trap","Kh«ng cÇn!/OnCancel")
end

function out_trap()
	local mm = RUN_A_TIME - GetMissionV(5)
	if(mm < 0) then
		Say("<#> ThŞ vÖ héi tr­êng: B©y giê rêi khái th× ph¶i chê ®Õn ®ît, b¹n x¸c nhËn muèn rêi khái ®©y ­? ", 2, "Ta muèn rêi khái!/sure_trap", "Kh«ng cÇn!/OnCancel")
		return
	end
	Say("ThŞ vÖ héi tr­êng: Vßng thi ®Êu míi s¾p b¾t ®Çu, b¹n x¸c nhËn muèn rêi khái ®©y ­?", 2, "Ta muèn rêi khái!/sure_trap", "Kh«ng cÇn!/OnCancel")
end;

function sure_trap()
	if ( nt_gettask( CP_TASKID_ENEMY ) > 0 ) then
		return
	end
	WL_clear_pl_state()
	tryout_mapid = SubWorldIdx2ID( SubWorld )
	Msg2Player( "B¹n ®· rêi khái khu vùc thi ®Êu kiÖt xuÊt!" )
	DelMSPlayer( MISSIONID_OUTER, PlayerIndex, 1 )
	SetLogoutRV(0);
	NewWorld( tryout_mapid, CP_MAPPOS_IN[1], CP_MAPPOS_IN[2] )
end
