IL("RELAYLADDER");

--²éÑ¯£¨Ö÷¶Ô»°£©
function wlls_query()
	local str = "<enter>  §­¬ng kim lo¹n thÕ, anh hïng hµo kiÖt næi lªn kh¾p n¬i. V× muèn chèng l¹i sù tranh giµnh trªn giang hå nªn §éc C« Minh Chñ cã ý tæ chøc Vâ l©m liªn ®Êu: Tr­íc tiªn lµ ®Ó chän ra nh÷ng g­¬ng mÆt ­u tó cña Vâ l©m, hai lµ cïng nhau tÝnh kÕ. Tham gia thi ®Êu nÕu cã biÓu hiÖn tèt sÏ nhËn ®­îc gi¶i th­ëng.<enter>"..
		"B¹n vÉn cã thÓ kiÓm tra t×nh h×nh liªn quan liªn ®Êu kiÖt xuÊt Vâ l©m vµ liªn ®Êu Vâ l©m ë chç ta."
	local tb_option = {}
	if (LG_GetLeagueObjByRole(WLLS_LGTYPE, GetName()) ~= 0) then
		tb_option[getn(tb_option)+1] = "Ta muèn kiÓm tra t×nh h×nh chiÕn ®éi [®éi m×nh]/wlls_query_mylg"
	end
	tb_option[getn(tb_option)+1] = "Ta muèn kiÓm tra t×nh h×nh chiÕn ®éi [10 h¹ng ®Çu]/wlls_query_level"
	tb_option[getn(tb_option)+1] = "Ta muèn kiÓm tra chØ ®Þnh t×nh h×nh chiÕn ®éi [tªn chiÕn ®éi] /wlls_query_lgnamein"
	tb_option[getn(tb_option)+1] = "Ta muèn kiÓm tra chØ ®Þnh t×nh h×nh chiÕn ®éi [tªn nh©n vËt]/wlls_query_plnamein"
	tb_option[getn(tb_option)+1] = "Kh«ng cÇn!/OnCancel"
	wlls_descript(str, tb_option)
end

--²éÑ¯×Ô¼ºÕ½¶Ó£¨²éÑ¯£©
function wlls_query_mylg()
	local n_lid = LG_GetLeagueObjByRole(WLLS_LGTYPE, GetName())
	if (FALSE(n_lid)) then
		Say(wlls_npcname().."Xin lçi! B¹n vÉn ch­a vµo nhãm, kh«ng thÓ kiÓm tra!", 0)
	else
		wlls_query_do(n_lid)
	end
end

--²éÑ¯ÅÅÐÐÇ°10µÄÕ½¶Ó£¨¼¶±ðÁÐ±í£ºÐÂÐã¡¢¸ß¼¶£©
function wlls_query_level()
	wlls_descript("B¹n muèn kiÓm tra kiÓm tra xÕp h¹ng chiÕn ®éi cÊp nµo?",
		WLLS_LEVEL_DESC[1].."10 h¹ng ®Çu/#wlls_query_type(1)",
		WLLS_LEVEL_DESC[2].."10 h¹ng ®Çu/#wlls_query_type(2)",
		"Trë l¹i/wlls_query",
		"Ta biÕt råi/OnCancel")
end

--²éÑ¯ÅÅÐÐÇ°10µÄÕ½¶Ó£¨·ÖÀàÁÐ±í£©
function wlls_query_type(n_level)
	local n_type = GetGlbValue(GLB_WLLS_TYPE)
	local tb_option = {}
	local n
	for n_mtype, tb_mtaype in WLLS_TAB[n_type].match_type do
		if (tb_mtaype.level == n_level) then
			n = n_mtype
			tb_option[getn(tb_option)+1] = WLLS_LEVEL_DESC[tb_mtaype.level].."-"..tb_mtaype.name.."10 h¹ng ®Çu/#wlls_query_top10("..n_mtype..")"
		end
	end
	if (getn(tb_option) == 1) then	--Ö»ÓÐÒ»¸ö£¬Ö±½ÓÏÔÊ¾
		wlls_query_top10(n)
		return
	end
	tb_option[getn(tb_option)+1] = "Trë l¹i/wlls_query_level"
	tb_option[getn(tb_option)+1] = "Ta biÕt råi/OnCancel"
	wlls_descript("lÇn nµy "..WLLS_LEVEL_DESC[n_level].."Gåm cã "..(getn(tb_option) - 1).."B¹n muèn kiÓm tra kiÓm tra xÕp h¹ng chiÕn ®éi cÊp nµo?", tb_option)
end

--²éÑ¯ÅÅÐÐÇ°10µÄÕ½¶Ó£¨Ç°Ê®ÃûÁÐ±í£©
function wlls_query_top10(n_mtype)
	local n_type = GetGlbValue(GLB_WLLS_TYPE)
	local n_ladder = WLLS_TAB[n_type].match_type[n_mtype].ladder
	local n_level = WLLS_TAB[n_type].match_type[n_mtype].level
	local tb_option = {}
	for i = 1, 10 do
		local str_lgname, n_order = Ladder_GetLadderInfo(n_ladder, i)
		if (not FALSE(n_order)) then
			tb_option[getn(tb_option)+1] = strfill_left("h¹ng thø "..(-n_order).."danh ", 7)..str_lgname.."/#wlls_query_top("..n_ladder..","..i..")"
		end
	end
	if (getn(tb_option) <= 0) then
		Say(wlls_npcname().."Xin lçi! HiÖn vÉn ch­a cã xÕp h¹ng chiÕn ®éi, kh«ng thÓ kiÓm tra!", 0)
	else
		tb_option[getn(tb_option)+1] = "Trë l¹i/#wlls_query_type("..n_level..")"
		tb_option[getn(tb_option)+1] = "Ta biÕt råi/OnCancel"
		Say(wlls_npcname().."B¹n muèn kiÓm tra nhãm nµo?", getn(tb_option), tb_option)
	end
end

--²éÑ¯Ç°10µÄÕ½¶Ó£¨²éÑ¯£©
function wlls_query_top(n_ladder, n_idx)
	local str_lgname = Ladder_GetLadderInfo(n_ladder, n_idx)
	local n_lid = LG_GetLeagueObj(WLLS_LGTYPE, str_lgname)
	if (n_lid ~= 0 and LG_GetLeagueTask(n_lid, WLLS_LGTASK_RANK) > 0) then
		wlls_query_do(n_lid)
	else
		Say(wlls_npcname().."Xin lçi! ChiÕn ®éi nµy ®· gi¶i t¸n, kh«ng thÓ kiÓm tra!", 0)
	end
end

--²éÑ¯Ö¸¶¨Õ½¶Ó(ÊäÈë)
function wlls_query_lgnamein()
	AskClientForString("wlls_query_lgname", "", 1, 16, "NhËp vµo tªn chiÕn ®éi muèn kiÓm tra!")
end

--²éÑ¯Ö¸¶¨Õ½¶Ó(²éÑ¯)
function wlls_query_lgname(str_lgname)
	local n_lid = LG_GetLeagueObj(WLLS_LGTYPE, str_lgname)
	if (FALSE(n_lid)) then
		Say(wlls_npcname().."Xin lçi! ChiÕn ®éi kh«ng tån t¹i hoÆc ®· gi¶i t¸n.", 0)
	else
		wlls_query_do(n_lid)
	end
end

--²éÑ¯Ö¸¶¨½ÇÉ«(ÊäÈë)
function wlls_query_plnamein()
	AskClientForString("wlls_query_plname", "", 1, 16, "Xin h·y nhËp tªn nh©n vËt muèn kiÓm tra!")
end

--²éÑ¯Ö¸¶¨½ÇÉ«(²éÑ¯)
function wlls_query_plname(str_plname)
	local n_lid = LG_GetLeagueObjByRole(WLLS_LGTYPE, str_plname)
	if (FALSE(n_lid)) then
		Say(wlls_npcname().."Xin lçi! Tªn nh©n vËt b¹n nhËp vµo cã thÓ kh«ng tån t¹i hoÆc kh«ng cã gia nhËp chiÕn ®éi, kh«ng thÓ kiÓm tra!", 0)
	else
		wlls_query_do(n_lid)
	end
end

--²éÑ¯Ö¸¶¨Õ½¶Ó£¨ÏÔÊ¾£©
function wlls_query_do(n_lid)
	local str_lgname, _, n_memcount = LG_GetLeagueInfo(n_lid)
	local n_type = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
	local n_mtype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_MTYPE)
	local str_mtype = wlls_get_desc(2, n_mtype, 1, n_type)
	local str_mem = join(wlls_get_mems(n_lid), "  ")
	local n_win = LG_GetLeagueTask(n_lid, WLLS_LGTASK_WIN)
	local n_tie = LG_GetLeagueTask(n_lid, WLLS_LGTASK_TIE)
	local n_total = LG_GetLeagueTask(n_lid, WLLS_LGTASK_TOTAL)
	local n_point = LG_GetLeagueTask(n_lid, WLLS_LGTASK_POINT)
	local n_time = ceil(LG_GetLeagueTask(n_lid, WLLS_LGTASK_TIME)/18)
	local n_lose = n_total - n_tie - n_win
	local f_rate = 0
	if (n_total > 0) then
		f_rate = n_win/n_total*100
	end
	local n_rank = LG_GetLeagueTask(n_lid, WLLS_LGTASK_RANK)
	local str_rank
	if (n_rank > 1000) then
		str_rank = "Sau 1000"
	elseif (n_rank > 0) then
		str_rank = "h¹ng thø "..n_rank.."danh "
	else
		str_rank = "VÉn ch­a xÕp h¹ng"
	end
	local n_width = 17
	local str = "<enter>"
	str = str .. strfill_center(str_mtype.."nhãm [<color=yellow>"..str_lgname.."<color>]", 53+21, "-")
	str = str .. strfill_left("gåm cã<color=yellow>"..n_memcount.."<color> Thµnh viªn", n_width+21).."<color=cyan>"..str_mem.."<color><enter>"
	str = str .. strfill_left("®· tham gia<color=yellow>"..n_total.."<color>thi ®Êu:", n_width+21).."th¾ng lîi<color=yellow>"..n_win.."<color>trËn/hßa<color=yellow>"..n_tie.."<color>trËn/thÊt b¹i<color=yellow>"..n_lose.."<color>trËn<enter>"
	str = str .. strfill_left("",n_width).."tû lÖ th¾ng<color=yellow>"..strsub(f_rate,1,4).."<color>%<enter>"
	str = str .. strfill_left("®iÓm th­ëng nhãm:<color=yellow>"..n_point.."<color>", n_width+21).."thêi gian chiÕn ®Êu tÝch lòy:<color=yellow>"..n_time.."<color>gi©y<enter>"
	str = str .. ""..strfill_center("<<  <color=yellow>"..str_rank.."<color>  >>", 53+21).."<color>"
	wlls_descript(str)
end

--°ïÖú
function wlls_help(n_type, n_level, n_id)
	local tb_option = {}
	local tb = WLLS_TAB[n_type].help_msg
	for i = 1, getn(tb) do
		if (i == n_id) then
			tb_option[getn(tb_option)+1] = "< "..tb[i][n_level][1].." >/#wlls_help("..n_type..","..n_level..","..i..")"
		else
			tb_option[getn(tb_option)+1] = tb[i][n_level][1].."/#wlls_help("..n_type..","..n_level..","..i..")"
		end
	end
	tb_option[getn(tb_option)+1] = "Ta ®· râ råi!/OnCancel"
	wlls_descript("<enter>"..strfill_center(" ( "..tb[n_id][n_level][1]..") ", 52).."<enter>"..tb[n_id][n_level][2], tb_option)
end

--Describe¶Ô»°
function wlls_descript(str, ...)
	str = "<link=image[0,8]:\\spr\\npcres\\passerby\\passerby092\\passerby092_st.spr>"..wlls_npcname().."<link>"..str
	if (type(arg[1]) == "table") then
		arg = arg[1]
	end
	if (getn(arg) <= 0) then
		Describe(str, 1, "KÕt thóc ®èi tho¹i/OnCancel")
	else
		Describe(str, getn(arg), arg)
	end
end

--µÃµ½ËùÓÐµÄ¶ÓÔ±Ãû×Ö
function wlls_get_mems(n_lid)
	local str_lgame, _, n_memcount = LG_GetLeagueInfo(n_lid)
	local tb = {""}
	for i = 0, n_memcount-1 do
		local str_plname = LG_GetMemberInfo(n_lid, i)
		local n_job = LG_GetMemberTask(WLLS_LGTYPE, str_lgame, str_plname, WLLS_LGMTASK_JOB)
		if n_job == 1 then
			tb[1] = str_plname
		else
			tb[getn(tb)+1] = str_plname
		end
	end
	return tb
end

--µÃµ½¶Ô»°NpcÃû³Æ
function wlls_npcname()
	return GetNpcName(GetLastDiagNpc())..":"
end

--Ìí¼Ó²éÑ¯¡¢°ïÖúÑ¡Ïî
function wlls_add_option(tb, str)
	tb[getn(tb)+1] = "Ta muèn kiÓm tra t×nh h×nh thi ®Êu hiÖn t¹i/wlls_query"
	local n_type = GetGlbValue(GLB_WLLS_TYPE)
	local n_next = GetGlbValue(GLB_WLLS_NEXT)
	local n_mtype, _, n_map = wlls_get_mapinfo()
	local n_level
	if (n_mtype) then
		n_level = WLLS_TAB[n_type].match_type[n_mtype].level
	else
		n_level = wlls_getcityinfo()
	end
	if (n_type == n_next) then
		tb[getn(tb)+1] = WLLS_LEVEL_DESC[n_level] .. "Hç trî thi ®Êu/#wlls_help("..n_type..","..n_level..",1)"
	else
		tb[getn(tb)+1] = WLLS_LEVEL_DESC[n_level] .. WLLS_TAB[n_type].name .. "Hç trî thi ®Êu/#wlls_help("..n_type..","..n_level..",1)"
		tb[getn(tb)+1] = WLLS_LEVEL_DESC[n_level] .. WLLS_TAB[n_next].name .. "Hç trî thi ®Êu/#wlls_help("..n_next..","..n_level..",1)"
	end
	--if (n_map == 1) then
	--	tb[getn(tb)+1] = "ÎÒÒªÀë¿ª»á³¡/wlls_want2transback"
	--end
	tb[getn(tb)+1] = str.."/OnCancel"
	return tb
end
