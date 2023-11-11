OBJTYPE_NUMBER	= 1
OBJTYPE_STRING	= 2
OBJTYPE_TABLE	= 3
OBJTYPE_NIL		= 4

ObjBuffer = {}

function ObjBuffer:New(handle)
	local tb = clone(ObjBuffer)
	if (handle) then
		tb.m_Handle = handle
	else
		tb.m_Handle = OB_Create()
	end
	return tb
end

function ObjBuffer:Destroy()
	if (self.m_Handle) then
		OB_Release(self.m_Handle)
		self.m_Handle = nil
	end
end

function ObjBuffer:Clear()
	OB_Clear(self.m_Handle)
end

function ObjBuffer:IsEmpty()
	return OB_IsEmpty(self.m_Handle)
end

function ObjBuffer:Push(obj)
	ObjBuffer:PushObject(self.m_Handle, obj)
end

function ObjBuffer:Pop()
	return ObjBuffer:PopObject(self.m_Handle)
end

--从handle读出数据
function ObjBuffer:PopObject(handle)
	local nDataType = OB_PopByte(handle)
	if (nDataType == OBJTYPE_NUMBER) then
		return ObjBuffer:PopNumber(handle)
	elseif (nDataType == OBJTYPE_STRING) then
		return ObjBuffer:PopString(handle)
	elseif (nDataType == OBJTYPE_TABLE) then
		return ObjBuffer:PopTable(handle)
	elseif (nDataType == OBJTYPE_NIL) then
		return nil
	else
		if (nDataType == nil) then
			OutputMsg("load[NIL] is not supported!!!")
		else
			OutputMsg("load["..nDataType.."] is not supported!!!")
		end
		return nil
	end
end

--把数据存入handle
function ObjBuffer:PushObject(handle, obj)
	local tname = type(obj)
	if (tname == "number") then
		OB_PushByte(handle, OBJTYPE_NUMBER)
		ObjBuffer:PushNumber(handle, obj)
	elseif (tname == "string") then
		OB_PushByte(handle, OBJTYPE_STRING)
		ObjBuffer:PushString(handle, obj)
	elseif (tname == "table") then
		OB_PushByte(handle, OBJTYPE_TABLE)
		ObjBuffer:PushTable(handle, obj)
	elseif (tname == "nil") then
		OB_PushByte(handle, OBJTYPE_NIL)
	else
		OutputMsg("save["..tname.."] is not supported!!!")
	end
end

function ObjBuffer:PopNumber(handle)
	return OB_PopDouble(handle)
end

function ObjBuffer:PushNumber(handle, obj)
	OB_PushDouble(handle, obj)
end

function ObjBuffer:PopString(handle)
	return OB_PopString(handle)
end

function ObjBuffer:PushString(handle, obj)
	OB_PushString(handle, obj)
end

function ObjBuffer:PopTable(handle)
	local count = OB_PopInt(handle)
	local tb = {}
	for i = 1, count do
		local key = ObjBuffer:PopObject(handle)
		local val = ObjBuffer:PopObject(handle)
		tb[key] = val
	end
	return tb
end

function ObjBuffer:PushTable(handle, tb)
	local count = 0
	for key, val in tb do
		count = count + 1
	end
	OB_PushInt(handle, count)
	for key, val in tb do
		ObjBuffer:PushObject(handle, key)
		ObjBuffer:PushObject(handle, val)
	end
end

