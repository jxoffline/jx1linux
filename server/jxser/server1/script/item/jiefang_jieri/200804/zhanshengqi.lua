-- ÎÄ¼şÃû¡¡£ºzhanshengqi.lua
-- ´´½¨Õß¡¡£ºzhongchaolong
-- ´´½¨Ê±¼ä£º2008-04-15 11:51:30

--ÏŞÖÆ£º
--- 50¼¶ÒÔÉÏµÄ³äÖµÍæ¼Ò²ÅÄÜÊ¹ÓÃ¡£
--- »î¶¯ÆÚ¼ä£¬Ã¿¸öÍæ¼ÒÖ»ÄÜÍ¨¹ıÊ¹ÓÃÕ½Ê¤Æì»ñµÃ×î¶à1.200.000.000¾­ÑéÖµ¡£
---Éı¼¶ÒÔºó¾­Ñé²»µş¼Ó
--Ê¹ÓÃÕ½Ê¤ÆìÂíÉÏ»ñµÃ2.000.000¾­ÑéÖµ¡£

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
	
	
	
	if IsCharged() == 0 or GetLevel() < 50 then
		Say("ChØ cã ng­êi ch¬i cÊp trªn 50 ®· n¹p thÎ míi cã thÓ sö dông.", 0)
		return 1;
	end
	
	local nExp = 2000000
	local nCurFlagExp = GetTask(jiefang_0804_TSK_FlagExpLimit)
	if nCurFlagExp >= jiefang_0804_TSKV_FlagExpLimit then
		Say(format("Trong thêi gian ho¹t ®éng, th«ng qua viÖc sö dông l¸ cê chiÕn th¾ng chØ cã thÓ nhËn ®­îc tèi ®a %d ®iÓm kinh nghiÖm.", jiefang_0804_TSKV_FlagExpLimit), 0)
		return 1
	end
	AddOwnExp(nExp)
	SetTask(jiefang_0804_TSK_FlagExpLimit, nCurFlagExp + nExp)
	
end