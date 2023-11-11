Include("\\script\\lib\\objbuffer_head.lua")

tbZhuShuai = {}
tbZhuShuai.tbPreResult = {szName = "", nMark = -1,}
tbZhuShuai.tbNowResult = {szName = "", nMark = -1,}
tbZhuShuai.nNextSortTime = 0	-- 下次排序时间

tbZhuShuai.SAVE_KEY = "EVENT_April_zhushuai"
tbZhuShuai.UPDATE_KEY = 1
tbZhuShuai.RESULT_KEY = 2

tbZhuShuai.tbStartDay = {2012,3,29,10,0} -- 以2012/3/29 10：00 为周四的起始时间
tbZhuShuai.nTempTime = 7 * 24 * 60 * 60		-- 每周排名一次

function tbZhuShuai:Save(nKey1, nKey2, tbValue)
	local handle = OB_Create()
	ObjBuffer:PushObject(handle, tbValue)	
	OB_SaveShareData(handle, self.SAVE_KEY, nKey1, nKey2)
	OB_Release(handle)
end

function tbZhuShuai:Load(nKey1, nKey2, varDefault)
	local handle = OB_Create()
	OB_LoadShareData(handle, self.SAVE_KEY, nKey1, nKey2)
	local tbValue = varDefault
	if OB_IsEmpty(handle) ~= 1 then
		tbValue = ObjBuffer:PopObject(handle)
	end
	OB_Release(handle)
	return tbValue
end

function tbZhuShuai:CalNextTime(nCurTime, nNextSortTime)
	local nCount = floor( (nCurTime - nNextSortTime)/self.nTempTime) + 1
	nNextSortTime = nNextSortTime + nCount * self.nTempTime
	if nNextSortTime <= nCurTime then
		nNextSortTime = nNextSortTime + self.nTempTime
	end
	return nNextSortTime
end

function tbZhuShuai:CheckUpdate()
	local nCurTime = GetSysCurrentTime()
--	OutputMsg("tbZhuShuai:CheckUpdate nCurTime = " .. nCurTime)
--	OutputMsg("self.nNextSortTime = " .. self.nNextSortTime)
	if nCurTime >= self.nNextSortTime then
		self.nNextSortTime = self:CalNextTime(nCurTime, self.nNextSortTime)
		self:Save(self.UPDATE_KEY, 0, {self.nNextSortTime})
		
		self:OutMsg("tbZhuShuai:CheckUpdate", format("SAVE nNextSortTime = %d", self.nNextSortTime))
		return 1
	end
	return 0
end

function tbZhuShuai:UpdatePreZhuShuai()	
	self.tbPreResult.szName = self.tbNowResult.szName
	self.tbPreResult.nMark = self.tbNowResult.nMark
	self.tbNowResult.szName = ""
	self.tbNowResult.nMark = -1
	
	self:SaveResult()
end

function tbZhuShuai:SaveResult()
	local tbValue = {}
	tbValue[1] = self.tbPreResult.szName
	tbValue[2] = self.tbPreResult.nMark
	tbValue[3] = self.tbNowResult.szName
	tbValue[4] = self.tbNowResult.nMark
	self:Save(self.RESULT_KEY, 0, tbValue)
	
	self:OutMsg("tbZhuShuai:SaveResult", 
			format("SAVE preName = %s, preMark = %d, nowName = %s, nowMark = %d", tbValue[1],tbValue[2],tbValue[3],tbValue[4]))
end

function tbZhuShuai:s2g_AddDate(ParamHandle, ResultHandle)
	if self:CheckUpdate() == 1 then
		self:UpdatePreZhuShuai()
	end
	local szName = ObjBuffer:PopObject(ParamHandle)
	local nMark = ObjBuffer:PopObject(ParamHandle)
	
	if nMark > self.tbNowResult.nMark then
		self.tbNowResult.nMark = nMark
		self.tbNowResult.szName = szName
		self:SaveResult()
	end
end

function tbZhuShuai:g2s_PreZhuShuai(ParamHandle, ResultHandle)
	if self:CheckUpdate() == 1 then
		self:UpdatePreZhuShuai()
	end

	local nPlayerName = ObjBuffer:PopObject(ParamHandle)
	local nParam = ObjBuffer:PopObject(ParamHandle)
	
	local szName = self.tbPreResult.szName
	local nMark = max(self.tbPreResult.nMark,0)
	
	ObjBuffer:PushObject(ResultHandle, szName)
	ObjBuffer:PushObject(ResultHandle, nMark)
	
	ObjBuffer:PushObject(ResultHandle, nPlayerName)
	ObjBuffer:PushObject(ResultHandle, nParam)
end

function tbZhuShuai:g2s_NowZhuShuai(ParamHandle, ResultHandle)
	if self:CheckUpdate() == 1 then
		self:UpdatePreZhuShuai()
	end
	
	local nPlayerName = ObjBuffer:PopObject(ParamHandle)
	
	local szName = self.tbNowResult.szName
	local nMark = max(self.tbNowResult.nMark,0)
	
	ObjBuffer:PushObject(ResultHandle, szName)
	ObjBuffer:PushObject(ResultHandle, nMark)
	
	ObjBuffer:PushObject(ResultHandle, nPlayerName)
end

function tbZhuShuai:LoadMark()
	local tbValue = self:Load(self.RESULT_KEY, 0, {"",-1,"",-1})
	self.tbPreResult.szName = tbValue[1]
	self.tbPreResult.nMark = tbValue[2]
	self.tbNowResult.szName = tbValue[3]
	self.tbNowResult.nMark = tbValue[4]
	
	self:OutMsg("tbZhuShuai:LoadMark", 
			format("Load preName = %s, preMark = %d, nowName = %s, nowMark = %d", tbValue[1],tbValue[2],tbValue[3],tbValue[4]))
end

function tbZhuShuai:LoadNextSortTime()
	tbValue = self:Load(self.UPDATE_KEY, 0, {0})
	self.nNextSortTime = tbValue[1]
	if self.nNextSortTime == 0 then
		local nCurTime = GetSysCurrentTime()
		local nTime = Tm2Time(self.tbStartDay[1],self.tbStartDay[2],self.tbStartDay[3],self.tbStartDay[4],self.tbStartDay[5])
		-- 计算当前时间和2012/3/1 10:00 差了几周，根据差值，计算下次更新排名的时间
		self.nNextSortTime = self:CalNextTime(nCurTime, nTime)
		self:Save(self.UPDATE_KEY, 0, {self.nNextSortTime})
	end
end

function tbZhuShuai:LoadData()
	self:LoadMark()
	self:LoadNextSortTime()
end

function tbZhuShuai:OutMsg(szFuncName, szKey)
--	OutputMsg("------------------------")
--	OutputMsg(format("szFuncName = %s", szFuncName))
--	OutputMsg(szKey)
--	OutputMsg("------------------------")
end

tbZhuShuai:LoadData()