--Ãæ¾ß´¦Àí
--·µ»Ø £¨1:ÔÊÐíÅå´÷, 0:²»ÔÊÐíÅå´÷£©
Include("\\script\\lib\\pay.lua");

MARK_DAJIANGJUN_TASK_NO = 2620
MARK_YUANSUAI_TASK_NO = 2621

function CanEquip(nParticular)	
	--VLDNB 10 - Kh«ng cho mang mÆt n¹ TK trng ®Êu tr­êng - 20111017
	if nParticular == 482 or nParticular == 447 or nParticular == 450 or nParticular == 446 then
		local tbMapID = {
			605, 608, 609,
			606, 610, 611,
			607, 612, 613,
		}
		local nW, _, _ = GetWorldPos()
		for i = 1, getn(tbMapID) do
			if tbMapID[i] == nW then
				return 0
			end
		end
	end
	local nTripMode = GetTripMode()
	-- ´ó½«¾üÒ×ÈÝ
	if (nParticular == 446 or nParticular == 450 or nParticular == 454 or nParticular == 455) then
		
		if nTripMode ~= 2 and (IsCharged() ~= 1) then
			Say("ChØ cã ng­êi ch¬i cÊp trªn 50 ®· n¹p thÎ míi cã thÓ sö dông.", 0)
			return 0;
		end
		return 1;
	end

	-- ÔªË§Ò×ÈÝ
	if (nParticular == 447) then
		
		if nTripMode ~= 2 and (IsCharged() ~= 1) then
			Say("ChØ cã ng­êi ch¬i cÊp trªn 50 ®· n¹p thÎ míi cã thÓ sö dông.", 0)
			return 0;
		end	
		return 1;
	end
	return 1;
end;
		