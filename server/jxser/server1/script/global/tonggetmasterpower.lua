--°ïÖ÷ÅĞ¶Ï½Å±¾
--By Suyu 2003.11.5

Include("\\script\\global\\repute_head.lua")

function CheckTongMasterPower()
	--Change request 14/06/2011 - Modified by DinhHQ
	local nWeekDay = tonumber(GetLocalDate("%w"))
	local nHour = tonumber(GetLocalDate("%H%M"))
	if nWeekDay == 5 and nHour >= 1800 and nHour <= 2350 then
		return 0
	end
	if((GetLevel() >= 50) and (GetReputeLevel(GetRepute()) >= 6) and (GetLeadLevel() >= 30))then
		return 1
	else
		return 0
	end
end;

