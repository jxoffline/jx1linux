Include("\\script\\lib\\objbuffer_head.lua")
local TYPE_TIMING = 1
local TYPE_ON_CHANGE_GS = 2
tbAnnouncement = {}
tbAnnouncement.tbMessage = {}

function tbAnnouncement:Recv(ParamHandle, ResultHandle)
	if (OB_IsEmpty(ParamHandle) == 1) then
		return
	end
	local pMessage = ObjBuffer:PopObject(ParamHandle)
	if pMessage.nType == %TYPE_TIMING then
		local nId = getn(self.tbMessage) + 1
		self.tbMessage[nId] = pMessage
		self.tbMessage[nId].nTimeId = AddTimer(pMessage.nInterval, "tbAnnouncement:OnTime", nId)
	else
		local handle = OB_Create()
		ObjBuffer:PushObject(handle, pMessage)
		RemoteExecute("\\script\\misc\\gm\\announcement.lua", "tbAnnouncement:RegMessage", handle, nil, 0, nil)
		OB_Release(handle)
	end
	
end

function tbAnnouncement:Trans2DelLocalMessage(ParamHandle, ResultHandle)
	if (OB_IsEmpty(ParamHandle) == 1) then
		return
	end
	local nId = ObjBuffer:PopObject(ParamHandle)
	local handle = OB_Create()
	ObjBuffer:PushObject(handle, nId)
	RemoteExecute("\\script\\misc\\gm\\announcement.lua", "tbAnnouncement:DelLocalMessage", handle, nil, 0, nil)
	OB_Release(handle)
	
end

function tbAnnouncement:OnTime(nParam)
	local pMessage = self.tbMessage[nParam]
	if not pMessage then
		return 0
	end
	pMessage.nCount = pMessage.nCount -1
	
	GlobalExecute(format("dw Msg2SubWorld([[%s]])", pMessage.szMsg));
	if pMessage.nCount > 0 then
		return pMessage.nInterval, nParam
	else
		pMessage.nTimerId = nil
		return 0
	end
end

function tbAnnouncement:GetMessage(ParamHandle, ResultHandle)
	if (OB_IsEmpty(ParamHandle) == 1) then
		return
	end
	local szName = ObjBuffer:PopObject(ParamHandle)
	ObjBuffer:PushObject(ResultHandle, szName)
	ObjBuffer:PushObject(ResultHandle, self.tbMessage)
end

function tbAnnouncement:DelMessage(ParamHandle, ResultHandle)
	if (OB_IsEmpty(ParamHandle) == 1) then
		return
	end
	local nId = ObjBuffer:PopObject(ParamHandle)
	local nTimeId = self.tbMessage[nId].nTimeId
	self.tbMessage[nId] = nil
	if nTimerId then
		DelTimer(nTimeId)
	end
end