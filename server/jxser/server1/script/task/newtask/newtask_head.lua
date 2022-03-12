-------------------------------------------------------------------------
-- FileName		:	newtask_head.lua
-- Author		:	lailigao
-- CreateTime	:	2004-12-27 21:42:55
--	Desc		£º	ĞÂÈÎÎñÏµÍ³»ù´¡¶¨Òå
--					ÃüÃû¹æ·¶£ºnt_xxx (newtask)
-------------------------------------------------------------------------

--Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\task_award_extend.lua")		--ÈÎÎñÖĞ½±ÀøµÄÀ©Õ¹½Å±¾

-- DescribÍ¼Æ¬ÃèÊö
DescLink_NieShiChen = "<#><link=image[147,167]:\\spr\\npcres\\enemy\\enemy154\\enemy154_pst.spr>NhiÕp Thİ TrÇn:<link>";
TSKID_KILLTASKID =		1082;	-- ½ÓÊÜµÄÄÄ¸öÈÎÎñ
TSKID_KILLERDATE =		1192;	--½ÓÈÎÎñÊ±µÄÈÕÆÚ
TSKID_KILLERMAXCOUNT =	1193;	--Ã¿ÌìÉ±ÈË´ÎÊı
TSKID_KILLTASKID_SPE =	1793;	-- ÊÇ·ñ½ÓÊÜ¸ß¼¶É±ÊÖÈÎÎñ	-- ÊÕ·Ñ°æ²»ÓÃ
TSKID_KILLERDATE_SPE =	1794;	--½Ó¸ß¼¶É±ÊÖÈÎÎñÊ±µÄÈÕÆÚºÍ´ÎÊı	-- ÊÕ·Ñ°æ²»ÓÃ

KILLER_MAXCOUNT		= 8;	--Ã¿ÌìÉ±ÈËÉÏÏŞ8ÈË


-- ÕıÖĞĞ°ÕóÓª¶¨Òå
NT_Camp_Zheng 	= 0
NT_Camp_Zhong 	= 1
NT_Camp_Xie 	= 2
----------------¹«¹²ÀàĞÍ¶¨Òå end -------------------

----------------¹«¹²»ù±¾º¯Êı start-------------------
-- ÉèÖÃÈÎÎñ×´Ì¬
function nt_setTask(nTaskID, nTaskValue)
	SetTask(nTaskID, nTaskValue)
	SyncTaskValue(nTaskID) -- Í¬²½µ½¿Í»§¶Ë
end

-- »ñÈ¡ÈÎÎñ×´Ì¬
function nt_getTask(nTaskID)
	return GetTask(nTaskID)
end

-- »ñÈ¡Íæ¼ÒµÄÕı¡¢ÖĞ¡¢Ğ°ÕóÓª
-- 0 - Õı 1 - ÖĞ£¬2 - Ğ°
function nt_getCamp()
	local lastFaction = GetLastFactionNumber();
	if (lastFaction == 0) or (lastFaction == 4) or (lastFaction == 6) or (lastFaction == 8) then
		return NT_Camp_Zheng; -- ÕıÅÉ
	elseif  (lastFaction == 1) or (lastFaction == 2) or (lastFaction == 5) or (lastFaction == 9) then
		return NT_Camp_Zhong; --ÖĞÁ¢
	elseif  (lastFaction == 3) or (lastFaction == 7) then
		return NT_Camp_Xie; --Ğ°ÅÉ
	end
end
----------------¹«¹²»ù±¾º¯Êı start-------------------
