-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµÍøÂç°æÒ»ÕòÅÉÁéµ¤
-- Ê³ÓÃºóÄÜÌáÉı£±µã¼¼ÄÜµã
-- ÓëÕòÅÉÁéÒ©¹²ÓÃ±äÁ¿£¬µÚÒ»¸öByte¼ÇÂ¼Áéµ¤Ê¹ÓÃ´ÎÊı£¬µÚ¶ş¸öByte¼ÇÂ¼ÁéÒ©Ê¹ÓÃ´ÎÊı

-- Edited by ×Ó·Çô~
-- 2008/03/03 23:29

-- ======================================================
Include("\\script\\lib\\gb_modulefuncs.lua")


TSK_ZHENPAILINGDAN_USECNT	=	1882;
TSK_TOUSHI_FLAG				=	1881						-- ¡°´øÒÕÍ¶Ê¦¡±ÍË³öÃÅÅÉµÄ±ê¼Ç
														--	 0£ºÎ´ÉêÇë×ªÍ¶ÃÅÅÉ»ò×ªÍ¶ÃÅÅÉ³É¹¦£¨Óë×ªÖ°´ÎÊıÒ»Æğ¾ö¶¨£©£»1£º³É¹¦ÉêÇë×ªÍ¶ÃÅÅÉ£»
TSK_TOUSHI_COUNT			=	1883						-- ¡°´øÒÕÍ¶Ê¦¡±×ªÖ°µÄ´ÎÊı

function main(nItemIdx)
	if (gb_GetModule("SWITH_DAIYITOUSHI") ~= 1) then
		Say("Xin lçi, c«ng n¨ng nµy t¹m thêi ®· bŞ ®ãng, thêi gian më l¹i sÏ ®ùoc th«ng b¸o sau ", 0);
		return 1;
	end
	
	local nValue	= GetTask(TSK_ZHENPAILINGDAN_USECNT);
	local nTimes = GetByte(nValue, 1);
	local str={
		"Nghiªn cøu mét håi trÊn ph¸i linh ®¬n mµ vÉn kh«ng biÕt c¸ch sö dông. (ch­a chuyÓn m«n ph¸i kh«ng thÓ sö dông)",
		"Võa míi uèng xong trÊn ph¸i linh ®¬n c¶m thÊy mét luång sinh lùc ch¹y quanh ng­êi (T¨ng 1 ®iÓm kü n¨ng)",
		"Tay cÇm lÊy trÊn ph¸i linh ®¬n mµ ph¸t hiÖn ra r»ng nã kh«ng cßn t¸c dông g× n÷a (®· sö dông ®Õn sè lÇn giíi h¹n cao nhÊt)"
		}
	if(nTimes >= 15) then              	-- Ê¹ÓÃ´ÎÊıÒÑ´ïµ½ÉÏÏŞ
		Msg2Player(str[3])
		return 1;
	elseif (GetTask(TSK_TOUSHI_FLAG) == 0 and GetTask(TSK_TOUSHI_COUNT) <= 0) then     	-- ×ªÍ¶ÃÅÅÉ³É¹¦²Å¿ÉÊ¹ÓÃ
		Msg2Player(str[1])
		return 1;
	else                            	-- ½±Àø1µã¼¼ÄÜµã
		AddMagicPoint(1);
		SetTask(TSK_ZHENPAILINGDAN_USECNT, SetByte(nValue, 1, nTimes + 1));
		Msg2Player(str[2]);
		WriteLog(format("[%s]\t%s\tName:%s\tAccount:%s\tAdd MagicPoint 1 by ZhenPaiLingDan",
						"TrÊn ph¸i linh ®¬n",
						GetLocalDate("%Y-%m-%d %X"),
						GetName(), GetAccount()));
		return 0;
	end
end
