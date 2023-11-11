Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\missions\\arena\\player.lua")
Include("\\script\\missions\\arena\\map.lua")


function get_status(ParamHandle, ResultHandle)
	local szName = ObjBuffer:PopObject(ParamHandle)
	local nStatus = "none"
	if tbPlayerManage.tbMap[szName] then
		nStatus = tbPlayerManage.tbMap[szName]:GetStatus()
	end
	ObjBuffer:PushObject(ResultHandle, szName)
	ObjBuffer:PushObject(ResultHandle, nStatus)
end