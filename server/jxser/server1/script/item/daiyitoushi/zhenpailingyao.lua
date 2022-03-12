-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµÍøÂç°æÒ»ÕòÅÉÁéÒ©
-- Ê³ÓÃºóÄÜÌáÉý5µãÇ±ÄÜµã
-- ÓëÕòÅÉÁéÒ©¹²ÓÃ±äÁ¿£¬µÚÒ»¸öByte¼ÇÂ¼Áéµ¤Ê¹ÓÃ´ÎÊý£¬µÚ¶þ¸öByte¼ÇÂ¼ÁéÒ©Ê¹ÓÃ´ÎÊý

-- Edited by ×Ó·Çô~
-- 2008/03/03 23:29

-- ======================================================
Include("\\script\\lib\\gb_modulefuncs.lua")


TSK_ZHENPAILINGDAN_USECNT	=	1882;
TSK_TOUSHI_FLAG				=	1881						-- ¡°´øÒÕÍ¶Ê¦¡±ÍË³öÃÅÅÉµÄ±ê¼Ç
														--	 0£ºÎ´ÉêÇë×ªÍ¶ÃÅÅÉ»ò×ªÍ¶ÃÅÅÉ³É¹¦£¨Óë×ªÖ°´ÎÊýÒ»Æð¾ö¶¨£©£»1£º³É¹¦ÉêÇë×ªÍ¶ÃÅÅÉ£»
TSK_TOUSHI_COUNT			=	1883						-- ¡°´øÒÕÍ¶Ê¦¡±×ªÖ°µÄ´ÎÊý

function main(nItemIdx)
	if (gb_GetModule("SWITH_DAIYITOUSHI") ~= 1) then
		Say("Xin lçi, c«ng n¨ng nµy t¹m thêi ®· bÞ ®ãng, thêi gian më l¹i sÏ ®ùoc th«ng b¸o sau ", 0);
		return 1;
	end
	
	local nValue	= GetTask(TSK_ZHENPAILINGDAN_USECNT);
	local nTimes = GetByte(nValue, 2);
	
	local str ={
		"Nghiªn cøu mét håi trÊn ph¸i linh d­îc mµ vÉn kh«ng biÕt c¸ch sö dông. (ch­a chuyÓn m«n ph¸i kh«ng thÓ sö dông)",
		"TrÊn ph¸i linh d­îc võa ®­îc nuèt xuèng, ®an ®iÒn liÒn sinh ra mét dßng nhiÖt khÝ ch¹y kh¾p kú kinh b¸t m¹ch(T¨ng 5 ®iÓm tiÒm n¨ng)",
		"Tay cÇm lÊy trÊn ph¸i linh d­îc mµ ph¸t hiÖn ra r»ng nã kh«ng cßn t¸c dông g× n÷a (®· sö dông ®Õn sè lÇn giíi h¹n cao nhÊt)"
	}
	
	if(nTimes >= 15) then 				--Ê¹ÓÃ³¬¹ý´ÎÊý
		Msg2Player(str[3])
		return 1;
	elseif (GetTask(TSK_TOUSHI_FLAG) == 0 and GetTask(TSK_TOUSHI_COUNT) <= 0) then     	-- ×ªÍ¶ÃÅÅÉ³É¹¦²Å¿ÉÊ¹ÓÃ
		Msg2Player(str[1])
		return 1;
	else                            	-- ½±Àø5µãÇ±ÄÜµã
		AddProp(5);
		SetTask(TSK_ZHENPAILINGDAN_USECNT, SetByte(nValue, 2, nTimes + 1));
		Msg2Player(str[2]);
		WriteLog(format("[%s]\t%s\tName:%s\tAccount:%s\tAdd Prop 5 by ZhenPaiLingYao",
						"TrÊn ph¸i linh d­îc",
						GetLocalDate("%Y-%m-%d %X"),
						GetName(), GetAccount()));
		return 0;
	end
end
