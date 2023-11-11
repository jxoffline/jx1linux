
Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\missions\\arena\\rule.lua")

function get_status()	
	local handle = OB_Create()
	ObjBuffer:PushObject(handle, GetName())

	RemoteExecute("\\script\\missions\\arena\\cmd.lua", "get_status", handle, "revc_status")

	OB_Release(handle)
end

function revc_status(nParam, ParamHandle)
	local szName = ObjBuffer:PopObject(ParamHandle)
	local szStatus = ObjBuffer:PopObject(ParamHandle)
	local nPlayerIndex = SearchPlayer(szName)
	if nPlayerIndex > 0 then
		CallPlayerFunction(nPlayerIndex, Msg2Player, format("%s, %s", szName, szStatus))
	end
end