Include("\\script\\lib\\objbuffer_head.lua")
MapInfo = {}

function MapInfo:new(nMapId)
	local tb = {}
	tb.nStatus = "free"
	tb.nLockTimeOut = nil
	tb.nPlayerCount = 0
	tb.nMapId = nMapId
	for k,v in self do
		tb[k] = v
	end
	return tb
end

function MapInfo:GetCurStatus()
	if self.nStatus == "lock" then
		local nCurTime = GetSysCurrentTime()
		if not self.nLockTimeOut then
			self.nLockTimeOut = nCurTime
		elseif  self.nLockTimeOut <= nCurTime and self.nPlayerCount <= 0 then
			self.nStatus = "free"
		end
	end
	return self.nStatus
end


tbMapManage = {}
tbMapManage.tbList = {}
tbMapManage.TIME_OUT = 40

function tbMapManage:Init()
	self.tbList = {}
end

function tbMapManage:RegMap(nMapId)
	self.tbList[nMapId] = MapInfo:new(nMapId)
end


function tbMapManage:AssignMap()
	for nMapId, pMapInfo in self.tbList do
		if pMapInfo:GetCurStatus() == "free" then
			pMapInfo.nStatus = "lock"
			pMapInfo.nPlayerCount = 0
			pMapInfo.nLockTimeOut = GetSysCurrentTime() + self.TIME_OUT
			return pMapInfo.nMapId
		end
	end
	RemoteExecute("\\script\\missions\\arena\\protocol.lua", "allocate_map", 0, nil, 0, nil)
end

function tbMapManage:OnPlayerEnter(nMapId)
	if self.tbList[nMapId] then
		self.tbList[nMapId].nPlayerCount = self.tbList[nMapId].nPlayerCount + 1
	end
end

function tbMapManage:OnPlayerLeave(nMapId)
	if self.tbList[nMapId] then
		self.tbList[nMapId].nPlayerCount = self.tbList[nMapId].nPlayerCount - 1
	end
end

function tbMapManage:Release(nMapId)
	self.tbList[nMapId] = nil
end

