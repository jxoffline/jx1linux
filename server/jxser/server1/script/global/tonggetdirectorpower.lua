--³¤ÀÏÅĞ¶Ï½Å±¾
--By Suyu 2003.11.5

Include("\\script\\global\\repute_head.lua")

function CheckTongDirectorPower()
	if((GetLevel() >= 50) and (GetReputeLevel(GetRepute()) >= 5) and (GetLeadLevel() >= 25))then
		return 1
	else
		return 0
	end
end;
