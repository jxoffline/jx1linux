Include("\\script\\misc\\eventsys\\type\\player.lua")
Include("\\script\\missions\\miniencounter\\protocol.lua")
	
function OnPlayerLogout()
	local szName = GetName()
	local nMapID = GetWorldPos()
	if tbPlayerQueue[szName] then
		print("Player Logout")
		local hObject = OB_Create()
		ObjBuffer:PushObject(hObject, szName)
		ObjBuffer:PushObject(hObject, 0)
		ObjBuffer:PushObject(hObject, nMapID)
		RemoteExecute("\\script\\missions\\miniencounter\\protocol.lua", "PlayerInfoChange", hObject)
		OB_Release(hObject)
	end
end

function OnPlayerEnterMap()
	local szName = GetName()
	local nMapID = GetWorldPos()
	if tbPlayerQueue[szName] then
		print("Player Enter Map")
		local hObject = OB_Create()
		ObjBuffer:PushObject(hObject, szName)
		ObjBuffer:PushObject(hObject, 1)
		ObjBuffer:PushObject(hObject, nMapID)
		RemoteExecute("\\script\\missions\\miniencounter\\protocol.lua", "PlayerInfoChange", hObject)
		OB_Release(hObject)
	end
end

EventSys:GetType("OnLogout"):Reg(0, OnPlayerLogout)
EventSys:GetType("EnterMap"):Reg("ALL", OnPlayerEnterMap)