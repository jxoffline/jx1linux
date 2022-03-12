Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\lib\\common.lua")

MapDatabase = {
	m_Name = "",
	m_List = {},	-- key=>value
	m_Count = 0,
}

function MapDatabase:New(name)
	local tb = clone(MapDatabase)
	tb.m_Name = name
	return tb
end

function MapDatabase:Clear()
	for name, tb in self.m_List do
		if (tb ~= nil) then
			OB_DeleteShareData(self.m_Name, 0, tb.Index)
		end
	end
	local buff = ObjBuffer:New()
	buff:Push(0)
	OB_SaveShareData(buff.m_Handle, self.m_Name, 0, 0)
	buff:Destroy()
	self.m_Count = 0
	self.m_List = {}
end

function MapDatabase:LoadAll()
	for name, tb in self.m_List do
		if (tb ~= nil) then
			OB_DeleteShareData(self.m_Name, 0, tb.Index)
		end
	end
	self.m_List = {}

	local buff = ObjBuffer:New()
	if (OB_LoadShareData(buff.m_Handle, self.m_Name, 0, 0) == 0) then
		self.m_Count = 0
		buff:Destroy()
		return 0
	end

	local count = buff:Pop()
	for i = 1, count do
		buff:Clear()
		if (OB_LoadShareData(buff.m_Handle, self.m_Name, 0, i) == 1) then
			local name = buff:Pop()
			local item = buff:Pop()
			local tb = {}
			tb.Data = item
			tb.Index = i
			self.m_List[name] = tb
		end
	end
	buff:Destroy()
	self.m_Count = count
	return 1
end

function MapDatabase:SaveAll()
	local buff = ObjBuffer:New()
	for name, tb in self.m_List do
		if (item ~= nil) then
			buff:Clear()
			buff:Push(name)
			buff:Push(tb.Data)
			OB_SaveShareData(buff.m_Handle, self.m_Name, 0, tb.Index)
		end
	end
	buff:Clear()
	buff:Push(self.m_Count)
	OB_SaveShareData(buff.m_Handle, self.m_Name, 0, 0)
	buff:Destroy()
end

function MapDatabase:Set(key, val)
	if (not key or not val) then
		return
	end
	local tb = self.m_List[key]
	if (not tb) then
		self.m_Count = self.m_Count + 1
		tb = {}
		tb.Index = self.m_Count
		tb.Data = val
		self.m_List[key] = tb
	else
		tb.Data = val
	end
end

function MapDatabase:Get(key)
	local tb = self.m_List[key]
	if (not tb) then
		return nil
	else
		return tb.Data
	end
end

function MapDatabase:Del(key)
	if (not key) then
		return
	end
	local find = self.m_List[key]
	if (not find) then
		return
	end
	self.m_List[key] = nil
	OB_DeleteShareData(self.m_Name, 0, self.m_Count)

	local buff = ObjBuffer:New()
	for name, tb in self.m_List do
		if (tb ~= nil and tb.Index > find.Index) then
			tb.Index = tb.Index - 1
			buff:Clear()
			buff:Push(name)
			buff:Push(tb.Data)
			OB_SaveShareData(buff.m_Handle, self.m_Name, 0, tb.Index)
		end
	end

	self.m_Count = self.m_Count - 1
	buff:Clear()
	buff:Push(self.m_Count)
	OB_SaveShareData(buff.m_Handle, self.m_Name, 0, 0)
	buff:Destroy()
end

function MapDatabase:Save(key)
	local tb = self.m_List[key]
	if (not tb) then
		return
	end
	local buff = ObjBuffer:New()
	buff:Push(key)
	buff:Push(tb.Data)
	OB_SaveShareData(buff.m_Handle, self.m_Name, 0, tb.Index)
	buff:Clear()
	buff:Push(self.m_Count)
	OB_SaveShareData(buff.m_Handle, self.m_Name, 0, 0)
	buff:Destroy()
end
