
Include("\\script\\lib\\baseclass.lua")


g_ScriptItemClass = tbBaseClass:new()


function g_ScriptItemClass:_init()
	self.tbSet = {}
	
end


function g_ScriptItemClass:Add(tbScriptItem)
	
	if self.tbSet[tbScriptItem.szKey] then
		
		print("warning item script override")
	end
	self.tbSet[tbScriptItem.szKey] = tbScriptItem
end


function g_ScriptItemClass:Get(tbProp)
	local szKey = "";
	if tbProp ~= nil then
		szKey = format("%d,%d,%d", tbProp[1],tbProp[2],tbProp[3]);
		if self.tbSet[szKey] == nil then
			szKey = format("%d,%d,%d,%d", tbProp[1],tbProp[2],tbProp[3],tbProp[4]);
			if self.tbSet[szKey] == nil then
				szKey = format("%d,%d,%d,%d,%d", tbProp[1],tbProp[2],tbProp[3],tbProp[4],tbProp[5]);
				if self.tbSet[szKey] == nil then
					szKey = format("%d,%d,%d,%d,%d", tbProp[1],tbProp[2],tbProp[3],-1,tbProp[5]);
				end
			end
		end
	end
	
	return self.tbSet[szKey]
end

g_ScriptItemClass:_init()