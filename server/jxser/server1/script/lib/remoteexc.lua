Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\lib\\baseclass.lua")
Include("\\script\\lib\\common.lua")

if not tbRemoteExcClass then
	tbRemoteExcClass = tbBaseClass:new();
end

tbRemoteExcClass.tbCallBack = {};

-- 传给szCallBackFun的参数将是tbCallBackParam内的值+远程函数的返回值
function RemoteExc(szRemoteScript, szRemoteFun, tbRemoteParam, szCallBackScript, szCallBackFun, tbCallBackParam)
	local handle = OB_Create();
	ObjBuffer:PushObject(handle, szRemoteScript);
	ObjBuffer:PushObject(handle, szRemoteFun);
	ObjBuffer:PushObject(handle, tbRemoteParam);
	
	if szCallBackScript and szCallBackScript ~= "" then
		local nCallBackID = getn(tbRemoteExcClass.tbCallBack) + 1;
		tbRemoteExcClass.tbCallBack[nCallBackID] = {szCallBackScript, szCallBackFun, tbCallBackParam};
		RemoteExecute("\\script\\lib\\remoteexc.lua", "ReceiveExc", handle, "RemoteExc_CallBack", nCallBackID);
	else
		RemoteExecute("\\script\\lib\\remoteexc.lua", "ReceiveExc", handle);
	end
	
	OB_Release(handle);
end

function RemoteExc_CallBack(Param, ResultHandle)
	if (tbRemoteExcClass.tbCallBack[Param] ~= nil) then
		local szCallBackScript	= tbRemoteExcClass.tbCallBack[Param][1];
		local szCallBackFun	= tbRemoteExcClass.tbCallBack[Param][2];
		local tbCallBackParam = tbRemoteExcClass.tbCallBack[Param][3];
		local tbRemoteRet = {};
		if (OB_IsEmpty(ResultHandle) ~= 1) then
			tbRemoteRet = ObjBuffer:PopObject(ResultHandle);
		end
		
		if (szCallBackScript ~= nil and szCallBackScript ~= "" and 
				szCallBackFun ~= nil and szCallBackFun ~= "") then
				-- 将2个参数表合并
				local tbParam = {szCallBackScript, szCallBackFun};
				if (type(tbCallBackParam) == "table") then
					for i=1, getn(tbCallBackParam) do
						tinsert(tbParam, tbCallBackParam[i]);
					end
				end
				if (type(tbRemoteRet) == "table") then
					for i=1, getn(tbRemoteRet) do
						tinsert(tbParam, tbRemoteRet[i]);
					end
				end
		
				--DynamicExecute(szCallBackScript, szCallBackFun, unpack(tbParam))
				call(DynamicExecute, tbParam);
		end
		
		tbRemoteExcClass.tbCallBack[Param] = nil;
	end
end

function ReceiveExc(ParamHandle, ResultHandle)
	if (OB_IsEmpty(ParamHandle) == 1) then
		return
	end
	local szScript = ObjBuffer:PopObject(ParamHandle);
	if (OB_IsEmpty(ParamHandle) == 1) then
		return
	end
	local szFun = ObjBuffer:PopObject(ParamHandle);
	local tbParam = {};
	if (OB_IsEmpty(ParamHandle) ~= 1) then
		tbParam = ObjBuffer:PopObject(ParamHandle);
	end
	local tbCallParam = {szScript, szFun}
	if (type(tbParam) == "table") then
		for i=1, getn(tbParam) do
			tinsert(tbCallParam, tbParam[i]);
		end
	end

	local tbRet = pack(call(DynamicExecute, tbCallParam));
	if getn(tbRet) > 0 then
		ObjBuffer:PushObject(ResultHandle, tbRet);
	end
end