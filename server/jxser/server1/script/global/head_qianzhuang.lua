--------------------------------------
-- Ç®×¯¹¦ÄÜµÄÍ·ÎÄ¼ş

Include("\\script\\global\\systemconfig.lua") -- ÏµÍ³ÅäÖÃ

IncludeForRegionVer("\\script\\global\\", "gamebank_head.lua")

--------------------------------------

QUESTKEY_TICKET = 488;					-- ÒøÆ±µÄÎïÆ·ID
EXTPOINT_TICKET = 2;					-- ÒøÆ±µÄÀ©Õ¹µã
EXTPOINT_TICKET_NEW = 6;
QUESTKEY_TICKET_NEW = 962

EXTPOINT_MAXVAL = 32768;	
			-- À©Õ¹µãµÄ×î´óÖµ
---------------------------------------------------------------
--Ê¹ÓÃÒøÆ±¹¦ÄÜº¯Êı ÒøÆ±·ÖÒøÆ±ºÍĞÂÒøÆ±Á½ÖÖ£¬±¾function Í³Ò»´¦Àí
--ÊäÈë²ÎÊı£¬ticket ÒøÆ±ÊıÁ¿ logstr ²Ù×÷ÃèÊö£¨»á¼ÇÈÕÖ¾£©
--·µ»ØÖµÎª -1Òì³£ 0ÒøÆ±²»¹» 1 ÒøÆ±¿Û³ı³É¹¦
--Èç¹ûÒøÆ±²»¹»£¬²»»á¿ÛÒøÆ±µÄ

function qz_use_silver( ticket , logstr)
	if (logstr == nil) then
		logstr = " [ch­a râ]"
	end
	
	if (SYSCFG_GAMEBANK_TICKET_USE == nil) then -- ³ö´íÁË~~
		print("use_ticket have close, but something is wrong...");
		Msg2Player("Chøc n¨ng bŞ lçi!");
		return -1
	end
	
	if (ticket < 1 or ticket == nil) then
		Msg2Player("Chøc n¨ng bŞ lçi!")
		return -1
	end
	local nCountOld = GetItemCountEx(488);--¾ÉÒøÆ±
	local nCountNew = GetItemCountEx(962);
	if (nCountOld + nCountNew < ticket) then
		return 0;
	end
	
	local nDelCountOld = ticket;
	local nDelCountNew = 0;
	if (nCountOld < ticket) then
		nDelCountOld = nCountOld;
		nDelCountNew = ticket - nCountOld;
	end;
	for i = 1, nDelCountOld do
		DelItemEx(488);
	end
	for i = 1, nDelCountNew do
		DelItemEx(962);
	end
	WriteGoldLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: dïng"..ticket.."TÊm ng©n phiÕu"..logstr, 0, 0, 0, (-ticket));
	
	if (nDelCountOld > 0) then
		UseSilver(2, 2, nDelCountOld); -- ÒøÆ±¶Ò»»ÎªÍ­Ç®µÄÏûºÄÍ³¼Æ(Ö±½ÓÏûºÄµÄÔª±¦ÒøÆ±£¬ÓëÍ­Ç®¶Ò»»µÈÍ¬´¦Àí)
	end;
	if (nDelCountNew > 0) then
		UseSilver(3, 2, nDelCountNew); -- ÒøÆ±¶Ò»»ÎªÍ­Ç®µÄÏûºÄÍ³¼Æ(Ö±½ÓÏûºÄµÄÔª±¦ÒøÆ±£¬ÓëÍ­Ç®¶Ò»»µÈÍ¬´¦Àí)
	end;
	SaveNow(); -- Á¢¼´´æÅÌ
	return 1;
end
