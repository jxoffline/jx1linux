Include( "\\script\\missions\\leaguematch\\head.lua" )

TB_WLLS_JOIN_SAY = {
	"VÞ §¹i hiÖp! Thêi gian vµo tr­êng ®Êu ®· qua råi, lÇn sau h·y quay l¹i!",
	"§¹i hiÖp! Ch­a gia nhËp chiÕn ®éi, lµm sao tham gia thi ®Êu?",
	"Mçi s©n thi ®Êu chØ chøa ®­îc 400 chiÕn ®éi, hiÖn ®· ®ñ råi, ng­¬i h·y quay l¹i sau!",
	"LÇn liªn ®Êu nµy chiÕn ®éi cña c¸c h¹ ®· tham gia sè trËn ®Êu ®¹t ®Õn møc cao nhÊt, kh«ng thÓ tham gia thªm n÷a!",
	"Xin lçi! Thµnh viªn trong chiÕn ®éi cña b¹n vµ b¹n cïng lóc vµo khu vùc chuÈn bÞ, ®Ó tr¸nh nh÷ng ph¸t sinh ngoµi ý muèn, xin thö l¹i lÇn n÷a!",
	"Ng­êi ®· qu¸ ®«ng råi! Kh«ng thÓ vµo n÷a",
}

TB_WLLS_PHASE_MSG = {
	"Vâ l©m liªn ®Êu vµ Vâ l©m kiÖt xuÊt liªn ®Êu ®ang trong giai ®o¹n t¹m nghØ, c¸c dòng sÜ cã thÓ l·nh gi¶i th­ëng xÕp h¹ng, vµ chØnh ®èn l¹i chiÕn ®éi cña m×nh. H¹n chÕ thi ®Êu lÇn nµy lµ:%s",
	"Vâ l©m liªn ®Êu vµ Vâ l©m kiÖt xuÊt liªn ®Êu s¾p b¾t ®Çu! Xin c¸c Dòng sÜ h·y kiÓm tra l¹i chiÕn ®éi cña m×nh! H¹n chÕ thi ®Êu lÇn nµy lµ:%s",
	"Vâ l©m liªn ®Êu kiÖt xuÊt h«m nay t¹m thêi kÕt thóc ",	-- ²»Ò»¶¨ÊÇ½ñÌìÔÙÃ»ÓÐ±ÈÈüÁË
	"Vâ l©m KiÖt xuÊt %d ®ang trong giai ®o¹n b¸o danh. C¸c ®éi muèn tham gia h·y nhanh ch©n ®Õn b¸o danh!",
}

--ÏòÖ¸¶¨½ÇÉ«Ãû·¢ÏûÏ¢
function wlls_gw_say(rolename, str, b_msg, b_sync)
	local n_playeridx = SearchPlayer(rolename)
	if (n_playeridx > 0) then
		local n_old = PlayerIndex 
		PlayerIndex = n_playeridx
		if b_msg then
			Msg2Player(str)
		else
			local str_npc = GetNpcName(GetLastDiagNpc())
			if (str_npc ~= "Sø gi¶ liªn ®Êu " and str_npc ~= "Sø gi¶ kiÖt xuÊt" and str_npc ~= "Quan viªn héi tr­êng") then str_npc = "Quan viªn Vâ l©m" end
			Say(str_npc..":"..str, 0)
		end
		if b_sync then
			wlls_sync_lginfo(LG_GetLeagueObjByRole(WLLS_LGTYPE, rolename))
		end
		PlayerIndex = n_old
	end
end

--µ±Ç°±ÈÈü½×¶Îµ÷Õû
function wlls_setphase(n_sid, n_type, n_phase, n_mid, n_next, tbOpen)
	_M("wlls_setphase", n_sid, n_type, n_phase, n_mid, n_next, tbOpen)
	--ÊýÖµ»¯£¬°²È«Æð¼û
	n_sid = tonumber(n_sid)
	n_type = tonumber(n_type)
	n_phase = tonumber(n_phase)
	n_mid = tonumber(n_mid)
	n_next = tonumber(n_next)
	
	local nClose	= 0
	for i = 1, getn(tbOpen) do
		if (FALSE(tbOpen[i])) then
			nClose	= SetBit(nClose, i, 1)
		end
	end
	_M("{"..join(tbOpen).."}", nClose)

	--±¸·Ý¾ÉÖµ
	local n_oldsid = GetGlbValue(GLB_WLLS_SID)
	local n_oldtype = GetGlbValue(GLB_WLLS_TYPE)
	local n_oldphase = GetGlbValue(GLB_WLLS_PHASE)
	local n_oldmid = GetGlbValue(GLB_WLLS_MATCHID)
	local n_oldnext = GetGlbValue(GLB_WLLS_NEXT)
	local nOldClose = GetGlbValue(GLB_WLLS_CLOSE)
	
	--ÎÞ±ä»¯Ö±½Ó·µ»Ø
	if (n_oldsid == n_sid and
		n_oldtype == n_type and
		n_oldphase == n_phase and
		n_oldmid == n_mid and
		n_oldnext == n_next and
		nOldClose == nClose) then	--ÎÞ±ä»¯Ö±½Ó·µ»Ø
		return
	end
	
	--±£´æÐÂÖµ
	SetGlbValue(GLB_WLLS_SID, n_sid)
	SetGlbValue(GLB_WLLS_TYPE, n_type)
	SetGlbValue(GLB_WLLS_PHASE, n_phase)
	SetGlbValue(GLB_WLLS_MATCHID, n_mid)
	SetGlbValue(GLB_WLLS_NEXT, n_next)
	SetGlbValue(GLB_WLLS_CLOSE, nClose)
	
	if (n_phase == 1) then	--¼äÐªÆÚ
		local str = format(TB_WLLS_PHASE_MSG[1], WLLS_TAB[n_next].name)
		Msg2SubWorld(str)
	elseif (n_phase == 2) then	--±ÈÈüÆÚ£¬ÎÞ±ÈÈü
		if (n_oldsid ~= n_sid) then	--ÐÂÈü¼¾
			local str = format(TB_WLLS_PHASE_MSG[2], WLLS_TAB[n_type].name)
			Msg2SubWorld(str)
		else
			Msg2SubWorld(TB_WLLS_PHASE_MSG[3])
		end
	elseif (n_phase == 4) then	--¿ªÊ¼±ÈÈü
		local tb_sub = wlls_get_subworld(2)
		local n_oldsub = SubWorld

		--È¡Ïû¿ÉÄÜÕýÔÚµÈ´ý¿ªÊ¼µÄ±ÈÈü
		for n_idx, nGroupIdx in tb_sub do
			SubWorld = n_idx
			CloseMission(WLLS_MSID_SCHEDULE)
		end
		
		if (n_mid <= 0) then	--Relay¸Õ¸ÕÆô¶¯£¬²»ÄÜ¿ªÊ¼±ÈÈü
			SetGlbValue(GLB_WLLS_PHASE, 3)	--×èÖ¹¼ÌÐø½øÈë×¼±¸³¡
			if (n_oldmid > 0) then
				--Îª¿ÉÄÜÒÑ¾­¿ªÊ¼±ÈÈüµÄÍæ¼Ò»Ö¸´±ÈÈüID
				SetGlbValue(GLB_WLLS_MATCHID, n_oldmid)
			end
		else
			--¹Ø±ÕÈ«¾Ö¼ÆÊ±Mission
			CloseGlbMission(WLLS_MSID_GLB)
			if (nClose ~= 3) then	-- ²»ÊÇËùÓÐ±ÈÈü¶¼¹ØÁË
				--´ò¿ªÈ«¾Ö¼ÆÊ±Mission
				OpenGlbMission(WLLS_MSID_GLB)
				
				local str = format(TB_WLLS_PHASE_MSG[4], mod(n_mid, 100))
				Msg2SubWorld(str)
				AddGlobalNews(str)
				WriteLog(date("%Y/%m/%d-%H:%M\t")..str)
				
				--¿ªÆôËùÓÐ×¼±¸³¡
				local tbGroup	= {}
				local n_oldsub = SubWorld
				for n_idx, nGroupIdx in tb_sub do
					SubWorld = n_idx
					local nMType	= wlls_get_mapinfo()
					local nLevel	= wlls_get_level(nMType)
					if (not FALSE(tbOpen[nLevel])) then	-- Ã»ÓÐ¹Ø±ÕµÄ»°
						tbGroup[getn(tbGroup)+1]	= nGroupIdx
						print("sever phô tr¸ch"..wlls_get_desc(3).."sever")
						OpenMission(WLLS_MSID_SCHEDULE)
					end
				end
				if (getn(tbGroup) > 0) then
					local szParam = GetPlayerCount().." "..join(tbGroup).." 1"	-- 1±íÊ¾ÊÇ¿ªÊ¼±¨ÃûºóµÄµÚÒ»´Î»ã±¨
					LG_ApplyDoScript(0, "", "", "\\script\\leaguematch\\joinmatch.lua", "wlls_GsState", szParam , "", "")
				end
			end
		end
		SubWorld = n_oldsub
	else
		print("§¹i héi Vâ lam ®ang trong giai ®o¹n:"..n_phase.."("..n_mid..") ???")
	end
end

--ÈÃÖ¸¶¨½ÇÉ«½øÈëÖ¸¶¨·þÎñÆ÷µÄ×¼±¸³¡£¬¼ÓÈëÖ¸¶¨ÕóÓª
function wlls_player_join(str_playername, n_mtype, n_group, n_mscamp)
	_M("wlls_player_join", str_playername, n_mtype, n_group, n_mscamp)
	if (GetGlbValue(GLB_WLLS_PHASE) ~= 4) then	--Ê±¼äÒÑ¹ý
		n_group = nil
		n_mtype = 1
	end
	local n_playeridx = SearchPlayer(str_playername)
	if (n_playeridx > 0) then
		local n_old = PlayerIndex 
		PlayerIndex = n_playeridx
		if n_group then	--relayÈÏÎª¿ÉÒÔ½øÈë
			if not wlls_en_check() then	--¿ç·þÊ§°ÜÔõÃ´ÅÐ¶Ï£¿£¿£¿£¡£¡£¡
				local szResult = n_mtype.." "..n_group.." "..GetName()
				LG_ApplyDoScript(0, "", "", "\\script\\leaguematch\\joinmatch.lua", "wlls_onleave", szResult , "", "")
				return
			end
			SetTask(WLLS_TASKID_ORGCAMP, n_mscamp)
			--Çå³ý¸½¼Ó×´Ì¬
			for i = 1, getn(WLLS_FORBID_ITEM) do
				RemoveSkillState(WLLS_FORBID_ITEM[i][3])
			end
			for i = 1, getn(WLLS_FORBID_STATES) do
				RemoveSkillState(WLLS_FORBID_STATES[i][2])
			end
			Msg2Player("Sau khi vµo khu vùc thi ®Êu, kh«ng thÓ di chuyÓn vËt phÈm trong hµnh trang nh­ng vÉn cã thÓ sö dông vËt phÈm trong hµnh trang vµ thanh c«ng cô.");
			SetRevPos(wlls_get_mapid(1, n_mtype, n_group), 1)	--ÖØÉúµãÔÚËùÔÚ±ÈÈü·þÎñÆ÷µÄ»á³¡
			local n_mapid = wlls_get_mapid(2, n_mtype, n_group)
			_M(n_mapid, "wlls_get_mapid", n_mtype, n_group)
			NewWorld(n_mapid, WLLS_MAPPOS_PRE[1], WLLS_MAPPOS_PRE[2])
		else	--²»ÄÜ½øÈë
			Say(TB_WLLS_JOIN_SAY[n_mtype], 0)
		end
		PlayerIndex = n_old
	end
end

-- ·µ»ØÖ¸¶¨½±Æ·ÐÅÏ¢
function wlls_get_awardinfo(n_type, n_level, n_award)
	local str	= WLLS_LEVEL_DESC[n_level] .. " (" .. WLLS_TAB[n_type].name .. ") thø "

	local tb_award	= WLLS_TAB[n_type].award_rank[n_level]
	
	local n_start, n_end	= 1, 1
	if (n_award > 1) then
		n_start	= tb_award[n_award - 1][1] + 1
	end
	n_end	= tb_award[n_award][1]
	
	if (n_start ~= n_end) then
		str	= str .. n_start .. "~" .. n_end
	else
		str	= str .. n_end
	end
	str	= str .. "phÇn th­ëng (" .. tb_award[n_award][3] .. ") "
	
	return str
end

-- ·µ»ØÖ¸¶¨ÅÅÃûÓ¦¸ÃÁìÈ¡µÄ½±Ïî
function wlls_get_rankinfo(tb_award, n_rank)
	if (n_rank <= 0) then
		return nil
	end
	local n_award
	for i = getn(tb_award), 1, -1 do
		if (tb_award[i][1] >= n_rank) then
			n_award = i
		else
			break
		end
	end
	return n_award
end

--²éÑ¯±¾½ÇÉ«ÒÑÁìÈ¡ÁËÊ²Ã´½±Àø
function wlls_awardinfo(b_Msg)
	local str
	local n_got		= GetTask(WLLS_TASKID_GOTAWARD)
	local n_type	= GetByte(n_got, 4)
	local n_level	= GetByte(n_got, 3)
	local n_award	= GetByte(n_got, 2)
	local n_sid		= GetByte(n_got, 1)
	if (n_award == 0) then
		if (n_sid == 0) then
			str	= "ch­a nhËn qua"
		else
			str	= "h¹ng thø " .. n_sid .. "liªn ®Êu lÇn nµy, ch­a biÕt néi dung"
		end
	else
		str	= "h¹ng thø " .. n_sid .. "lÇn nµy" .. wlls_get_awardinfo(n_type, n_level, n_award)
	end

	local n_awardex	= GetTask(WLLS_TASKID_AWARDEX)
	local n_type	= GetByte(n_awardex, 4)
	local n_level	= GetByte(n_awardex, 3)
	local n_awarderr= GetByte(n_awardex, 2)
	local n_award	= GetByte(n_awardex, 1)
	
	if b_Msg then
		Msg2Player(str)
	end

	return str
end

function wlls_reload(bRelay)
	LoadScript( "\\script\\missions\\leaguematch\\npc\\officer.lua" )
	LoadScript( "\\script\\missions\\leaguematch\\npc\\helper.lua" )
	LoadScript( "\\script\\missions\\leaguematch\\npc\\signup.lua" )
	LoadScript( "\\script\\missions\\leaguematch\\npc\\housecarl.lua" )
	LoadScript( "\\script\\missions\\leaguematch\\npc\\chefu.lua" )
	LoadScript( "\\script\\missions\\leaguematch\\npc\\chuwuxiang.lua" )
	LoadScript( "\\script\\missions\\leaguematch\\npc\\yaoshang.lua" )
	LoadScript( "\\script\\missions\\leaguematch\\combat\\mission.lua" )
	LoadScript( "\\script\\missions\\leaguematch\\combat\\playerdeath.lua" )
	LoadScript( "\\script\\missions\\leaguematch\\schedule\\newworld.lua" )
	LoadScript( "\\script\\missions\\leaguematch\\schedule\\mission.lua" )
	LoadScript( "\\script\\missions\\leaguematch\\schedule\\newworld.lua" )
	LoadScript( "\\script\\missions\\leaguematch\\glbmission\\mission.lua" )
	LoadScript( "\\script\\missions\\leaguematch\\glbmission\\combat.lua" )
	LoadScript( "\\script\\missions\\leaguematch\\glbmission\\schedule.lua" )
	LoadScript( "\\script\\global\\server_playerlevelup.lua" )
	LoadScript( "\\script\\global\\login.lua" )
	if (bRelay) then
		LG_ApplyDoScript(0, "", "", "\\script\\leaguematch\\joinmatch.lua", "ReloadAllScript", "" , "", "")
	end
	Msg2Player("WLLS file gèc ®· qu¸ t¶i"..date())
	print("===============WLLS file gèc ®· qu¸ t¶i"..date())
end
