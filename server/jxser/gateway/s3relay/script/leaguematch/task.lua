Include("\\script\\leaguematch\\head.lua")
Include("\\script\\gb_taskfuncs.lua")
Include("\\script\\leaguematch\\switch.lua")

--¼ÆËãµ±Ç°µÄÊ±¼äÊÇ·ñÔÚ±ÈÈüÊ±¶Î£¬Èç¹ûÊÇ·µ»ØÊÇÒ»ÌìµÄµÚ¼¸³¡±ÈÈü£¬·ñÔò·µ»Ønil
function wlls_calc_loop(tb_calendar, n_mins)
	local tb_cal, n
	local n_loop = 1
	for _, tb_cal in tb_calendar do
		n = floor((n_mins-tb_cal[1])/WLLS_MATCHTIME)
		if (n >= 0 and n < tb_cal[2]) then
			return n + n_loop;
		end
		n_loop = n_loop + tb_cal[2]
	end
	return nil
end

--¼ÆËãÏÖÔÚµÄ±ÈÈü½×¶Î£¬·µ»Ø£º
--	±ÈÈü½×¶Î(1,2,4)£¬MatchID(0±íÊ¾²»ÊÇ±ÈÈüÖÐ)£¬Èü¼¾ID(0±íÊ¾µÚÒ»¸öÈü¼¾Ö®Ç°)
function wlls_calc_phase()
	local n_date = tonumber(date("%y%m%d"))
	local n_sid = 0
	for i, tb in WLLS_SEASON_TB do
		if (i > n_sid and n_date >= tb[2]) then
			n_sid = i
		end
	end
	local tb = WLLS_SEASON_TB[n_sid]
	if (n_date <= tb[3]) then	--±ÈÈüÆÚ
		local n_time = tonumber(date("%H%M"))
		local n_time = floor(n_time/100)*60 + mod(n_time,100)
		local n_loop
		if tb[5].weekend then	--ÓÐÖÜÄ©ÌØ±ð°²ÅÅ
			local n_wday = tonumber(date("%w"))
			if (n_wday == 0 or n_wday >= 5) then	--ÏÖÔÚÊÇÖÜÄ©
				n_loop = wlls_calc_loop(tb[5].weekend, n_time)
				if n_loop then
					return 4, n_date*100 + n_loop, n_sid
				else
					return 2, 0, n_sid
				end
			end
		end
		n_loop = wlls_calc_loop(tb[5].common, n_time)
		if n_loop then
			return 4, n_date*100 + n_loop, n_sid
		else
			return 2, 0, n_sid
		end
	end
	--¼äÐªÆÚ
	return 1, 0, n_sid
end

--Í³¼Æn_lgtypeÀàÐÍ±ÈÈüµ±Ç°»ý·ÖÇé¿ö
function wlls_match_stat(n_mtype, n_matchid, n_sid)
	_M("wlls_match_stat+", n_mtype, n_matchid, n_sid)
	local tb_order = {}
	
	for i = 1, 48*10 do	--³õÊ¼»¯Ò»´Î
		tb_order[i] = {}
	end
	tb_order[0] = {}
	
	local n_point, n_lastmatch
	local n_lid = LG_GetFirstLeague(WLLS_LGTYPE)
	local n_minid = WLLS_SEASON_TB[n_sid][2]*100	--±¾Èü¼¾MatchID»ù´¡Öµ
	while( not FALSE(n_lid) ) do
		if (n_mtype == LG_GetLeagueTask(n_lid, WLLS_LGTASK_MTYPE)) then
			n_lastmatch = LG_GetLeagueTask(n_lid, WLLS_LGTASK_LAST)
			if (n_lastmatch ~= 0 and n_lastmatch <= n_minid) then	--²»ÊÇ±¾Èü¼¾½øÀ´µÄ£¬ÒªÇå¿ÕÊý¾Ý
				wlls_lg_clear_one(n_lid)
			elseif (n_lastmatch > 0) then	--Ö»ÅÅÃû±¾Èü¼¾²ÎÈüµÄ
				n_point = LG_GetLeagueTask(n_lid, WLLS_LGTASK_POINT)
				tb_order[n_point][getn(tb_order[n_point])+1] = n_lid
			end
		end
		n_lid = LG_GetNextLeague(WLLS_LGTYPE, n_lid)
	end
	local n_type = WLLS_SEASON_TB[n_sid][1]
	local n_ladder = WLLS_TYPE[n_type].ladder + n_mtype - 1
	Ladder_ClearLadder(n_ladder)	--mmm
	local count = 0
	local str_lgname
	local str_logfile = "\\relay_log\\"..date("%Y_%m_%d").."\\wlls_"..n_matchid..".log"
	local str	= "===== WLLS Order -- Zone:"..GetGateWayClientID().." MatchType:"..n_mtype.." ====="
	_M(str)
	WriteStringToFile(str_logfile, str.."\n")
	for i = getn(tb_order), 1, -1 do	--»ý·Ö0µÄ²»ÅÅÐÐ
		if (getn(tb_order[i]) > 0) then
			local tb_torder = tb_order[i]
			local n_torder = getn(tb_torder)
			if (count > 1000 or i <= 0) then	--1000ÃûÒÔºó£¬µ¥´¿°´»ý·ÖÅÅÐò
				for j = 1, n_torder do
					str_lgname = LG_GetLeagueInfo(tb_torder[j])
					wlls_SetLeagueTask(str_lgname, WLLS_LGTASK_RANK, 1001)	--¼õÉÙ±ä»¯£¬ÕæÊµÅÅÃûÊÇ£ºcount+1
					--Êä³öÅÅÃû
					WriteStringToFile(str_logfile, (count + 1)..":\t"..i.."\t-\t-\t-\t"..wlls_getlginfo(str_lgname).."\n")
				end
			else	--Ç°1000ÃûÒª±ÜÃâ²¢ÁÐ
				local tb_winrate = {[0] = 1}	--Ê¤ÂÊÊý×é£¬º¬¼àÊÓÉÚ
				local tb_usedtime = {}	--ÓÃÊ±Êý×é
				local n_win, n_total;
				for j = 1, n_torder do	--°´Ê¤ÂÊÅÅÐò£¬²åÈë·¨ÅÅÐò
					n_lid = tb_torder[j]
					n_win = LG_GetLeagueTask(n_lid, WLLS_LGTASK_WIN)
					n_total = LG_GetLeagueTask(n_lid, WLLS_LGTASK_TOTAL)
					tb_usedtime[n_lid] = LG_GetLeagueTask(n_lid, WLLS_LGTASK_TIME)
					tb_winrate[n_lid] = n_win/n_total
					local k = j - 1
					while k >= 1 do
						if (tb_winrate[tb_torder[k]] >= tb_winrate[n_lid]) then break end
						tb_torder[k+1] = tb_torder[k]
						k = k - 1
					end
					tb_torder[k+1] = n_lid
				end
				for j = 1, n_torder do	--½«ÈÔ¾É²¢ÁÐµÄ°´ÕÕÕ½¶·Ê±¼äÅÅÐò
					local n_thiswinrate = tb_winrate[tb_torder[j]]
					local k = j
					while k < n_torder do
						if (tb_winrate[tb_torder[k+1]] ~= n_thiswinrate) then break end
						k = k + 1
					end
					--´ËÊ±´Ójµ½k¶¼ÊÇÏàÍ¬Ê¤ÂÊµÄ
					--°´ÓÃÊ±ÅÅÐò£¬Ã°ÅÝ·¨ÅÅÐò
					local b_f
					repeat
						b_f = 1
						for l = j, k - 1 do
							if (tb_usedtime[tb_torder[l]] > tb_usedtime[tb_torder[l+1]]) then	--Ç°ÃæµÄÓÃÊ±¼ä¶àÁË£¬½»»»
								n_lid = tb_torder[l]
								tb_torder[l] = tb_torder[l+1]
								tb_torder[l+1] = n_lid
								b_f = nil
							end
						end
					until b_f
				end
				local n_lastwin, n_thiswin
				local n_lasttime, n_thistime
				local n_lastorder
				for j = 1, n_torder do	--µÃ³öÅÅÃû
					n_thiswin = tb_winrate[tb_torder[j]]
					n_thistime = tb_usedtime[tb_torder[j]]
					if (n_lastwin ~= n_thiswin or n_lasttime ~= n_thistime) then	--Ã»ÓÐ²¢ÁÐ
						n_lastwin = n_thiswin
						n_lasttime = n_thistime
						n_lastorder = count + j
					end
					str_lgname = LG_GetLeagueInfo(tb_torder[j])
					wlls_SetLeagueTask(str_lgname, WLLS_LGTASK_RANK, n_lastorder)
					--Êä³öÅÅÃû
					WriteStringToFile(str_logfile, n_lastorder..":\t"..i.."\t"..n_thiswin.."\t"..LG_GetLeagueTask(tb_torder[j],WLLS_LGTASK_WIN).."\t"..n_thistime.."\t"..wlls_getlginfo(str_lgname).."\n")
					if (count + j <= 10) then
						Ladder_NewLadder(n_ladder, str_lgname, -n_lastorder, 0)
					end
				end
			end
			count = count + n_torder
		end
	end
	_M("wlls_match_stat-")
end

--½øÈëÐÂ±ÈÈüÊ±ÆÚ
function wlls_set_mid(n_sid, n_mid)
	_M("wlls_set_mid", n_sid, n_mid)
	local n_oldsid = gb_GetTask("WLLS", 1)
	local n_oldtype = gb_GetTask("WLLS", 2)
	local n_oldmid = gb_GetTask("WLLS", 3)
	local n_type = WLLS_SEASON_TB[n_sid][1]
	if (n_oldtype > 0 and n_oldtype ~= n_type) then	--Ä£Ê½¸Ä±ä£¬É¾³ý¾ÉÕ½¶Ó
		_M("Thay ®æi m« thøc, xãa ®éi cò ")
		local n_lid = LG_GetFirstLeague(WLLS_LGTYPE)
		while (not FALSE(n_lid)) do 
			local n_rmlid = n_lid
			n_lid = LG_GetNextLeague(WLLS_LGTYPE, n_lid)
			if (LG_GetLeagueTask(n_rmlid, WLLS_LGTASK_STYPE) ~= n_type) then
				local str_lgname = LG_GetLeagueInfo(n_rmlid)
				_M("LG_ApplyRemoveLeague", WLLS_LGTYPE, str_lgname)
				LG_ApplyRemoveLeague(WLLS_LGTYPE, str_lgname)
			end
		end
	end
	if (n_oldsid > 0 and n_oldsid ~= n_sid) then	--¿çÈü¼¾£¬³õÊ¼»¯Õ½¶ÓÊý¾Ý
		_M("kªu gäi thi ®Êu, sè liÖu ®éi ban ®Çu")
		local n_lid = LG_GetFirstLeague(WLLS_LGTYPE)
		while (not FALSE(n_lid)) do 
			if (LG_GetLeagueTask(n_lid, WLLS_LGTASK_LAST) ~= 0) then
				wlls_lg_clear_one(n_lid)
			end
			n_lid = LG_GetNextLeague(WLLS_LGTYPE, n_lid)
		end
		--ÇåÅÅÃû
		for n_ladder = WLLS_TYPE[n_type].ladder, WLLS_TYPE[n_type].ladder + WLLS_TYPE[n_type].mtypes - 1 do
			Ladder_ClearLadder(n_ladder)
		end
	end
	if (n_oldmid > 0 and n_oldmid ~= n_mid) then	--±ÈÈü³¡´Î¸Ä±ä£¬ÐèÒª½øÐÐÅÅÐÐ
		_M("Thay ®æi thø trËn thi ®Êu, cÇm tiÕn hµnh s¾p xÕp")
		for n_mtype = 1, WLLS_TYPE[n_oldtype].mtypes do
			wlls_match_stat(n_mtype, n_oldmid, n_oldsid)
		end
	end
	SetGblInt(RLGLB_WLLS_SEASONID, n_sid)
	SetGblInt(RLGLB_WLLS_MATCHID, n_mid)
	gb_SetTask("WLLS", 1, n_sid)
	gb_SetTask("WLLS", 2, n_type)
	gb_SetTask("WLLS", 3, n_mid)
end

function TaskShedule()
	TaskName("Vâ l©m liªn ®Êu")
	--ÏÂ¸öÕû°ëÐ¡Ê±Æô¶¯
	if (tonumber(date("%M")) >= 30) then
		TaskTime(tonumber(date("%H"))+1, 0)
	else
		TaskTime(tonumber(date("%H")), 30)
	end
	TaskCountLimit(0);	--ÎÞÏÞÆô¶¯
	TaskInterval(15);	--¼ä¸ô15·ÖÖÓ
	
	--ÐèÒª³õÊ¼»¯
	for i = RLGLB_WLLS_PHASE, RLGLB_WLLS_SVRCOUNT+20 do
		SetGblInt(i, 0)
	end
	
	local n_phase, _, n_sid = wlls_calc_phase()
	SetGblInt(RLGLB_WLLS_PHASE, n_phase)
	wlls_set_mid(n_sid, 0)	--¸Õ¸ÕÆô¶¯Relay²»ÄÜ½øÈë±ÈÈü
	OutputMsg("============ League Match Start: Phase="..n_phase.."  SeasonID="..n_sid.." ==============")
end

function TaskContent()
	local n_phase, n_matchid, n_sid = wlls_calc_phase()
	
	OutputMsg("============ League Match: Phase="..n_phase.."  MatchID="..n_matchid.."  SeasonID="..n_sid.." =============")

	local n_oldphase = GetGblInt(RLGLB_WLLS_PHASE)
	local n_oldmid = GetGblInt(RLGLB_WLLS_MATCHID)
	local n_oldsid = GetGblInt(RLGLB_WLLS_SEASONID)

	SetGblInt(RLGLB_WLLS_PHASE, n_phase)
	wlls_set_mid(n_sid, n_matchid)
	
	if (n_matchid > 0) then	--ÓÐ±ÈÈü£¬Çå³ý×¼±¸³¡¼ÆÊý
		for i = RLGLB_WLLS_SVRCOUNT+1, RLGLB_WLLS_SVRCOUNT+20 do
			SetGblInt(i, 0)
		end
	end
	
	--Í¨ÖªGameServerµ±Ç°×´Ì¬
	wlls_set_phase(n_phase, n_matchid, n_sid)
end

function GameSvrConnected(dwGameSvrIP)
end

function GameSvrReady(dwGameSvrIP)
	local n_phase = GetGblInt(RLGLB_WLLS_PHASE)
	local n_matchid = 0	--²»ÄÜÁ¢¼´¿ªÊ¼
	local n_sid = GetGblInt(RLGLB_WLLS_SEASONID)
	OutputMsg("============ League Match GSReady("..dwGameSvrIP.."): Phase="..n_phase.."  MatchID="..n_matchid.."  SeasonID="..n_sid.." =============")
	
	--Í¨ÖªGameServerµ±Ç°×´Ì¬
	wlls_set_phase(n_phase, n_matchid, n_sid)
end

function wlls_set_phase(n_phase, n_mid, n_sid)
	_M("wlls_set_phase", n_phase, n_mid, n_sid)
	local n_type = WLLS_SEASON_TB[n_sid][1]
	local n_next = iif(n_phase == 1, WLLS_SEASON_TB[n_sid+1][1], n_type)
	local str = join({n_sid, n_type, n_phase, n_mid, n_next})
	if (not WLLS_SWITCH_JUNIOR) then
		WLLS_SWITCH_JUNIOR	= 1
	end
	if (not WLLS_SWITCH_SENIOR) then
		WLLS_SWITCH_SENIOR	= 1
	end
	str	= "dw wlls_setphase("..str..",{"..WLLS_SWITCH_JUNIOR..","..WLLS_SWITCH_SENIOR.."})"
	GlobalExecute(str)
	_M(str)
end
