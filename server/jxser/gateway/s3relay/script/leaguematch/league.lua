Include( "\\script\\leaguematch\\head.lua" )

--Ìá¹©GameServerµ÷ÓÃµÄ½¨Á¢Õ½¶Óº¯Êı
function wlls_create(szParam)
	_M("Mêi wlls_create nhËp tham sè lµ:"..szParam);
	
	--²ğ·Ö´«Èë²ÎÊı
	local aryParam = split(szParam, " ")
	rolename = aryParam[1]
	n_type = tonumber(aryParam[2])
	n_mtype = tonumber(aryParam[3])
	leaguename = aryParam[4]

	--±ÜÃâÖØ¸´¼ÓÈë¶ÓÔ±
	if (not FALSE(LG_GetLeagueObjByRole(WLLS_LGTYPE, rolename))) then
		wlls_say(rolename, "Xin lçi! B¹n ®· gia nhËp vµo ®éi kh¸c, kh«ng thÓ lËp ®éi n÷a!!")
		return 0
	end

	--±ÜÃâÕ½¶ÓÃûÖØ¸´
	local n_lid = LG_GetLeagueObj(WLLS_LGTYPE, leaguename)
	if(not FALSE(n_lid)) then
		wlls_say(rolename, "Xin lçi! Tªn cña ®éi nµy [<color=yellow>"..leaguename.."<color>]®· ®­îc sö dông!")
		return 0
	end
	
	--½¨Á¢Õ½¶Ó
	if(wlls_relay_createleague(leaguename) == 1) then
		local n_sid = GetGblInt(RLGLB_WLLS_SEASONID)
		wlls_SetLeagueTask(leaguename, WLLS_LGTASK_MTYPE, n_mtype)
		wlls_SetLeagueTask(leaguename, WLLS_LGTASK_STYPE, n_type)
		--Ìí¼Óµ±Ç°rolenameµ½Õ½¶Ó
		if(wlls_relay_addmember(leaguename, rolename) == 1) then
			wlls_SetMemberTask(leaguename, rolename, WLLS_LGMTASK_JOB, 1)
			wlls_say(rolename, "B¹n ®· lËp ®éi thµnh c«ng, tªn ®éi lµ [<color=yellow>"..leaguename.."<color>].", nil, 1)
			wlls_rest_hint(rolename, 1, n_type)
			return 1
		end
		wlls_say(rolename, "Ch­a ph¸t hiÖn ®­îc lçi! Xin liªn hÖ qu¶n lı!")
	end

	OutputMsg("create league "..leaguename.." error!!!")
	return 0
end

--Ìá¹©GameServerµ÷ÓÃµÄ¼ÓÈë¶ÓÔ±º¯Êı
function wlls_add(szParam)
	_M("Mêi wlls_add nhËp tham sè lµ:"..szParam);

	--²ğ·Ö´«Èë²ÎÊı
	local aryParam = split(szParam, " ")
	rolename = aryParam[1]
	leaguename = aryParam[2]
	cpname = aryParam[3]
	
	--±ÜÃâÖØ¸´¼ÓÈë¶ÓÔ±
	if (not FALSE(LG_GetLeagueObjByRole(WLLS_LGTYPE, rolename))) then
		wlls_say(rolename, "Xin lçi! B¹n ®· gia nhËp vµo ®éi kh¸c, kh«ng thÓ gia nhËp ®éi n÷a!!")
		wlls_say(cpname, "§éi viªn cña b¹n <color=yellow>"..rolename.."<color> ®· gia nhËp ®éi kh¸c, kh«ng thÓ gia nhËp ®éi n÷a!!", 0)
		return 0
	end
	
	--·ÀÖ¹³¬¹ıÕ½¶ÓÈËÊıÉÏÏŞ
	local n_lid = LG_GetLeagueObj(WLLS_LGTYPE, leaguename)
	if (FALSE(n_lid)) then
		wlls_say(rolename, "Xin lçi! §éi nµy kh«ng tån t¹i hoÆc ®· bŞ gi¶i t¸n!!")
		wlls_say(cpname, "§éi cña b¹n gÆp vÊn ®Ò, h×nh nh­ kh«ng thÓ nhËp thªm ®éi viªn!.", 0)
		return 0
	end
	_, _, membercount = LG_GetLeagueInfo(n_lid)
	local n_type = LG_GetLeagueTask(WLLS_LGTYPE, leaguename, WLLS_LGTASK_STYPE)
	local n_maxmem = WLLS_TYPE[n_type].max_member
	if (membercount >= n_maxmem) then
		wlls_say(rolename, "Xin lçi! §éi viªn ®· ®ñ! Kh«ng thÓ gia nhËp thµnh viªn míi!!")
		wlls_say(cpname, "Sè thµnh viªn trong ®éi cña b¹n ®· ®ñ! Kh«ng thÓ gia nhËp thµnh viªn míi!!", 0)
		return 0
	end

	--¼ÓÈëÕ½¶Ó
	if(wlls_relay_addmember(leaguename, rolename) == 1) then
		wlls_say(rolename, "Chóc mõng b¹n ®· nhËp ®éi thµnh c«ng! [<color=yellow>"..leaguename.."<color>]", nil, 1)
		wlls_say(cpname, "<color=yellow>"..rolename.."<color> ®· gia nhËp thµnh c«ng vµo ®éi cña b¹n!", 0)
		wlls_rest_hint(cpname, membercount+1, n_type)
		return 1
	end

	OutputMsg("wlls_add error!", rolename, leaguename)
	return 0
end

--Ìá¹©GameServerµ÷ÓÃµÄÉ¾³ı¶ÓÔ±º¯Êı£¨×îÖÕ£©
function wlls_leave(rolename)
	_M("Mêi wlls_leave nhËp tham sè lµ:"..rolename);
	
	--È·ÈÏÒÑ¾­¼ÓÈëÁË¶ÓÎé
	local n_lid = LG_GetLeagueObjByRole(WLLS_LGTYPE, rolename)
	if (FALSE(n_lid)) then
		wlls_say(rolename, "B¹n ch­a cã ®éi nhãm!")
		return 0
	end

	local leaguename, _, membercount = LG_GetLeagueInfo(n_lid)
	local str = "B¹n ®· rêi khái ®éi [<color=yellow>"..leaguename.."<color>]."
	local removelg = 0

	local n_type = LG_GetLeagueTask(WLLS_LGTYPE, leaguename, WLLS_LGTASK_STYPE)
	if (membercount > 1) then
		local n_job = LG_GetMemberTask(WLLS_LGTYPE, leaguename, rolename, WLLS_LGMTASK_JOB)
		if (n_job == 1) then	--¶Ó³¤ÍË³ö
			for i = 0, LG_GetMemberCount(n_lid)-1 do
				local name = LG_GetMemberInfo(n_lid, i)
				if (name ~= rolename) then
					if (n_type == 3) then	--Ê¦Í½Èü£¬È¡ÏûÍ½µÜ±ÈÈü×Ê¸ñ
						wlls_SetMemberTask(leaguename, name, WLLS_LGMTASK_OVER, 1)
					else	--ÆäËû±ÈÈü£¬ÒÆ½»¶Ó³¤
						wlls_SetMemberTask(leaguename, name, WLLS_LGMTASK_JOB, 1)
						str = str .. "Th©n phËn ®éi tr­ëng cña b¹n ®· chuyÓn giao cho ®ång ®éi: <color=yellow>" .. name.."<color>"
						break
					end
				end
			end
			if (n_type == 3) then	--Ê¦Í½Èü£¬È¡ÏûÍ½µÜ±ÈÈü×Ê¸ñ
				str = str .. "T­ c¸ch thi ®Êu cña ®å ®Ö b¹n ®· bŞ xãa!."
			end
		end
	else
		str = str .. "§éi cña b¹n ®· bŞ gi¶i t¸n!"
		removelg = 1
	end
	
	--É¾³ı¶ÓÔ±
	if(LGM_ApplyRemoveMember(WLLS_LGTYPE, leaguename, rolename, "", "", removelg) == 1) then
		wlls_say(rolename, str, 1, 1)
		return 1
	end

	OutputMsg("wlls_leave error!", rolename, leaguename)
	return 0
end

--½¨Á¢Õ½¶Ó£¨×îÖÕ£©
function wlls_relay_createleague(leaguename)
	local nNewLeagueID = LG_CreateLeagueObj()	--Éú³ÉÉçÍÅÊı¾İ¶ÔÏó(·µ»Ø¶ÔÏóID)
	LG_SetLeagueInfo(nNewLeagueID, WLLS_LGTYPE, leaguename)	--ÉèÖÃÉçÍÅĞÅÏ¢(ÀàĞÍ¡¢Ãû³Æ)
	local ret = LG_ApplyAddLeague(nNewLeagueID, "", "") 
	LG_FreeLeagueObj(nNewLeagueID)
	return ret
end

--¼ÓÈë¶ÓÔ±£¨×îÖÕ£©
function wlls_relay_addmember(leaguename, rolename)
	local nMemberID = LGM_CreateMemberObj() -- Éú³ÉÉçÍÅ³ÉÔ±Êı¾İ¶ÔÏó(·µ»Ø¶ÔÏóID)
	--ÉèÖÃÉçÍÅ³ÉÔ±µÄĞÅÏ¢(½ÇÉ«Ãû¡¢Ö°Î»¡¢ÉçÍÅÀàĞÍ¡¢ÉçÍÅÃû³Æ)
	LGM_SetMemberInfo(nMemberID, rolename, 0, WLLS_LGTYPE, leaguename) 
	local ret = LGM_ApplyAddMember(nMemberID, "", "") 
	LGM_FreeMemberObj(nMemberID)
	
	if (ret == 1) then	--¼ÇÂ¼¼ÓÈëÕ½¶ÓµÄÈü¼¾
		local n_sid = GetGblInt(RLGLB_WLLS_SEASONID)
		--±ÈÈüÆÚ¼ÓÈëµÄ£¬ÊÓÎªÉÏÒ»¸öÈü¼¾¼ÓÈëµÄ
		if (GetGblInt(RLGLB_WLLS_PHASE) > 1) then n_sid = n_sid - 1 end
		wlls_SetMemberTask(leaguename, rolename, WLLS_LGMTASK_ADDSID, n_sid)
	end

	return ret
end

--ÌáĞÑ¶Ó³¤»¹¿ÉÒÔ¼ÓÈë¶àÉÙ¶ÓÔ±
function wlls_rest_hint(n_plname, n_count, n_type)
	local n_maxmem = WLLS_TYPE[n_type].max_member
	if (n_count < n_maxmem) then
		wlls_say(n_plname, "§éi [<color=yellow>"..leaguename.."<color>] cña b¹n hiÖn cã <color=yellow>"..n_count.."<color> thµnh viªn, b¹n cßn cã thÓ mêi thªm <color=yellow>"..(n_maxmem-n_count).."<color> ng­êi", 1)
	else
		wlls_say(n_plname, "§éi [<color=yellow>"..leaguename.."<color>] cña b¹n hiÖn ®· ®ñ <color=yellow>"..n_maxmem.."<color> thµnh viªn.", 1)
	end
end

--ÏòÖ¸¶¨½ÇÉ«ÃûµÄÍæ¼Ò·¢ĞÅÏ¢
function wlls_say(rolename, msg, b_msg, b_sync)
	_M("dw wlls_gw_say("..wlls_safestr(rolename)..", "..wlls_safestr(msg)..", "..tostring(b_msg)..", "..tostring(b_sync)..")" )
	GlobalExecute("dw wlls_gw_say("..wlls_safestr(rolename)..", "..wlls_safestr(msg)..", "..tostring(b_msg)..", "..tostring(b_sync)..")" )
end

