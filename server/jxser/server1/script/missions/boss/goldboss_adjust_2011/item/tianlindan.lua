-- ÎÄ¼şÃû¡¡£ºtianlindan.lua
-- ´´½¨Õß¡¡£ºwangjingjun
-- ÄÚÈİ¡¡¡¡£ºÌìÁéµ¤£¬Ã¿Ìì×î¶àÖ»ÄÜÊ¹ÓÃ2¸ö
-- ´´½¨Ê±¼ä£º2011-09-01 09:42:31

Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\awardtemplet.lua")

TSK_USED = 2800	-- ÈÎÎñ±äÁ¿´ı¶¨
--1 ngµy dc sö dông 5 lÇn vËt phÈm Tiªn Linh §¬n - Modified by DinhHQ - 20111013
NDAILYTIME = 5


function main()
	
	local tbAward = {
		{nExp_tl=1,nCount = 20000000,},
		}
	local szFailMsg = format("Mçi ngµy mçi nh©n vËt chØ cã thÓ sö dông nhiÒu nhÊt %d lÇn, ®îi ngµy mai h·y sö dông tiÕp",NDAILYTIME)	
	if PlayerFunLib:CheckTaskDaily(TSK_USED, NDAILYTIME, szFailMsg, "<") == 1 then
		PlayerFunLib:AddTaskDaily(TSK_USED, 1) 
		tbAwardTemplet:Give(tbAward, 1, {"goldbossadjust_2011", "use_tianlindan"} )
		return 0
	end
	
	return 1
end