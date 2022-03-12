-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµÍøÂç°æÔ½ÄÏ°æ - Áú·ïÎ²
-- ÎÄ¼şÃû¡¡£ºlongfeng_wei.lua
-- ´´½¨Õß¡¡£º×Ó·Çô~
-- ´´½¨Ê±¼ä£º2009-05-21 12:05:35

-- ======================================================

Include("\\script\\event\\birthday_jieri\\200905\\class.lua");

function main()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	if 20090619 > nCurDate or nCurDate > 20090727 then	
		Talk(1, "", "Ho¹t ®éng ®· kÕt thóc.");
		return 0;
	end
	
	if tbBirthday0905.tbTask:get_task(tbBirthday0905.tbTask.tsk_zhuhe_maxexp) == 0 or tbBirthday0905.tbTask:get_task(tbBirthday0905.tbTask.tsk_zhuhe_maxexp) == nil then
		tbBirthday0905.tbTask:add_zhuhe_maxexp();
	end	
	
	if (tbBirthday0905.tbTask:get_task(tbBirthday0905.tbTask.tsk_zhuhe_maxexp) == tbBirthday0905.tbTask.nmaxexpfromzhuhe) then
		tbBirthday0905.tbTask:add_zhuhe_maxexp();
		Msg2Player("N©ng cÊp thu ®­îc giíi h¹n kinh nghiÖm cña hai vËt phÈm [T©n B¶n Cæ] vµ [T©n B¶n Kú] lµ 3000000000 Exp")
	else
		
		Talk(1, "", "Kh«ng ®­îc sö dông vËt phÈm nµy.");
		return 1;
		
	end
end

