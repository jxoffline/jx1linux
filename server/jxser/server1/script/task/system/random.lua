
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonline Ëæ»úÈÎÎñ´¥·¢Èë¿Ú½Å±¾
-- Edited by peres
-- 2005/09/01 PM 16:40

-- Ö»ÓĞËûºÍËıÁ½¸öÈË
-- ËûÃÇÏà°®
-- Ëı¼ÇµÃ
-- ËûµÄÊÖ¸§Ä¦ÔÚËıµÄÆ¤·ôÉÏµÄÎÂÇé
-- ËûµÄÇ×ÎÇÏñÄñÈºÔÚÌì¿ÕÂÓ¹ı
-- ËûÔÚËıÉíÌåÀïÃæµÄ±©ìåºÍ·Å×İ
-- ËûÈëË¯Ê±ºòµÄÑù×Ó³äÂú´¿Õæ
-- Ëı¼ÇµÃ£¬Çå³¿ËıĞÑ¹ıÀ´µÄÒ»¿Ì£¬ËûÔÚËıµÄÉí±ß
-- ËıÕö×ÅÑÛ¾¦£¬¿´Êï¹âÍ¸¹ı´°Á±Ò»µãÒ»µãµØÕÕÉä½øÀ´
-- ËıµÄĞÄÀïÒòÎªĞÒ¸£¶øÌÛÍ´

-- ======================================================

-- ÈÎÎñÏµÍ³¿âÖ§³Ö
IncludeLib("TASKSYS");

-- Í¬°éÏµÍ³µÄÖ§³Ö
IncludeLib("PARTNER");

-- ¶ÁÈëÈÎÎñÏµÍ³Í·ÎÄ¼ş£¬°üº¬Ëæ»úÈÎÎñ
Include("\\script\\task\\system\\task_main.lua");


-- ×ÓÄ¸´üÍ·ÎÄ¼ş
Include("\\script\\item\\ib\\zimudai.lua");


function main()
	local szRegion = GetProductRegion();

	if (szRegion == "vn") then	--Ô½ÄÏÃ»ÓĞËæ»úÈÎÎñ
		do return end
	end;

	if (szRegion == "cn_ib") then
		-- IB ×ÓÄ¸´ü¶¨Ê±¼ì²éÓĞĞ§ÆÚ
		zmd_check_expire_timer();
		do return end
	end	
	
	
	local partnerindex,partnerstate = PARTNER_GetCurPartner()       -- »ñµÃÕÙ»½³öÍ¬°éµÄindex,Í¬°é×´Ì¬ÎªÕÙ³ö»òÎª²»ÕÙ³ö
	local nResult = 0;

	local nRandomMax = 8;  -- Ëæ»úÈÎÎñ¼¸ÂÊµÄ×î´óËæ»úÖµ

	-- Ã»ÓĞÍ¬°éµÄ¸úËæÎŞ·¨´¥·¢ÈÎÎñ
	if partnerindex==0 or partnerstate==0 then
		return
	end;
	

	if (szRegion == "cn") then
		-- Èç¹ûÊÇxx»î¶¯£¬Ôò¼Ó´óÒ»±¶µÄ¸ÅÂÊ
		--if isEventDay()==1 then nRandomMax = 4; end;
	end
	
	-- Èç¹û²»ÊÇÌØÊâ»î¶¯£¬ÔòÓĞ 1/8 µÄ¼¸ÂÊ´¥·¢Ëæ»úÈÎÎñ
	if random(1,nRandomMax)==1 then
	
		nResult = initRandomTask();
		
		if nResult==0 then
			CDebug:MessageOut("Tïy theo nhiÖm vô b¹n sÏ chän sè ID t­¬ng øng!");
		end;
		
	end;

	return 0;

end;

-- »ñÈ¡Ã¿´ÎËæ»úÈÎÎñµÄ´¥·¢Ê±¼ä£¬Ã¿ 12 ·ÖÖÓ´¥·¢
function GetRandomTimer()
	return 720;
end;
