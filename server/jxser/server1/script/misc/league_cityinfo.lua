--------------------------------------------------------------------
-- Ê¹ÓÃÉçÍÅ½á¹¹À´¼ÇÂ¼³ÇÊĞµÄĞÅÏ¢ (¼ÇÂ¼ÔÚÉçÍÅµÄÈÎÎñ±äÁ¿ÉÏ)
-- Ã¿¸ö³ÇÊĞ²ÉÓÃÒ»¸öÉçÍÅ×éÖ¯(League)
-- Êı¾İ×éÖ¯£º
--	.ÉçÍÅÀàĞÍ(LeagueType)£ºÈ«¾ÖÎ¨Ò»±êÊ¶£¬×¢Òâ²»ÒªÖØÓÃ
--	.ÉçÍÅÃû³Æ(LeagueName)£º³ÇÊĞID(×Ö·û´®)
--	.ÉçÍÅ³ÉÔ±(LeagueMember)£ºÒ»¸ö£¬ÈÎÒâ£¬Ä¿Ç°²»ĞèÒªµÄÊı¾İ
--------------------------------------------------------------------

IncludeLib("LEAGUE")

LEAGUETYPE_CITYINFO			= 4	-- ÉçÍÅID(³ÇÊĞĞÅÏ¢)£¬È«¾ÖÎ¨Ò»µÄ±êÊ¶
CITYINFO_LEAGUEJOB			= 1 -- Ö°Î»£¬ËæÒâ£¬²»ĞèÒªµÄÊı¾İ
CITYINFO_LEAGUETASK_BONUS	= 1	-- ³ÇÊĞĞÅÏ¢µÄ½±Àø¼ÇÂ¼(ÈÎÎñ±äÁ¿)
CITYINFO_LEAGUETASK_GIFT	= 2	-- ³ÇÊĞĞÅÏ¢µÄ½±Àø¼ÇÂ¼(ÈÎÎñ±äÁ¿)
CITYINFO_LEAGUETASK_DATE	= 3	-- ³ÇÊĞĞÅÏ¢µÄ½±Àø¼ÇÂ¼(ÈÎÎñ±äÁ¿)

CITYINFO_GLBVALUEID = {840, 841, 842, 843, 844, 845, 846}
---------------------------------------------------------------
function cityID2LeagueName(nCityID)
	return tostring(nCityID)
end

function debug_print(str)
	print(str)
end

------------------
-- ´´½¨³ÇÊĞĞÅÏ¢¼ÇÂ¼
function buildCityInfoLeague(nCityID)
	local strLeagueName = cityID2LeagueName(nCityID)
	local leagueObj = LG_GetLeagueObj(LEAGUETYPE_CITYINFO, strLeagueName)
	if (leagueObj == 0) then
		-- ´Ë³ÇÊĞµÄ¼ÇÂ¼²»´æÔÚ£¬´´½¨Ö®
		leagueObj = LG_CreateLeagueObj()
		local memberObj = LGM_CreateMemberObj()

		LG_SetLeagueInfo(leagueObj, LEAGUETYPE_CITYINFO, strLeagueName)
		LGM_SetMemberInfo(memberObj, strLeagueName, LEAGUEJOB_MASTER, LEAGUETYPE_CITYINFO, strLeagueName)
		LG_AddMemberToObj(leagueObj, memberObj)

		LG_ApplyAddLeague(leagueObj, "\\script\\misc\\league_cityinfo.lua", "OnBuildCityLeague")
	end
end

-- »Øµ÷
function OnBuildCityLeague(nLeagueType, szLeagueName, szMemberName, bSucceed)
	if (bSucceed == 0) then
		debug_print("CityLeague Build Fail: "..szLeagueName)
	end
	print("CityLeague Build OK: "..szLeagueName)
end

-- ÒòÈÎÎñ±äÁ¿µÄ²Ù×÷£¬ĞëÏòRelayÉêÇë£¬Relay·µ»Øºó²Å»áĞŞ¸Ä³É¹¦
-- Òò´ËÎª·ÀÖ¹gameserver³öÏÖäÌµÄÏÖÏó£¬¶Ô´Ë²Ù×÷ÉèÖÃ×´Ì¬Ëø
-- cityinfo_option_lock = {0, 0, 0, 0, 0, 0, 0};
function OnSetCityLeagueTask(nLeagueType, szLeagueName, szMemberName, bSucceed)

	-- cityinfo_option_lock[tonumber(szLeagueName)] = 0
	SetGlbValue(CITYINFO_GLBVALUEID[tonumber(szLeagueName)], 0)
end

-----------------------------------------------------------------------------
-- ´Ëº¯Êı½«ÔÚautoexecÉÏµ÷ÓÃ
function buildAllCityInfoLeague()
	for i = 1 , 7 do
		buildCityInfoLeague(i)
		SetGlbValue(CITYINFO_GLBVALUEID[i], 0)
	end
	debug_print("CityLeague Build...")
end

-- ÉèÖÃµÃ³ÇÊĞ½±ÀøµÄÊ±¼ä(¸ñÊ½£º20051018) - ÄêÔÂÈÕ
function set_citybonus_date(nCityID, nDate)
	local strLeagueName = cityID2LeagueName(nCityID)
	local leagueObj = LG_GetLeagueObj(LEAGUETYPE_CITYINFO, strLeagueName)
	if (leagueObj == 0) then
		-- ´Ë³ÇÊĞµÄ¼ÇÂ¼²»´æÔÚ£¬´´½¨Ö®
		debug_print("CityInfoLeague Not Found: "..nCityID)
		return 0
	end
	
	-- ÉÏËø£¬ÔÚ»Øµ÷ÖĞÇå³ı
	--cityinfo_option_lock[nCityID] = 1 
	SetGlbValue(CITYINFO_GLBVALUEID[nCityID], 1)
	
	LG_ApplySetLeagueTask(LEAGUETYPE_CITYINFO, strLeagueName, CITYINFO_LEAGUETASK_BONUS, nDate,
							"\\script\\misc\\league_cityinfo.lua", "OnSetCityLeagueTask")	
end

-- »ñÈ¡ÉÏ´ÎµÃ·şÎñÆ÷Ö÷³ÇÊĞ½±ÀøµÄÊ±¼ä(¸ñÊ½£º51018) - ÄêÔÂÈÕ
function get_maincitybonus_date(nCityID)
	local nDate = 0;
	
	if (GetGlbValue(CITYINFO_GLBVALUEID[nCityID]) == 1) then
		debug_print("Chó ı: VÉn ch­a chÊp hµnh mÖmh lÖnh"..nCityID)
		nDate = get_maincity_deadline(nCityID);--tonumber(date("%y%m%d"))
	else
		debug_print("GetDate ok!")
		local strLeagueName = cityID2LeagueName(nCityID)
		nDate = LG_GetLeagueTask(LEAGUETYPE_CITYINFO, strLeagueName, CITYINFO_LEAGUETASK_DATE)
	end
	
	return nDate
end

-- »ñÈ¡ÉÏ´ÎµÃ³ÇÊĞ½±ÀøµÄÊ±¼ä(¸ñÊ½£º20051018) - ÄêÔÂÈÕ
function get_citybonus_date(nCityID)
	local nDate = 0;
	
	if (GetGlbValue(CITYINFO_GLBVALUEID[nCityID]) == 1) then
		debug_print("Chó ı: VÉn ch­a chÊp hµnh mÖmh lÖnh"..nCityID)
		nDate = tonumber(date("%Y%m%d"))
	else
		debug_print("GetDate ok!")
		local strLeagueName = cityID2LeagueName(nCityID)
		nDate = LG_GetLeagueTask(LEAGUETYPE_CITYINFO, strLeagueName, CITYINFO_LEAGUETASK_BONUS)
	end
	
	return nDate
end


function get_citybonus_task(nCityID, nTsk)
	local nValue = 0;
	
	if (GetGlbValue(CITYINFO_GLBVALUEID[nCityID]) == 1) then
		debug_print("Chó ı: VÉn ch­a chÊp hµnh mÖmh lÖnh"..nCityID)
		nValue = 100;	--½±ÀøµÄ×î´óÖµ
	else
		debug_print("GetDate ok!")
		local strLeagueName = cityID2LeagueName(nCityID);
		nValue = LG_GetLeagueTask(LEAGUETYPE_CITYINFO, strLeagueName, nTsk);
	end;
	return nValue;
end;

function set_citybonus_task(nCityID, nTsk, nValue)
	local strLeagueName = cityID2LeagueName(nCityID)
	local leagueObj = LG_GetLeagueObj(LEAGUETYPE_CITYINFO, strLeagueName)
	if (leagueObj == 0) then
		-- ´Ë³ÇÊĞµÄ¼ÇÂ¼²»´æÔÚ£¬´´½¨Ö®
		debug_print("CityInfoLeague Not Found: "..nCityID)
		return 0
	end
	
	-- ÉÏËø£¬ÔÚ»Øµ÷ÖĞÇå³ı
	--cityinfo_option_lock[nCityID] = 1 
	SetGlbValue(CITYINFO_GLBVALUEID[nCityID], 1)
	
	LG_ApplySetLeagueTask(LEAGUETYPE_CITYINFO, strLeagueName, nTsk, nValue,
							"\\script\\misc\\league_cityinfo.lua", "OnSetCityLeagueTask")	
end;