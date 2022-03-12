Include("\\script\\event\\wulin_final_match\\awardhead.lua")

Include("\\script\\task\\task_addplayerexp.lua")  --¸øÍæ¼ÒÀÛ¼Ó¾­ÑéµÄ¹«¹²º¯Êı
Include("\\script\\lib\\file.lua")

function wl_get_zonename( clientid )
	for i = 1, getn( WL_TAB_ZONEINFO ) do
		if ( WL_TAB_ZONEINFO[ i ][ 2 ] == clientid ) then
			return WL_TAB_ZONEINFO[ i ][ 1 ]
		end
	end
	return nil
end

function safe_tonumber( str )
	local ret=tonumber(str)
	if (ret==nil) then
		return 0
	else
		return	ret
	end
end

function wl_get_zonefile_match( zonename )
	if ( zonename ~= nil and zonename ~= "" ) then
		return "\\data\\wulin\\"..zonename.."award.dat"
	end
	return nil
end

function wl_get_zonefile_actor( zonename )
	if ( zonename ~= nil and zonename ~= "" ) then
		return "\\data\\wulin\\"..zonename.."actoraward.dat"
	end
	return nil
end

------------------------------------------------------------------------------------
-- ´ò¿ªÒ»¸öÎÄ¼ş
function biwu_loadfile(filename)
	if (IniFile_Load(filename, filename) == 0) then
		File_Create(filename)
	end
end

--»ñµÃÎÄ¼şÖĞµÄszSectionµÄkeyµÄÖµ
function biwu_getdata(filename, szsect, szkey)
	return IniFile_GetData(filename, szsect, szkey)
end

--ÉèÖÃÎÄ¼şÖĞµÄszSectionµÄkeyÖµÎªszValue
function biwu_setdata(filename, szsect, szkey, szvalue)
	IniFile_SetData(filename, szsect, szkey, szvalue)	
end

function biwu_save(filename)
	IniFile_Save(filename, filename)
end

------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
function GetIniFileData(mapfile, sect, key)
	if (IniFile_Load(mapfile, mapfile) == 0) then 
		print("Load IniFile Error!"..mapfile)
		return ""
	else
		return IniFile_GetData(mapfile, sect, key)	
	end
end


------------------------------------------------------------------------------------

--Ö÷Òª×÷ÓÃ£ºÅĞ¶ÏÊÇ·ñ¿ÉÒÔÁìÈ¡¸ÃÏî½±Àø
--==========================================================================
--µ±²éÑ¯Çø·ş»ñÒ»¡¢¶ş¡¢ÈıµÈ½±ÊıÁ¿Ê±£º
--nMatchType£ºZONEAWARD_TASKID_FIRST »ò ZONEAWARD_TASKID_SECOND »ò ZONEAWARD_TASKID_THIRD
--nAwardLevel£ºÎŞÓÃ
--[·µ»Ø]£º¸ÃÏî½±ÀøµÄÊıÁ¿
----------------------------------------------
--µ±²éÑ¯ÆäËû½±ÏîÊ±£º
--nMatchType£º¼´ÎªTaskID£¬´ú±í±ÈÈüÀàĞÍ
--nAwardLevel£º½±ÀøµÈ¼¶
--	nAwardLevel=0±íÊ¾£º·µ»Ø¸Ã½±ÏîµÄ½±ÀøµÈ¼¶
--[·µ»Ø]-1£º	±íÊ¾ÒÑ¾­Áì¹ıÁË
--[·µ»Ø]0£º	±íÊ¾Ã»ÓĞ½±Àø
--[·µ»Ø]1£º	±íÊ¾¿ÉÒÔÁìÈ¡¸ÃÏî½±Àø
---------------------------------------------------
function wl_CheckAward(nMatchType, nAwardLevel)
	if( GetTask(nMatchType) == -1 ) then
		return -1
	end

	local nClientID = GetGateWayClientID()
	local strPlayerAccount = GetAccount()
	local strZoneName = wl_get_zonename( nClientID )
	local strPlayerName = GetName()
	local strZoneSection = tostring( nClientID )

	--±ØĞëÊÇ±ÈÈüÇø·ş
	if (strZoneName == nil) then
		-- print("±ØĞëÊÇ±ÈÈüÇø·ş")
		return 0
	end
	--±ØĞë50¼¶ÒÔÉÏ
	if (GetLevel() < 50) then
		-- print("±ØĞë50¼¶ÒÔÉÏ")
		return 0
	end

	--È«Çø·ş»ñµÃÒ»¡¢¶ş¡¢ÈıµÈ½±ÊıÁ¿£¨È«·ş½±Àø£©
	if (nMatchType == ZONEAWARD_TASKID_FIRST or nMatchType == ZONEAWARD_TASKID_SECOND or nMatchType == ZONEAWARD_TASKID_THIRD) then
		local strAwardType
		if (nMatchType == ZONEAWARD_TASKID_FIRST) then
			strMatchType="First"
		elseif (nMatchType == ZONEAWARD_TASKID_SECOND) then
			strMatchType="Second"
		elseif (nMatchType == ZONEAWARD_TASKID_THIRD) then
			strMatchType="Third"
		end

		biwu_loadfile( WL_FILE_ZONEAWARD )
		local nAwardCount = safe_tonumber(biwu_getdata( WL_FILE_ZONEAWARD, strZoneSection, strMatchType ))
		return nAwardCount
	end

	--ÆäËû½±Àø±ØĞëÊÇ²ÎÈü¶ÓÔ±
	local nChampTitle = champ_checktitle();
	if (nChampTitle == nil) then
		-- print("±ØĞëÊÇ²ÎÈü¶ÓÔ±")
		return 0
	end

	--²ÎÈüÈËÔ±½±Àø£¨¶ÓÔ±¡¢Áì¶Ó£©
	local nReadAwardLevel	--¶ÁÈ¡µ½µÄ½±ÀøµÈ¼¶
	if (nMatchType == ZONEAWARD_TASKID_ACTORAWARD or nMatchType == ZONEAWARD_TASKID_LEADAWARD) then
		if (nMatchType == ZONEAWARD_TASKID_LEADAWARD and nChampTitle~=7) then
			-- print("±ØĞëÊÇÁì¶Ó")
			return 0
		end
		biwu_loadfile( WL_FILE_ACTORAWARD )
		nReadAwardLevel = safe_tonumber(biwu_getdata( WL_FILE_ACTORAWARD, strZoneSection, "ZoneAwardType" ))
	--Çø·şÍÅÌåÈü½±Àø
	elseif (nMatchType == ZONEAWARD_TASKID_ZONE) then
		biwu_loadfile( WL_FILE_ACTORAWARD )
		nReadAwardLevel = safe_tonumber(biwu_getdata( WL_FILE_ACTORAWARD, strZoneSection, "ZoneMatch" ))
	--µ¥Ïî½±½±Àø£¨µ¥ÈË¡¢Ë«ÈË¡¢ÎåĞĞ¡¢Ê®ÈË¡¢Ê®ÁùÈË£©
	else
		local strMatchType
		if (nMatchType == ZONEAWARD_TASKID_SINGLE) then
			strMatchType="SingleMatch"
		elseif (nMatchType == ZONEAWARD_TASKID_DOUBLE) then
			strMatchType="DoubleMatch"
		elseif (nMatchType == ZONEAWARD_TASKID_FIVE) then
			strMatchType="FiveMatch"
		elseif (nMatchType == ZONEAWARD_TASKID_TEN) then
			strMatchType="TenMatch"
		elseif (nMatchType == ZONEAWARD_TASKID_SIXTEEN) then
			strMatchType="SixteenMatch"
		else
			-- print("ÎŞ´Ë½±ÀøÀàĞÍ£¡")
			return 0
		end

		biwu_loadfile( WL_FILE_MATCHAWARD )
		local strReadPlayerName = biwu_getdata( WL_FILE_MATCHAWARD, strPlayerAccount, "Key" )
		if (strReadPlayerName == nil or strReadPlayerName ~= strPlayerName) then
			-- print("Ã»ÓĞ¸Ã½ÇÉ«ĞÅÏ¢")
			return 0
		end

		nReadAwardLevel = safe_tonumber(biwu_getdata(WL_FILE_MATCHAWARD, GetAccount(), strMatchType))
	end

	if (nAwardLevel == nil or nAwardLevel <= 0) then
		return nReadAwardLevel
	elseif (nAwardLevel == nReadAwardLevel) then
		return 1
	else
		-- print("½±Ïî²»·û")
		return 0
	end
end

-----------------------------------------------------------

--×îÖÕÁìÈ¡½±Æ·£¨º¬±£»¤£©
--·µ»Ø£º1¡¢³É¹¦£»0¡¢Ê§°Ü
function wl_FinalTakeMatch( nTaskID, nCount )
	local nAwardLevel = wl_CheckAward(nTaskID)

	if( nAwardLevel == -1 ) then
		Say("Sao? Ng­¬i l·nh råi mµ, sao cßn ®Õn ®©y?!!", 0)
		-- print("ÄãÓ¦¸ÃÒÑ¾­ÁìÈ¡¹ıÁË")
		return 0
	elseif( nAwardLevel == 0 ) then
		Say("Xin lçi! Ng­¬i kh«ng thÓ nhËn phÇn th­ëng ®ã!", 0)
		WriteLog("PhÇn th­ëng vâ l©m ®¹i héi bŞ lçi!!    Cã ng­êi ®ang l·nh th­ëng 'nh©n ®«i kinh nghiÖm' kh«ng ph¶i cña m×nh! ["..GetName().."]  TaskID:"..nTaskID);
		-- print("³¢ÊÔÁìÈ¡²»ÄÜÁìÈ¡µÄ½±Ïî£¡	["..GetName().."]  TaskID:"..nTaskID);
		return 0
	end
	
	local nClientID = GetGateWayClientID();
	local strZoneName = tostring( nClientID )

	--Ò»µÈ½±½±Àø
	if (nTaskID == ZONEAWARD_TASKID_FIRST) then
		if( nCount == nil or nCount <= 0 ) then
			-- print("ÁìÈ¡ÏÉ²İÂ¶ÊıÄ¿²»´óÓÚ 0 »ò nil ¡£")
			WriteLog("PhÇn th­ëng vâ l©m ®¹i héi bŞ lçi!!    L·nh 'Tiªn Th¶o Lé' kh«ng ®­îc v­ît qu¸ møc 0 hoÆc nil")
			return 0
		end;
		
		if( wl_get_awardcount( nAwardLevel , nTaskID ) < nCount ) then
			Say("Sè l­îng nhËn ®­îc h×nh nh­ kh«ng ®óng!", 0)
			-- print("ÓĞÈË³¢ÊÔÁìÈ¡¹ı¶àµÄÏÉ²İÂ¶£¡	["..GetName().."]:SecondAward:"..nCount.."/"..GetTask( nTaskID ));
			WriteLog("PhÇn th­ëng vâ l©m ®¹i héi bŞ lçi!!    Cã ng­êi l·nh th­ëng 'Tiªn Th¶o Lé' v­ît qu¸ sè lÇn cho phĞp! ["..GetName().."]:SecondAward:"..nCount.."/"..GetTask( nTaskID ));
			return 0
		end;
		
		local nRoom = CalcFreeItemCellCount()
		if ( nRoom < nCount ) then
			Say("Hµnh trang ®· hÕt chç! S¾p xÕp l¹i råi h·y ®Õn ®©y!  V­ît qu¸ møc th­ëng 'Tiªn Th¶o Lé'", 0)
			-- print("ÄãµÄ±³°üºÃÏñÃ»ÓĞÄÇÃ´¶àÎ»ÖÃ", 0)
			return 0
		end;
		
		SetTask( nTaskID, GetTask( nTaskID ) - nCount )
		if( GetTask( nTaskID ) == 0 ) then
			SetTask( nTaskID, -1 )
		end;
		for i = 1, nCount do
			AddItem( 6, 1, 71, 1, 0, 0, 0 )
		end;
		Msg2Player("Chóc mõng, b¹n nhËn ®­îc"..nCount.."1 Tiªn Th¶o lé ")
		WriteLog(date("%y-%m-%d,%H:%M,").."Account==["..GetAccount().."],RoleName=="..GetName()..", PhÇn th­ëng trong khu vùc nhËn ®­îc"..nCount.."Tiªn Th¶o Lé ")
		return 1
	--¶ş¡¢ÈıµÈ½±½±Àø£¬¶¼ÊÇ¼ÓË«±¶¾­Ñé
	elseif (nTaskID == ZONEAWARD_TASKID_SECOND or nTaskID == ZONEAWARD_TASKID_THIRD) then
		if( nCount == nil or nCount <= 0 ) then
			WriteLog("PhÇn th­ëng vâ l©m ®¹i héi bŞ lçi!!    L·nh '®iÓm kimh nghiÖm' kh«ng ®­îc v­ît qu¸ møc 0 hoÆc nil")
			-- print("ÁìÈ¡Ë«±¶¾­ÑéÊıÄ¿²»´óÓÚ 0 »ò nil¡£")
			return 0
		end;
		
		if( wl_get_awardcount( nAwardLevel , nTaskID ) < nCount ) then
			WriteLog("PhÇn th­ëng vâ l©m ®¹i héi bŞ lçi!!    Cã ng­êi l·nh th­ëng 'nh©n ®«i kinh nghiÖm' v­ît qu¸ sè lÇn cho phĞp!! ["..GetName().."]:SecondAward:"..nCount.."/"..GetTask( nTaskID ));
			-- print("³¢ÊÔÁìÈ¡¹ı¶àµÄË«±¶¾­Ñé£¡	["..GetName().."]:SecondAward:"..nCount.."/"..GetTask( nTaskID ));
			return 0
		end
		SetTask( nTaskID, GetTask(nTaskID) - nCount )
		
		if( GetTask( nTaskID ) == 0 ) then
			SetTask( nTaskID, -1 )
		end
		
		local nDoubleTime = 15 * nCount
		if (nTaskID == ZONEAWARD_TASKID_SECOND) then
			nDoubleTime = nDoubleTime * 2;
		end
		
		AddSkillState(440, 1, 1, nDoubleTime * 60 * 18)
		Msg2Player("Chóc mõng, b¹n nhËn ®­îc"..nDoubleTime.."sè phót t¨ng gÊp ®«i ®iÓm kinh nghiÖm")
		WriteLog(date("%y-%m-%d,%H:%M,").."Account==["..GetAccount().."],RoleName=="..GetName().."PhÇn th­ëng trong khu vùc nhËn ®­îc"..nDoubleTime.."sè phót t¨ng gÊp ®«i ®iÓm kinh nghiÖm")
		return 1
	--²ÎÈüÑ¡ÊÖ½±Àø
	elseif (nTaskID == ZONEAWARD_TASKID_ACTORAWARD) then
		--×ÜÊı¿ØÖÆ
		biwu_loadfile( WL_FILE_MATCHAWARD )
		local nAwardCount = safe_tonumber(biwu_getdata( WL_FILE_MATCHAWARD, strZoneName, "ActorAwardGot"))
		if( nAwardCount >= 100 ) then
			Say("Xin lçi! PhÇn th­ëng ®ã ®· ®­îc l·nh hÕt!", 0)
			-- print("½±Æ·ÒÑ¾­ÁìÍêÁË£¬ÈÔÓĞÈË³¢ÊÔÁì½±£¡	["..GetName().."]:ActorAward");
			WriteLog("PhÇn th­ëng vâ l©m ®¹i héi bŞ lçi!!    Cã ng­êi ®· nhËn th­ëng råi, nh­ng l¹i ®Õn nhËn n÷a! ["..GetName().."]:ActorAward");
			return 0
		else
			biwu_setdata( WL_FILE_MATCHAWARD, strZoneName, "ActorAwardGot", nAwardCount+1);
			biwu_save(WL_FILE_MATCHAWARD)
		end
		
		nCount = WL_TAB_ACTORAWARD_INFO[ nAwardLevel ][ 2 ]
		local nRoom = CalcFreeItemCellCount()
		if( nRoom < nCount ) then
			Say("Hµnh trang ®· hÕt chç! S¾p xÕp l¹i råi h·y ®Õn ®©y!PhÇn th­ëng nµy ®· cã ng­êi l·nh råi.", 0)
			Say("Chç trèng trong hµnh trang cña b¹n kh«ng ®ñ", 0)
			return 0
		end
		
		SetTask( ZONEAWARD_TASKID_ACTORAWARD, -1 )

		wl_addownexp( WL_TAB_ACTORAWARD_INFO[ nAwardLevel ][ 3 ] )
		AddItem( 6, 1, 831, 1, 0, 0, 0 )		--ÎäÁÖ´ó»áºì°ü	£¿£¿
		Msg2Player("Chóc mõng, b¹n nhËn ®­îc"..WL_TAB_ACTORAWARD_INFO[ nAwardLevel ][ 1 ])
		WriteLog(date("%y-%m-%d,%H:%M,").."Account==["..GetAccount().."],RoleName=="..GetName()..", tuyÓn thñ tham gia thi ®Êu khu vùc nhËn ®­îc"..WL_TAB_ACTORAWARD_INFO[ nAwardLevel ][ 1 ].."XÕp h¹ng tİch lòy khu vùc"..nAwardLevel)
		return 1
	--×ÜÁì¶Ó½±Àø
	elseif (nTaskID == ZONEAWARD_TASKID_LEADAWARD) then
		--×ÜÊı¿ØÖÆ
		biwu_loadfile( WL_FILE_MATCHAWARD )
		local nAwardCount = safe_tonumber(biwu_getdata( WL_FILE_MATCHAWARD, strZoneName, "LeadAwardGot"))
		if( nAwardCount >= 1 ) then
			Say("Xin lçi! PhÇn th­ëng ®ã ®· ®­îc l·nh hÕt!", 0)
			WriteLog("PhÇn th­ëng vâ l©m ®¹i héi bŞ lçi!!    Cã ng­êi ®· nhËn th­ëng råi, nh­ng l¹i ®Õn nhËn n÷a! ["..GetName().."]:LeadAward");
			-- print("½±Æ·ÒÑ¾­ÁìÍêÁË£¬ÈÔÓĞÈË³¢ÊÔÁì½±£¡	["..GetName().."]:LeadAward");
			return 0
		else
			biwu_setdata( WL_FILE_MATCHAWARD, strZoneName, "LeadAwardGot", 1);
			biwu_save(WL_FILE_MATCHAWARD)
		end
		
		nCount = WL_TAB_LEADERAWARD_INFO[ nAwardLevel ][ 2 ]
		local nRoom = CalcFreeItemCellCount()
		
		if( nRoom < nCount or (nAwardLevel == 1 and nRoom < nCount + 6)) then
			Say("Hµnh trang ®· hÕt chç! S¾p xÕp l¹i råi h·y ®Õn ®©y!PhÇn th­ëng nµy ®· cã ng­êi l·nh råi.", 0)
			-- print("±³°ü¿Õ¼äºÃÏñ²»¹»", 0)
			return 0
		end
		
		if( nAwardLevel == 1 ) then
			wl_addgolditem_random()
		end
		
		for i = 1, nCount do
			AddItem( 6, 1, 831, 1, 0, 0, 0 )		--ÎäÁÖ´ó»áºì°ü	£¿£¿
		end;

		SetTask( ZONEAWARD_TASKID_LEADAWARD, -1 )
		Msg2Player("Chóc mõng, b¹n nhËn ®­îc"..nCount.."1 Vâ L©m ®¹i hång bao")
		WriteLog(date("%y-%m-%d,%H:%M,").."Account==["..GetAccount().."],RoleName=="..GetName()..", Tæng l·nh ®éi khu vùc nhËn ®­îc"..WL_TAB_LEADERAWARD_INFO[ nAwardLevel ][ 1 ].."XÕp h¹ng tİch lòy khu vùc"..nAwardLevel)
		return 1
	end

	--µ¥Ïî½±½±Àø£¨µ¥ÈË¡¢Ë«ÈË¡¢ÎåĞĞ¡¢Ê®ÈË¡¢Ê®ÁùÈË¡¢ÍÅÌå£©
	local strMatchName
	if (nTaskID == ZONEAWARD_TASKID_SINGLE) then
		strMatchName = "SingleMatch"
	elseif (nTaskID == ZONEAWARD_TASKID_DOUBLE) then
		strMatchName = "DoubleMatch"
	elseif (nTaskID == ZONEAWARD_TASKID_FIVE) then
		strMatchName = "FiveMatch"
	elseif (nTaskID == ZONEAWARD_TASKID_TEN) then
		strMatchName = "TenMatch"
	elseif (nTaskID == ZONEAWARD_TASKID_SIXTEEN) then
		strMatchName = "SixteenMatch"
	elseif (nTaskID == ZONEAWARD_TASKID_ZONE) then
		strMatchName = "ZoneMatch"
	end

	local strAwardCountName
	if (nTaskID == ZONEAWARD_TASKID_ZONE) then
		strAwardCountName = "ZoneMatchLeft"
	else
		strAwardCountName = strMatchName..tostring(nAwardLevel).."Left"
	end

	--½±Æ·×ÜÊı¿ØÖÆ
	biwu_loadfile( WL_FILE_MATCHAWARD )
	local nAwardCount = safe_tonumber(biwu_getdata( WL_FILE_MATCHAWARD, strZoneName, strAwardCountName))
	if( nAwardCount <= 0 ) then
		Say("Xin lçi! PhÇn th­ëng ®ã ®· ®­îc l·nh hÕt!", 0)
		WriteLog("PhÇn th­ëng vâ l©m ®¹i héi bŞ lçi!!    Cã ng­êi ®· nhËn th­ëng råi, nh­ng l¹i ®Õn nhËn n÷a! ["..GetName().."]:matchtype:"..strMatchName..":award:"..nAwardLevel);
		-- print("½±Æ·ÒÑ¾­ÁìÍêÁË£¬ÈÔÓĞÈË³¢ÊÔÁì½±£¡	["..GetName().."]:matchtype:"..strMatchName..":award:"..nAwardLevel);
		return 0
	else
		biwu_setdata( WL_FILE_MATCHAWARD, strZoneName, strAwardCountName, nAwardCount-1);
		biwu_save(WL_FILE_MATCHAWARD)
	end

	--Èç¹ûÊÇÃÅÅÉµ¥ÏîÈü¹Ú¾üÔò½±ÀøÊÇ¹Ì¶¨µÄ ´ó»Æ½ğ×°±¸
	if(nTaskID == ZONEAWARD_TASKID_SINGLE and nAwardLevel == 1) then
		if ( wl_awardgolditem( GetLastFactionNumber(), nTaskID ) ~= nil ) then
			SetTask( nTaskID, -1 )
		end
		return 1
	end
	
	local nCount = WL_TAB_MATCHAWARD_INFO[ strMatchName ][nAwardLevel][2]
	if( nCount == nil or nCount == 0 ) then
		WriteLog( "PhÇn th­ëng vâ l©m ®¹i héi bŞ lçi    count==0 match=="..strMatchName..", phÇn th­ëng lµ "..WL_TAB_MATCHAWARD_INFO[ strMatchName ][nAwardLevel][1] )
		-- print( "ÎäÁÖ´ó»á½±Àø³ö´í		count==0 match=="..strMatchName..",½±ÀøÎª"..WL_TAB_MATCHAWARD_INFO[ strMatchName ][nAwardLevel][1] )
		return 0
	end
	
	--Èç¹ûÊÇË«ÈËÈüµÄ»òÕßÎåĞĞÈüµÄ¹Ú¾üÔò£¬Ã¿ÈË»¹ÓĞÒ»¼şËæ»úµÄ´ó»Æ½ğ
	if( ( strMatchName == "DoubleMatch" or strMatchName == "FiveMatch" ) and nAwardLevel == 1 ) then
		wl_addgolditem_random()	--½±ÀøËæ»úµÄ´ó»Æ½ğ
	end
	
	local q = WL_TAB_MATCHAWARD_INFO[ strMatchName ][nAwardLevel][3]
	local g = WL_TAB_MATCHAWARD_INFO[ strMatchName ][nAwardLevel][4]
	local d = WL_TAB_MATCHAWARD_INFO[ strMatchName ][nAwardLevel][5]
	local l = WL_TAB_MATCHAWARD_INFO[ strMatchName ][nAwardLevel][6]
	local f = WL_TAB_MATCHAWARD_INFO[ strMatchName ][nAwardLevel][7]
	local k = WL_TAB_MATCHAWARD_INFO[ strMatchName ][nAwardLevel][8]
	local m = WL_TAB_MATCHAWARD_INFO[ strMatchName ][nAwardLevel][9]
	for i = 1, nCount do
		AddItem( q, g, d, l, f, k, m )
	end
	SetTask( nTaskID, -1 )
	Msg2Player( "Chóc mõng, b¹n nhËn ®­îc"..WL_TAB_MATCHAWARD_INFO[ strMatchName ][nAwardLevel][1] )
	WriteLog(date("%y-%m-%d,%H:%M").."Account==["..GetAccount().."] RoleName=="..GetName()..", ®· nhËn ®­îc"..WL_TAB_MATCHAWARD_INFO[ strMatchName ][nAwardLevel][1].."tham gia trËn ®Êu lµ "..strMatchName)
	return 1
end

--============================================

function wl_get_awardcount( count, taskid )
	if ( GetTask( taskid ) == 0 ) then
		SetTask( taskid, count )
		return count
	end
	if( GetTask( taskid ) == -1 ) then
		return 0
	end
	return GetTask( taskid )
end

function champ_checktitle()
	
	local nClientID = GetGateWayClientID();
	local zonename = wl_get_zonename( nClientID )
	if( zonename == nil ) then	--²»ÊÇ±ÈÈüÇø·ş
		return nil
	end
	local prefix = "\\data\\wulin\\"..nClientID.."\\"
	local name = ""	--ÅĞ¶ÏÊÇ²»ÊÇ×ÜÁì¶Ó
	biwu_loadfile( prefix .. BID_LEADER )
	name = biwu_getdata( prefix..BID_LEADER, "Leader_Name", "Name")
	if( GetName() == name ) then
		return 7
	end
	
	name = ""	--ÅĞ¶ÏÊÇ²»ÊÇÊÀ½çÊ®´ó
	biwu_loadfile(prefix.. LEVELTOP10 )
	for i = 1, 10 do
		name = biwu_getdata(prefix..LEVELTOP10, "LevelTop10", "Top"..i);
		if( name == GetName() ) then
			return 1
		end
	end

	name = ""	--ÅĞ¶ÏÊÇ²»ÊÇÃÅÅÉÈüÇ°ÎåÃû
	local fanctionnum = GetLastFactionNumber()
	--for fanctionnum = 0, 9 do	--temp
	biwu_loadfile( prefix..WL_FACTION[fanctionnum+1][1] )
	for i = 1, 5 do
		name = biwu_getdata(prefix..WL_FACTION[fanctionnum+1][1], WL_FACTION[fanctionnum+1][2], "Top"..i);
		if( name == GetName() ) then
			return 1
		end
	end
	--end	--temp

	name = ""	--ÅĞ¶ÏÊÇ²»ÊÇ×ÜÁì¶Ó¸øÓëµÄ²ÎÈü×Ê¸ñ
	local count = 0
	biwu_loadfile( prefix..LEADER_MEMBER )
	count = tonumber(biwu_getdata(prefix..LEADER_MEMBER, "LeadMember", "Count"))
	if( count == 0 ) then
		return nil
	end
	for i = 1, count do
		name = biwu_getdata(prefix..LEADER_MEMBER, "LeadMember", "Member"..i)
		if( GetName() == name ) then
			return 1
		end
	end
	
	return nil
end;

------------------------------------------------------------------------------------
--main
function wulin_awardmain()
	local nClientID = GetGateWayClientID();
	local zonename = wl_get_zonename( nClientID )
	local nowday = tonumber(date("%Y%m%d"))
	local bAwardNow = 1
	if (nowday > WL_AWARD_TIME[2] or nowday < WL_AWARD_TIME[1]) then
		bAwardNow = 0
	end
		
	if( zonename == nil or bAwardNow == 0) then	--²»ÊÇ±ÈÈüÇø·ş
		Say("Vâ l©m ®¹i héi ®· kÕt thóc, kÕt qu¶ chi tiÕt liªn hÖ trang chñ.", 0)
		return
	end

	if ( GetLevel() < 50 ) then
		Say("Vâ l©m ®¹i héi ®· chİnh thøc h¹ mµn, kÕt qu¶ chi tiÕt xin liªn hÖ trang chñ. <color=red>cÊp 50<color> trë lªn cã thÓ ë chç ta nhËn phÇn th­ëng khu vùc", 0)
		return
	end
	
	local zonesection = tostring( nClientID )
	biwu_loadfile( WL_FILE_ZONEAWARD )
	local firstcount = tonumber(biwu_getdata( WL_FILE_ZONEAWARD, zonesection, "First" ))--biwu_getdata( WL_FILE_ZONEAWARD, zonesection, "First" )
	local secondcount = tonumber(biwu_getdata( WL_FILE_ZONEAWARD, zonesection, "Second" ))
	local thirdcount = tonumber(biwu_getdata( WL_FILE_ZONEAWARD, zonesection, "Third" ))
	
	WL_FILE_MATCHAWARD = wl_get_zonefile_match( zonesection )
	WL_FILE_ACTORAWARD = wl_get_zonefile_actor( zonesection )
	
	local count = 0
	local tbOpp = {}
	count = firstcount + secondcount + thirdcount
	if (GetLastFactionNumber() ~= -1 and GetCamp() > 0) then
		if ( champ_checktitle() ~= nil ) then	--ÊÇ²»ÊÇ²ÎÈüÑ¡ÊÖ
			tbOpp[ getn( tbOpp ) + 1 ] = "PhÇn th­ëng vâ l©m ®¹i héi b¸n kÕt/wl_matchaward"
			tbOpp[ getn( tbOpp ) + 1 ] = "PhÇn th­ëng tuyÓn thñ tham gia thi ®Êu khu vùc/wl_joinaward"
			tbOpp[ getn( tbOpp ) + 1 ] = "NhËn danh hiÖu vâ l©m ®¹i héi b¸n kÕt/wl_taketitle"
		end
	end
		
	if (nowday >= WL_ZONEAWARD_TIME[1] and nowday <= WL_ZONEAWARD_TIME[2]) then
		if (count > 0 ) then --Çø·şÖĞÓĞ»ñµÃ¹Ú¡¢ÑÇ¡¢¼¾¾ü£¬Ôò
			tbOpp[ getn( tbOpp ) + 1 ] = "PhÇn th­ëng khu vùc/#wl_awardall("..firstcount..","..secondcount..","..thirdcount..")"
		end
	end
	
	if( getn( tbOpp ) < 1 ) then	--Ã»ÓĞ½±Àø
		Say("Vâ l©m ®¹i héi ®· kÕt thóc, kÕt qu¶ chi tiÕt liªn hÖ trang chñ.", 0)
		return
	end
	
	tbOpp[ getn( tbOpp ) + 1 ] = "Ta chØ ®Õn ch¬i/OnCancel"
	Say( "Vâ l©m ®¹i héi ®· kÕt thóc, cã thÓ ®Õn chç ta l·nh th­ëng.", getn(tbOpp), tbOpp )
end;

--------------------------------------------------------------------------------------------

function wl_matchaward()
	local nClientID = GetGateWayClientID();
	local zonename = wl_get_zonename( nClientID )
	local zonesection = tostring( nClientID )
	--WL_TAB_MATCHAWARD_INFO
	--WL_FILE_MATCHAWARD
	local playeraccount = GetAccount()
	local playername = GetName()

	biwu_loadfile( WL_FILE_MATCHAWARD )
	local rolename = biwu_getdata( WL_FILE_MATCHAWARD, playeraccount, "Key" )
	
	biwu_loadfile( WL_FILE_ACTORAWARD )
	local zonematch = tonumber(biwu_getdata( WL_FILE_ACTORAWARD, zonesection, "ZoneMatch" ))
	
	if( (rolename == nil or playername ~= rolename) and zonematch == 0 ) then
		Say("ng­¬i kh«ng nhËn ®­îc thø h¹ng nµo qua c¸c gi¶i ®Êu, cè g¾ng rÌn luyÖn h¬n nhĞ! KÕt qu¶ chi tiÕt xin liªn hÖ trang chñ.", 0)
		return
	end
	
	local tbOpp = {}
	
	biwu_loadfile( WL_FILE_ACTORAWARD )
	if( zonematch ~= 0 and GetTask( ZONEAWARD_TASKID_ZONE ) ~= -1 ) then
		tbOpp[ getn( tbOpp ) + 1 ] = "PhÇn th­ëng thi ®Êu tËp thÓ khu vùc___"..WL_TAB_MATCHAWARD_INFO[ "ZoneMatch" ][zonematch][1].."/#wl_want2takematch('ZoneMatch',"..zonematch..","..ZONEAWARD_TASKID_ZONE..")"
	end
	
	biwu_loadfile( WL_FILE_MATCHAWARD )
	local singlematch = 0
	local doublematch = 0
	local fivematch = 0
	local tenmatch = 0
	local sixteenmatch = 0
	if( rolename ~= nil and playername == rolename ) then
		singlematch	=	tonumber(biwu_getdata( WL_FILE_MATCHAWARD, playeraccount, "SingleMatch" ))
		doublematch	=	tonumber(biwu_getdata( WL_FILE_MATCHAWARD, playeraccount, "DoubleMatch" ))
		fivematch 	=	tonumber(biwu_getdata( WL_FILE_MATCHAWARD, playeraccount, "FiveMatch" ))
		tenmatch	=	tonumber(biwu_getdata( WL_FILE_MATCHAWARD, playeraccount, "TenMatch" ))
		sixteenmatch	=	tonumber(biwu_getdata( WL_FILE_MATCHAWARD, playeraccount, "SixteenMatch" ))
		
		if( singlematch ~= 0 and GetTask( ZONEAWARD_TASKID_SINGLE ) ~= -1 ) then
			tbOpp[ getn( tbOpp ) + 1 ] = "PhÇn th­ëng §¬n ®Êu m«n ph¸i___"..WL_TAB_MATCHAWARD_INFO[ "SingleMatch" ][singlematch][1].."/#wl_want2takematch('SingleMatch',"..singlematch..","..ZONEAWARD_TASKID_SINGLE..")"
		end
		if( doublematch ~= 0 and GetTask( ZONEAWARD_TASKID_DOUBLE ) ~= -1 ) then
			tbOpp[ getn( tbOpp ) + 1 ] = "PhÇn th­ëng Song ®Êu___"..WL_TAB_MATCHAWARD_INFO[ "DoubleMatch" ][doublematch][1].."/#wl_want2takematch('DoubleMatch',"..doublematch..","..ZONEAWARD_TASKID_DOUBLE..")"
		end
		if( fivematch ~= 0 and GetTask( ZONEAWARD_TASKID_FIVE ) ~= -1 ) then
			tbOpp[ getn( tbOpp ) + 1 ] = "PhÇn th­ëng Ngò hµnh ®Êu___"..WL_TAB_MATCHAWARD_INFO[ "FiveMatch" ][fivematch][1].."/#wl_want2takematch('FiveMatch',"..fivematch..","..ZONEAWARD_TASKID_FIVE..")"
		end
		if( tenmatch ~= 0 and GetTask( ZONEAWARD_TASKID_TEN ) ~= -1 ) then
			tbOpp[ getn( tbOpp ) + 1 ] = "PhÇn th­ëng ThËp ph¸i ®Êu___"..WL_TAB_MATCHAWARD_INFO[ "TenMatch" ][tenmatch][1].."/#wl_want2takematch('TenMatch',"..tenmatch..","..ZONEAWARD_TASKID_TEN..")"
		end
		if( sixteenmatch ~= 0 and GetTask( ZONEAWARD_TASKID_SIXTEEN ) ~= -1 ) then
			tbOpp[ getn( tbOpp ) + 1 ] = "PhÇn th­ëng ThËp lôc s¸t ®Êu___"..WL_TAB_MATCHAWARD_INFO[ "SixteenMatch" ][sixteenmatch][1].."/#wl_want2takematch('SixteenMatch',"..sixteenmatch..","..ZONEAWARD_TASKID_SIXTEEN..")"
		end
	end
	
	if( getn( tbOpp ) == 0 ) then
		Say( "Ng­¬i ®· nhËn qua phÇn th­ëng hoÆc kh«ng cã phÇn th­ëng, kÕt qu¶ chi tiÕt xin vµo trang chñ.", 0 )
		return
	end
	tbOpp[ getn( tbOpp ) + 1 ] = "L¸t n÷a ta quay l¹i/OnCancel"
	Say("Ng­¬i cã thÓ nhËn phÇn th­ëng mét lóc, tr­íc khi nhËn xin s¾p xÕp l¹i hµnh trang!", getn( tbOpp ), tbOpp)
end

function wl_want2takematch( sectionname ,awardtype, taskid )
	local room = 0
	room = CalcFreeItemCellCount()
	if( room < 12 ) then
		Say("Hµnh trang ®· hÕt chç! S¾p xÕp l¹i råi h·y ®Õn ®©y!", 0)
		return
	end
	Say( "HiÖn t¹i ng­¬i cÇn l·nh lµ "..WL_TAB_MATCHAWARD_INFO[ sectionname ][awardtype][1]..", l·nh ngay b©y giê chø?", 2, "§­a cho ta nhanh ®i!/#wl_FinalTakeMatch("..taskid..")", "§Ó ta suy nghÜ l¹i/OnCancel" )
end

function wl_awardgolditem( fact, taskid )
	if ( fact == 0 ) then
		print("cña ThiÕu L©m nh­ng kh«ng cã gi¶i Qu¸n qu©n ThiÕu L©m")
		return nil
	end
	
	if( fact == 1 ) then
		AddGoldItem(0,19)
		Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 H¸m Thiªn Hæ §Çu KhÈn Thóc UyÓn")
		WriteLog(date("%y-%m-%d,%H:%M").."Account==["..GetAccount().."] RoleName=="..GetName()..", nhËn ®­îc gi¶i nhÊt ®¬n ®Êu Thiªn V­¬ng, phÇn th­ëng lµ 1 KhÈn Thóc UyÓn")
		return 1
	elseif ( fact == 2 ) then
		AddGoldItem(0,80)
		Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 Thiªn Quang Thóc Thiªn Ph­îc §Şa Hoµn")
		WriteLog(date("%y-%m-%d,%H:%M").."Account==["..GetAccount().."] RoleName=="..GetName()..", nhËn ®­îc gi¶i nhÊt ®¬n ®Êu §­êng M«n, phÇn th­ëng lµ 1 Ph­îc §Şa Hoµn")
		return 1
	elseif( fact == 3 ) then
		AddGoldItem(0,59)
		Msg2Player("Chóc mõng, nhËn ®­îc mét U Lung Ng©n ThiÒm Hé Thñ ")
		WriteLog(date("%y-%m-%d,%H:%M").."Account==["..GetAccount().."] RoleName=="..GetName()..", nhËn ®­îc gi¶i nhÊt ®¬n ®Êu Ngò §éc, phÇn th­ëng lµ 1 Ng©n ThiÒm Hé Thñ ")
		return 1
	elseif( fact == 6 ) then
		AddGoldItem(0,100)
		Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 §Şch Kh¸i Th¶o Gian Th¹ch Giíi")
		WriteLog(date("%y-%m-%d,%H:%M").."Account==["..GetAccount().."] RoleName=="..GetName()..", nhËn ®­îc gi¶i nhÊt ®¬n ®Êu C¸i Bang, phÇn th­ëng lµ 1 Gian Th¹ch Giíi")
		return 1
	elseif( fact == 7 ) then
		AddGoldItem(0,113)
		Msg2Player("Chóc mõng b¹n nhËn ®­îc phÇn th­ëng Ma ThŞ NghiÖp Háa U Minh Giíi")
		WriteLog(date("%y-%m-%d,%H:%M").."Account==["..GetAccount().."] RoleName=="..GetName()..", nhËn ®­îc gi¶i nhÊt ®¬n ®Êu Thiªn NhÉn, phÇn th­ëng lµ 1 U Minh Giíi")
		return 1
	elseif( fact == 4 ) then
		AddGoldItem(0,35)
		Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 V« Gian B¹ch Ngäc Bµn ChØ ")
		WriteLog(date("%y-%m-%d,%H:%M").."Account==["..GetAccount().."] RoleName=="..GetName()..", nhËn ®­îc gi¶i nhÊt ®¬n ®Êu Nga My, phÇn th­ëng lµ 1 V« Gian B¹ch Ngäc Bµn ChØ ")
		return 1
	elseif( fact == 5 ) then
		AddGoldItem(0,50)
		Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 Tª Hoµn Thóy Ngäc ChØ Hoµn")
		WriteLog(date("%y-%m-%d,%H:%M").."Account==["..GetAccount().."] RoleName=="..GetName()..", nhËn ®­îc gi¶i nhÊt ®¬n ®Êu Thóy Yªu, phÇn th­ëng lµ 1 Ngäc ChØ Hoµn")
		return 1
	elseif( fact == 8 ) then
		AddGoldItem(0,125)
		Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 CËp Phong Thanh Tïng Ph¸p Giíi")
		WriteLog(date("%y-%m-%d,%H:%M").."Account==["..GetAccount().."] RoleName=="..GetName()..", nhËn ®­îc gi¶i nhÊt ®¬n ®Êu Vâ §ang, phÇn th­ëng lµ 1 Thanh Tïng Ph¸p Giíi")
		return 1
	elseif( fact == 9 ) then
		AddGoldItem(0,130)
		Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 S­¬ng Tinh Phong B¹o chØ hoµn")
		WriteLog(date("%y-%m-%d,%H:%M").."Account==["..GetAccount().."] RoleName=="..GetName()..", nhËn ®­îc gi¶i nhÊt ®¬n ®Êu C«n L«n, phÇn th­ëng lµ 1 S­¬ng Tinh Phong B¹o chØ hoµn")
		return 1
	else
		print("wl_awardgolditem faction wrong!!!!error!!!!")
		return nil
	end
end;

---------------------------------------------------------------------------------------------

function wl_joinaward()		--Çø·ş²ÎÈüµÃ½±
	local nClientID = GetGateWayClientID();
	local zonename = wl_get_zonename( nClientID )
	local zonesection = tostring( nClientID )
	local tabTitle = {}
	local leader = 0
	local awardtype = tonumber(biwu_getdata( WL_FILE_ACTORAWARD, zonesection, "ZoneAwardType" ))
	
	local leader = 0
	leader = champ_checktitle()		--leader == 7Îª×ÜÁì¶Ó
	if( leader == 7 ) then
		local tbOpp = {}
		if ( GetTask( ZONEAWARD_TASKID_LEADAWARD ) == -1 and GetTask( ZONEAWARD_TASKID_ACTORAWARD ) == -1 ) then
			Say( "Ng­¬i ®· nhËn qua phÇn th­ëng. KÕt qu¶ thi ®Êu chi tiÕt xin xem trang chñ.", 0 )
			return
		end;
		if ( GetTask( ZONEAWARD_TASKID_LEADAWARD ) ~= -1 ) then
			tbOpp[ getn( tbOpp ) + 1 ] = "NhËn phÇn th­ëng Tæng l·nh ®éi/#wl_FinalTakeMatch("..ZONEAWARD_TASKID_LEADAWARD..")"
		end;
		if ( GetTask( ZONEAWARD_TASKID_ACTORAWARD ) ~= -1 ) then
			tbOpp[ getn( tbOpp ) + 1 ] = "NhËn phÇn th­ëng tuyÓn thñ /#wl_FinalTakeMatch("..ZONEAWARD_TASKID_ACTORAWARD..")"
		end;
		tbOpp[ getn( tbOpp ) + 1 ] = "§îi mét l¸t ®i!/OnCancel" 
		if( awardtype == 5 ) then
			Say("Tæng l·nh ®éi nh­ ng­¬i cã thÓ nhËn"..WL_TAB_LEADERAWARD_INFO[ awardtype ][ 1 ]..", vµ tuyÓn thñ "..WL_TAB_ACTORAWARD_INFO[ awardtype ][ 1 ]..", nhËn ngay b©y giê chø? Tr­íc khi nhËn xin s¾p xÕp l¹i hµnh trang!", getn( tbOpp ), tbOpp )
		else
			Say("Quan viªn Vâ l©m kiÖt xuÊt:"..zonename.."Trong b¶ng thµnh tİch xÕp h¹ng thø "..awardtype.."h¹ng, do lµ Tæng l·nh ®éi, b¹n nhËn ®­îc"..WL_TAB_LEADERAWARD_INFO[ awardtype ][ 1 ]..", vµ phÈn th­ëng tuyÓn thñ tham gia"..WL_TAB_ACTORAWARD_INFO[ awardtype ][ 1 ]..", nhËn ngay b©y giê chø? Tr­íc khi nhËn xin s¾p xÕp l¹i hµnh trang!", getn( tbOpp ), tbOpp )
		end
	else
		if ( GetTask( ZONEAWARD_TASKID_ACTORAWARD ) == -1 ) then
			Say( "Ng­¬i ®· nhËn qua phÇn th­ëng. KÕt qu¶ thi ®Êu chi tiÕt xin xem trang chñ.", 0 )
			return
		end;
		if( awardtype == 5 ) then
			Say("Lµ "..zonename.."tuyÓn thñ trong khu vùc, ng­¬i cã thÓ nhËn ®­îc"..WL_TAB_ACTORAWARD_INFO[ awardtype ][ 1 ]..", nhËn ngay b©y giê chø? Tr­íc khi nhËn xin s¾p xÕp l¹i hµnh trang!", 2, "NhËn ngay ®©y!/#wl_FinalTakeMatch("..ZONEAWARD_TASKID_ACTORAWARD..")", "§îi mét l¸t ®i!/OnCancel" )
		else
			Say("Quan viªn Vâ l©m kiÖt xuÊt:"..zonename.."Trong b¶ng thµnh tİch xÕp h¹ng thø "..awardtype..", tuyÓn thñ trong khu vùc, ng­¬i cã thÓ nhËn ®­îc "..WL_TAB_ACTORAWARD_INFO[ awardtype ][ 1 ]..", nhËn ngay b©y giê chø? Tr­íc khi nhËn xin s¾p xÕp l¹i hµnh trang!", 2, "NhËn ngay ®©y!/#wl_FinalTakeMatch("..ZONEAWARD_TASKID_ACTORAWARD..")", "§îi mét l¸t ®i!/OnCancel" )
		end
	end
	
end;

function wl_addgolditem_random()
	local serial = random( WL_GOLDITEMCOUNT )
	AddGoldItem(WL_TAB_MATCHAWARD[serial][3][1], WL_TAB_MATCHAWARD[serial][3][2])
	Msg2Player("Chóc mõng, b¹n nhËn ®­îc mét "..WL_TAB_MATCHAWARD[serial][1])
	WriteLog(date("%y-%m-%d,%H:%M").."Account==["..GetAccount().."] RoleName=="..GetName()..", phÇn th­ëng trang bŞ Hoµng Kim "..WL_TAB_MATCHAWARD[serial][1])
end;

function wl_addownexp( awardexp )
	tl_addPlayerExp(awardexp)
end;


---------------------------------------------------------------------------------------------
function wl_awardall( firstcnt, secondcnt, thirdcnt )	--ÁìÈ¡Çø·ş½±Àø
	local awardfst = 0
	local awardsec = 0
	local awardthd = 0
	local tbOpp = {}
	awardfst = wl_get_awardcount( firstcnt, ZONEAWARD_TASKID_FIRST )
	awardsec = wl_get_awardcount( secondcnt, ZONEAWARD_TASKID_SECOND )
	awardthd = wl_get_awardcount( thirdcnt, ZONEAWARD_TASKID_THIRD )
	
	local nClientID = GetGateWayClientID();
	local zonename = wl_get_zonename( nClientID )
	local str = "Quan viªn Vâ l©m kiÖt xuÊt:"..zonename.."trong khu vùc lµ: "
	
	if ( firstcnt ~= 0 ) then
		str = str.."Qu¸n qu©n"..firstcnt..", "
	end
	
	if ( secondcnt ~= 0 ) then
		str = str.."¸ qu©n"..secondcnt..", "
	end
	
	if ( thirdcnt ~= 0 ) then
		str = str.."H¹ng 3"..thirdcnt..", "
	end
	
	if ( awardfst == 0 and awardsec == 0 and awardthd == 0 ) then
		str = str.."ng­¬i ®· nhËn tÊt c¶ phÇn th­ëng ë khu vùc."
		Say(str, 0)
		return
	end
	
	str = str.."ng­¬i cßn cã thÓ nhËn:"
	if( awardfst > 0 ) then
		tbOpp[ getn( tbOpp ) + 1 ] = tostring(awardfst).."PhÇn th­ëng Qu¸n Qu©n___Tiªn Th¶o lé /#wl_want2takeaward(1,"..awardfst..")"
	end
	
	if( awardsec > 0 ) then
		tbOpp[ getn( tbOpp ) + 1 ] = tostring(awardsec).."PhÇn th­ëng ¸ Qu©n___T¨ng ®«i ®iÓm kinh nghiÖm trong 30 phót/#wl_want2takeaward(2,"..awardsec..")"
	end
	
	if ( awardthd > 0 ) then
		tbOpp[ getn( tbOpp ) + 1 ] = tostring(awardthd).."PhÇn th­ëng h¹ng 3___T¨ng ®«i ®iÓm kinh nghiÖm trong 15 phót/#wl_want2takeaward(3,"..awardthd..")"
	end
	tbOpp[ getn( tbOpp ) + 1 ] = "§îi mét l¸t ®i!/OnCancel"
	Say( str, getn( tbOpp ), tbOpp )
end

function wl_want2takeaward(title,awardcount)
	local str = ""
	local cbFunc = ""
	local taskid = 0
	local tbOpp = {}
	if ( title == 1) then
		str = "ng­¬i cã thÓ nhËn ®­îc"..awardcount.."1 Tiªn Th¶o lé, nhËn b©y giê chø?"
		cbFunc = "c¸i/#wl_FinalTakeMatch"
		taskid = ZONEAWARD_TASKID_FIRST
	elseif ( title == 2 ) then
		str = "ng­¬i cã thÓ nhËn ®­îc"..awardcount.."lÇn t¨ng ®«i ®iÓm kinh nghiÖm trong 30 phót, nhËn b©y giê chø?"
		cbFunc = "lÇn/#wl_want2doubleexp_30"
		taskid = ZONEAWARD_TASKID_SECOND
	elseif( title == 3 ) then
		str = "ng­¬i cã thÓ nhËn ®­îc"..awardcount.."lÇn t¨ng ®«i kinh nghiÖm trong 15 phót, nhËn b©y giê chø?"
		cbFunc = "lÇn/#wl_want2doubleexp_15"
		taskid = ZONEAWARD_TASKID_THIRD
	end
	
	for i = 1, awardcount do
		tbOpp[ getn( tbOpp ) + 1 ] = "NhËn!"..tostring(i)..cbFunc.."("..taskid..","..i..")"
	end
	tbOpp[ getn( tbOpp ) + 1 ] = "§îi l¸t quay l¹i nhËn/OnCancel"
	Say(str, getn(tbOpp), tbOpp)
end;

function wl_want2doubleexp_30( taskid, count )	--ÁìÈ¡ÑÇ¾ü½±Àø
	if( count == 0 or count == nil ) then
		print("wl_want2doubleexp_30(count) error!! count == 0 or count == nil")
		return
	end;
	
	if( GetTask( taskid ) < count ) then
		Say("Sè l­îng nhËn ®­îc h×nh nh­ kh«ng ®óng!", 0)
		print( GetTask( taskid ).."== doubleexp30 :::: count=="..count.."not equal" )
		return
	end;
	
	local doubletime = 30 * count
	Say("Ng­¬i muèn nhËn lµ "..count.."phÇn th­ëng ¸ Qu©n + "..doubletime.."phót t¨ng ®«i ®iÓm kinh nghiÖm ®óng kh«ng?", 2, "Muèn/#wl_FinalTakeMatch("..taskid..","..count..")", "§îi mét l¸t ta quay l¹i nhËn!/OnCancel")
end

function wl_want2doubleexp_15( taskid, count )	--ÁìÈ¡¼¾¾ü½±Àø
	if( count == 0 or count == nil ) then
		print("wl_want2doubleexp_30(count) error!! count == 0 or count == nil")
		return
	end;
	
	if( GetTask( taskid ) < count ) then
		Say("Sè l­îng nhËn ®­îc h×nh nh­ kh«ng ®óng!", 0)
		print( GetTask( taskid ).."== doubleexp30 :::: count=="..count.."not equal" )
		return
	end;
	
	local doubletime = 15 * count
	Say("Ng­¬i muèn nhËn lµ "..count.."phÇn th­ëng ¸ Qu©n + "..doubletime.."phót t¨ng ®«i ®iÓm kinh nghiÖm ®óng kh«ng?", 2, "Muèn/#wl_FinalTakeMatch("..taskid..","..count..")", "§îi mét l¸t ta quay l¹i nhËn!/OnCancel")
end

----------------------------------------------------------------------------------------------


function wl_taketitle()
--	WL_FILE_MATCHAWARD = wl_get_zonefile_match( zonesection )
--	WL_FILE_ACTORAWARD = wl_get_zonefile_actor( zonesection )
	local tbOpp = {}
	local zonesection = tostring(GetGateWayClientID())
	local playeraccount = GetAccount()
	biwu_loadfile( WL_FILE_MATCHAWARD)
	local playername = GetName()
	local rolename = biwu_getdata( WL_FILE_MATCHAWARD, playeraccount, "Key" )
	
	biwu_loadfile( WL_FILE_ACTORAWARD )
	local zonematch = tonumber(biwu_getdata( WL_FILE_ACTORAWARD, zonesection, "ZoneMatch" ))
	
	if( (rolename == nil or playername ~= rolename) and zonematch == 0 ) then
		Say("Ng­¬i kh«ng cã thø h¹ng nµo qua c¸c lo¹t trËn ®Êu, ta kh«ng cã danh hiÖu cho ng­¬i.", 0)
		return
	end

	biwu_loadfile( WL_FILE_ACTORAWARD )
	if( zonematch > 0 and zonematch <= 3 ) then
		tbOpp[ getn( tbOpp ) + 1 ] = "NhËn ®­îc danh hiÖu ®Êu tËp thÓ khu vùc/#wl_sure2taketitle('ZoneMatch',"..zonematch..")"
	end
	
	biwu_loadfile( WL_FILE_MATCHAWARD )
	local singlematch = 0
	local doublematch = 0
	local fivematch = 0
	local tenmatch = 0
	local sixteenmatch = 0
	if( rolename ~= nil and playername == rolename ) then
		singlematch	=	tonumber(biwu_getdata( WL_FILE_MATCHAWARD, playeraccount, "SingleMatch" ))
		doublematch	=	tonumber(biwu_getdata( WL_FILE_MATCHAWARD, playeraccount, "DoubleMatch" ))
		fivematch 	=	tonumber(biwu_getdata( WL_FILE_MATCHAWARD, playeraccount, "FiveMatch" ))
		tenmatch	=	tonumber(biwu_getdata( WL_FILE_MATCHAWARD, playeraccount, "TenMatch" ))
		sixteenmatch	=	tonumber(biwu_getdata( WL_FILE_MATCHAWARD, playeraccount, "SixteenMatch" ))
		
		if( singlematch > 0 and singlematch <= 3 ) then
			tbOpp[ getn( tbOpp ) + 1 ] = "NhËn ®­îc danh hiÖu ®¬n ®Êu m«n ph¸i/#wl_sure2taketitle('SingleMatch',"..singlematch..")"
		end
		if( doublematch > 0 and doublematch <= 3 ) then
			tbOpp[ getn( tbOpp ) + 1 ] = "NhËn ®­îc danh hiÖu Song ®Êu/#wl_sure2taketitle('DoubleMatch',"..doublematch..")"
		end
		if( fivematch > 0 and fivematch <= 3 ) then
			tbOpp[ getn( tbOpp ) + 1 ] = "NhËn ®­îc danh hiÖu ngò hµnh ®Êu/#wl_sure2taketitle('FiveMatch',"..fivematch..")"
		end
		if( tenmatch > 0 and tenmatch <= 3 ) then
			tbOpp[ getn( tbOpp ) + 1 ] = "NhËn ®­îc danh hiÖu ThËp ph¸i ®Êu/#wl_sure2taketitle('TenMatch',"..tenmatch..")"
		end
		if( sixteenmatch > 0 and sixteenmatch <= 3 ) then
			tbOpp[ getn( tbOpp ) + 1 ] = "NhËn ®­îc danh hiÖu ThËp lôc s¸t ®Êu/#wl_sure2taketitle('SixteenMatch',"..sixteenmatch..")"
		end
	end
	
	if( getn( tbOpp ) == 0 ) then
		Say("Ng­¬i kh«ng cã thø h¹ng nµo qua c¸c lo¹t trËn ®Êu, ta kh«ng cã danh hiÖu cho ng­¬i.", 0)
		return
	end
	
	tbOpp[ getn( tbOpp ) + 1 ] = "§îi l¸t ®Ó ta suy nghÜ ®·/OnCancel"
	
	Say("Ng­¬i cã thÓ nhËn ®­îc danh hiÖu sau ®©y, suy nghÜ xem sao:", getn( tbOpp ), tbOpp)
end

function wl_sure2taketitle( sectionname , awardtype)
	if( awardtype < 0 or awardtype > 3 ) then
		return
	end
	
	local title = 0
	local str = ""
	if ( sectionname == "SingleMatch" ) then
		local faction = GetLastFactionNumber()
		if( faction == -1 ) then
			return
		end
		str = "Danh s¸ch m«n ph¸i thi ®Êu"
		if( awardtype == 1 ) then
			title = 32 + faction
		elseif( awardtype == 2 ) then
			title = 42 + faction
		else
			title = 52 + faction
		end
	end
	
	if( sectionname == "DoubleMatch" ) then
		title = 61 + awardtype
		str = "Song ®Êu"
	end
	
	if( sectionname == "FiveMatch" ) then
		title = 64 + awardtype
		str = "Ngò hµnh ®Êu"
	end
	
	if( sectionname == "TenMatch" ) then
		title = 67 + awardtype
		str = "ThËp ph¸i ®Êu"
	end
	
	if( sectionname == "SixteenMatch" ) then
		title = 70 + awardtype
		str = "ThËp lôc s¸t ®Êu"
	end
	
	if( sectionname == "ZoneMatch" ) then
		title = 73 + awardtype
		str = "§oµn ®éi khu vùc ®Êu"
	end

	Title_AddTitle(title, 1, 30 * 24 * 60 * 60 * 18)
	Title_ActiveTitle( title )
	SetTask( ZONEAWARD_TASKID_TITLEID, title )
	if ( awardtype == 1 ) then
		str = str.."Qu¸n qu©n"
	elseif ( awardtype == 2 ) then
		str = str.."¸ qu©n"
	else
		str = str.."H¹ng 3"
	end
	Msg2Player( "Chóc mõng b¹n ®¹t ®­îc"..str.."Danh hiÖu" )
end

