Include("\\script\\lib\\baseclass.lua")
if not RangeValueClass then
	RangeValueClass = tbBaseClass:new()
end


function RangeValueClass:_init(nMin, nMax)
	self.nMin = nMin
	self.nMax = nMax
end

function RangeValueClass:CheckDate(nValue)
	local nValue = nValue or tonumber(GetLocalDate("%Y%m%d%H%M"))
	if self.nMin and self.nMin ~= 0 and self.nMin > nValue then
		return nil
	end
	if self.nMax and self.nMax ~= 0 and self.nMax <= nValue then
		return nil
	end
	return 1
end
function RangeValueClass:IsInRange(nValue)
	if self.nMin and self.nMin > nValue then
		return nil
	end
	if self.nMax and self.nMax < nValue then
		return nil
	end
	return 1
end