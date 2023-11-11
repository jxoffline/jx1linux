-------------测试用
Include("\\script\\event\\wulin_final_match\\awardevent.lua");

t_nGateWayClientID = 0
t_strPlayerAccount = ""
t_strPlayerName = ""
--t_TaskTab = {}

function GetGateWayClientID()
	return t_nGateWayClientID
end

function GetAccount()
	return t_strPlayerAccount
end

function GetName()
	return t_strPlayerName
end

function GetTask( nTaskID )
    if (t_TaskTab == nil) then
        --Msg2Player("Init Task!")
        t_TaskTab = {}
    end
	if (t_TaskTab[GetName()] == nil) then
		t_TaskTab[GetName()] = {}
	end
	if (t_TaskTab[GetName()][nTaskID] == nil) then
		t_TaskTab[GetName()][nTaskID] = 0
	end
	return t_TaskTab[GetName()][nTaskID]
end

function SetTask( nTaskID , nValue )
    if (t_TaskTab == nil) then
        --Msg2Player("Init Task!")
        t_TaskTab = {}
    end
	if (t_TaskTab[GetName()] == nil) then
		t_TaskTab[GetName()] = {}
	end
	t_TaskTab[GetName()][nTaskID] = nValue
end

function AddItem()
	WriteLog("AddItem")
end

function AddGoldItem()
	WriteLog("AddGoldItem")
end

function Say()
end

--测试正常领取
function TestNormal()
	for i = 1, getn( WL_TAB_ZONEINFO ) do
		t_nGateWayClientID = WL_TAB_ZONEINFO[ i ][ 2 ]
		local strZoneSection = tostring(GetGateWayClientID())
		WL_FILE_MATCHAWARD = wl_get_zonefile_match( strZoneSection )
		WL_FILE_ACTORAWARD = wl_get_zonefile_actor( strZoneSection )
		
		biwu_loadfile( WL_FILE_MATCHAWARD )
		local nAccountCount = safe_tonumber(biwu_getdata( WL_FILE_MATCHAWARD, strZoneSection, "Count" ))
		if (nAccountCount>0) then
			for j=1, nAccountCount do
				t_strPlayerAccount = biwu_getdata( WL_FILE_MATCHAWARD, strZoneSection, "Account"..tostring(j) )
				t_strPlayerName = biwu_getdata( WL_FILE_MATCHAWARD, t_strPlayerAccount, "Key" )
				
				local nAwardLevel
				nAwardLevel = safe_tonumber(biwu_getdata( WL_FILE_MATCHAWARD, t_strPlayerAccount, "SingleMatch" ))
				if (nAwardLevel > 0) then
					if(wl_FinalTakeMatch(ZONEAWARD_TASKID_SINGLE) == 0) then
						print("Can't get SingleMatch award! "..GetGateWayClientID().."("..GetAccount()..")["..GetName().."]")
					end
				end
				nAwardLevel = safe_tonumber(biwu_getdata( WL_FILE_MATCHAWARD, t_strPlayerAccount, "DoubleMatch" ))
				if (nAwardLevel > 0) then
					if(wl_FinalTakeMatch(ZONEAWARD_TASKID_DOUBLE) == 0) then
						print("Can't get DoubleMatch award! "..GetGateWayClientID().."("..GetAccount()..")["..GetName().."]")
					end
				end
				nAwardLevel = safe_tonumber(biwu_getdata( WL_FILE_MATCHAWARD, t_strPlayerAccount, "FiveMatch" ))
				if (nAwardLevel > 0) then
					if(wl_FinalTakeMatch(ZONEAWARD_TASKID_FIVE) == 0) then
						print("Can't get FiveMatch award! "..GetGateWayClientID().."("..GetAccount()..")["..GetName().."]")
					end
				end
				nAwardLevel = safe_tonumber(biwu_getdata( WL_FILE_MATCHAWARD, t_strPlayerAccount, "TenMatch" ))
				if (nAwardLevel > 0) then
					if(wl_FinalTakeMatch(ZONEAWARD_TASKID_TEN) == 0) then
						print("Can't get TenMatch award! "..GetGateWayClientID().."("..GetAccount()..")["..GetName().."]")
					end
				end
				nAwardLevel = safe_tonumber(biwu_getdata( WL_FILE_MATCHAWARD, t_strPlayerAccount, "SixteenMatch" ))
				if (nAwardLevel > 0) then
					if(wl_FinalTakeMatch(ZONEAWARD_TASKID_SIXTEEN) == 0) then
						print("Can't get SixteenMatch award! "..GetGateWayClientID().."("..GetAccount()..")["..GetName().."]")
					end
				end
				
				biwu_loadfile( WL_FILE_ACTORAWARD )
				nAwardLevel = safe_tonumber(biwu_getdata( WL_FILE_ACTORAWARD, strZoneSection, "ZoneMatch" ))
				if (nAwardLevel > 0) then
					if(wl_FinalTakeMatch(ZONEAWARD_TASKID_ZONE) == 0) then
						print("Can't get ZoneMatch award! "..GetGateWayClientID().."("..GetAccount()..")["..GetName().."]")
					end
				end
				nAwardLevel = safe_tonumber(biwu_getdata( WL_FILE_ACTORAWARD, strZoneSection, "ZoneAwardType" ))
				if (nAwardLevel > 0) then
					if(wl_FinalTakeMatch(ZONEAWARD_TASKID_ACTORAWARD) == 0) then
						print("Can't get Actor award! "..GetGateWayClientID().."("..GetAccount()..")["..GetName().."]")
					end
					if(champ_checktitle() == 7 and wl_FinalTakeMatch(ZONEAWARD_TASKID_LEADAWARD) == 0) then
						print("Can't get Lead award! "..GetGateWayClientID().."("..GetAccount()..")["..GetName().."]")
					end
				end
				
				biwu_loadfile( WL_FILE_ZONEAWARD )
				nAwardLevel = safe_tonumber(biwu_getdata( WL_FILE_ZONEAWARD, strZoneSection, "First" ))
				if (nAwardLevel > 0) then
					if(wl_FinalTakeMatch(ZONEAWARD_TASKID_FIRST, nAwardLevel) == 0) then
						print("Can't get First award! "..GetGateWayClientID().."("..GetAccount()..")["..GetName().."]")
					end
				end
				nAwardLevel = safe_tonumber(biwu_getdata( WL_FILE_ZONEAWARD, strZoneSection, "Second" ))
				if (nAwardLevel > 0) then
					if(wl_FinalTakeMatch(ZONEAWARD_TASKID_SECOND, nAwardLevel) == 0) then
						print("Can't get Second award! "..GetGateWayClientID().."("..GetAccount()..")["..GetName().."]")
					end
				end
				nAwardLevel = safe_tonumber(biwu_getdata( WL_FILE_ZONEAWARD, strZoneSection, "Third" ))
				if (nAwardLevel > 0) then
					if(wl_FinalTakeMatch(ZONEAWARD_TASKID_THIRD, nAwardLevel) == 0) then
						print("Can't get Third award! "..GetGateWayClientID().."("..GetAccount()..")["..GetName().."]")
					end
				end
			end
		end
	end
	
	print("Ki觤 tra ho祅 th祅h!!")
end

--完全测试
function TestAll()
	for i = 1, getn( WL_TAB_ZONEINFO ) do
		t_nGateWayClientID = WL_TAB_ZONEINFO[ i ][ 2 ]
		local strZoneSection = tostring(GetGateWayClientID())
		WL_FILE_MATCHAWARD = wl_get_zonefile_match( strZoneSection )
		WL_FILE_ACTORAWARD = wl_get_zonefile_actor( strZoneSection )
		
		biwu_loadfile( WL_FILE_MATCHAWARD )
		local nAccountCount = safe_tonumber(biwu_getdata( WL_FILE_MATCHAWARD, strZoneSection, "Count" ))
		if (nAccountCount>0) then
			for j=1, nAccountCount do
				t_strPlayerAccount = biwu_getdata( WL_FILE_MATCHAWARD, strZoneSection, "Account"..tostring(j) )
				t_strPlayerName = biwu_getdata( WL_FILE_MATCHAWARD, t_strPlayerAccount, "Key" )
				
				--正常测试
				local nAwardLevel
				nAwardLevel = safe_tonumber(biwu_getdata( WL_FILE_MATCHAWARD, t_strPlayerAccount, "SingleMatch" ))
				if (nAwardLevel > 0) then
					if(wl_FinalTakeMatch(ZONEAWARD_TASKID_SINGLE) == 0) then
						print("Can't get SingleMatch award! "..GetGateWayClientID().."("..GetAccount()..")["..GetName().."]")
					end
				end
				nAwardLevel = safe_tonumber(biwu_getdata( WL_FILE_MATCHAWARD, t_strPlayerAccount, "DoubleMatch" ))
				if (nAwardLevel > 0) then
					if(wl_FinalTakeMatch(ZONEAWARD_TASKID_DOUBLE) == 0) then
						print("Can't get DoubleMatch award! "..GetGateWayClientID().."("..GetAccount()..")["..GetName().."]")
					end
				end
				nAwardLevel = safe_tonumber(biwu_getdata( WL_FILE_MATCHAWARD, t_strPlayerAccount, "FiveMatch" ))
				if (nAwardLevel > 0) then
					if(wl_FinalTakeMatch(ZONEAWARD_TASKID_FIVE) == 0) then
						print("Can't get FiveMatch award! "..GetGateWayClientID().."("..GetAccount()..")["..GetName().."]")
					end
				end
				nAwardLevel = safe_tonumber(biwu_getdata( WL_FILE_MATCHAWARD, t_strPlayerAccount, "TenMatch" ))
				if (nAwardLevel > 0) then
					if(wl_FinalTakeMatch(ZONEAWARD_TASKID_TEN) == 0) then
						print("Can't get TenMatch award! "..GetGateWayClientID().."("..GetAccount()..")["..GetName().."]")
					end
				end
				nAwardLevel = safe_tonumber(biwu_getdata( WL_FILE_MATCHAWARD, t_strPlayerAccount, "SixteenMatch" ))
				if (nAwardLevel > 0) then
					if(wl_FinalTakeMatch(ZONEAWARD_TASKID_SIXTEEN) == 0) then
						print("Can't get SixteenMatch award! "..GetGateWayClientID().."("..GetAccount()..")["..GetName().."]")
					end
				end
				
				biwu_loadfile( WL_FILE_ACTORAWARD )
				nAwardLevel = safe_tonumber(biwu_getdata( WL_FILE_ACTORAWARD, strZoneSection, "ZoneMatch" ))
				if (nAwardLevel > 0) then
					if(wl_FinalTakeMatch(ZONEAWARD_TASKID_ZONE) == 0) then
						print("Can't get ZoneMatch award! "..GetGateWayClientID().."("..GetAccount()..")["..GetName().."]")
					end
				end
				nAwardLevel = safe_tonumber(biwu_getdata( WL_FILE_ACTORAWARD, strZoneSection, "ZoneAwardType" ))
				if (nAwardLevel > 0) then
					if(wl_FinalTakeMatch(ZONEAWARD_TASKID_ACTORAWARD) == 0) then
						print("Can't get Actor award! "..GetGateWayClientID().."("..GetAccount()..")["..GetName().."]")
					end
					if(champ_checktitle() == 7 and wl_FinalTakeMatch(ZONEAWARD_TASKID_LEADAWARD) == 0) then
						print("Can't get Lead award! "..GetGateWayClientID().."("..GetAccount()..")["..GetName().."]")
					end
				end
				
				biwu_loadfile( WL_FILE_ZONEAWARD )
				nAwardLevel = safe_tonumber(biwu_getdata( WL_FILE_ZONEAWARD, strZoneSection, "First" ))
				if (nAwardLevel > 0) then
					if(wl_FinalTakeMatch(ZONEAWARD_TASKID_FIRST, nAwardLevel) == 0) then
						print("Can't get First award! "..GetGateWayClientID().."("..GetAccount()..")["..GetName().."]")
					end
				end
				nAwardLevel = safe_tonumber(biwu_getdata( WL_FILE_ZONEAWARD, strZoneSection, "Second" ))
				if (nAwardLevel > 0) then
					if(wl_FinalTakeMatch(ZONEAWARD_TASKID_SECOND, nAwardLevel) == 0) then
						print("Can't get Second award! "..GetGateWayClientID().."("..GetAccount()..")["..GetName().."]")
					end
				end
				nAwardLevel = safe_tonumber(biwu_getdata( WL_FILE_ZONEAWARD, strZoneSection, "Third" ))
				if (nAwardLevel > 0) then
					if(wl_FinalTakeMatch(ZONEAWARD_TASKID_THIRD, nAwardLevel) == 0) then
						print("Can't get Third award! "..GetGateWayClientID().."("..GetAccount()..")["..GetName().."]")
					end
				end
				
				--过多测试
				if(wl_FinalTakeMatch(ZONEAWARD_TASKID_FIRST, 1) == 1) then
					print("Got more First award! "..GetGateWayClientID().."("..GetAccount()..")["..GetName().."]")
				end
				if(wl_FinalTakeMatch(ZONEAWARD_TASKID_SECOND, 1) == 1) then
					print("Got more Second award! "..GetGateWayClientID().."("..GetAccount()..")["..GetName().."]")
				end
				if(wl_FinalTakeMatch(ZONEAWARD_TASKID_THIRD, 1) == 1) then
					print("Got more Five award! "..GetGateWayClientID().."("..GetAccount()..")["..GetName().."]")
				end
				if(wl_FinalTakeMatch(ZONEAWARD_TASKID_SINGLE) == 1) then
					print("Got more SingleMatch award! "..GetGateWayClientID().."("..GetAccount()..")["..GetName().."]")
				end
				if(wl_FinalTakeMatch(ZONEAWARD_TASKID_FIRST) == 1) then
					print("Got more Ten award! "..GetGateWayClientID().."("..GetAccount()..")["..GetName().."]")
				end
				if(wl_FinalTakeMatch(ZONEAWARD_TASKID_DOUBLE) == 1) then
					print("Got more DoubleMatch award! "..GetGateWayClientID().."("..GetAccount()..")["..GetName().."]")
				end
				if(wl_FinalTakeMatch(ZONEAWARD_TASKID_FIVE) == 1) then
					print("Got more FiveMatch award! "..GetGateWayClientID().."("..GetAccount()..")["..GetName().."]")
				end
				if(wl_FinalTakeMatch(ZONEAWARD_TASKID_TEN) == 1) then
					print("Got more TenMatch award! "..GetGateWayClientID().."("..GetAccount()..")["..GetName().."]")
				end
				if(wl_FinalTakeMatch(ZONEAWARD_TASKID_SIXTEEN) == 1) then
					print("Got more SixteenMatch award! "..GetGateWayClientID().."("..GetAccount()..")["..GetName().."]")
				end
				if(wl_FinalTakeMatch(ZONEAWARD_TASKID_ZONE) == 1) then
					print("Got more ZoneMatch award! "..GetGateWayClientID().."("..GetAccount()..")["..GetName().."]")
				end
				if(wl_FinalTakeMatch(ZONEAWARD_TASKID_ACTORAWARD) == 1) then
					print("Got more Actor award! "..GetGateWayClientID().."("..GetAccount()..")["..GetName().."]")
				end
				if(wl_FinalTakeMatch(ZONEAWARD_TASKID_LEADAWARD) == 1) then
					print("Got more Lead award! "..GetGateWayClientID().."("..GetAccount()..")["..GetName().."]")
				end
			end
		end
	end
	
	print("Ki觤 tra ho祅 th祅h!!")
end

function TestOne(nZoneSection, strAccountName, nKeyName, nTaskID, nCount)
	t_nGateWayClientID = nZoneSection
	t_strPlayerAccount = strAccountName
	t_strPlayerName = nKeyName
	--t_TaskTab = {};
	local nRet = wl_FinalTakeMatch(nTaskID, nCount)
    --Msg2Player(nRet)
	return nRet
end
