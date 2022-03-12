Include("\\script\\lib\\objbuffer_head.lua")

function LoadShareData(key, param1, param2, szCallBackFun, nCallBackParam)
	local handle = OB_Create()
	ObjBuffer:PushObject(handle, key)
	ObjBuffer:PushObject(handle, param1)
	ObjBuffer:PushObject(handle, param2)
	RemoteExecute("\\script\\lib\\sharedata.lua", "LoadShareData", handle, szCallBackFun, nCallBackParam)
	OB_Release(handle)
end

function SaveShareData(key, param1, param2, obj)
	local handle = OB_Create()
	ObjBuffer:PushObject(handle, key)
	ObjBuffer:PushObject(handle, param1)
	ObjBuffer:PushObject(handle, param2)
	ObjBuffer:PushObject(handle, obj)
	RemoteExecute("\\script\\lib\\sharedata.lua", "SaveShareData", handle)
	OB_Release(handle)
end