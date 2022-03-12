Include("\\script\\global\\login_head.lua")
Include( "\\script\\missions\\leaguematch\\head.lua" )

function wlls_login()
	local str_plname = GetName()
	local n_lid = LG_GetLeagueObjByRole(WLLS_LGTYPE, str_plname)
	if (n_lid ~= 0) then
		local n_mtype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_MTYPE)
		local n_mytype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
		local n_level = WLLS_TAB[n_mytype].match_type[n_mtype].level
		local n_phase = GetGlbValue(GLB_WLLS_PHASE)
		if (n_phase >= 2) then
			local n_wday = tonumber(GetLocalDate("%w"))
			_M("n_wday="..n_wday)
			if (n_wday == 0 or n_wday >= 5) then
				Msg2Player("HiÖn ®ang trong gian ®o¹n Vâ l©m liªn ®Êu, h«m nay tõ <color=yellow>18:00~19:00<color> vµ <color=yellow>21:00~22:00<color> cã tiÕn hµnh <color=yellow>8<color> trËn"..WLLS_LEVEL_DESC[n_level]..".")
			else
				Msg2Player("HiÖn ®ang trong gian ®o¹n Vâ l©m liªn ®Êu, h«m nay tõ <color=yellow>18:00~19:00<color> sÏ tiÕn hµnh <color=yellow>4<color> trËn"..WLLS_LEVEL_DESC[n_level]..".")
			end
		else
			local str = wlls_levelcheck()
			if (str) then
				Msg2Player(str)
			end
		end
		local str_lgname = LG_GetLeagueInfo(n_lid)
		local n_addtotal = LG_GetMemberTask(WLLS_LGTYPE, str_lgname, str_plname, WLLS_LGMTASK_TOTAL)
		_M("wlls_login : n_addtotal="..n_addtotal)
		if (n_addtotal > 0) then
			local n_addwin = LG_GetMemberTask(WLLS_LGTYPE, str_lgname, str_plname, WLLS_LGMTASK_WIN)
			local n_addtie = LG_GetMemberTask(WLLS_LGTYPE, str_lgname, str_plname, WLLS_LGMTASK_TIE)
			LG_ApplySetMemberTask(WLLS_LGTYPE, str_lgname, str_plname, WLLS_LGMTASK_TOTAL, 0, "", "")
			LG_ApplySetMemberTask(WLLS_LGTYPE, str_lgname, str_plname, WLLS_LGMTASK_WIN, 0, "", "")
			LG_ApplySetMemberTask(WLLS_LGTYPE, str_lgname, str_plname, WLLS_LGMTASK_TIE, 0, "", "")
			wlls_award_pl(n_level, n_addwin, n_addtie, n_addtotal)
		end
	else
		local n_level = wlls_player_level()
		if (n_level > 0) then
			Msg2Player("B¹n cã thÓ ®Õn gÆp Quan viªn b¸o danh tham gia liªn ®Êu Vâ l©m.")
		end
	end
	wlls_sync_lginfo(n_lid)
end

--¼ÓÉÏÒ»¸öifÅĞ¶Ï£¬¿ÉÒÔ±ÜÃâ¼ÓÔØ½Å±¾Ê±µÄ±¨´í£¨ÆäÊµ£¬¼´Ê¹±¨´íÒ²²»»á·¢Éú´íÎó£©
if login_add then login_add(wlls_login, 2) end
