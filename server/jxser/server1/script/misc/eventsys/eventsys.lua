
EventSys = {}
EventSys.szName = "EventSys"
EventSys.MapEvnent = {}

EventSys.EventType = {}

function EventSys:NewType(szType)
	local tb = {}
	for key, value in self do
		if type(value) == "table" then
			tb[key] = {}
		else
			tb[key] = value
		end
		tb.szName = szType
	end
	self.EventType[szType] = tb
	return tb
end

function EventSys:GetType(szType)
	return self.EventType[szType] or self
end

function EventSys:Reg(szType, varFun, ...)
	
	local nPackNo = curpack()
	self.MapEvnent[szType] = self.MapEvnent[szType] or {}
	local nNewId = getn(self.MapEvnent[szType]) + 1
	self.MapEvnent[szType][nNewId] = {varFun, arg, nPackNo}
	return nNewId
end

function EventSys:UnReg(szType, nId)
	if not self.MapEvnent[szType] then
		return
	end
	if not self.MapEvnent[szType][nId] then
		return
	end
	self.MapEvnent[szType][nId] = nil
end

function EventSys:GetProcParam(szType, nId, tbEventParam)
	if not self.MapEvnent[szType] then
		return
	end
	local tbProcParam = self.MapEvnent[szType][nId]
	local tmpParam = {}
	for i=1, getn(tbProcParam[2]) do --有顺序要求，这个第一
		tinsert(tmpParam, tbProcParam[2][i])
	end
	for i=1, getn(tbEventParam) do--有顺序要求，这个第二
		tinsert(tmpParam, tbEventParam[i])
	end
	
	return  tbProcParam[1], tmpParam, tbProcParam[3]
end

function EventSys:OnPlayerEvent(szType, nPlayerIndex, ...)
	if not self.MapEvnent[szType] then
		return
	end
	for nId=1, getn(self.MapEvnent[szType]) do
		local varFun, tbParam, nPackNo  = self:GetProcParam(szType, nId, arg)
		local nOldPack = usepack(nPackNo)
		CallPlayerFunction(nPlayerIndex, varFun, unpack(tbParam))
		usepack(nOldPack)
		
	end
end

function EventSys:OnEvent(szType, ...)
	if not self.MapEvnent[szType] then
		return
	end
	for nId=1, getn(self.MapEvnent[szType]) do
		local varFun, tbParam, nPackNo = self:GetProcParam(szType, nId, arg)
		local nOldPack = usepack(nPackNo)
		call( varFun, tbParam)
		usepack(nOldPack)
	end
end

function EventSys:OnTeamEvent(szType, nPlayerIndex, ...)
	if not self.MapEvnent[szType] then
		return
	end
	local nTeamSize = GetTeamSize()
	if nTeamSize == 0 then 
		self:OnPlayerEvent(szType, nPlayerIndex, unpack(arg))
	end
	for nId=1, getn(self.MapEvnent[szType]) do
		local varFun, tbParam, nPackNo  = self:GetProcParam(szType, nId, arg)
		local nOldPack = usepack(nPackNo)
		for i=1, nTeamSize do
			local nTeamPlayerIndex = CallPlayerFunction(nPlayerIndex, GetTeamMember, i)
			CallPlayerFunction(nTeamPlayerIndex, varFun, unpack(tbParam))
		end
		usepack(nOldPack)
	end
end