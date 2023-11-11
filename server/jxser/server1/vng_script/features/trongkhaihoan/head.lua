Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")

if not tbVNGTriumphDrum then
	tbVNGTriumphDrum = {}
end

tbVNGTriumphDrum = 
{
	nStartDate = 20160301,		
	nCloseDate = 20201231, 	
	
	nStartTime = 1930,	
	nCloseTime = 2000,
	
	tbBitTaskID_DailyExp = {nTaskID = 2773,nStartBit = 14,nBitCount = 12,nMaxValue = 3000}, --gioi han 30tr exp 1 ngay
		
	nLimit_Level  = 100,	
	nLimit_DayUse = 1, --1 BH dung 1 cai 1 ngay	
	nLimit_DayAward = 3000,
	nNPCID		  = 1556,
	nTimerOut	  = 10*18,
	nTimerCount   = 180,
	nTimerShow	  = 180,
	nSercherRange = 16,
}

function tbVNGTriumphDrum:IsCarryOn()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if nDate < self.nStartDate or nDate >= self.nCloseDate then
		 return 0;
	else	
		 return 1;
	end
end

function tbVNGTriumphDrum:CheckCondition_BuyDrum()
	
	if tbVNGTriumphDrum:IsCarryOn() ~= 1 then
		return 0;
	end
	
	if GetLevel() < self.nLimit_Level then
		return 0;
	end 
	
	local szTongName, nTongId = GetTongName();
	if nTongId == 0 then
		return 0;
	end
	
	local nFigure = GetTongFigure();
	if nFigure ~= 0 and nFigure ~= 1 then
		return 0;
	end
	
	return 1;
end


function tbVNGTriumphDrum:GetExpDrump(nCount)
	if nCount <= 0 then
		return 0
	elseif nCount <= 50 then
		return 200000
	elseif nCount <= 60 then
		return 250000
	elseif nCount <= 80 then
		return 300000
	else
		return 400000
	end
end

function clone(obj)
	local otype = type(obj)
	if (otype == "number") then
		return obj
	elseif (otype == "string") then
		local ret = obj
		return ret
	elseif (otype == "nil") then
		return obj
	elseif (otype == "table") then
		local ret = {}
		for key, val in obj do
			ret[clone(key)] = clone(val)
		end
		return ret
	else
		return obj
	end
end

function tbVNGTriumphDrum:ResetExpDrumpDaily()
	tbVNG_BitTask_Lib:setBitTask(tbVNGTriumphDrum.tbBitTaskID_DailyExp, 0)
end