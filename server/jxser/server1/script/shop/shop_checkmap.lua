
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonline ÆæÕä¸óÏŞÖÆÅĞ¶Ï½Å±¾
-- Edited by peres
-- 2006/01/16 PM 12:42

-- Èç¹ûÓĞ¹ıĞÒ¸£
-- ĞÒ¸£Ö»ÊÇË²¼äµÄÆ¬¶Ï£¬Ò»Ğ¡¶ÎÒ»Ğ¡¶Î
-- ·¿¼äÀïµÄºÚ°µ¾ÍÓÌÈç´óº££¬Í¯ÄêµÄÊ±ºòËıºÍ¸¸Ä¸Ò»Æğ×ø´¬È¥º£µº
-- Ò¹ÍíµÄ´¬ÔÚ·çÀËÀïµßô¤£¬ËıÌÉÔÚĞ¡Ğ¡µÄÆÌÎ»ÉÏ¸Ğ¾õ×Ô¼ºËæ×Å³±Ë®Æ¯ÏòÊÀ½çµÄ¾¡Í·
-- ¶øÄÇÒ»¿Ì£¬ÊÀ½çÊÇ²»´æÔÚµÄ
-- Ö»ÓĞËûºÍËıÁ½¸öÈË¡£ËûÃÇÏà°®

-- ======================================================

-- LLG_ALLINONE_TODO_20070802

Include("\\script\\global\\systemconfig.lua") -- ÏµÍ³ÅäÖÃ
Include("\\script\\trip\\define.lua")
Include("\\script\\maps\\checkmap.lua");

-- ¿ÉÒÔ½øĞĞ¹ºÂòµÄÆäËüÌØÊâµØÍ¼ ID
aryMap = {
	44, 326, 327, 328, 329, 330, 331, 344, 345, 346, 347, 348, 349, 350, 351, 352, 353, 354, 355, 357, 358, 359, 360, 361, 362, 363, 364, 365, 366, 367, 368, 369, 370, 371, 372, 373, 374,375,376,377,378,379,380,381,382,383,384,385,386,--ËÎ½ğÕ½³¡ºóÓª
	323,324,325,	--ËÎ½ğ±¨Ãûµã
	221,222,223,	--¹¥³ÇÕ½£¬ºóÓª
	208,			--´óÀÎ(by ÁÎÖ¾É½)
	605,606,607,	--ÎäÁÖµÚÒ»°ïºóÓª
	608,609,610,611,612,613,		--ÎäÁÖµÚÒ»°ï×¼±¸³¡
	520,521,522,523,524,525,526,	-- Ã÷ÔÂÕò
--	-- ÌÒ»¨µº
--	235,
--	236,
--	237,
--	238,
--	239,
--	240,
--	241,
}

OtherMap = {m_Maps = {}}

function OtherMap:Initialize()
	for i = 1, getn(aryMap) do
		self.m_Maps[aryMap[i]] = 1
	end
end

function OtherMap:AddMap(mapid)
	self.m_Maps[mapid] = 1
end

function OtherMap:DelMap(mapid)
	self.m_Maps[mapid] = nil
end

function OtherMap:Check(mapid)
	if (self.m_Maps[mapid] ~= nil) then
		return 1
	else
		return 0
	end
end
OtherMap:Initialize()

function IsShopMap(nMapID)
	if (IsCityMap(nMapID) == 1 or
		IsFreshmanMap(nMapID) == 1 or
		IsTongMap(nMapID) == 1 or
		OtherMap:Check(nMapID) == 1) then
		return 1
	else
		return 0
	end
end

function main()
	if (CheckGlobalTradeFlag() == 0) then		-- È«¾Ö¾­¼ÃÏµÍ³½»Ò×¿ª¹Ø
		return
	end
	
	-- ÔÚ global\systemconfig.lua ÖĞÅäÖÃÆæÕä¸ó¿ª¹Ø
	if SYSCFG_SHOP_OPEN ~= 1 then
		Msg2Player("<color=yellow>HiÖn t¹i Kú Tr©n C¸c vÉn ch­a më! <color>")
		return 0
	end

	if GetTripMode() == TRIP_MODE_SERVER then
		Msg2Player("<color=yellow>HiÖn t¹i Kú Tr©n C¸c vÉn ch­a më! <color>")
		return 0
	end
	local nMapID, _, _ = GetWorldPos()
	if (GetFightState() >= 1 or IsShopMap(nMapID) == 0) then
		Msg2Player("<color=yellow>Kú Tr©n C¸c chØ cã thÓ më t¹i c¸c thµnh thŞ, t©n thñ th«n vµ mét sè khu vùc phi chiÕn ®Êu kh¸c! <color>")
		return 0
	else
		return 1
	end
end
