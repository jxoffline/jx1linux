Include("\\script\\lib\\objbuffer_head.lua")

tbQunXia = {}
tbQunXia.tbData = {} --无序排列，记录所有玩家的当前斗酒成功的总酒量
tbQunXia.tbName = {}	--key为玩家名，value为此玩家名对应的在tbQunXia.tbTData的索引
tbQunXia.SAVE_KEY = "EVENT_dayanqunxia"

tbQunXia.Sort = function(tbA, tbB)
	return tbA[2] > tbB[2]
end

function tbQunXia:Save(nKey1, nKey2, var)
	local handle = OB_Create()
	ObjBuffer:PushObject(handle, var)	
	OB_SaveShareData(handle, self.SAVE_KEY, nKey1, nKey2)
	OB_Release(handle)
end

function tbQunXia:Load(nKey1, nKey2, varDefault)
	local handle = OB_Create()
	OB_LoadShareData(handle, self.SAVE_KEY, nKey1, nKey2)
	local var = varDefault
	if OB_IsEmpty(handle) ~= 1 then
		var = ObjBuffer:PopObject(handle)
	end
	OB_Release(handle)
	return var
end

function tbQunXia:SaveData(tbTData, nDate)
	local nCount = getn(tbTData)
	self:Save(nDate, 0, nCount)
	for i=1, nCount do
		self:Save(nDate, i, tbTData[i])
	end
end

function tbQunXia:LoadData(nDate)
	local nCount = self:Load(nDate, 0, 0)
	local tb1 = {}
	local tb2 = {}
	for i=1, nCount do
		tb1[i] = self:Load(nDate, i, {})
		local szName = tb1[i][1]
		if szName ~= nil then
			tb2[szName] = i
		end
	end
	return tb1, tb2
end

function tbQunXia:GetData(nDate)
	if not self.tbData[nDate] then
		self.tbData[nDate], self.tbName[nDate] = self:LoadData(nDate)	
	end
	return self.tbData[nDate]
end

function tbQunXia:g2s_LoadFixCountData(ParamHandle, ResultHandle)
	local nDate = ObjBuffer:PopObject(ParamHandle)
	local nFixCount = ObjBuffer:PopObject(ParamHandle)
	local szName = ObjBuffer:PopObject(ParamHandle)
	ObjBuffer:PushObject(ResultHandle, szName)
	
	
	local tbTData = self:GetData(nDate)
	local nCount = getn(tbTData)
	if nCount < nFixCount then
		nFixCount = nCount
	end
	local tbTopTen = {}
	for i = 1, nFixCount do
		if tbTData[i][1] ~= nil and tbTData[i][2] ~= nil then
			tinsert(tbTopTen, {tbTData[i][1], tbTData[i][2]})
		end
	end
	ObjBuffer:PushObject(ResultHandle, tbTopTen)
end

function tbQunXia:g2s_AddJiuLiang(ParamHandle)
	local szName = ObjBuffer:PopObject(ParamHandle)
	local nValue = ObjBuffer:PopObject(ParamHandle)
	local nDate = ObjBuffer:PopObject(ParamHandle)
	
	local tbTData = self:GetData(nDate)
	local nIndex = self.tbName[nDate][szName]
	local nCount = getn(tbTData)
	if type(nValue) == "number" then
		if nIndex == nil then
			tbTData[nCount + 1] = {szName, nValue}
			self.tbName[nDate][szName] = nCount + 1
		else
			tbTData[nIndex][2] = tbTData[nIndex][2] + nValue
		end
		self:SaveData(tbTData, nDate)
	end
end

function tbQunXia:g2s_QueryTopTen(ParamHandle, ResultHandle)
	local nDate = ObjBuffer:PopObject(ParamHandle)
	local szName = ObjBuffer:PopObject(ParamHandle)
	ObjBuffer:PushObject(ResultHandle, szName)
	
	local tbTData = self:GetData(nDate)
	local nCount = 10
	local nTbCount = getn(tbTData)
	if nCount > nTbCount then
		nCount = nTbCount
	end
	local tbTopTen = {}
	for i = 1, nCount do
		if tbTData[i][1] ~= nil and tbTData[i][2] ~= nil then
			tinsert(tbTopTen, {tbTData[i][1], tbTData[i][2]})
		end
	end
	ObjBuffer:PushObject(ResultHandle, tbTopTen)
end

function tbQunXia:g2s_QueryPlayerPaiMing(ParamHandle, ResultHandle)
	local szName = ObjBuffer:PopObject(ParamHandle)
	local nDate = ObjBuffer:PopObject(ParamHandle)
	
	self:GetData(nDate)
	ObjBuffer:PushObject(ResultHandle, szName)
	if self.tbName[nDate] == nil or self.tbName[nDate][szName] == nil then
		ObjBuffer:PushObject(ResultHandle, nil)
	else
		ObjBuffer:PushObject(ResultHandle, self.tbName[nDate][szName])
	end
end

function tbQunXia:g2s_QueryPlayerJiuLiang(ParamHandle, ResultHandle)
	local szName = ObjBuffer:PopObject(ParamHandle)
	local nDate = ObjBuffer:PopObject(ParamHandle)

	self:GetData(nDate)
	ObjBuffer:PushObject(ResultHandle, szName)
	if self.tbName[nDate] == nil or self.tbName[nDate][szName] == nil then
		ObjBuffer:PushObject(ResultHandle, 0)
	else
		local nIndex = self.tbName[nDate][szName]
		ObjBuffer:PushObject(ResultHandle, self.tbData[nDate][nIndex][2])
	end	
end

function tbQunXia:PaiMing()
	local nCurDate = tonumber(self:GetLocalDate("%Y%m%d"))
	local nTime = GetSysCurrentTime() - 24*60*60
	local tbYDate = Time2Tm(nTime)
	local nYDate = tbYDate[1] * 10000 + tbYDate[2] * 100 + tbYDate[3]

	self:GetData(nYDate)
	if self.tbData[nYDate] ~= nil then	
		sort(self.tbData[nYDate], tbQunXia.Sort)
		self:SaveData(self.tbData[nYDate], nYDate)
		
		local tbYData = self.tbData[nYDate]
		local tbYName = self.tbName[nYDate]
		for i = 1, getn(tbYData) do
			local szName = tbYData[i][1]
			tbYName[szName] = i
		end
	end
	
	self:GetData(nCurDate)
end

function tbQunXia:GetLocalDate(...)
	return call(date, arg)
end
