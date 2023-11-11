Include("\\script\\misc\\eventsys\\type\\player.lua")
IncludeLib("SETTING")
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\vng_script\\vng_lib\\extpoint.lua")
Include("\\vng_script\\events\\traogiai\\awards\\trao_item_tdb\\head.lua")


function tbGetAwardItemTDB:main()
	if self:CheckIsAccTDB2() ~= 1 then
		return Talk(1,"",format("ChØ cã bang chñ trong danh s¸ch míi nhËn ®­îc th­ëng. Ng­¬i kh«ng n»m trong danh s¸ch nhËn th­ëng gi¶i ®Êu TuyÖt §Ønh Bang."))	
	end
	local szTitle = format("<color=yellow>Gi¶i th­ëng c¸c h¹ ®­îc nhËn:<color>\n")
	local tbOpt = {}	
	if self:CheckTypeAwardTDB2() == 1 then
		tinsert(tbOpt, {format("NhËn MÆt N¹ V­¬ng gi¶"), tbGetAwardItemTDB.GetAwardTDB2, {tbGetAwardItemTDB,TYPE_MATNA}})
		tinsert(tbOpt, {format("NhËn bé An bang"), tbGetAwardItemTDB.GetAwardTDB2, {tbGetAwardItemTDB,TYPE_ANBANG}})
		tinsert(tbOpt, {format("NhËn ngùa B«n Tiªu"), tbGetAwardItemTDB.GetAwardTDB2, {tbGetAwardItemTDB,TYPE_BONTIEU}})
	else
		tinsert(tbOpt, {format("NhËn bé An bang"), tbGetAwardItemTDB.GetAwardTDB2, {tbGetAwardItemTDB,TYPE_ANBANG}})
	end
	tinsert(tbOpt, {format("NhËn ngùa Phi V©n"), tbGetAwardItemTDB.GetAwardTDB2, {tbGetAwardItemTDB,TYPE_PHIVAN}})
	tinsert(tbOpt, {format("NhËn 10 ThiÕt la h¸n lÔ bao"), tbGetAwardItemTDB.tbGetAwardTLH_QHK, {tbGetAwardItemTDB,TYPE_TLH}})
	tinsert(tbOpt, {format("NhËn 10 Qu¶ ®¹i hoµng kim"), tbGetAwardItemTDB.tbGetAwardTLH_QHK, {tbGetAwardItemTDB,TYPE_QUAHK}})
	tinsert(tbOpt, {"Hñy bá "})
	CreateNewSayEx(szTitle, tbOpt)
end
--nhan phan thuong
function tbGetAwardItemTDB:GetAwardTDB2(nType)
	if (self:IsActive() ~=1) then	
		return
	end
	if self:CheckIsAccTDB2() ~= 1 then
		return Talk(1,"",format("ChØ cã bang chñ trong danh s¸ch míi nhËn ®­îc th­ëng. Ng­¬i kh«ng n»m trong danh s¸ch nhËn th­ëng gi¶i ®Êu TuyÖt §Ønh Bang."))	
	end
	local szAccount = GetAccount()
	local nCount = tbAwardItemTDB2[szAccount][nType]
	if not tbPackAward[nType] then
		tbLog:PlayerActionLog(EVENT_LOG_TITLE.."LOI_Khongcobangphanthuong")
		return
	end
	if tbVNG_BitTask_Lib:getBitTask(tbBITTSK_LIMIT_GET_AWARD_TDB2[nType]) == 1 then
		return Talk(1,"","Ch¼ng ph¶i c¸c h¹ ®· nhËn phÇn th­ëng nµy råi ­!")
	end
	if PlayerFunLib:CheckFreeBagCellWH(4, 10, 1, "default") ~= 1  then
		return
	end
	tbVNG_BitTask_Lib:setBitTask(tbBITTSK_LIMIT_GET_AWARD_TDB2[nType], 1)
	VngExtPointLib:SetBitValueByVersion(EXT_POINT_AWARD_TDB_2,0)
	
	tbAwardTemplet:Give(tbPackAward[nType],nCount,{EVENT_LOG_TITLE,"NhanThuongType: "..nType})			
	Talk(1,"",format("Chóc mõng b¹n ®· nhËn phÇn th­ëng thµnh c«ng."))	
end
--nhan phan thuong TLH, Qua HK
function tbGetAwardItemTDB:tbGetAwardTLH_QHK(nType)
	if (self:IsActive() ~=1) then	
		return
	end
	if not tbPackAward[nType] then
		tbLog:PlayerActionLog(EVENT_LOG_TITLE.."LOI_Khongcobangphanthuong")
		return
	end
	local szAccount = GetAccount()
	local nCount = tbAwardItemTDB2[szAccount][nType]
	if not nCount then
		return
	end
	local CurCount  = tbVNG_BitTask_Lib:getBitTask(tbBITTSK_LIMIT_GET_AWARD_TDB2[nType])*10 --mçi lÇn nhËn 10 vËt phÈm
	if CurCount >= nCount then
		return Talk(1,"","Ch¼ng ph¶i c¸c h¹ ®· nhËn hÕt phÇn th­ëng nµy råi ­!")
	end
	if PlayerFunLib:CheckFreeBagCell(10,"Ph¶i cã Ýt nhÊt 10 « trèng míi cã thÓ nhËn th­ëng.")~= 1 then
		return
	end
	tbVNG_BitTask_Lib:addTask(tbBITTSK_LIMIT_GET_AWARD_TDB2[nType], 1)
	VngExtPointLib:SetBitValueByVersion(EXT_POINT_AWARD_TDB_2,0)
	
	tbAwardTemplet:Give(tbPackAward[nType],10,{EVENT_LOG_TITLE,"NhanThuongType: "..nType.."- Soluongdanhan:.."..(CurCount+10)})	
	Talk(1,"",format("Chóc mõng b¹n ®· nhËn phÇn th­ëng thµnh c«ng."))	
end
function tbGetAwardItemTDB:CheckTypeAwardTDB2()
	local szAccount = GetAccount()
	if szAccount == "tyanh71717171" or  szAccount == "hieubeonlyb99" or szAccount == "kevinokok" or szAccount == "xitrum11o2b" then
		 return 1
	end
	return 2
end

function tbGetAwardItemTDB:CheckIsAccTDB2()
	local nCheck  = 0	
	local szAccount = GetAccount()
	--kiem tra lan dau tien chua nhan: ®óng acc vµ ®­îc bËt bit
	for k,v in tbAwardItemTDB2 do
		if (szAccount == k) and (VngExtPointLib:GetBitValueByVersion(EXT_POINT_AWARD_TDB_2) == 1) then
			nCheck = 1
		end
	end
	--kiem tra role nay da nhan thuong roi
	for n,m in tbBITTSK_LIMIT_GET_AWARD_TDB2 do
		if  tbVNG_BitTask_Lib:getBitTask(m) >= 1 then
			nCheck = 1			
		end
	end
	return nCheck
end

function tbGetAwardItemTDB:IsActive()
	local nCurDate = nCurDate or tonumber(GetLocalDate("%Y%m%d%H%M"))
	if nCurDate >= self.nStartDate  and nCurDate <= self.nEndDate  then
		return 1
	end	
	return 0
end

local nDate = tonumber(GetCurrentTime())
if nDate <= Tm2Time(2016, 1, 15, 0 ) then	
	EventSys:GetType("AddNpcOption"):Reg("Sø Gi¶ Trao Th­ëng","NhËn gi¶i th­ëng TuyÖt §Ønh Bang 2", tbGetAwardItemTDB.main,{tbGetAwardItemTDB})
end
