Include("\\script\\leaguematch\\timetable.lua")
Include("\\script\\lib\\common.lua")

--Realy Global Value--
RLGLB_WLLS_PHASE	= 121	--±ÈÈüµ±Ç°Ëù´¦½×¶Î
RLGLB_WLLS_SEASONID	= 122	--µ±Ç°Èü¼¾±àºÅ
RLGLB_WLLS_MATCHID	= 123	--µ±Ç°±ÈÈü±àºÅ
RLGLB_WLLS_SVRCOUNT	= 123	-- +i Ä³×¼±¸³¡µ±Ç°ÈËÊý(124~143)

--LG Task ID--
WLLS_LGTASK_MTYPE	= 11--±ÈÈüÀàÐÍ
WLLS_LGTASK_LAST	= 1	--Ëù²Î¼ÓµÄ×îºóÒ»³¡±ÈÈü±àºÅ£¨½øÈë×¼±¸³¡¾ÍËã£©	
WLLS_LGTASK_SVRID	= 2 --Ëù²Î¼ÓµÄ×îºóÒ»³¡±ÈÈü·þÎñÆ÷
WLLS_LGTASK_MSCAMP	= 3 --Ëù²Î¼ÓµÄ×îºóÒ»³¡±ÈÈüMSÕóÓª
WLLS_LGTASK_POINT	= 4	--Õ½¶Ó»ñµÃ»ý·Ö
WLLS_LGTASK_RANK	= 5	--Õ½¶ÓÅÅÃû
WLLS_LGTASK_WIN		= 6	--Ê¤Àû´ÎÊý
WLLS_LGTASK_TIE		= 7	--Æ½¾Ö´ÎÊý
WLLS_LGTASK_TOTAL	= 8	--²ÎÈü´ÎÊý£¨Ê§°Ü´ÎÊý = TOTAL - WIN - TIE£©
WLLS_LGTASK_JOIN	= 9	--ÒÑ¾­½øÈë×¼±¸³¡µÄÈËÊý
WLLS_LGTASK_TIME	= 10--Õ½¶·Ê±¼ä×Ü¼Æ
WLLS_LGTASK_STYPE	= 12--×é½¨Ê±µÄÁªÈüÄ£Ê½
WLLS_LGTASK_EMY1	= 13	--×îºóµÄÒ»³¡±ÈÈüÓöµ½µÄ¶ÔÊÖ£¨Õ½¶ÓÃûString2ID£©
WLLS_LGTASK_EMY2	= 14	--µ¹ÊýµÚ¶þ³¡±ÈÈüÓöµ½µÄ¶ÔÊÖ
WLLS_LGTASK_EMY3	= 15	--µ¹ÊýµÚÈý³¡±ÈÈüÓöµ½µÄ¶ÔÊÖ
WLLS_LGTASK_TOTAL_EX= 16	--À©Õ¹²Î¼Ó´ÎÊý
WLLS_LGTASK_USE_LingQi_COUNT= 17	--À©Õ¹²Î¼Ó´ÎÊý

WLLS_LGMTASK_JOB	= 1	--Ö°Î»:0¡¢¶ÓÔ±£»1¡¢¶Ó³¤
WLLS_LGMTASK_STATE	= 2	--Õ½¶Ó³ÉÔ±×´Ì¬£º0¡¢ÔÚ³¡Íâ£»1¡¢½øÈë×¼±¸³¡
WLLS_LGMTASK_ADDSID	= 3	--ÔÚÄÄ¸öÈü¼¾¼ÓÈëÁË±¾Õ½¶Ó
WLLS_LGMTASK_WIN	= 4	--ÐèÒª²¹¼ÓµÄÊ¤Àû´ÎÊý
WLLS_LGMTASK_TIE	= 5	--ÐèÒª²¹¼ÓµÄÆ½¾Ö´ÎÊý
WLLS_LGMTASK_TOTAL	= 6	--ÐèÒª²¹¼ÓµÄ²ÎÈü´ÎÊý
WLLS_LGMTASK_OVER	= 7	--ÔÚÄÄ¸öÈü¼¾¼¶·¢ÉúÔ½¼¶

--Const Value--
WLLS_LGTYPE	= 5	--Õ½¶ÓÀàÐÍ

WLLS_MAX_COUNT	= 200	--Ã¿¸ö×¼±¸³¡×î¶àÈÝÄÉ¶àÉÙÕ½¶Ó

WLLS_MATCHTIME	= 15	--Ã¿³¡±ÈÈüµÄÊ±¼ä£¨·ÖÖÓ£©

WLLS_LEVEL_DESC = {"Vâ l©m liªn ®Êu", "Vâ l©m liªn ®Êu"}
WLLS_LingQi_PerCOUNT = 4
WLLS_TYPE = {
	{
		name = "Song ®Êu",	-- ÁªÈüÀàÐÍÃû³Æ
		max_member = 2,		-- Õ½¶Ó×î´ó³ÉÔ±Êý
		ladder = 10196,		-- ÅÅÃûÆðÊ¼ID
		mtypes = 2,			-- ¸ÃÁªÈüÀàÐÍÖÐµÄÕ½¶ÓÀàÐÍÊýÄ¿£¨¼´ÊÇ×îÖÕÅÅÐÐ°ñÊýÁ¿£©
		groups = 8,			-- Í¬ÀàÐÍµÄÕ½¶Ó¿ÉÒÔ±»·ÖÅäµ½¶àÉÙÌ×²»Í¬µÄ³¡µØ
	},
	{
		name = "Thi ®Êu 1 ng­êi",
		max_member = 1,
		ladder = 10201,
		mtypes = 20,
		groups = 1,
	},
	{
		name = "Song ®Êu s­ ®å",
		max_member = 2,
		ladder = 10221,
		mtypes = 2,
		groups = 8,
	},
	{
		name = "§Êu ba ng­êi",
		max_member = 3,
		ladder = 10223,
		mtypes = 2,
		groups = 8,
	},
	{
		name = "§¬n ®Êu tù do",
		max_member = 1,
		ladder = 10235,
		mtypes = 2,
		groups = 8,
	},
	{
		name = "Song ®Êu (Cïng hÖ)",
		max_member = 2,
		ladder = 10238,
		mtypes = 10,
		groups = 1,
	},
	{
		name = "Song ®Êu",
		max_member = 2,
		ladder = 10248,
		mtypes = 2,
		groups = 8,
	},
}

--Èç¹ûÎªnil»ò0£¬·µ»Ø1£¬·ñÔò·µ»Ø0
function FALSE(nValue)
	if (nValue == nil or nValue == 0 or nValue == "") then
		return 1
	else
		return nil
	end
end

--Çå³ýÖ¸¶¨µÄÕ½¶ÓËùÓÐÐÅÏ¢
function wlls_lg_clear_one(n_lid)
	_M("wlls_lg_clear_one", n_lid)
	local str_lgname, _, n_membercount = LG_GetLeagueInfo(n_lid)
	wlls_SetLeagueTask(str_lgname, WLLS_LGTASK_LAST, 0)
	wlls_SetLeagueTask(str_lgname, WLLS_LGTASK_POINT, 0)
	wlls_SetLeagueTask(str_lgname, WLLS_LGTASK_RANK, 0)
	wlls_SetLeagueTask(str_lgname, WLLS_LGTASK_WIN, 0)
	wlls_SetLeagueTask(str_lgname, WLLS_LGTASK_TIE, 0)
	wlls_SetLeagueTask(str_lgname, WLLS_LGTASK_TOTAL, 0)
	wlls_SetLeagueTask(str_lgname, WLLS_LGTASK_JOIN, 0)
	wlls_SetLeagueTask(str_lgname, WLLS_LGTASK_TIME, 0)
	--Çå³ýÃ¿¸ö³ÉÔ±Õ½¶ÓÐÅÏ¢
	for i = 0, n_membercount-1 do 
		local str_playername = LG_GetMemberInfo(n_lid, i)
		wlls_SetMemberTask(str_lgname, str_playername, WLLS_LGMTASK_STATE, 0)
	end	
end

--°²È«str
function wlls_safestr(str)
	return '"'..safestr(str)..'"'
end

function wlls_getlginfo(str_lgname)
	local n_lid = LG_GetLeagueObj(WLLS_LGTYPE, str_lgname)
	if FALSE(n_lid) then return str_lgname.."\t" end
	local str = ""
	for i = 0, LG_GetMemberCount(n_lid)-1 do
		local str_pl = LG_GetMemberInfo(n_lid, i)
		local n_job = LG_GetMemberTask(WLLS_LGTYPE, str_lgname, str_pl, WLLS_LGMTASK_JOB)
		if n_job == 1 then
			str = str_pl..str
		else
			str = str.." "..str_pl
		end
	end
	return  str_lgname.."\t"..str
end

function wlls_SetLeagueTask(str_lgname, n_taskid, n_value)
	local n_oldv = LG_GetLeagueTask(WLLS_LGTYPE, str_lgname, n_taskid)
	if (n_oldv == n_value) then return end
	LG_ApplySetLeagueTask(WLLS_LGTYPE, str_lgname, n_taskid, n_value)
end

function wlls_SetMemberTask(str_lgname, str_plname, n_taskid, n_value)
	local n_oldv = LG_GetMemberTask(WLLS_LGTYPE, str_lgname, str_plname, n_taskid)
	if (n_oldv == n_value) then return end
	LG_ApplySetMemberTask(WLLS_LGTYPE, str_lgname, str_plname, n_taskid, n_value)
end

--¼ì²é²ÎÈü´ÎÊý
function wlls_CheckMatchCount(n_leagueid, n_sid)
	
	if FALSE(n_leagueid) or WLLS_SEASON_TB[n_sid] == nil then
		return 
	end
	
	 if (LG_GetLeagueTask(n_leagueid, WLLS_LGTASK_TOTAL) >= WLLS_SEASON_TB[n_sid][4]) then	--²ÎÈü´ÎÊý´ïµ½ÏÞÖÆ
		
		if LG_GetLeagueTask(n_leagueid, WLLS_LGTASK_TOTAL_EX) >= LG_GetLeagueTask(n_leagueid, WLLS_LGTASK_USE_LingQi_COUNT) * WLLS_LingQi_PerCOUNT then
			return
		end
	end
	
	return 1
end

function _M(...)
	--local str = "+++DEBUG["..date("%H:%M:%S").."]: "..join(arg)
	--OutputMsg(str)
end
