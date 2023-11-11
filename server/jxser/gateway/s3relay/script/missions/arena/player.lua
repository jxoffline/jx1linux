Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\missions\\arena\\map.lua")

PlayerInfo = {}
PlayerInfo.LOAD_TIME_OUT = 10
function PlayerInfo:new(szName)
	local tb = {}
	tb.nStatus = "waitting"
	tb.nTimeOut = nil
	tb.nGroup = nil
	tb.nMapId = nil
	tb.tbLastState = {}
	tb.szName = szName
	for k, v in self do
		tb[k] = v
	end
	return tb
end

function PlayerInfo:GetStatus()
	if self.nStatus == "loading" or self.nStatus == "ready" then
		local nCurTime = GetSysCurrentTime()
		if not self.nTimeOut then
			self.nTimeOut = nCurTime
		elseif  self.nTimeOut <= nCurTime then
			self.nStatus = "waitting"
		end
	end
	return self.nStatus
end
function PlayerInfo:SetStatus(nStatus)
	if nStatus == "loading" or nStatus == "ready" then
		self.nTimeOut = GetSysCurrentTime() + self.LOAD_TIME_OUT
	end
	self.nStatus = nStatus
end

function PlayerInfo:AddTimeOut(nTimeOut)
	nTimeOut = nTimeOut or self.LOAD_TIME_OUT
	self.nTimeOut = GetSysCurrentTime() + nTimeOut
end

tbPlayerManage = {}

tbPlayerManage.tbMap = {}
tbPlayerManage.tbGroup = {}
tbPlayerManage.tbVsMap = {}

tbPlayerManage.TIME_OUT = 30

function tbPlayerManage:Init(nMaxGroup)
	self.tbMap = {}
	self.tbGroup = {}
	self.tbVsMap = {}
	for i=1, nMaxGroup do
		self.tbGroup[i] = {}
	end
end

function tbPlayerManage:OnLogout(szName)
	local pPlayerInfo = self.tbMap[szName]
	if pPlayerInfo then
		if pPlayerInfo:GetStatus() ~= "loading" then
			self:Release(szName)
		end
	end
end

function tbPlayerManage:OnEnterMap(szName, nMapId)
	
	local pPlayerInfo = self.tbMap[szName]
	if pPlayerInfo then
		if pPlayerInfo:GetStatus() == "loading" then
			pPlayerInfo:SetStatus("ready")
			pPlayerInfo.nMapId = nMapId
		end
	end
end

function tbPlayerManage:OnLeaveMap(szName)
	local pPlayerInfo = self.tbMap[szName]
	if pPlayerInfo then
		if pPlayerInfo:GetStatus() == "ready" then
			self:Release(szName)
		end
	end
end

function tbPlayerManage:MatchOpponet(nGroup, pPlayerInfo)
	local tbGroupMap = self.tbGroup[nGroup]
	if not tbGroupMap then
		return
	end
	local nCurTime = GetSysCurrentTime()
	for szOpponetName, pOppoentInfo in tbGroupMap do
		
		if szOpponetName ~= pPlayerInfo.szName then
			if pPlayerInfo.nGroup == nGroup then
				return pOppoentInfo
			elseif pPlayerInfo.nTimeOut <= nCurTime and pOppoentInfo.nTimeOut <= nCurTime then
				return pOppoentInfo
			end
		end
	end
end

function tbPlayerManage:SetLastState(szName, tbLastState)
	local pPlayerInfo = self.tbMap[szName]
	if pPlayerInfo then
		pPlayerInfo.tbLastState = tbLastState
	end
end

function tbPlayerManage:GetLastState(szName)
	local pPlayerInfo = self.tbMap[szName]
	if pPlayerInfo then
		return pPlayerInfo.tbLastState
	end
end

function tbPlayerManage:IsInGroup(pPlayerInfo, nGroup)
	
	if not pPlayerInfo or pPlayerInfo.nGroup ~= nGroup then
		return
	end
	if self.tbGroup[nGroup] then
		return self.tbGroup[nGroup][pPlayerInfo.szName] ~= nil 
	end
end

function tbPlayerManage:ChangeGroup(pPlayerInfo, nGroup)
	self:LeaveGroup(pPlayerInfo)
	self:JoinGroup(pPlayerInfo, nGroup)
end

function tbPlayerManage:JoinGroup(pPlayerInfo, nGroup)
	local szName = pPlayerInfo.szName
	self.tbGroup[nGroup][szName] = pPlayerInfo
	pPlayerInfo.nTimeOut = GetSysCurrentTime() + self.TIME_OUT
	pPlayerInfo.nGroup = nGroup
end
function tbPlayerManage:LeaveGroup(pPlayerInfo)
	local nGroup = pPlayerInfo.nGroup
	if self.tbGroup[nGroup] then
		self.tbGroup[nGroup][pPlayerInfo.szName] = nil	
	end
	
end

function tbPlayerManage:CreatePlayer(szName)
	self.tbMap[szName] = PlayerInfo:new(szName)
	return self.tbMap[szName]
end

function tbPlayerManage:SearchOpponents(szName, nGroup)
	
	local pPlayerInfo = self.tbMap[szName]
	if not pPlayerInfo then
		
		pPlayerInfo = self:CreatePlayer(szName)
		self:JoinGroup(pPlayerInfo, nGroup)
	end
	if pPlayerInfo:GetStatus() ~= "waitting" then
		return -1
	end
	if not self:IsInGroup(pPlayerInfo, nGroup) then
		
		self:ChangeGroup(pPlayerInfo, nGroup)
	end
	
	local nMapId = nil
	local pOppoentInfo = self:MatchOpponet(nGroup, pPlayerInfo)
	
	
	
	if not pOppoentInfo and pPlayerInfo.nTimeOut <= GetSysCurrentTime() then
		local nGroupSize = getn(self.tbGroup) 
		
		for nStep=1, max(nGroup, nGroupSize-nGroup) do 
			local i=nGroup - nStep
			local j= nGroup + nStep
			
			if i > 0 then
				pOppoentInfo = self:MatchOpponet(i, pPlayerInfo)
				if pOppoentInfo then
					break
				end
			end
			if j <= nGroupSize then
				pOppoentInfo = self:MatchOpponet(j, pPlayerInfo)
				if pOppoentInfo then
					break
				end
			end
		end
	end	

	if pOppoentInfo then
		self:NotifyMatched(pPlayerInfo)
		self:NotifyMatched(pOppoentInfo)
		local nMapId =  self:ApplyMap(pPlayerInfo, pOppoentInfo)
		if nMapId then
			self:NotifyEnterMap(pPlayerInfo, nMapId)
			self:NotifyEnterMap(pOppoentInfo, nMapId)
		else

			self:NotifyWaitMap(pPlayerInfo)
			self:NotifyWaitMap(pOppoentInfo)
			
			pPlayerInfo:AddTimeOut()
			pOppoentInfo:AddTimeOut()
			
			self.tbVsMap[pPlayerInfo.szName] = pOppoentInfo.szName
			self.tbVsMap[pOppoentInfo.szName] = pPlayerInfo.szName
		end
		return 1
	end
end


function tbPlayerManage:NotifyMatched(pPlayerInfo)
	if pPlayerInfo then
		self:LeaveGroup(pPlayerInfo)
		pPlayerInfo:SetStatus("loading")
		local handle = OB_Create()
		ObjBuffer:PushObject(handle, pPlayerInfo.szName)
		RemoteExecute("\\script\\missions\\arena\\protocol.lua", "finded_oppoent", handle, nil, 0, nil)	
		OB_Release(handle)
	end
end

function tbPlayerManage:NotifyWaitMap(pPlayerInfo)
	if pPlayerInfo then
		local handle = OB_Create()
		ObjBuffer:PushObject(handle, pPlayerInfo.szName)
		RemoteExecute("\\script\\missions\\arena\\protocol.lua", "wait_map", handle, nil, 0, nil)	
		OB_Release(handle)
	end
end

function tbPlayerManage:NotifyOppoentCancel(pPlayerInfo)
	if pPlayerInfo then
		local handle = OB_Create()
		ObjBuffer:PushObject(handle, pPlayerInfo.szName)
		RemoteExecute("\\script\\missions\\arena\\protocol.lua", "notify_oppoent_cancel", handle, nil, 0, nil)	
		OB_Release(handle)
	end
end


function tbPlayerManage:NotifyWaitMap(pPlayerInfo)
	if pPlayerInfo then
		local handle = OB_Create()
		ObjBuffer:PushObject(handle, pPlayerInfo.szName)
		RemoteExecute("\\script\\missions\\arena\\protocol.lua", "wait_map", handle, nil, 0, nil)	
		OB_Release(handle)
	end
end

function tbPlayerManage:ApplyMap(pPlayerInfo, pOppoentInfo)
	if pPlayerInfo.nMapId then
		return pPlayerInfo.nMapId
	elseif pOppoentInfo.nMapId then
		return pOppoentInfo.nMapId
	else
		return tbMapManage:AssignMap()
	end
end

function tbPlayerManage:Active()
	for szName, pPlayerInfo in self.tbMap do 
		
		if pPlayerInfo and pPlayerInfo:GetStatus() == "waitting" then
			
			self:SearchOpponents(pPlayerInfo.szName, pPlayerInfo.nGroup)
		end
		
	end
end



function tbPlayerManage:Proc()
	for szName, szOppoentName in self.tbVsMap do
		if szOppoentName then
			local pPlayerInfo = self.tbMap[szName]
			local pOppoentInfo = self.tbMap[szOppoentName]
			if pPlayerInfo and pPlayerInfo:GetStatus() == "loading"  and pOppoentInfo and pOppoentInfo:GetStatus() == "loading"  then
				local nMapId =  self:ApplyMap(pPlayerInfo, pOppoentInfo)
				if nMapId then
					self:NotifyEnterMap(pPlayerInfo, nMapId)
					self:NotifyEnterMap(pOppoentInfo, nMapId)
					self.tbVsMap[szName] = nil
					self.tbVsMap[szOppoentName] = nil
				else
					return
				end 
			elseif (pPlayerInfo and pPlayerInfo:GetStatus() == "waitting") or (pOppoentInfo and pOppoentInfo:GetStatus() == "waitting")  then
				if pPlayerInfo then
					pPlayerInfo:SetStatus("waitting")
					self:SearchOpponents(pPlayerInfo.szName, pPlayerInfo.nGroup)
				end
				if pOppoentInfo then
					pOppoentInfo:SetStatus("waitting")
					self:SearchOpponents(pOppoentInfo.szName, pOppoentInfo.nGroup)
				end
			end
		end
	end
end

function tbPlayerManage:NotifyEnterMap(pPlayerInfo, nMapId)
	if pPlayerInfo then
		if pPlayerInfo.nMapId ~= nMapId then
			local handle = OB_Create()
			ObjBuffer:PushObject(handle, pPlayerInfo.szName)
			ObjBuffer:PushObject(handle, nMapId)
			ObjBuffer:PushObject(handle, pPlayerInfo.nTimeOut)
			RemoteExecute("\\script\\missions\\arena\\protocol.lua", "player_enter_map", handle, nil, 0, nil)	
			OB_Release(handle)
		else
			pPlayerInfo:SetStatus("ready")
		end
		
	end
end

function tbPlayerManage:OnTime()
	self:Proc()
	self:Active()
	return self.TIME_OUT
end



function tbPlayerManage:Release(szName)
	local pPlayerInfo = self.tbMap[szName]
	if pPlayerInfo then
		self:LeaveGroup(pPlayerInfo)
		self.tbMap[szName] = nil
		local szOppoentName = self.tbVsMap[szName]
		self.tbVsMap[szName] = nil
		if szOppoentName then
			self.tbVsMap[szOppoentName] = nil
			local pOppoentInfo = self.tbMap[szOppoentName]
			if pOppoentInfo then
				self:NotifyOppoentCancel(pOppoentInfo)
				if pOppoentInfo:GetStatus() == "ready" then
					pOppoentInfo:SetStatus("waitting")
					self:SearchOpponents(szOppoentName, pOppoentInfo.nGroup)
				end
			end
		end
	end
end

tbPlayerManage:Init(30)
tbMapManage:Init()

AddTimer(tbPlayerManage.TIME_OUT, "tbPlayerManage:OnTime", 0)