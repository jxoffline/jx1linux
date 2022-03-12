Include("\\script\\lib\\objbuffer_head.lua")

function battle_msg2allworld(szParam)
	GlobalExecute(format("dw Msg2SubWorld([[%s]])", szParam));
end

function broadcast(ParamHandle, ResultHandle)
	if (OB_IsEmpty(ParamHandle) == 0) then
		local msg = ObjBuffer:PopObject(ParamHandle)
		GlobalExecute(format("dw Msg2SubWorld([[%s]])", tostring(msg)))
	end
end
