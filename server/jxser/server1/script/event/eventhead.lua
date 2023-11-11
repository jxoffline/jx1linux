--========ÎÄ¼þ¶¨Òå==================================--
--ÎÄ¼þÃû£º/script/event/evnethead.lua
--×÷Õß£ºyfeng
--´´½¨ÈÕÆÚ£º2005-3-21
--×îºóÐÞ¸ÄÈÕÆÚ£º2005-3-22
--¹¦ÄÜÐðÊö£º
--	ÊÐ³¡»î¶¯µÄÍ·ÎÄ¼þ£¬¸ÃÎÄ¼þ´æ´¢¸÷ÖÖÊÐ³¡»î¶¯µÄ¿ª¹Ø£¬
--ÊÐ³¡»î¶¯µÄ¿ª¹Ø£¬ÔÚÕâÀï¿ØÖÆ¡£
--
--ÓÎÏ·½Å±¾¡¤½£ÏÀÇéÔµÍøÂç°æ
--½ðÉ½Èí¼þ¹É·ÝÓÐÏÞ¹«Ë¾£¬copyright 1992-2005
--==================================================--

if not EVENTHEAD_LUA then
EVENTHEAD_LUA = 1

--========º¯Êý¶¨Òå==================================--
--º¯ÊýÔ­ÐÎ£ºvalidateDate(startt,endt)
--×÷Õß£ºyfeng
--´´½¨ÈÕÆÚ£º2005-3-21
--×îºóÐÞ¸ÄÈÕÆÚ£º
--¹¦ÄÜÐðÊö£º
--	ÑéÖ¤µ±Ç°Ê±¼äÊÇ·ñÔÚÊÐ³¡»î¶¯Ê±¼äÄÚ
--²ÎÊý£º
--	startt£ºÊÐ³¡»î¶¯ÆðÊÂÊ±¼ä£¬ÎªÕûÊý£¬¾«È·µ½Ð¡Ê±£¬ÊÐ³¡
--»î¶¯±ØÐë´ÓÄ³ÌìµÄÄ³Ê±0·ÖÆô¶¯£¬¸ñÊ½ÎªYYMMDDHH
--	endt£ºÊÐ³¡»î¶¯µÄÖÕÖ¹Ê±¼ä£¬ÎªÕûÊý£¬¾«È·µ½ÏûÊ§£¬ÊÐ³¡
--»î¶¯±ØÐëÔÚÄ³ÌìµÄÄ³Ê±0·ÖÖ®Ç°ÖÕÖ¹£¬¸ñÊ½ÎªYYMMDDHH
--·µ»ØÖµ£º
--	nil±íÊ¾µ±Ç°Ê±¼ä²»ÔÚÊÐ³¡»î¶¯ÈÕÆÚÄÚ¡£·ñÔò±íÊ¾ÔÚÊÐ³¡»î
--¶¯ÈÕÆÚÄÚ¡£
--==================================================--
function validateDate(startt,endt)
	local now = tonumber(date("%y%m%d%H"))
	if(now >= startt and now < endt) then
		return 1
	end
	return nil
end

--========º¯Êý¶¨Òå==================================--
--º¯ÊýÔ­ÐÎ£ºQuit()
--×÷Õß£ºyfeng
--´´½¨ÈÕÆÚ£º2005-3-22
--×îºóÐÞ¸ÄÈÕÆÚ£º
--¹¦ÄÜÐðÊö£º
--	¶Ô»°¿òÍ¨ÓÃ¹Ø±Õº¯Êý
--==================================================--
function Quit()
	return
end

--========º¯Êý¶¨Òå==================================--
--º¯ÊýÔ­ÐÎ£ºLIGUAN_TAG(msg)
--×÷Õß£ºyfeng
--´´½¨ÈÕÆÚ£º2005-3-21
--×îºóÐÞ¸ÄÈÕÆÚ£º
--¹¦ÄÜÐðÊö£º
--	ÓÃÓÚÍ¼ÐÎ¶Ô»°¿òÖÐÀñ¹ÙÍ¼Æ¬µÄÁ´½Ó
--²ÎÊý£º
--	msg£ºÍ¼Æ¬ºó¸úµÄÎÄ±¾ÐÅÏ¢
--==================================================--
function LIGUAN_TAG(msg)
	return "<link=image[0,20]:\\spr\\npcres\\passerby\\passerby181\\passerby181_pst.spr>LÔ quan <link>"..msg
end

DATESNEWBIELEVELUP = 05032400 --ÐÂÊÖ·è¿ñ¾­Ñé·­±¶»î¶¯ÓÚ2005-3-24ÈÕ0µã0·ÖÆô¶¯
DATEENEWBIELEVELUP = 05040100 --ÐÂÊÖ·è¿ñ¾­Ñé·­±¶»î¶¯ÓÚ2005-4-1ÈÕ0µã0·Ö¹Ø±Õ

DATESPLAYERLEVELUP = 05032600 --È«ÇøÉÁµç³å¼¶ÐÐ¶¯ÓÚ2004-3-24ÈÕ0Ê±0·ÖÆô¶¯(¿ªÆô)
DATEEPLAYERLEVELUP = 05040300 --È«ÇøÉÁµç³å¼¶ÐÐ¶¯ÓÚ2004-4-1ÈÕ0Ê±0·Ö¹Ø±Õ(¿ªÆô)

DATESKILLER = 05041200
DATEEKILLER = 05042600

--update:2005-03-21
YEARCARD_EX_XUANJING = 1 --½£ÍøÄê¿¨»î¶¯
REVIVAL_PLAYER = nil
GREAT_NIGHT = 1
end