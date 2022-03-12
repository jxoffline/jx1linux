-- mooncake_head.lua
-- ÔÂ±ý»î¶¯Í·ÎÄ¼þ
-- 2005-09-07 by steve

IncludeLib("TIMER")

-- È«¾Ö±äÁ¿
GBL_VAR_MOONCAKE_EXCHANGING		 = 801	-- ÊÇ·ñÕýÔÚ¶Ò»»²ÄÁÏ
GBL_VAR_MOONCAKE_MARTERIAL_TYPE	 = 802	-- ¶Ò»»²ÄÁÏµÄÀà±ð
GBL_VAR_MOONCAKE_MARTERIAL_COUNT = 803	-- ¶Ò»»²ÄÁÏµÄÊýÄ¿
GBL_VAR_MOONCAKE_CITY 			 = 804	-- ¶Ò»»²ÄÁÏµÄ³ÇÊÐ
GBL_VAR_MOONCAKE_EXCHANGETIME	 = 805	-- ±¾´Î¶Ò»»µÄ¿ªÊ¼Ê±¼ä

TIMER_MOONCAKE_EXCHANGE			= 47	-- ¶Ò»»²ÄÁÏ¶¨Ê±Æ÷
TIMER_MOONCAKE					= 48	-- ÖÆ×÷ÔÂ±ý¶¨Ê±Æ÷
TIMER_MOONCAKE_HINT				= 49	-- ÌáÐÑÁìÈ¡ÔÂ±ýµÄ¶¨Ê±Æ÷
MISSION_MOONCAKE_EXCHANGE		= 8		-- ¶Ò»»²ÄÁÏÈÎÎñ

VARV_MOONCAKE_EXCHANGETIME		= 1566	-- Íæ¼ÒÉÏ´Î¶Ò»»²ÄÁÏµÄÊ±¼ä
VARV_MOONCAKE_EXCHANGECOUNT		= 1567	-- Íæ¼Ò¶Ò»»²ÄÁÏµÄ´ÎÊý
VARV_MOONCAKE 					= 1569	-- ÔÂ±ýÊ¹ÓÃµÄÈÎÎñ±äÁ¿£¬ÓÃÀ´±£´æÔÂ±ýµÄÀà±ðºÍ×´Ì¬ == ÔÂ±ýÀà±ð * 1000 + ÔÂ±ý×´Ì¬


STAT_MIN				= 1		-- ×îÐ¡×´Ì¬
STAT_PARCHED			= 1		-- ºæ¿¾¹ýÊ±µÄ¿¼½¹µÄÔÂ±ý
STAT_HUOMIAN_PARCHED	= 2		--ºÍÃæ¡¢°üÏÚ ¹ýÊ±µÄ¿¾½¹µÄÔÂ±ý
STAT_HUOMIAN_MAKING 	= 3		-- ÕýÔÚºÍÃæ
STAT_HUOMIAN_FINISH 	= 4		-- ºÍÃæÍê³É
STAT_BAOXIAN_MAKING 	= 5		-- ÕýÔÚ°üÏÚ
STAT_BAOXIAN_FINISH 	= 6		-- °üÏÚÍê³É
STAT_HONGKAO_MAKING 	= 7		-- ÕýÔÚºæ¿¾
STAT_HONGKAO_FINISH 	= 8		-- ºæ¿¾Íê³É
STAT_MAX				= 8		-- ×î´ó×´Ì¬

TYPE_MIN				= 1		-- ×îÐ¡Àà±ð
TYPE_SHIJIN				= 1		-- Ê²½õÔÂ±ý
TYPE_GUOREN				= 2		-- ¹ûÈÊÔÂ±ý
TYPE_DANHUANGLIANRONG	= 3		-- µ°»ÆÁ«ÈØÔÂ±ý
TYPE_DANHUANGDOUSHA		= 4		-- µ°»Æ¶¹É³ÔÂ±ý
TYPE_LIANRONG			= 5		-- Á«ÈØÔÂ±ý
TYPE_DOUSHA				= 6 	-- ¶¹É³ÔÂ±ý
TYPE_MAX				= 6		-- ×î´óÀà±ð

-- Æß´ó³ÇÊÐ
tbl_cities = {
    [1] = "Ph­îng T­êng",
    [11] = "Thµnh §«",
    [37] = "BiÖn Kinh",
    [78] = "T­¬ng D­¬ng",
    [80] = "D­¬ng Ch©u",
    [162] = "§¹i Lý",
    [176] = "L©m An", 
};

-- ²ÄÁÏÃû×Ö
tbl_material = {
    {"Trøng ",		4,	522},
    {"H¹nh nh©n ",	4,	525},
    {"§Ëu phéng ",	4,	526},
    {"C¬m dõa",	4,	527},
    {"Bét m× ",	4,	520},
    {"§­êng c¸t",	4,	521},
    {"Bét sen ",	4,	523},
    {"§Ëu xanh",	4,	524},
};

-- ¶Ò»»´ÎÊýÏÞÖÆ
tbl_exchange_limitcount = {
	10,		-- µ°
	4,		-- ÐÓÈÊ
	2,		-- »¨Éú
	1,		-- Ò¬Ë¿
};

-- ¶Ò»»±í
tbl_exchange = {
   	--µ°	ÐÓÈÊ	»¨Éú	Ò¬Ë¿
	{0,		1,		2,		24},	-- µ°¶Ò»»ÆäËûÎïÆ·
	{0,		0,		2,		16},	-- ÐÓÈÊ¶Ò»»ÆäËûÎïÆ·
	{0,		0,		0, 		8},		-- »¨Éú¶Ò»»ÆäËûÎïÆ·
	{0,		0,		0,		0},		-- Ò¬Ë¿¶Ò»»ÆäËûÎïÆ·
	{50,	75,		150,	1500},	-- Ãæ·Û¶Ò»»ÆäËûÎïÆ·
	{50,	75,		150,	1500},	-- É°ÌÇ¶Ò»»ÆäËûÎïÆ·
	{6,		8,		16,		160},	-- Á«ÈØ¶Ò»»ÆäËûÎïÆ·
	{6,		8,		16,		160},	-- ¶¹É³¶Ò»»ÆäËûÎïÆ·
};

-- Í¨Öª
tbl_notice = {
	[STAT_HUOMIAN_FINISH] = "<#> B¸nh cña ng­¬i ®· <color=yellow>nhµo bét xong<color>, mau ®Õn lÊy!",		-- ºÍÃæÍê³É
	[STAT_BAOXIAN_FINISH] = "<#> B¸nh cña ng­¬i ®· <color=yellow>lµm xong nh©n b¸nh<color>, mau ®Õn lÊy!",		-- °üÏÚÍê³É
	[STAT_HONGKAO_FINISH] = "<#> B¸nh cña ng­¬i ®· <color=yellow>n­íng xong <color>, mau ®Õn lÊy!",	-- ºæ¿¾Íê³É
};

-- »ñÈ¡¿É¶Ò»»Ä³ÖÖ²ÄÁÏµÄ²ÄÁÏÊýÁ¿ÁÐ±í
function GetExchangeList(typeid)
	-- DEBUG
	print(format("GetExchangeList(%d)", typeid))
	local index = 1
	local result = {}
	for i = 1, getn(tbl_exchange) do
		local count = tbl_exchange[i][typeid]
		if (count ~= 0) then
			result[index] = {i, count}	-- {ÀàÐÍ, ÊýÁ¿}
			index = index + 1
		end
	end
	if (getn(result) == 0) then
		return nil
	else
		return result
	end
end

function cancel()
	-- do nothing
end

-- Æô¶¯ÌáÐÑÁìÈ¡ÔÂ±ýµÄ¶¨Ê±Æ÷
function start_hint()
	TM_SetTimer(18 * 10, TIMER_MOONCAKE_HINT, 30, 0)
end

-- ¹Ø±ÕÌáÐÑÁìÈ¡ÔÂ±ýµÄ¶¨Ê±Æ÷
function close_hint()
	TM_StopTimer(TIMER_MOONCAKE_HINT)
end
