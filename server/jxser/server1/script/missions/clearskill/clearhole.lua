Include("\\script\\missions\\clearskill\\head.lua");
Include("\\script\\task\\system\\task_string.lua");

TTID_CityIndex 	= 101;

-- Ï´µã¶´(µÚÒ»²ã)Ïà¹Ø¹¦ÄÜ
-- ·µ»ØÖµ: -1 Ê§°Ü£¬1³É¹¦
function CSP_EnterClearMap(nCityIndex)
	nLevel = GetLevel();
	if (nLevel < CSP_NEEDLEVEL) then
		Talk(1, "", "<#> Tr¸ng sÜ ch­a ®¹t cÊp"..CSP_NEEDLEVEL.."<#>, ch­a thÓ vµo ®¶o TÈy Tñy")
		return -1;
	end
	
	if (GetCamp() == 0) then
		Talk(1, "", "Ng­¬i kh«ng cã kü n¨ng nµo, vËy mµ còng muèn ®i tÈy tñy ­? ")
		return -1;
	end

	-- ½«³ÇÊĞºÅ¼ÇÂ¼µ½ÁÙÊ±±äÁ¿ÖĞ
	SetTaskTemp(TTID_CityIndex, nCityIndex);
	
	-- È¥Ï´ËèµºµÄÃâ·Ñ´ÎÊı
	nResult = GetTask(CSP_TID_ClearFreeTime);
	if (nResult < CSP_MAXClearTime) then -- Ãâ·Ñ½øµº
		Say("<#> C¬ héi vµo ®¶o tÈy Tñy miÔn phİ chØ cã"..CSP_MAXClearTime.."<#> lÇn. Tr¸ng sÜ ®· suy nghÜ kü ch­a?", 2, "§i ®¶o TÈy Tñy/CSP_FreeEnterClearMap", "§Ó nghØ thªm mét chót /gotocsm_no")
		return 1;
	else
		-- Ã»ÓĞÃâ·Ñ»ú»áÁË£¬ÕÒË®¾§»ò±¦Ê¯
		strNoFree = 
		{
			"<#>Xa phu: LÇn dïng miÔn phİ ®· dïng hÕt, nh­ng c¸c h¹ cã thÓ sö dông <color=blue>thñy tinh (hoÆc b¹ch ngäc) <color> hoÆc <color=blue>tinh hång b¶o th¹ch (hoÆc tö ngäc) <color> ®Ó cã thÓ ®i vµo ®¶o tÈy tñy. Ng­¬i cã ®ång ı nh­ vËy kh«ng?",
			"<#> ChØ tÈy ®iÓm kü n¨ng [3 viªn Thñy Tinh]/CSP_JEnterClearMap_Skill",
			"<#>ChØ tÈy ®iÓm kü n¨ng [B¹ch Ngäc]/CSP_JEnterClearMap_Skill2",
			"<#> ChØ tÈy ®iÓm tiÒm n¨ng [6 viªn Tinh Hång B¶o Th¹ch]/CSP_JEnterClearMap_Prop",
			"<#>ChØ tÈy ®iÓm tiÒm n¨ng [Tö Ngäc]/CSP_JEnterClearMap_Prop2",
			"<#> TÈy c¶ ®iÓm tiÒm n¨ng vµ kü n¨ng [3 viªn Thñy Tinh + 6 viªn Tinh Hång B¶o Th¹ch]/CSP_JEnterClearMap_All",
			"<#>TÈy ®iÓm kü n¨ng tiÒm n¨ng [B¹ch Ngäc + Tö Ngäc]/CSP_JEnterClearMap_All2",
			"<#> §Ó ra nghÜ l¹i/CSP_Cancel"
		};
		-- Say(strNoFree[1], 7, strNoFree[2], strNoFree[3], strNoFree[4], strNoFree[5], strNoFree[6], strNoFree[7], strNoFree[8]);
		CreateTaskSay(strNoFree)
		return 1;
	end
	return 1;
end;

-- Ãâ·Ñ½øµºµÄ»ú»á
function CSP_FreeEnterClearMap()
	
	-- ¼ÇÂ¼½øµºÏ´µãÀàĞÍ
	SetTask(CSP_TID_ClearType, CSP_CTYPE_ALL); -- È«Ï´
	CSP_EnterClearMapCore();
end

-- Ê¹ÓÃ±¦Ê¯»»È¡½øµºÏ´µãµÄ»ú»á - ¼¼ÄÜµã
-- JEnter - JewelEnter
function CSP_JEnterClearMap_Skill()
	j238 = GetItemCountEx(238)
	j239 = GetItemCountEx(239)
	j240 = GetItemCountEx(240)
	nJCount = j238 + j239 + j240;
	if (nJCount < CSP_NEEDJEWEL_SKILL) then
		Talk(1,"","Ng­¬i kh«ng mang <color=blue>3 viªn Thñy Tinh <color>. §õng nãng ruét t×m ®ñ råi h·y quay l¹i. ")
		return -1;
	end
	if (nJCount > CSP_NEEDJEWEL_SKILL) then
		Talk(1, "", "Trªn ng­êi ng­¬i ®em theo rÊt nhiÒu Thñy Tinh, ta kh«ng tiÖn quyÕt ®Şnh giïm ng­¬i sö dông 3 viªn nµo, hay lµ h·y cÊt nh÷ng thø cßn d­ vµo r­¬ng chøa ®å? ")
		return -1;
	end

	-- ¿ÛË®¾§
	for i = 1,j238 do DelItemEx(238) end
	for i = 1,j239 do DelItemEx(239) end
	for i = 1,j240 do DelItemEx(240) end
	
	CSP_WriteLog("Sö dông råi"..nJCount.."H¹t thñy tinh, tiÕn vµo ®¶o TÈy Tñy");
	-- ¼ÇÂ¼½øµºÏ´µãÀàĞÍ
	SetTask(CSP_TID_ClearType, CSP_CTYPE_SKILL); -- Ï´¼¼ÄÜµã
	CSP_EnterClearMapCore(); -- ½øÈëÏ´Ëèµº
	Msg2Player("TiÕn vµo ®¶o TÈy tñy, b¹n cã thÓ cã v« sè lÇn tÈy ®iÓm kü n¨ng. ");

end;

-- Ê¹ÓÃ±¦Ê¯»»È¡½øµºÏ´µãµÄ»ú»á - Ç±ÄÜµã
-- JEnter - JewelEnter
function CSP_JEnterClearMap_Prop()
	j353 = GetItemCountEx(353)
	if (j353 < CSP_NEEDJEWEL_PROP) then
		Talk(1,"","Ng­¬i kh«ng mang <color=red>6 viªn Tinh Hång B¶o Th¹ch <color>. §õng nãng ruét, t×m ®ñ råi h·y quay l¹i. ")
		return -1;
	end
	
	-- ¿ÛĞÉºì±¦Ê¯(Áù¿Å)
	for i = 1, CSP_NEEDJEWEL_PROP do DelItemEx(353) end

	CSP_WriteLog("Sö dông råi"..CSP_NEEDJEWEL_PROP.."H¹t tinh hång b¶o th¹ch, tiÕn vµo ®¶o TÈy Tñy");
	-- ¼ÇÂ¼½øµºÏ´µãÀàĞÍ
	SetTask(CSP_TID_ClearType, CSP_CTYPE_PROP); -- Ï´Ç±ÄÜµã
	CSP_EnterClearMapCore(); -- ½øÈëÏ´Ëèµº
	Msg2Player("TiÕn vµo ®¶o TÈy tñy, b¹n cã thÓ cã v« sè lÇn tÈy ®iÓm kü n¨ng. ");
end;

-- Ê¹ÓÃ±¦Ê¯»»È¡½øµºÏ´µãµÄ»ú»á - ¼¼ÄÜµã&Ç±ÄÜµã
-- JEnter - JewelEnter
function CSP_JEnterClearMap_All()
	j353 = GetItemCountEx(353)
	if (j353 < CSP_NEEDJEWEL_PROP) then
		Talk(1,"","Ng­¬i kh«ng mang <color=red>6 viªn Tinh Hång B¶o Th¹ch <color>. §õng nãng ruét, t×m ®ñ råi h·y quay l¹i. ")
		return -1;
	end
	
	j238 = GetItemCountEx(238)
	j239 = GetItemCountEx(239)
	j240 = GetItemCountEx(240)
	nJCount = j238 + j239 + j240;
	if (nJCount < CSP_NEEDJEWEL_SKILL) then
		Talk(1,"","Ng­¬i kh«ng mang <color=blue>3 viªn Thñy Tinh <color>. §õng nãng ruét t×m ®ñ råi h·y quay l¹i. ")
		return -1;
	end
	if (nJCount > CSP_NEEDJEWEL_SKILL) then
		Talk(1, "", "Trªn ng­êi ng­¬i ®em theo rÊt nhiÒu Thñy Tinh, ta kh«ng tiÖn quyÕt ®Şnh giïm ng­¬i sö dông 3 viªn nµo, hay lµ h·y cÊt nh÷ng thø cßn d­ vµo r­¬ng chøa ®å? ")
		return -1;
	end
	
	-- ¿ÛĞÉºì±¦Ê¯(Áù¿Å)
	for i = 1,CSP_NEEDJEWEL_PROP do DelItemEx(353) end
	-- ¿ÛË®¾§
	for i = 1,j238 do DelItemEx(238) end
	for i = 1,j239 do DelItemEx(239) end
	for i = 1,j240 do DelItemEx(240) end	

	CSP_WriteLog("Sö dông råi"..nJCount.."H¹t thñy tinh, vµ "..CSP_NEEDJEWEL_PROP.."H¹t tinh hång b¶o th¹ch, tiÕn vµo ®¶o TÈy Tñy");
	SetTask(CSP_TID_ClearType, CSP_CTYPE_ALL); -- Ï´¼¼ÄÜµãºÍÇ±ÄÜµã
	CSP_EnterClearMapCore(); -- ½øÈëÏ´Ëèµº
	Msg2Player("TiÕn vµo ®¶o TÈy tñy, b¹n cã thÓ cã v« sè lÇn tÈy ®iÓm kü n¨ng. ");
end;

function CSP_Cancel()
end

-- ½øµºµÄºËĞÄº¯Êı
function CSP_EnterClearMapCore()
	-- ´ÓÁÙÊ±±äÁ¿ÖĞÈ¡³ö³ÇÊĞºÅ
	nCityIndex = GetTaskTemp(TTID_CityIndex);
	nMapID = CSP_GetClearMapID(nCityIndex);
	-- µØÍ¼ÕÒ²»µ½£¬·µ»Ø
	if (nMapID == -1) then
		CSP_WriteLog("ID khu vùc:"..nMapID.." t×m kh«ng thÊy, vµo ®¶o TÈy Tñy thÊt b¹i!");
		return -1;
	end

	LeaveTeam();
	nResult = NewWorld(nMapID,1615,3200);
	if (nResult == 0) then
		CSP_WriteLog("ID khu vùc:"..nMapID.." NhËp ®iÓm cã sai sãt, vµo ®¶o TÈy Tñy thÊt b¹i!");
		Msg2Player("NhËp ®iÓm cã sai sãt!");
		return -1;
	end
	
	-- ÆÁ±ÎÄ³Ğ©¹¦ÄÜ£º²»ÄÜÊ¹ÓÃ»Ø³Ç·û¡¢ĞÄĞÄÏàÓ³·û£¬²»ÔÊĞí°ÚÌ¯
	DisabledUseTownP(1);
	DisabledUseHeart(1);
	DisabledStall(1);
	
	-- ÉèÖÃ·ÇÕ½¶·×´Ì¬
	SetFightState(0)
	
	-- ¼ÇÂ¼ÖØÉúµã(Àë¿ªÊ±¸´Ô­)
	nSWID, nRevID = GetPlayerRev();
	SetTask(CSP_TID_RevivalSWID, nSWID);
	SetTask(CSP_TID_ReviveID, nRevID);
	
	-- ÉèÖÃĞÂµÄÁÙÊ±ÖØÉúµã
	SetRevPos(nMapID, CSP_RevieSWID);
	SetPunish(0);	
end;

-- ·µ»ØÖµ: -1 Ê§°Ü£¬1³É¹¦
function CSP_LeaveClearMap(nClearMapID)
	nCityIndex = CSP_GetCityIndexByClearMap(nClearMapID);
	if (nCityIndex == -1) then
		return -1;
	end

	-- »Ö¸´ÖØÉúµã(Ö»ÓĞ×´Ì¬ºÏ·¨Ê±£¬²ÅÖØÉèÖØÉúµã)
	if (CSP_CheckValid() == 1) then
		nSWID = GetTask(CSP_TID_RevivalSWID);
		nRevID = GetTask(CSP_TID_ReviveID);
		SetRevPos(nSWID, nRevID);
	end
		
	-- ¹Ø±Õ±»ÆÁ±ÎµÄ¹¦ÄÜ£º²»ÄÜÊ¹ÓÃ»Ø³Ç·û¡¢ĞÄĞÄÏàÓ³·û£¬²»ÔÊĞí°ÚÌ¯
	DisabledUseTownP(0);
	DisabledUseHeart(0);
	DisabledStall(0);
	
	-- ÀëµºÊ±Àë¿ª¶ÓÎé
	LeaveTeam();
	
	-- ÉèÖÃ·ÇÕ½¶·×´Ì¬
	SetFightState(0);
	SetPunish(1);
	SetLogoutRV(0);

	nResult = GetTask(CSP_TID_ClearFreeTime);
	if (nResult < CSP_MAXClearTime) then -- Ãâ·Ñ½øµº
		SetTask(CSP_TID_ClearFreeTime, nResult + 1) -- ¼ÇÂ¼Ãâ·Ñ´ÎÊı
	else
		SetTask(CSP_TID_JewelEnterTime, GetTask(CSP_TID_JewelEnterTime) + 1) -- ¼ÇÂ¼Ê¹ÓÃ±¦Ê¯½øÈë´ÎÊı
	end
	

	if (nCityIndex == 1) then
		NewWorld(1, 1557, 3112) -- ·ïÏè		
	elseif (nCityIndex == 2) then
		NewWorld(11, 3193, 5192) -- ³É¶¼	
	elseif (nCityIndex == 3) then
		NewWorld(162, 1669, 3129) -- ´óÀí	
	elseif (nCityIndex == 4) then
		NewWorld(37, 1598, 3000) -- ãê¾©
	elseif (nCityIndex == 5) then
		NewWorld(78, 1592, 3377) -- ÏåÑô
	elseif (nCityIndex == 6) then
		NewWorld(80, 1670, 2996) -- ÑïÖİ		
	elseif (nCityIndex == 7) then
		NewWorld(176, 1603, 2917) -- ÁÙ°²
	else
		Msg2Player("HÖ thèng xuÊt hiÖn sù cè! Vui lßng t×m nh©n viªn phôc vô x¸c nhËn gi¶i quyÕt vÊn ®Ò. ");
	end	
end;


function CSP_JEnterClearMap_Skill2()
	if (CalcItemCount(3, 6, 1, 2390,-1) < CSP_NEEDJEWEL_SKILL2) then
		Talk(1,"","Xa phu: Trªn ng­êi kh«ng cã <color=blue>B¹ch Ngäc<color>. Hay lµ ®Ó quªn ë ®©u ®ã råi?")
		return -1;
	end

	if (ConsumeItem(3, 1, 6,1,2390,-1) ~= 1) then
		return -1;
	end
	
	CSP_WriteLog(format("§· sö dông %d B¹ch Ngäc, tiÕn vµo ®¶o tÈy tñy", CSP_NEEDJEWEL_SKILL2));
	-- ¼ÇÂ¼½øµºÏ´µãÀàĞÍ
	SetTask(CSP_TID_ClearType, CSP_CTYPE_SKILL); -- Ï´¼¼ÄÜµã
	CSP_EnterClearMapCore(); -- ½øÈëÏ´Ëèµº
	Msg2Player("TiÕn vµo ®¶o TÈy tñy, b¹n cã thÓ cã v« sè lÇn tÈy ®iÓm kü n¨ng. ");

end;

-- Ê¹ÓÃ±¦Ê¯»»È¡½øµºÏ´µãµÄ»ú»á - Ç±ÄÜµã
-- JEnter - JewelEnter
function CSP_JEnterClearMap_Prop2()
	if (CalcItemCount(3, 6, 1, 2391,-1) < CSP_NEEDJEWEL_PROP2) then
		Talk(1,"","Xa phu: Trªn ng­êi kh«ng cã <color=red>Tö Ngäc<color>. Hay lµ ®Ó quªn ë ®©u ®ã råi?")
		return -1;
	end
	
	if (ConsumeItem(3, 1, 6,1,2391,-1) ~= 1) then
		return -1;
	end
	
	CSP_WriteLog(format("§· sö dông %d Tö Ngäc, tiÕn vµo ®¶o tÈy tñy", CSP_NEEDJEWEL_PROP2));
	-- ¼ÇÂ¼½øµºÏ´µãÀàĞÍ
	SetTask(CSP_TID_ClearType, CSP_CTYPE_PROP); -- Ï´Ç±ÄÜµã
	CSP_EnterClearMapCore(); -- ½øÈëÏ´Ëèµº
	Msg2Player("TiÕn vµo ®¶o TÈy tñy, b¹n cã thÓ cã v« sè lÇn tÈy ®iÓm kü n¨ng. ");
end;

-- Ê¹ÓÃ±¦Ê¯»»È¡½øµºÏ´µãµÄ»ú»á - ¼¼ÄÜµã&Ç±ÄÜµã
-- JEnter - JewelEnter
function CSP_JEnterClearMap_All2()
	if (CalcItemCount(3, 6, 1, 2390,-1) < CSP_NEEDJEWEL_SKILL2) then
		Talk(1,"","Xa phu: Trªn ng­êi kh«ng cã <color=blue>B¹ch Ngäc<color>. Hay lµ ®Ó quªn ë ®©u ®ã råi?")
		return -1;
	end
	
	if (CalcItemCount(3, 6, 1, 2391,-1) < CSP_NEEDJEWEL_PROP2) then
		Talk(1,"","Xa phu: Trªn ng­êi kh«ng cã <color=red>Tö Ngäc<color>. Hay lµ ®Ó quªn ë ®©u ®ã råi?")
		return -1;
	end
	
	if (ConsumeItem(3, 1, 6,1,2390,-1) ~= 1 or ConsumeItem(3, 1, 6,1,2391,-1) ~= 1) then
		return -1;
	end
	
	CSP_WriteLog(format("§· sö dông %d %s vµ %d %s, tiÕn vµo ®¶o tÈy tñy",CSP_NEEDJEWEL_SKILL2, "B¹ch Ngäc", CSP_NEEDJEWEL_PROP2, "Tö Ngäc") );
	SetTask(CSP_TID_ClearType, CSP_CTYPE_ALL); -- Ï´¼¼ÄÜµãºÍÇ±ÄÜµã
	CSP_EnterClearMapCore(); -- ½øÈëÏ´Ëèµº
	Msg2Player("TiÕn vµo ®¶o TÈy tñy, b¹n cã thÓ cã v« sè lÇn tÈy ®iÓm kü n¨ng. ");
end;


