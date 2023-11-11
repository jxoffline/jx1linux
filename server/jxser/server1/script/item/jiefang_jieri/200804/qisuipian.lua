-- ÎÄ¼þÃû¡¡£ºqisuipian.lua
-- ´´½¨Õß¡¡£ºzhongchaolong
-- ´´½¨Ê±¼ä£º2008-04-15 10:58:58
--ÆìµÄËéÆ¬ 

--Ê¹ÓÃ·½·¨£ºÓÒ¼üµã»÷Ê¹ÓÃºó½«»áÁìÈ¡304¾­ÑéÖµ304 ¾­Ñéµã £¨304ÊÇÖ¸4ÔÂ30ÈÕµÄÒâË¼£©
--Ê¹ÓÃ½ØÖ¹Ê±¼ä£º2008Äê05ÔÂ31ÈÕ24µã00·Ö
--ÏÞÖÆ£º
--- Íæ¼ÒµÄÈÎºÎµÈ¼¶¶¼ÄÜÊ¹ÓÃ´ËÀàÎïÆ·¡£
--- ³äÖµÍæ¼Ò²ÅÄÜÊ¹ÓÃ¡£
---Éý¼¶ºó¾­Ñé²»µþ¼Ó
--- »î¶¯ÆÚ¼ä£¬Ò»¸öÍæ¼Ò×î¶àÄÜÊ¹ÓÃ1975¸ö¡£
--SetSpecItemParam(nItemIndex, 1, tonumber(GetLocalDate("%Y%m%d")) )
--SetSpecItemParam(nItemIndex, 2, tonumber(GetLocalDate("%Y")) )
--SetSpecItemParam(nItemIndex, 3, tonumber(GetLocalDate("%m")) )
--SetSpecItemParam(nItemIndex, 4, tonumber(GetLocalDate("%d")) )


IncludeLib("SETTING");
Include("\\script\\lib\\pay.lua");
Include("\\script\\event\\jiefang_jieri\\200804\\taskctrl.lua")
function main(nItemIndex)
	jiefang_0804_ResetTask()
	
	local nItemData	= 20080531
	local nDate = tonumber(GetLocalDate("%Y%m%d"))
	
	
	if nDate > nItemData then
		Msg2Player("VËt phÈm qu¸ h¹n sö dông, tù ®éng mÊt ®i.")
		return 0;
	end
	
	if IsCharged() == 0 then
		Say("ChØ cã ng­êi ch¬i ®· n¹p thÎ míi cã thÓ sö dông.", 0)
		return 1;
	end
	local nCurFlagCount = GetTask(jiefang_0804_TSK_FlagCount)
	if nCurFlagCount >= jiefang_0804_TSKV_FlagCount then
		Say(format("§· sö dông %d vËt phÈm nµy, ®· ®¹t ®Õn giíi h¹n sö dông.", jiefang_0804_TSKV_FlagCount), 0)
		return 1
	end
	AddOwnExp(304)
	SetTask(jiefang_0804_TSK_FlagCount, nCurFlagCount + 1)
	return 0;
end