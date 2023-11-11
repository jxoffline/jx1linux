--»á³¡ÊÌÎÀ

Include( "\\script\\missions\\leaguematch\\head.lua" )
Include( "\\script\\missions\\leaguematch\\npc\\head.lua" )

function main()
	local mm = ceil(( WLLS_TIMER_PREP_TOTAL - GetGlbValue(GLB_WLLS_TIME)) * WLLS_TIMER_PREP_FREQ / 60 )
	local tb_option = wlls_add_option({"§Ó ta chuÈn bŞ ®·!/wlls_want2leave"}, "TiÕp tôc thi ®Êu")
	Say("ThŞ vÖ héi tr­êng: thêi gian b¾t ®Çu thi ®Êu cßn"..mm.."phót, ng­¬i chuÈn bŞ xong ch­a?", getn(tb_option), tb_option)
end

function wlls_want2leave()
	Say("ThŞ vÖ héi tr­êng: Ng­¬i nhÊt ®Şnh muèn rêi khái? S¼p thi ®Êu råi! §õng nªn bá lì thêi gian th× ®Êu!", 2, "Ta muèn rêi khái ®©y!/wlls_sure2leave", "Ta muèn ë l¹i thi ®Êu!/OnCancel")
end

function wlls_sure2leave()
	SetLogoutRV(0);		--ËÀÍöÖØÉúÓë¶ÏÏßÖØÉúµã²»ÔÚÍ¬Ò»µØµã
	local n_signmap = wlls_get_mapid(1)
	NewWorld(n_signmap, WLLS_MAPPOS_SIGN[1], WLLS_MAPPOS_SIGN[2])
end
