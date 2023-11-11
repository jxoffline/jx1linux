
Include("\\script\\lib\\baseclass.lua")
Include("\\script\\lib\\functionset.lua")
Include("\\script\\lib\\rangevalue.lua")

ScriptItemClass = tbBaseClass:new()


function ScriptItemClass:_init()
	
	self.szKey = ""
	self.pFunctionSet = FunctionSetClass:new()
	self.DateRange = RangeValueClass:new()
end

function ScriptItemClass:Use(nItemIndex, nCurDate)
	
	
	if self.DateRange:CheckDate(nCurDate) ~= 1 then
		Talk(1, "", "V藅 ph萴 n祔  h誸 h筺")
		return 1
	end
	
	 if self.pFunctionSet:Exec(self, nItemIndex) then
	 	return 0; --使用成功删掉物品
	end
	return 1; --使用失败，保留物品
	
end



