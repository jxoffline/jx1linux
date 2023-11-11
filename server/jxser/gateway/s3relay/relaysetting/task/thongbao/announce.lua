-- ¶¨Ê±ÏòÒ»×é·þÎñÆ÷µÄËùÓÐGameserver·¢ÏµÍ³¹«¸æ
-- Ô½ÄÏ°æ²»´¥·¢¹«¸æ  by peres 2006/05/11

function TaskShedule()
	TaskName("Tin tøc tù ®éng - th«ng b¸o");
	
	-- 10·ÖÖÓÒ»´Î
	TaskInterval(10);
	
	-- ²»ÉèTaskTme, ÔòÊÇRelayÆô¶¯Ê±¾Í¿ªÊ¼
	-- xµãy·Ö¿ªÊ¼(y%10==0)
	local n_cur_h	= tonumber(date("%H"));
	local n_cur_m	= tonumber(date("%M"));
	
	if (n_cur_m > 50) then
		n_cur_h = mod((n_cur_h + 1), 24); 
	end
	
	n_cur_m = mod((n_cur_m - mod(n_cur_m, 10) + 10), 60);
	TaskTime( n_cur_h, n_cur_m );
	TaskCountLimit(0);
	
	OutputMsg("Tù ®éng cuén th«ng b¸o");
end

g_strTipMsg = 
	{
--		"¡¼½­ºþ´«ÎÅ¡½ÎªÁËÓ­½ÓÐÂÄê£¬½üÈÕ¹Ù¸®½«×éÖ¯¡°¸ÏÀÏ»¢¡±Ð¡ÓÎÏ·£¬¸÷³ÇÑÃÃÅ»áÔÚ19£º00~23£º00×éÖ¯ÈËÊÖÈ¥²ÎÓë»î¶¯£¬²¢»á½±ÀøÔÚ»î¶¯ÖÐ½Ü³öµÄÏÀÊ¿£¬¸÷Î»µ½Ê±¿ÉÒÔµ½¸÷´ó³ÇÊÐµÄÑÃÃÅ²îÒÛ´¦±¨Ãû²Î¼Ó¡£",
--		"¡¼ÌÒ»¨µº¡½µ½ÌÒ»¨ÒþÊ¿´¦¹ºÂò¡¼¿ó¸ä¡½£¬¼´¿ÉÔÚÌÒ»¨µºÐÞÁ·µÄÍ¬Ê±£¬ÍÚµ½¸÷ÖÖ²»Í¬¼¶±ðµÄÐþ¾§¿ó£¡´òÔì×ÏÉ«×°±¸£¬´Ó´Ë¸ü·½±ã£¡",
--		"¡¼ÌÒ»¨µº¡½ÌÒ»¨µºÉÏ¿ÉÊ¹ÓÃ(´ó)°×¾ÔÍè½øÐÐ¡¼ÀëÏßÍÐ¹Ü¡½£¬ÐÞÁ·¡¢ÍÚ¿óÁ½²»Îó¡£ÌÒ»¨µºÐÞÁ·¾­ÑéÓëÀëÏßÍÐ¹Ü¾­Ñéµþ¼Ó¼ÆËã£¬»¥²»Ó°Ïì",
--		"¡¼ÌÒ»¨µº¡½´ÓÆß´ó³ÇÊÐµÄ´¬·ò×ø´¬¼´¿ÉµÇÉÏÌÒ»¨µº£¬Íæ¼Ò½øÈëµÈ¼¶²»ÔÙÓÐ50¼¶ÏÞÖÆ£¬5¼¶Íæ¼ÒÒ²¿ÉÍÚµ½Ðþ¾§¿ó£»µ«50¼¶ÒÔÏÂµÄÍæ¼ÒÎÞ·¨»ñµÃÐÞÁ·¾­Ñé",
--		--"¡¼ÌÒ»¨µº¡½Ôø¾­¹ºÂò¹ýÀ°°ËÖàµÄÍæ¼Ò£¬½øÈëÌÒ»¨µº£¬À°°ËÖàÓÐÐ§Ê±¼ä×Ô¶¯×ª»¯Îª¿ÉÍÚ¿óÊ±¼ä(ÐÞÁ·¾­Ñé²»ÔÙË«±¶)",
--		"¡¼ÐÅÊ¹ÈÎÎñ¡½Äú¿ÉÒÔÔÚ¸÷´ó³ÇÊÐµÄæä¹Ù´¦ÁìÈ¡µ½È«ÐÂµÄÐÅÊ¹ÈÎÎñÀ²~(ÏêÇé²Î¼û¹ÙÍø£ºjx.xoyo.com)",
--		"¡¼×°±¸Ä¥Ëðµ÷Õû¡½£º×°±¸ÄÍ¾Ã¶ÈÄ¥Ëðµ½0£¬×Ô¶¯´ÓÉíÉÏÐ¶ÏÂ£¬±ä³É<Ëð»µµÄ×°±¸>·ÅÖÃÔÚ±³°üÀï(×°±¸²»ÏûÊ§)¡£<Ëð»µµÄ×°±¸>¿Éµ½ÁÙ°²¡¼ÉñÃØÉÌÈË¡½´¦¸´Ô­",
--		"¡¼½­ºþ´«ÎÅ¡½ÓÐÈË·¢ÏÖÁËÐí¶à¾øÊÀ¸ßÊÖ³öÏÖÔÚ7´ó³ÇÊÐÖÜÎ§£¬ÊÆ±Ø½­ºþÖÐÓÖ½«ÏÆÆðÒ»³¡ÐùÈ»´ó²¨¡£",
--		"ÎÀ¹úÕ½ÕùÖ®·é»ðÁ¬³Ç»î¶¯ÓÚÃ¿ÖÜÖÜÁùÖÜÈÕµÄ15:00~17:00¿ª·Å¡£Íæ¼Ò¿ÉÒÔÍ¨¹ýÓë³É¶¼¸®£¬ÏåÑô¸®£¬ÁÙ°²¸®£¬´óÀí¸®£¬ÑïÖÝ¸®µÄ³ÇÃÅÊØÎÀ¶Ô»°À´²Î¼ÓËÎ·½ÊØ³ÇÕ½ÒÛ£»Í¨¹ýÓë·ïÏè¸®£¬ãê¾©¸®µÄ³ÇÃÅÊØÎÀ¶Ô»°À´²Î¼Ó½ð·½ÊØ³ÇÕ½ÒÛ¡£",
--		--"¡¼ÇéÒå½­ºþ¡½12ÔÂ31ÈÕ£¬µÚ¶þ½ìÎäÁÖÁªÈü½øÈë¼äÐªÆÚ¡£¸÷ÃÅÅÉ»ñµÃÇ°32ÃûµÄÑ¡ÊÖ½«¿ÉÒÔÁìÈ¡µ½ÅÅÃû½±Àø¡£06Äê1ÔÂ8ÈÕµÚÈý½ìÎäÁÖÁªÈü¼´½«¿ªÊ¼£¬±ÈÈüÀàÐÍÎªÊ¦Í½Ë«ÈËÈü¡£",
--		--"¡¼ÇéÒå½­ºþ¡½12ÔÂ8ÈÕµÚ¶þ½ìÎäÁÖÁªÈüÕýÊ½¿ªÊ¼£¬±ÈÈüÀàÐÍÎªÃÅÅÉµ¥ÏîÈü£¬±ÈÈüÆÚÎª12ÔÂ8ÈÕ-12ÔÂ28ÈÕ£¬ÁªÈü½áÊøºó£¬Ç°32ÃûÕ½¶Ó¾ù»á»ñµÃ·áºñµÄÅÅÃû½±Àø¡£ÏêÇéÇë²Î¼û¹ÙÍø¹«¸æºÍÎäÁÖÁªÈüÏà¹Ø½éÉÜ¡£",
--		--"¡¼½£Íø×îÐÂ×ÊÁÏÆ¬£ºÇéÒå½­ºþ¡½£º2005-10-31È«ÇøÈ«·þÍ¬Ê±¿ª·Å£¬¾´ÇëÁôÒâ£¬ÏêÇéÇë²Î¼û¹ÙÍø¡£",
--		--"¡¼ÇéÒå½­ºþ¡½£ºÍ¬°éÏµÍ³È¼Çé¿ª·Å£¬Íæ¼Ò¿ÉÒÔÔÚ7´ó³ÇÊÐµÄ³¤¸èÃÅÃÅÈË´¦ÁìÈ¡Í¬°éÈÎÎñ£¡Í¬Ê±¿Éµ½¸÷´óÐÂÊÖ´åÁúÎå´¦ÁìÈ¡Í¬°é¾çÇéÈÎÎñ¡£",
--		"¡¼ÇéÒå½­ºþ¡½£ºÍ¬°éÏµÍ³È¼Çé¿ª·Å£¬Íæ¼Ò¿ÉÒÔÔÚ7´ó³ÇÊÐµÄ³¤¸èÃÅÃÅÈË´¦ÁìÈ¡Í¬°éÈÎÎñ£¡Í¬Ê±¿Éµ½¸÷´óÐÂÊÖ´åÁúÎå´¦ÁìÈ¡Í¬°é¾çÇéÈÎÎñ¡£",
--		"¡¼Ëæ»úÊÂ¼þÏµÍ³¡½£ºËæ»úÊÂ¼þÏµÍ³È«Ãæ¿ª·Å£¬Í¬°é´¦ÓÚÕÙ»½×´Ì¬ÏÂ¼´ÓÐ¿ÉÄÜ´¥·¢¡£",
--		"¡¼»Ô»ÍÖ®Ò¹»î¶¯¡½£º»Ô»ÍÖ®Ò¹»î¶¯ÓÚÃ¿Ìì19:30µ½20:00£¬20:30µ½22:30¶¨Ê±¿ªÆô¡£(ÏêÇé²Î¼û¹ÙÍø£ºjx.xoyo.com)",
--		"¡¼ÉñÃØ²Ø±¦Í¼¡½£ºÉñÃØ²Ø±¦Í¼¾ªÏÖ½­ºþ£¬ÎÞÏÞ±¦²Ø¾¡ÔÚÑÛÇ°¡£(ÏêÇé²Î¼û¹ÙÍø£ºjx.xoyo.com)",
--		"¡¼ÆæÕä¸ó¡½Ò×ÈÝÊõÊ¿¡¢ÐÐ½ÅÉÌÈË¡¢Áã··×î½üºÏ»ï¶ÒÏÂÁËÒ»¼Ò°ÙÄêÀÏÆÌ¡ª¡ª<color=yellow>ÆæÕä¸ó<color>(µã»÷ÓÒÏÂ½Ç°´Å¥)£¬ÐÂ´ºÆÚ¼äÉÌÆ·ÓÅ»ÝÈÈÂô(ÓÅ»ÝÊ±¼ä£º2006Äê1ÔÂ24ÈÕÖÁ2ÔÂ7ÈÕ)¡£(ÏêÇé²Î¼û¹ÙÍø£ºjx.xoyo.com)",
	};
	
-- ÐÂ¹¦ÄÜÔ¤¸æÐÅÏ¢
g_nFutureDate = 2009010424;
STR_HEAD_FUTURE = " [Ho¹t ®éng Phong ba th¸ng 9]";
g_strFutureMsg = 
	{
		"Ho¹t ®éng Phong ba th¸ng 9 ®ang tiÕn hµnh, mçi ngµy, mçi tuÇn, mçi th¸ng ®Òu cã nh÷ng phÇn th­ëng hÊp dÉn ®ang chê ®îi b¹n! Trong thêi gian tõ   ®Õn, tham gia c¸c ho¹t ®éng nh­ Tèng Kim ®¹i chiÕn, NhiÖm vô D· TÈu, NhiÖm vô s¸t thñ thÝ luyÖn h¹ng 3 ®Òu cã thÓ t¨ng thªm ®iÓm tÝch lòy trong tõng ho¹t ®éng s«i næi. Cã thÓ ®Õn gÆp Vâ L©m TruyÒn nh©n hoÆc xem chi tiÕt trªn trang chñ ",
		"Ho¹t ®éng Phong ba th¸ng 9 ®ang tiÕn hµnh, ®iÓm tÝch lòy mçi ngµy cã thÓ ®æi phÇn th­ëng trong ngµy: 10 tªn cã tæng ®iÓm tÝch lòy ®øng ®Çu trong tuÇn sÏ nhËn ®­îc phÇn th­ëng tuÇn: 10 tªn cã tæng ®iÓm tÝch ph©n ®øng ®Çu trong suèt thêi gian ho¹t ®éng cµng cã thÓ nhËn ®­îc phÇn th­ëng cña th¸ng. Gi¶i th­ëng qu¸n qu©n lµ mét ®«i nhÉn §¹i M· Hæ hoÆc ngÉu nhiªn nhËn ®­îc mét bé ®¹i trang bÞ hoµng kim cña m«n ph¸i cã Kü n¨ng + 1!",
		"§iÒu chØnh gi¸ B¹ch C©u hoµn: Tõ ngµy 8/9, hµng rong L©m An cã b¸n B¹ch C©u hoµn gi¸ lµ 1 tiÒn ®ång/1 c¸i: mçi ngµy tõ 0:00 ®Õn 12:00 rêi m¹ng kinh nghiÖm vÉn t¨ng ®«i!",
	};
function TaskContent()
	str = "";
	local ndateH 	= tonumber(date("%H"));
	local ndateM	= tonumber(date("%M"));
	local ndateD	= tonumber(date("%Y%m%d"));
	if (ndateH < 21 and ndateM == 0 and ndateD >= 20090116 and ndateD < 20090216) then
		str	= "HiÖn t¹i vâ l©m nh©n sü cã thÓ ®Õn NPC ThÇn Tµi ®Ó tÆng quµ vµ nhËn Ph¸o Hoa"
	elseif (ndateH == 21 and ndateM == 0 and ndateD >= 20090116 and ndateD < 20090216) then
		str	= "Vâ l©m nh©n sü h·y mau ®Õn nhËn th­ëng ®ång thêi sÏ cã c¬ héi nhËn nhiÒu phÇn quµ may m¾n!";
	else
		return
		--str = getTipMsg();
	end
	GlobalExecute(format("dw Msg2SubWorld([[%s]])", str));
end

-- È¡ÌáÊ¾ÐÅÏ¢
function getTipMsg()

	nCount = getn(g_strTipMsg);
	nIndex = random(1, nCount);

	return g_strTipMsg[nIndex];
end

-- È¡Ô¤¸æÐÅÏ¢
function getFutureMsg()
	nCurDate = tonumber(date("%Y%m%d%H"));
	str = "";
	if (g_nFutureDate > nCurDate) then -- ÊÇ·ñÔÚÖ¸¶¨ÈÕÆÚÖ®Ç°£¬·ñÔò²»·¢
		nCount = getn(g_strFutureMsg);
		nIndex = random(1, nCount);
		str = STR_HEAD_FUTURE..(g_strFutureMsg[nIndex]);
	end
	
	return str;
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
