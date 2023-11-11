Include("\\script\\lib\\objbuffer_head.lua")

function LoadShareData(ParamHandle, ResultHandle)
	local key = ObjBuffer:PopObject(ParamHandle)
	local param1 = ObjBuffer:PopObject(ParamHandle)
	local param2 = ObjBuffer:PopObject(ParamHandle)
	OB_LoadShareData(ResultHandle, key, param1, param2)
end

function SaveShareData(ParamHandle, ResultHandle)
	local key = ObjBuffer:PopObject(ParamHandle)
	local param1 = ObjBuffer:PopObject(ParamHandle)
	local param2 = ObjBuffer:PopObject(ParamHandle)
	OB_SaveShareData(ParamHandle, key, param1, param2)
end