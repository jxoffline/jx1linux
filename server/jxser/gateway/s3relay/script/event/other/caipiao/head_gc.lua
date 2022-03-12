
Include("\\script\\lib\\objbuffer_head.lua")
tbCaiPiao = {}


tbCaiPiao.SAVE_KEY			= "EVENT_cailuhongbao"
tbCaiPiao.DK_STAGE			= 1
tbCaiPiao.DK_TYPE			= 2
--tbCaiPiao.DK_PLDATE			= 4	
tbCaiPiao.DK_NUMBER_COUNT			= 3	
--tbCaiPiao.DK_NUMBER_NAME			= 4
tbCaiPiao.DK_RESULT_NUMBER			= 5
tbCaiPiao.DK_RESULT_NAME		= 6

tbCaiPiao.DK_NAME_COUNT		= 7
tbCaiPiao.DK_NAME_DATA_START		= 8


function tbCaiPiao:_init(nWeekDay)
	--±¾³¡Êý¾Ý
	self.nStage		= 1		--Í¶×¢Õ¾×´Ì¬
	self.nType		= mod(nWeekDay, 10)	--ÀàÐÍ
	
	self.tbData_PL	= {}	--¸öÈËÍ¶×¢Êý×Ö
	
	self.tbNumberCount	= {}	--Í¶×¢Êý×ÖµÄ´ÎÊý
	self.tbNumberName	= {}	--Í¶×¢Êý×ÖµÄÃû×Ö
	
	--ÖÐ½±
	self.nResultNumber	= 0		--ÖÐ½±Êý×Ö
	self.szPlayerName	= ""	--ÖÐ½±Íæ¼ÒÃû
	
	self.nWeekDay	= nWeekDay	
	self.nRecordDataCount = 0
	self.tbRecordDataKey = {}
end

function tbCaiPiao:SavePL_Data(nWeekDay, szName, tbData)
	if self.tbRecordDataKey[szName] == nil then
		self.nRecordDataCount = self.nRecordDataCount + 1
		self.tbRecordDataKey[szName] = self.nRecordDataCount		
		self:Save(nWeekDay, self.DK_NAME_COUNT, self.nRecordDataCount)
	end
	self:Save(nWeekDay, self.DK_NAME_DATA_START + self.tbRecordDataKey[szName], {szName, tbData})
end

function tbCaiPiao:SaveAllPL_Data(nWeekDay, tbData_PL)
	for szName, tbData in tbData_PL do
		self:SavePL_Data(nWeekDay, szName, tbData)
	end
end


function tbCaiPiao:LoadAllPL_Data(nWeekDay)
	local nCount = self:Load(nWeekDay, self.DK_NAME_COUNT) or 0
	local tbData_PL = {}
	local tbRecordDataKey = {}
	
	if nCount ~= nil and nCount ~= 0 then
		for i=1, nCount do 
			local szName, tbData = self:LoadPL_Data(nWeekDay, i)
			if szName and tbData then
				tbData_PL[szName] = tbData
				tbRecordDataKey[szName] = i
			end
			
		end
	end
	return tbData_PL, tbRecordDataKey, nCount
end

function tbCaiPiao:LoadPL_Data(nWeekDay, nIndex)
	local tmp = self:Load(nWeekDay, self.DK_NAME_DATA_START + nIndex)
	if tmp ~= nil and type(tmp) == "table" and getn(tmp) == 2 then
		if type(tmp[1]) == "string" and type(tmp[2]) == "table" then
			return tmp[1], tmp[2]
		end
	end
end



function tbCaiPiao:Save(nWeekDay, nKey, var)
	local handle = OB_Create()
	ObjBuffer:PushObject(handle, var)	
	OB_SaveShareData(handle, self.SAVE_KEY, nWeekDay, nKey)
	OB_Release(handle)
end

function tbCaiPiao:Load(nWeekDay, nKey)
	local handle = OB_Create()	
	OB_LoadShareData(handle, self.SAVE_KEY, nWeekDay, nKey)
	local var = nil
	if OB_IsEmpty(handle) ~= 1 then
		var = ObjBuffer:PopObject(handle)
	end
	OB_Release(handle)
	return var
end

function tbCaiPiao:SaveAllData()
	local nWeekDay = self.nWeekDay
	self:Save(nWeekDay, self.DK_STAGE,			self.nStage			)
	self:Save(nWeekDay, self.DK_TYPE,			self.nType		    )

--	self:Save(nWeekDay, self.DK_PLDATE,			self.tbData_PL		)
	self:Save(nWeekDay, self.DK_NUMBER_COUNT,	self.tbNumberCount  )
	
	self:Save(nWeekDay, self.DK_RESULT_NUMBER,	self.nResultNumber  )
	self:Save(nWeekDay, self.DK_RESULT_NAME,	self.szResultName	)
	
	
	self:SaveAllPL_Data(nWeekDay, self.tbData_PL)
	
end

function tbCaiPiao:LoadAllData(nWeekDay)
	self.nWeekDay		= nWeekDay
	self.nStage			= self:Load(nWeekDay, self.DK_STAGE			)
	self.nType			= self:Load(nWeekDay, self.DK_TYPE			)

--	self.tbData_PL		= self:Load(nWeekDay, self.DK_PLDATE		)
	self.tbNumberCount	= self:Load(nWeekDay, self.DK_NUMBER_COUNT	)
	
	self.nResultNumber	= self:Load(nWeekDay, self.DK_RESULT_NUMBER	)
	self.szResultName	= self:Load(nWeekDay, self.DK_RESULT_NAME	)
	
	self.tbData_PL, self.tbRecordDataKey, self.nRecordDataCount = self:LoadAllPL_Data(nWeekDay)
end


function tbCaiPiao:CheckRound(nWeekDay)
	if self:Load(nWeekDay, self.DK_STAGE) == nil then
		return
	else
		return 1
	end
end

function tbCaiPiao:ClearRound(nWeekDay)
	self:_init(nWeekDay)
	self.nStage = 0
	self:SaveAllData()
end 


function tbCaiPiao:NewRound(nWeekDay)
	self:_init(nWeekDay)
	self:SaveAllData()
end

function tbCaiPiao:SetStage(nStage)
	self.nStage = nStage
	self:Save(self.nWeekDay, self.DK_STAGE, self.nStage)
end

function tbCaiPiao:MegeCountData(tbSrcData, tbTmpData)
	if not tbTmpData then
		return
	end
	for nNumber, nCount in tbTmpData do
		if type(tbTmpData[nNumber]) == "number" then
			if type(tbSrcData[nNumber]) == "number" then
				tbSrcData[nNumber] = tbTmpData[nNumber] + tbSrcData[nNumber]
			else
				tbSrcData[nNumber] = tbTmpData[nNumber]
			end
		end
	end
end

function tbCaiPiao:TransData(tbNumber_Name, tbData_PL)
	
	if not tbData_PL then 
		self:DebugOut("TransData, tbData_PL is nil")
		return
	end
	for szName, tbData in tbData_PL do
		for nNumber, bFlag in tbData do
			if bFlag == 1 then
				tbNumber_Name[nNumber] = tbNumber_Name[nNumber] or {}
				tbNumber_Name[nNumber][szName] = 1
			end
		end
	end
end 

function tbCaiPiao:GetCurAwardWeekDay()
	local nHM = tonumber(date("%H%M"))
	local nWeek = tonumber(date("%W"))
	
	
	local nDay = tonumber(date("%w"))
	
	if nDay == 1 and (0000 <= nHM and nHM < 2000) then --¿çÄê¾Í»á³öÎÊÌâ£¬Õâ´Î»î¶¯²»¿çÄê£¬ÔÝÊ±²»´¦Àí
		nWeek = nWeek - 1
		return nWeek*10
	elseif nDay == 0 and (0000 <= nHM and nHM < 2000) then
		return nWeek*10+6
	elseif nDay == 6 and (0000 <= nHM and nHM < 2000) then
		return nWeek*10 + 5
	elseif (nDay == 0 or nDay == 5 or nDay == 6) and (2100 <= nHM and nHM <= 2400) then
		return nWeek*10 + nDay
	else
		return 
	end
end

function tbCaiPiao:CalcResult()
	self:SetStage(2)
	
	self.nResultNumber	= 0
	self.szPlayerName	= ""
	local tbData = self.tbNumberCount
	local tbTransData = {}
	
	self:TransData(tbTransData, self.tbData_PL)
	
	if self.nType == 0 then
		self:DebugOut("ºÏ²¢Êý¾Ý--(ºÅÂë£¬´ÎÊý)")
		local nWeek = floor(self.nWeekDay / 10)
		--ÖÜÎåÊý¾Ý
		local tbTmpCount = self:Load(nWeek*10+5, self.DK_NUMBER_COUNT)
		local tbPL_DataTmp = self:LoadAllPL_Data(nWeek*10+5)
		self:MegeCountData(tbData, tbTmpCount)
		
		self:TransData(tbTransData, tbPL_DataTmp)
		--ÖÜÁùÊý¾Ý
		tbTmpCount = self:Load(nWeek*10+6, self.DK_NUMBER_COUNT)
		
		tbPL_DataTmp = self:LoadAllPL_Data(nWeek*10+6)
		self:MegeCountData(tbData, tbTmpCount)
		
		self:TransData(tbTransData, tbPL_DataTmp)
	end
		
	if not tbData or getn(tbData) <= 0 then
		self:DebugOut("¼ÆËãÐèÒªµÄÊý¾ÝÎª¿Õ")
		return 
	end	
	
	local nMinNumber = 0
	--²éÕÒ×îÐ¡ÇÒÍ¶×¢ÊýÎª1µÄÊý×Ö
	
	
	local tbTmpSet = {}
	for nNumber, nCount in tbData do 
		
		if type(nNumber) == "number" and nCount == 1 then
			if nMinNumber == 0 or nMinNumber > nNumber then
				nMinNumber = nNumber
			end
		elseif type(nNumber) == "number" then
			tinsert(tbTmpSet, nNumber)
		end
	end
	
	if tbTransData and tbTransData[nMinNumber] then
		for k, v in tbTransData[nMinNumber] do
			self.szPlayerName = k
		end
	end
	
	if nMinNumber <= 0 then --Ã»ÈËÖÐ½±£¬Ëæ»úÒ»¸öÈËÖÐ½±
		local nTmpNumber = tbTmpSet[random(1, getn(tbTmpSet))]
		tbTmpSet = {}
		for k,v in tbTransData[nTmpNumber] do
			if v then tinsert(tbTmpSet, k) end
		end
		self.szPlayerName = tbTmpSet[random(1, getn(tbTmpSet))]
	end
	
	self.nResultNumber		= nMinNumber
	
	self:Save(self.nWeekDay, self.DK_RESULT_NAME,	self.szPlayerName)
	self:Save(self.nWeekDay, self.DK_RESULT_NUMBER,	self.nResultNumber)
	self:SetStage(3)
	
	
	self:AnnounceResult(self.nType, self.nResultNumber, self.szPlayerName)
	
	return self.nResultNumber, self.szPlayerName
end

function tbCaiPiao:AnnounceResult(nType, nResultNumber, szPlayerName)
	local szMsg = ""
	if nType ~= 0 then		
		if nResultNumber > 0 then
			szMsg = format("Chóc mõng <color=green>%s<color> lµ ng­êi may m¾n h«m nay ®· chän <color=green>%s<color>.", szPlayerName, nResultNumber)
		else
			szMsg = format("H«m nay kh«ng cã sè phï hîp víi yªu cÇu, ng­êi ch¬i may m¾n nhÊt lµ <color=green>%s<color>", szPlayerName)
		end
	else
		if nResultNumber > 0 then
			szMsg = format("Chóc mõng cao thñ <color=green>%s<color> chän sè nhá nhÊt vµ duy nhÊt lµ <color=green>%s<color>", szPlayerName, nResultNumber)
		else
			szMsg = format("TuÇn nµy kh«ng cã sè phï hîp, ng­êi ch¬i may m¾n nhÊt lµ <color=green>%s<color>", szPlayerName)
		end
	end
	self:DebugOut(szMsg)
	GlobalExecute(format("dw AddLocalCountNews([[%s]], 2)", szMsg))
	GlobalExecute(format("dw Msg2SubWorld([[%s]])", szMsg))
end


function tbCaiPiao:Wager(szName, nNumber)
	if self.nStage ~= 1 then
		
		return -1
	end
	
	if nNumber <= 0 then
		
		return 0
	end
	
	if not self.tbData_PL[szName] then
		self.tbData_PL[szName] = {}
	end
	
	if self.tbData_PL[szName][nNumber] ~= 1 then --Íæ¼ÒÊý¾ÝÓÐ¸Ä±ä²Å±£´æ
		self.tbData_PL[szName][nNumber]= 1
		self:SavePL_Data(self.nWeekDay, szName, self.tbData_PL[szName])
	end
	
	if self.tbNumberCount[nNumber] then
		self.tbNumberCount[nNumber] = self.tbNumberCount[nNumber] + 1
	else
		self.tbNumberCount[nNumber] = 1
	end
	self:Save(self.nWeekDay, self.DK_NUMBER_COUNT, self.tbNumberCount)
	return nNumber
	
end

function tbCaiPiao:DebugOut(...)
	if not arg or getn(arg) <= 0 then
		return
	end
	local szMsg = ""
	
	for i=1, getn(arg) do
		szMsg = szMsg.."    "..arg[i]
	end
	OutputMsg(szMsg)
end

function tbCaiPiao:LoadRound(nWeekDay)
	local nType	 	= mod(nWeekDay,10)
	self.nWeekDay	= nWeekDay
	if not self:CheckRound(nWeekDay) then
		
		self:DebugOut("D÷ liÖu chän sè", nWeekDay, "nµy kh«ng tån t¹i")
		return 
	else
		self:LoadAllData(nWeekDay)
		self:DebugOut("¶ÁÈ¡", nWeekDay, "Êý¾Ý")
		return 1
	end
end




-------------------½ÓÊÕµ½GameserverµÄÉêÇë

function tbCaiPiao_SetStage(ParamHandle, ResultHandle)
	local nStage	= ObjBuffer:PopObject(ParamHandle)
	
	if nStage == 2 then
		tbCaiPiao:CalcResult()
	else
		tbCaiPiao:SetStage(nStage)
	end
	
end

function tbCaiPiao_ApplyGetInfo(ParamHandle, ResultHandle)
	
	local nWeekDay = ObjBuffer:PopObject(ParamHandle)
	local tbData_PL = tbCaiPiao:LoadAllPL_Data(nWeekDay)
	local szMsg = ""
	for szName, tbNumber in tbData_PL do
		szMsg = szMsg..szName.."<enter>"
		
		tbCaiPiao:DebugOut(szName)
		for nNumber, bFlag in tbNumber do
			szMsg = szMsg.." "..nNumber.." "
		end
		
		tbCaiPiao:DebugOut(szMsg)
		szMsg = szMsg .."<enter>"
		szMsg = szMsg .."<enter>"
	end
	
	ObjBuffer:PushObject(ResultHandle, szMsg)	
end




--Í¶×¢ 
function tbCaiPiao_Wager(ParamHandle, ResultHandle)	
	
	local szName	= ObjBuffer:PopObject(ParamHandle)
	local nNumber	= ObjBuffer:PopObject(ParamHandle)
	
	local nResult	= tbCaiPiao:Wager(szName, nNumber)
	
	ObjBuffer:PushObject(ResultHandle, nResult)	
end


--»ñµÃ½á¹ûÊý¾Ý
function tbCaiPiao_GetResultData(ParamHandle, ResultHandle)
	local nWeekDay	= ObjBuffer:PopObject(ParamHandle)
	
	local nType	= tbCaiPiao:Load(nWeekDay, tbCaiPiao.DK_TYPE)
	local nResultNumber = tbCaiPiao:Load(nWeekDay, tbCaiPiao.DK_RESULT_NUMBER)
	local szPlayerName	= tbCaiPiao:Load(nWeekDay, tbCaiPiao.DK_RESULT_NAME)
	
	ObjBuffer:PushObject(ResultHandle, {nType, nResultNumber, szPlayerName, nWeekDay})	
end

function tbCaiPiao_StartRound(ParamHandle, ResultHandle)
	local nWeekDay	= ObjBuffer:PopObject(ParamHandle)
	tbCaiPiao:LoadRound(nWeekDay)
end


function tbCaiPiao:Test(nWeekDay, bOnly)
	
	self:ClearRound(nWeekDay)
	self:NewRound(nWeekDay)
	local nWeek = mod(nWeekDay, 10)
	local tb = 
	{
		[5] = 
		{
			{"test1006", 88},
			{"test1005",99 },
			{"test1005", 100},
			{"test1005", 101},
			{"test1006", 99},
			{"test1006", 100},
			{"test1006", 101},
	
		},
		[6] = 
		{
			
			{"test1005",99 },
			{"test1006", 99},
			{"test1005", 100},
			{"test1005", 101},
			
	
		},
		[0] = 
		{
			
			{"test1005", 100},
			{"test1005", 101},
			
		}
	}
	
	
	for i=1, getn(tb[nWeek]) do
		self:Wager(tb[nWeek][i][1], tb[nWeek][i][2])
		
	end
	if bOnly == 1 then
		return
	end
	
	self:CalcResult()
	
	
	local nResultNumber = tbCaiPiao:Load(nWeekDay, tbCaiPiao.DK_RESULT_NUMBER)
	local szPlayerName	= tbCaiPiao:Load(nWeekDay, tbCaiPiao.DK_RESULT_NAME)
	
	tbCaiPiao:DebugOut("Áì½±---------")
	tbCaiPiao:DebugOut(nResultNumber, szPlayerName)
	
	
	tbCaiPiao:DebugOut("Í¶×¢Çé¿ö---------")
	
	local tbData_PL = self.tbData_PL
	if not tbData_PL then
		return 
	end
	for szName, tbNumber in tbData_PL do
		tbCaiPiao:DebugOut(szName)
		local szMsg = ""
		for nNumber, bFlag in tbNumber do
			szMsg = szMsg.." "..nNumber.." "
		end
		
		tbCaiPiao:DebugOut(szMsg)
		
	end
	
	tbCaiPiao:DebugOut("---------")
end


function tbCaiPiao_AutoTest(ParamHandle, ResultHandle)
	local nWeekDay	= ObjBuffer:PopObject(ParamHandle)
	local nOnly 	= ObjBuffer:PopObject(ParamHandle)
	
	if nWeekDay == 0 then
		tbCaiPiao:Test(55)
		tbCaiPiao:Test(56)
		tbCaiPiao:Test(50)
	elseif nWeekDay == 0 and nOnly == 1 then
		tbCaiPiao:Test(nWeekDay, 1)
	else
		tbCaiPiao:Test(nWeekDay, 0)
	end
end
