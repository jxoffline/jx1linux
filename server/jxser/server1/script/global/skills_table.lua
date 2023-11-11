--  skills_table.lua
--     By: Dan_Deng(2004-05-16)
--  Ö÷Î¬»¤±í£¬¸÷ÃÅÅÉ¡¢¸÷µÈ¼¶¼¼ÄÜ×Ü±í
-- Update: Dan_Deng(2004-07-05) Ôö¼ÓÍ¶µã·½Ê½µÄ90¼¶¼¼ÄÜÌØ±ğ´¦Àí£ºÈç¹ûÍæ¼ÒÓµÓĞ´Ë¼¼ÄÜ£¬Ôò±£´æ¼¼ÄÜIDºóÉ¾³ı¡£ÔÚ¼Ó¼¼ÄÜÊ±ÔÙµ¥¶À´¦Àí

function check_update()
	-- ¹«¹²·şÄ£Ê½²»Çå³ı×´Ì¬
	if (GetTask(137) >= 20 or GetTripMode() == 2) then
		return 0
	else
		SetTask(57,GetGameTime())		-- ¼Ç×¡¼¼ÄÜ¸üĞÂºóµÚÒ»´ÎÉÏÏßÊ±¼ä£¬±ØĞëÔÚÏß72Ğ¡Ê±ÒÔºó²ÅÔÊĞíÉÏÏ´Ëèµº
		rollback_prop()				-- ÖØÖÃÇ±ÄÜµã£¨2004-07-13£©
		skills_update()
		UpdateSkill()
		return 1
	end
end

function skills_update()
	SetTaskTemp(20,0)				-- Ê¹ÓÃÇ°¸´Î»£¬±£Ö¤²»ÊÜ¸ÉÈÅ
	SetTaskTemp(21,0)
	Player_Faction = check_faction()
	if (Player_Faction == 3) then				-- ÌìÍõ°ï
		update_tw()
	elseif (Player_Faction == 7) then		-- ÉÙÁÖÅÉ
		update_sl()
	elseif (Player_Faction == 2) then		-- ÌÆÃÅ
		update_tm()
	elseif (Player_Faction == 10) then		-- Îå¶¾
		update_wu()
	elseif (Player_Faction == 1) then		-- ¶ëáÒ
		update_em()
	elseif (Player_Faction == 6) then		-- ´äÑÌ
		update_cy()
	elseif (Player_Faction == 4) then		-- ÌìÈÌ
		update_tr()
	elseif (Player_Faction == 8) then		-- Ø¤°ï
		update_gb()
	elseif (Player_Faction == 5) then		-- Îäµ±
		update_wd()
	elseif (Player_Faction == 9) then		-- À¥ÂØ
		update_kl()
	else									-- °×Ãû
		SetTask(137,20)
		return 1
	end
	-- ×ÔÉí¼¼ÄÜµã×ÜÊı = (µÈ¼¶-1) + ¼Ó¼¼ÄÜÈÎÎñ + ¼Ó¼¼ÄÜµÀ¾ß - ÏÖÓĞÎ´·ÖÅäµãÊı	- »ØÌåÊõ£¨ÓêÂ¶ÖØÉú£©µÈ¼¶ - ¿ÛµãÏ´µãÓ°Ïì
--	Say("¼¼ÄÜ¸üĞÂÒÑ¾­Íê³É£¬Çë×¢ÒâÖØĞÂÎª¸÷¸ö¼¼ÄÜ·ÖÅä¼¼ÄÜµã¡£",0)
	Msg2Player("Phôc håi kü n¨ng ®· hoµn tÊt!  Xin h·y ph©n phèi l¹i ®iÓm! ")
	xMagic = 0
	if HaveMagic(397) >= 0 then			-- ¼ÆËãÓêÂ¶ÖØÉú¼¼ÄÜ£¬¿Û³ıÏàÓ¦µãÊı£¨Òª·ÀÖ¹·µ»Ø-1£©
		xMagic = HaveMagic(397)
	end
--	if (GetTask(13) >= 1) and (GetTask(13) < 256) then		-- ¼ÆËãÊÇ·ñ¿ÛµãÏ´µã¡£
--		xMagic = xMagic + 3
--		Msg2Player("ÄãÔø¾­¹ıÊÍÃ÷É®µÄÒ×½îÏ´Ëè£¬¾­ÂöÖĞÓĞÒ»¶¨ËğÉË¡£Äã¿ÉÒÔÀûÓÃÈı¿ÅË®¾§ÇëÊÍÃ÷°ïÄãĞŞ¸´ÊÜËğµÄ¾­Âö¡£")
--	end
	MagicPoint_total = GetLevel() + GetByte(GetTask(86),2) + GetByte(GetTask(80),1) + GetTask(700) - GetMagicPoint() - xMagic - 1
	Ttask21 = GetTaskTemp(21)
	if (Ttask21 ~= MagicPoint_total + GetMagicPoint()) then		-- ²»Ò»ÖÂµÄÒªĞ´log
		WriteLog(date("%Hgiê%Mphót%Sgi©y")..": tµi kho¶n'"..GetAccount().."'nh©n vËt'"..GetName().."'Phôc håi kü n¨ng ®· lui vÒ kû lôc ban ®Çu: §¼ng cÊp"..GetLevel()..", ®iÓm kü n¨ng ban ®Çu"..Ttask21..", ®­îc söa l¹i"..MagicPoint_total+GetMagicPoint().."®iÓm (Bao gåm nhiÖm vô céng"..GetByte(GetTask(86),2).."®iÓm, ®¹o cô céng"..GetTask(80).."®iÓm) .")
	end
	AddMagicPoint(MagicPoint_total)
	SetTaskTemp(20,0)				-- Ï´µãÍê³É£¬ÖØĞÂ¸´Î»
	SetTaskTemp(21,0)
end

function check_faction()
	if (GetTask(7) >= 10*256) and (GetTask(7) ~= 75*256) then		-- ÉÙÁÖ»ò´ËÃÅÅÉ³öÊ¦
		SetTask(137,7)
		SetLastFactionNumber(0)
		return 7
	elseif (GetTask(3) >= 10*256) and (GetTask(3) ~= 75*256) then			-- ÌìÍõ»ò´ËÃÅÅÉ³öÊ¦
		SetTask(137,3)
		SetLastFactionNumber(1)
		return 3
	elseif (GetTask(10) >= 10*256) and (GetTask(10) ~= 75*256) then	-- Îå¶¾»ò´ËÃÅÅÉ³öÊ¦
		SetTask(137,10)
		SetLastFactionNumber(3)
		return 10
	elseif (GetTask(2) >= 10*256) and (GetTask(2) ~= 75*256) then		-- ÌÆÃÅ»ò´ËÃÅÅÉ³öÊ¦
		SetTask(137,2)
		SetLastFactionNumber(2)
		return 2
	elseif (GetTask(6) >= 10*256) and (GetTask(6) ~= 75*256) then		-- ´äÑÌ»ò´ËÃÅÅÉ³öÊ¦
		SetTask(137,6)
		SetLastFactionNumber(5)
		return 6
	elseif (GetTask(1) >= 10*256) and (GetTask(1) ~= 75*256) then		-- ¶ëáÒ»ò´ËÃÅÅÉ³öÊ¦
		SetTask(137,1)
		SetLastFactionNumber(4)
		return 1
	elseif (GetTask(8) >= 10*256) and (GetTask(8) ~= 75*256) then		-- Ø¤°ï»ò´ËÃÅÅÉ³öÊ¦
		SetTask(137,8)
		SetLastFactionNumber(6)
		return 8
	elseif (GetTask(4) >= 10*256) and (GetTask(4) ~= 75*256) then		-- ÌìÈÌ»ò´ËÃÅÅÉ³öÊ¦
		SetTask(137,4)
		SetLastFactionNumber(7)
		return 4
	elseif (GetTask(9) >= 10*256) and (GetTask(9) ~= 75*256) then		-- À¥ÂØ»ò´ËÃÅÅÉ³öÊ¦
		SetTask(137,9)
		SetLastFactionNumber(9)
		return 9
	elseif (GetTask(5) >= 10*256) and (GetTask(5) ~= 75*256) then		-- Îäµ±»ò´ËÃÅÅÉ³öÊ¦
		SetTask(137,5)
		SetLastFactionNumber(8)
		return 5
	else																					-- °×ÃûµÄ£¬²»ĞèÒª¸üĞÂ
		SetLastFactionNumber(-1)
		return 20
	end
end;

function add_misc(lvl)		-- ¼Ó¹«¹²¼¼ÄÜ£¨°´Á½½øÖÆÎ»Öğ¸ö¼Ó£©
	if (GetBit(lvl,1) == 1) and (HaveMagic(210) == -1) then			-- µÚ1×ÖÎ»£ºÇá¹¦
		AddMagic(210,1)
	end
	if (GetBit(lvl,2) == 1) and (HaveMagic(400) == -1) then			-- µÚ2×ÖÎ»£º½Ù¸»¼ÃÆ¶
		AddMagic(400,1)
	end
	if (GetBit(lvl,3) == 1) and (HaveMagic(397) == -1) then			-- µÚ3×ÖÎ»£ºÓêÂ¶ÖØÉú
		AddMagic(397)
	end
end

function update_tw()			-- ÏÈ¸ù¾İÈÎÎñµÈ¼¶É¾³ı¡¢ÖØĞÂ¼ÓÈë¼¼ÄÜ£¬È»ºó²¹»Ø¼¼ÄÜµã
	UTask = GetTask(3)
	if (GetTask(121) == 255) then		-- Ñ§»áÁË90¼¶¼¼ÄÜ
		the_lvl = 90
-- ÌìÍõµÄ»ØÊ¦¼¼ÄÜĞèÒªÔÙ¶à×÷ÅĞ¶Ï£¬ÒòÎªÔ­60¼¶¼¼ÄÜ±»¸ÄÎª50¼¶£º¡¡¡¡ÓĞ½ğÖÓÕÖ¡¢¹ıÁË60¼¶£¬²¢ÇÒÒÑ³öÊ¦£¨²»ÊÇÅĞÊ¦£©
	elseif (HaveMagic(42) >= 0) and (GetTask(3) >= 70*256) and (GetTask(3) ~= 75*256) and (GetLevel() >= 60) then		-- ÓĞÕòÅÉ¾øÑ§¼¼ÄÜ
		the_lvl = 70
	elseif (UTask >= 60*256) then		-- ÒÑÍê³É50¼¶ÈÎÎñ
		the_lvl = 60
	elseif (UTask >= 50*256) then		-- ÒÑÍê³É40¼¶ÈÎÎñ
		the_lvl = 50
	elseif (UTask >= 40*256) then		-- ÒÑÍê³É30¼¶ÈÎÎñ
		the_lvl = 40
	elseif (UTask >= 30*256) then		-- ÒÑÍê³É20¼¶ÈÎÎñ
		the_lvl = 30
	elseif (UTask >= 20*256) then		-- ÒÑÍê³É10¼¶ÈÎÎñ
		the_lvl = 20
	elseif (UTask >= 10*256) then		-- ÒÑÈëÃÅ
		the_lvl = 10
	end
	del_all_skill()
	add_tw(the_lvl)			-- ¼Ó»ØÓ¦Ñ§»áµÄ¼¼ÄÜ
	SetTask(137,23)
end

function update_gb()			-- ÏÈ¸ù¾İÈÎÎñµÈ¼¶É¾³ı¡¢ÖØĞÂ¼ÓÈë¼¼ÄÜ£¬È»ºó²¹»Ø¼¼ÄÜµã
	UTask = GetTask(8)
	if (GetTask(128) == 255) then		-- Ñ§»áÁË90¼¶¼¼ÄÜ
		the_lvl = 90
-- Ø¤°ïµÄ»ØÊ¦¼¼ÄÜĞèÒªÔÙ¶à×÷ÅĞ¶Ï£¬ÒòÎªÔ­60¼¶¼¼ÄÜ±»¸ÄÎª50¼¶£º¡¡¡¡ÓĞ¿ºÁúÓĞ»Ú¡¢¹ıÁË60¼¶£¬²¢ÇÒÒÑ³öÊ¦£¨²»ÊÇÅĞÊ¦£©
	elseif (HaveMagic(128) >= 0) and (GetTask(8) >= 70*256) and (GetTask(8) ~= 75*256) and (GetLevel() >= 60) then		-- ÓĞÕòÅÉ¾øÑ§¼¼ÄÜ
		the_lvl = 70
	elseif (UTask >= 60*256) then		-- ÒÑÍê³É50¼¶ÈÎÎñ
		the_lvl = 60
	elseif (UTask >= 50*256) then		-- ÒÑÍê³É40¼¶ÈÎÎñ
		the_lvl = 50
	elseif (UTask >= 40*256) then		-- ÒÑÍê³É30¼¶ÈÎÎñ
		the_lvl = 40
	elseif (UTask >= 30*256) then		-- ÒÑÍê³É20¼¶ÈÎÎñ
		the_lvl = 30
	elseif (UTask >= 20*256) then		-- ÒÑÍê³É10¼¶ÈÎÎñ
		the_lvl = 20
	elseif (UTask >= 10*256) then		-- ÒÑÈëÃÅ
		the_lvl = 10
	end
	del_all_skill()
	add_gb(the_lvl)			-- ¼Ó»ØÓ¦Ñ§»áµÄ¼¼ÄÜ
	SetTask(137,28)
end

function update_wd()			-- ÏÈ¸ù¾İÈÎÎñµÈ¼¶É¾³ı¡¢ÖØĞÂ¼ÓÈë¼¼ÄÜ£¬È»ºó²¹»Ø¼¼ÄÜµã
	UTask = GetTask(5)
	if (GetTask(129) == 255) then		-- Ñ§»áÁË90¼¶¼¼ÄÜ
		the_lvl = 90
	elseif (HaveMagic(166) >= 0) then		-- ÓĞÕòÅÉ¾øÑ§¼¼ÄÜ
		the_lvl = 70
	elseif (UTask >= 60*256) then		-- ÒÑÍê³É50¼¶ÈÎÎñ
		the_lvl = 60
	elseif (UTask >= 50*256) then		-- ÒÑÍê³É40¼¶ÈÎÎñ
		the_lvl = 50
	elseif (UTask >= 40*256) then		-- ÒÑÍê³É30¼¶ÈÎÎñ
		the_lvl = 40
	elseif (UTask >= 30*256) then		-- ÒÑÍê³É20¼¶ÈÎÎñ
		the_lvl = 30
	elseif (UTask >= 20*256) then		-- ÒÑÍê³É10¼¶ÈÎÎñ
		the_lvl = 20
	elseif (UTask >= 10*256) then		-- ÒÑÈëÃÅ
		the_lvl = 10
	end
	del_all_skill()
	add_wd(the_lvl)			-- ¼Ó»ØÓ¦Ñ§»áµÄ¼¼ÄÜ
	SetTask(137,25)
end

function update_em()			-- ÏÈ¸ù¾İÈÎÎñµÈ¼¶É¾³ı¡¢ÖØĞÂ¼ÓÈë¼¼ÄÜ£¬È»ºó²¹»Ø¼¼ÄÜµã
	UTask = GetTask(1)
	if (GetTask(125) == 255) then		-- Ñ§»áÁË90¼¶¼¼ÄÜ
		the_lvl = 90
	elseif (HaveMagic(252) >= 0) then		-- ÓĞÕòÅÉ¾øÑ§¼¼ÄÜ
		the_lvl = 70
	elseif (UTask >= 60*256) then		-- ÒÑÍê³É50¼¶ÈÎÎñ
		the_lvl = 60
	elseif (UTask >= 50*256) then		-- ÒÑÍê³É40¼¶ÈÎÎñ
		the_lvl = 50
	elseif (UTask >= 40*256) then		-- ÒÑÍê³É30¼¶ÈÎÎñ
		the_lvl = 40
	elseif (UTask >= 30*256) then		-- ÒÑÍê³É20¼¶ÈÎÎñ
		the_lvl = 30
	elseif (UTask >= 20*256) then		-- ÒÑÍê³É10¼¶ÈÎÎñ
		the_lvl = 20
	elseif (UTask >= 10*256) then		-- ÒÑÈëÃÅ
		the_lvl = 10
	end
	del_all_skill()
	add_em(the_lvl)			-- ¼Ó»ØÓ¦Ñ§»áµÄ¼¼ÄÜ
	SetTask(137,21)
end

function update_sl()			-- ÏÈ¸ù¾İÈÎÎñµÈ¼¶É¾³ı¡¢ÖØĞÂ¼ÓÈë¼¼ÄÜ£¬È»ºó²¹»Ø¼¼ÄÜµã
	UTask = GetTask(7)
	if (GetTask(122) == 255) then		-- Ñ§»áÁË90¼¶¼¼ÄÜ
		the_lvl = 90
	elseif (HaveMagic(21) >= 0) then		-- ÓĞÕòÅÉ¾øÑ§¼¼ÄÜ
		the_lvl = 70
	elseif (UTask >= 60*256) then		-- ÒÑÍê³É50¼¶ÈÎÎñ
		the_lvl = 60
	elseif (UTask >= 50*256) then		-- ÒÑÍê³É40¼¶ÈÎÎñ
		the_lvl = 50
	elseif (UTask >= 40*256) then		-- ÒÑÍê³É30¼¶ÈÎÎñ
		the_lvl = 40
	elseif (UTask >= 30*256) then		-- ÒÑÍê³É20¼¶ÈÎÎñ
		the_lvl = 30
	elseif (UTask >= 20*256) then		-- ÒÑÍê³É10¼¶ÈÎÎñ
		the_lvl = 20
	elseif (UTask >= 10*256) then		-- ÒÑÈëÃÅ
		the_lvl = 10
	end
	del_all_skill()
	add_sl(the_lvl)			-- ¼Ó»ØÓ¦Ñ§»áµÄ¼¼ÄÜ
	SetTask(137,27)
end

function update_wu()			-- ÏÈ¸ù¾İÈÎÎñµÈ¼¶É¾³ı¡¢ÖØĞÂ¼ÓÈë¼¼ÄÜ£¬È»ºó²¹»Ø¼¼ÄÜµã
	UTask = GetTask(10)
	if (GetTask(124) == 255) then		-- Ñ§»áÁË90¼¶¼¼ÄÜ
		the_lvl = 90
	elseif (HaveMagic(75) >= 0) then		-- ÓĞÕòÅÉ¾øÑ§¼¼ÄÜ
		the_lvl = 70
	elseif (UTask >= 60*256) then		-- ÒÑÍê³É50¼¶ÈÎÎñ
		the_lvl = 60
	elseif (UTask >= 50*256) then		-- ÒÑÍê³É40¼¶ÈÎÎñ
		the_lvl = 50
	elseif (UTask >= 40*256) then		-- ÒÑÍê³É30¼¶ÈÎÎñ
		the_lvl = 40
	elseif (UTask >= 30*256) then		-- ÒÑÍê³É20¼¶ÈÎÎñ
		the_lvl = 30
	elseif (UTask >= 20*256) then		-- ÒÑÍê³É10¼¶ÈÎÎñ
		the_lvl = 20
	elseif (UTask >= 10*256) then		-- ÒÑÈëÃÅ
		the_lvl = 10
	end
	del_all_skill()
	add_wu(the_lvl)			-- ¼Ó»ØÓ¦Ñ§»áµÄ¼¼ÄÜ
	SetTask(137,30)
end

function update_cy()			-- ÏÈ¸ù¾İÈÎÎñµÈ¼¶É¾³ı¡¢ÖØĞÂ¼ÓÈë¼¼ÄÜ£¬È»ºó²¹»Ø¼¼ÄÜµã
	UTask = GetTask(6)
	if (GetTask(126) == 255) then		-- Ñ§»áÁË90¼¶¼¼ÄÜ
		the_lvl = 90
	elseif (HaveMagic(111) >= 0) then		-- ÓĞÕòÅÉ¾øÑ§¼¼ÄÜ
		the_lvl = 70
	elseif (UTask >= 60*256) then		-- ÒÑÍê³É50¼¶ÈÎÎñ
		the_lvl = 60
	elseif (UTask >= 50*256) then		-- ÒÑÍê³É40¼¶ÈÎÎñ
		the_lvl = 50
	elseif (UTask >= 40*256) then		-- ÒÑÍê³É30¼¶ÈÎÎñ
		the_lvl = 40
	elseif (UTask >= 30*256) then		-- ÒÑÍê³É20¼¶ÈÎÎñ
		the_lvl = 30
	elseif (UTask >= 20*256) then		-- ÒÑÍê³É10¼¶ÈÎÎñ
		the_lvl = 20
	elseif (UTask >= 10*256) then		-- ÒÑÈëÃÅ
		the_lvl = 10
	end
	del_all_skill()
	add_cy(the_lvl)			-- ¼Ó»ØÓ¦Ñ§»áµÄ¼¼ÄÜ
	SetTask(137,26)
end

function update_tm()			-- ÏÈ¸ù¾İÈÎÎñµÈ¼¶É¾³ı¡¢ÖØĞÂ¼ÓÈë¼¼ÄÜ£¬È»ºó²¹»Ø¼¼ÄÜµã
	UTask = GetTask(2)
	if (GetTask(123) == 255) then		-- Ñ§»áÁË90¼¶¼¼ÄÜ
		the_lvl = 90
	elseif (HaveMagic(249) >= 0) then		-- ÓĞÕòÅÉ¾øÑ§¼¼ÄÜ
		the_lvl = 70
	elseif (UTask >= 60*256) then		-- ÒÑÍê³É50¼¶ÈÎÎñ
		the_lvl = 60
	elseif (UTask >= 50*256) then		-- ÒÑÍê³É40¼¶ÈÎÎñ
		the_lvl = 50
	elseif (UTask >= 40*256) then		-- ÒÑÍê³É30¼¶ÈÎÎñ
		the_lvl = 40
	elseif (UTask >= 30*256) then		-- ÒÑÍê³É20¼¶ÈÎÎñ
		the_lvl = 30
	elseif (UTask >= 20*256) then		-- ÒÑÍê³É10¼¶ÈÎÎñ
		the_lvl = 20
	elseif (UTask >= 10*256) then		-- ÒÑÈëÃÅ
		the_lvl = 10
	end
	del_all_skill()
	add_tm(the_lvl)			-- ¼Ó»ØÓ¦Ñ§»áµÄ¼¼ÄÜ
	SetTask(137,22)
end

function update_tr()			-- ÏÈ¸ù¾İÈÎÎñµÈ¼¶É¾³ı¡¢ÖØĞÂ¼ÓÈë¼¼ÄÜ£¬È»ºó²¹»Ø¼¼ÄÜµã
	UTask = GetTask(4)
	if (GetTask(127) == 255) then		-- Ñ§»áÁË90¼¶¼¼ÄÜ
		the_lvl = 90
	elseif (HaveMagic(150) >= 0) then		-- ÓĞÕòÅÉ¾øÑ§¼¼ÄÜ
		the_lvl = 70
	elseif (UTask >= 60*256) then		-- ÒÑÍê³É50¼¶ÈÎÎñ
		the_lvl = 60
	elseif (UTask >= 50*256) then		-- ÒÑÍê³É40¼¶ÈÎÎñ
		the_lvl = 50
	elseif (UTask >= 40*256) then		-- ÒÑÍê³É30¼¶ÈÎÎñ
		the_lvl = 40
	elseif (UTask >= 30*256) then		-- ÒÑÍê³É20¼¶ÈÎÎñ
		the_lvl = 30
	elseif (UTask >= 20*256) then		-- ÒÑÍê³É10¼¶ÈÎÎñ
		the_lvl = 20
	elseif (UTask >= 10*256) then		-- ÒÑÈëÃÅ
		the_lvl = 10
	end
	del_all_skill()
	add_tr(the_lvl)			-- ¼Ó»ØÓ¦Ñ§»áµÄ¼¼ÄÜ
	SetTask(137,24)
end

function update_kl()			-- Ë¢ĞÂ¼¼ÄÜ
	UTask = GetTask(9)
	if (GetTask(130) == 255) then		-- Ñ§»áÁË90¼¶¼¼ÄÜ
		the_lvl = 90
	elseif (HaveMagic(182) >= 0) then		-- ÓĞÕòÅÉ¾øÑ§¼¼ÄÜ
		the_lvl = 70
	elseif (UTask >= 60*256) then		-- ÒÑÍê³É50¼¶ÈÎÎñ
		the_lvl = 60
	elseif (UTask >= 50*256) then		-- ÒÑÍê³É40¼¶ÈÎÎñ
		the_lvl = 50
	elseif (UTask >= 40*256) then		-- ÒÑÍê³É30¼¶ÈÎÎñ
		the_lvl = 40
	elseif (UTask >= 30*256) then		-- ÒÑÍê³É20¼¶ÈÎÎñ
		the_lvl = 30
	elseif (UTask >= 20*256) then		-- ÒÑÍê³É10¼¶ÈÎÎñ
		the_lvl = 20
	elseif (UTask >= 10*256) then		-- ÒÑÈëÃÅ
		the_lvl = 10
	end
	del_all_skill()
	add_kl(the_lvl)			-- ¼Ó»ØÓ¦Ñ§»áµÄ¼¼ÄÜ
	SetTask(137,29)
end

function add_tw(lvl)			-- ¸ù¾İÈÎÎñµÈ¼¶¼ÓÏàÓ¦µÄÌìÍõ¼¼ÄÜ
	AddMagic(210,1)
	if (lvl >= 10) then			-- ÒÑ¾­ÈëÃÅ£¨¼ÓÈëÃÅ¼¼ÄÜ£©
		if (HaveMagic(34) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(34)		--¾ªÀ×Õ¶[34]  £¨ÈëÃÅ£©
		end
		if (HaveMagic(30) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(30)		--»Ø·çÂäÑã[30]£¨ÈëÃÅ£©
		end
		if (HaveMagic(29) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(29)		--Õ¶Áú¾÷[29]  £¨ÈëÃÅ£©
		end
	end
	if (lvl >= 20) then		-- 10¼¶ÈÎÎñ£¨¼Ó10¼¶¼¼ÄÜ£©
		if (HaveMagic(26) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(26)		--ÌìÍõ´¸·¨[26]£¨10¼¶£©
		end
		if (HaveMagic(23) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(23)		--ÌìÍõÇ¹·¨[23]£¨10¼¶£©
		end
		if (HaveMagic(24) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(24)		--ÌìÍõµ¶·¨[24]£¨10¼¶£©
		end
	end
	if (lvl >= 30) then		-- 20¼¶ÈÎÎñ£¨¼Ó20¼¶¼¼ÄÜ£©
		if (HaveMagic(33) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(33)		--¾²ĞÄ¾÷[33]  £¨20¼¶£©
		end
	end
	if (lvl >= 40) then		-- 30¼¶ÈÎÎñ£¨¼Ó30¼¶¼¼ÄÜ£©
		if (HaveMagic(37) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(37)		--ÆÃ·çÕ¶  [37]£¨30¼¶£©
		end
		if (HaveMagic(35) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(35)		--Ñô¹ØÈıµş[35]£¨30¼¶£©
		end
		if (HaveMagic(31) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(31)		--ĞĞÔÆ¾÷  [31]£¨30¼¶£©
		end
	end
	if (lvl >= 50) then		-- 40¼¶ÈÎÎñ£¨¼Ó40¼¶¼¼ÄÜ£©
		if (HaveMagic(40) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(40)		--¶Ï»ê´Ì  [40]£¨40¼¶£©
		end
	end
	if (lvl >= 60) then		-- 50¼¶ÈÎÎñ£¨¼Ó50¼¶¼¼ÄÜ£©
		if (HaveMagic(42) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(42)		--½ğÖÓÕÖ  [42]£¨50¼¶£©
		end
	end
	if (lvl >= 70) then		-- »ØÊ¦ÈÎÎñ£¨¼ÓÕòÅÉ¾øÑ§£©
		if (HaveMagic(32) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(32)		--ÎŞĞÄÕ¶  [32] £¨60¼¶£©
		end
		if (HaveMagic(36) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(36)		--ÌìÍõÕ½Òâ[36]£¨ÕòÅÉ£©
		end
		if (HaveMagic(41) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(41)		--ÑªÕ½°Ë·½[41] £¨60¼¶£©
		end
		if (HaveMagic(324) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(324)		--³ËÁú¾÷  [324]£¨60¼¶£©
		end
	end
	if (lvl >= 90) then		-- 90¼¶ÈÎÎñ£¨¼Ó90¼¶¼¼ÄÜ£©
		if (HaveMagic(322) <= 0) then AddMagic(322,20) end		--ÆÆÌìÕ¶  [322]£¨90¼¶£©
		if (HaveMagic(323) <= 0) then AddMagic(323,20) end		--×·ĞÇÖğÔÂ[323]£¨90¼¶£©
		if (HaveMagic(325) <= 0) then AddMagic(325,20) end		--×··ç¾÷  [325]£¨90¼¶£©
		if (HaveMagic(708) <= 0) then AddMagic(708,20) end		--ÃÅÅÉ120¼¼ÄÜ
		if (HaveMagic(1058) <= 0) then AddMagic(1058,20) end		--ÃÅÅÉ150¼¼ÄÜ
		if (HaveMagic(1059) <= 0) then AddMagic(1059,20) end		--ÃÅÅÉ150¼¼ÄÜ
		if (HaveMagic(1060) <= 0) then AddMagic(1060,20) end		--ÃÅÅÉ150¼¼ÄÜ
		--AddItem(6,1,2841,1,0,0)
	end
end

function add_sl(lvl)			-- ¸ù¾İÈÎÎñµÈ¼¶¼ÓÏàÓ¦µÄÉÙÁÖ¼¼ÄÜ
	AddMagic(210,1)
	if (lvl >= 10) then			-- ÒÑ¾­ÈëÃÅ£¨¼ÓÈëÃÅ¼¼ÄÜ£©
		if (HaveMagic(14) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(14)		-- ĞĞÁú²»Óê[14]
		end
		if (HaveMagic(10) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(10)			--½ğ¸Õ·üÄ§[10]£¨ÈëÃÅ£©
		end
	end
	if (lvl >= 20) then		-- 10¼¶ÈÎÎñ£¨¼Ó10¼¶¼¼ÄÜ£©
		if (HaveMagic(8) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(8)			-- ÉÙÁÖÈ­·¨[8]
		end
		if (HaveMagic(4) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(4)			--ÉÙÁÖ¹÷·¨[4]£¨10¼¶
		end
		if (HaveMagic(6) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(6)			--ÉÙÁÖµ¶·¨[6]£¨10¼¶£©
		end
	end
	if (lvl >= 30) then		-- 20¼¶ÈÎÎñ£¨¼Ó20¼¶¼¼ÄÜ£©
		if (HaveMagic(15) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(15)		--²»¶¯Ã÷Íõ[15]£¨20¼¶£©
		end
	end
	if (lvl >= 40) then		-- 30¼¶ÈÎÎñ£¨¼Ó30¼¶¼¼ÄÜ£©
		if (HaveMagic(16) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(16)		--ÂŞººÕó[16]£¨30¼¶£©
		end
	end
	if (lvl >= 50) then		-- 40¼¶ÈÎÎñ£¨¼Ó40¼¶¼¼ÄÜ£©
		if (HaveMagic(20) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(20)		--Ê¨×Óºğ [20]£¨40¼¶£©
		end
	end
	if (lvl >= 60) then		-- 50¼¶ÈÎÎñ£¨¼Ó50¼¶¼¼ÄÜ£©
		if (HaveMagic(271) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(271)		-- Áú×¦»¢×¥[271]
		end
		if (HaveMagic(11) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(11)		--ºáÉ¨ÁùºÏ [11]£¨50¼¶£©
		end
		if (HaveMagic(19) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(19)		--Ä¦Ú­ÎŞÁ¿ [19]£¨50¼¶£©
		end
	end
	if (lvl >= 70) then		-- »ØÊ¦ÈÎÎñ£¨¼ÓÕòÅÉ¾øÑ§£©
		if (HaveMagic(273) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(273)		--ÈçÀ´Ç§Ò¶[273]
		end
		if (HaveMagic(21) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(21)		--Ò×½î¾­[21]£¨60¼¶£©
		end
	end
	if (lvl >= 90) then		-- 90¼¶ÈÎÎñ£¨¼Ó90¼¶¼¼ÄÜ£©
		if (HaveMagic(318) <= 0) then AddMagic(318,20) end		--´ïÄ¦¶É½­[318]
		if (HaveMagic(319) <= 0) then AddMagic(319,20) end		--ºáÉ¨Ç§¾ü[319]£¨90¼¶£©
		if (HaveMagic(321) <= 0) then AddMagic(321,20) end		--ÎŞÏàÕ¶  [321]£¨90¼¶£©
		if (HaveMagic(709) <= 0) then AddMagic(709,20) end		--ÃÅÅÉ120¼¼ÄÜ
		if (HaveMagic(1055) <= 0) then AddMagic(1055,20) end		--ÃÅÅÉ150¼¼ÄÜ
		if (HaveMagic(1056) <= 0) then AddMagic(1056,20) end		--ÃÅÅÉ150¼¼ÄÜ
		if (HaveMagic(1057) <= 0) then AddMagic(1057,20) end		--ÃÅÅÉ150¼¼ÄÜ
		--AddItem(6,1,2841,1,0,0)
	end
end

function add_tm(lvl)			-- ¸ù¾İÈÎÎñµÈ¼¶¼ÓÏàÓ¦µÄÌÆÃÅ¼¼ÄÜ
	AddMagic(210,1)
	if (lvl >= 10) then			-- ÒÑ¾­ÈëÃÅ£¨¼ÓÈëÃÅ¼¼ÄÜ£©
		if (HaveMagic(45) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(45)		--Åùö¨µ¯[45 ]£¨ÈëÃÅ£©
		end
	end
	if (lvl >= 20) then		-- 10¼¶ÈÎÎñ£¨¼Ó10¼¶¼¼ÄÜ£©
		if (HaveMagic(43) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(43)		--ÌÆÃÅ°µÆ÷[43 ]£¨10¼¶£©
		end
		if (HaveMagic(347) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(347)		--µØÑæ»ğ[347]£¨10¼¶£©
		end
	end
	if (lvl >= 30) then		-- 20¼¶ÈÎÎñ£¨¼Ó20¼¶¼¼ÄÜ£©
		if (HaveMagic(303) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(303)		--¶¾´Ì¹Ç  [303]£¨20¼¶£©
		end
	end
	if (lvl >= 40) then		-- 30¼¶ÈÎÎñ£¨¼Ó30¼¶¼¼ÄÜ£©
		if (HaveMagic(50) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(50)		--×·ĞÄ¼ı  [50 ]£¨30¼¶£©
		end
		if (HaveMagic(54) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(54)		--ÂşÌì»¨Óê[54 ]£¨30¼¶£©
		end
		if (HaveMagic(47) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(47)		--¶á»êïÚ  [47 ]£¨30¼¶£©
		end
		if (HaveMagic(343) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(343)		--´©ĞÄ´Ì  [343]£¨30¼¶£©
		end
	end
	if (lvl >= 50) then		-- 40¼¶ÈÎÎñ£¨¼Ó40¼¶¼¼ÄÜ£©
		if (HaveMagic(345) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(345)		--º®±ù´Ì  [345]£¨40¼¶£©
		end
	end
	if (lvl >= 60) then		-- 50¼¶ÈÎÎñ£¨¼Ó50¼¶¼¼ÄÜ£©
		if (HaveMagic(349) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(349)		--À×»÷Êõ[349]£¨50¼¶£©
		end
	end
	if (lvl >= 70) then		-- »ØÊ¦ÈÎÎñ£¨¼ÓÕòÅÉ¾øÑ§£©
		if (HaveMagic(249) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(249)		--Ğ¡Àî·Éµ¶[249]£¨60¼¶£©
		end
		if (HaveMagic(48) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(48)		--ĞÄÑÛ  [48 ]£¨ÕòÅÉ£©
		end
		if (HaveMagic(58) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(58)		--ÌìÂŞµØÍø[58 ]£¨60¼¶£©
		end
		if (HaveMagic(341) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(341)		--É¢»¨ïÚ  [341]£¨60¼¶£©
		end
	end
	if (lvl >= 90) then		-- 90¼¶ÈÎÎñ£¨¼Ó90¼¶¼¼ÄÜ£©
		if (HaveMagic(339) <= 0) then AddMagic(339,20) end		--Éã»êÔÂÓ°[339]£¨90¼¶£©
		if (HaveMagic(302) <= 0) then AddMagic(302,20) end		--±©ÓêÀæ»¨[302]£¨90¼¶£©
		if (HaveMagic(342) <= 0) then AddMagic(342,20) end		--¾Å¹¬·ÉĞÇ[342]£¨90¼¶£©
---		if (GetTaskTemp(20) == 351) then					-- Èç¹û·¢ÏÖÓĞ¸Ã¼¼ÄÜÔò¼Ó»Ø£¬ÆäËü90¼¼ÄÜÎ´É¾
---			if (HaveMagic(351) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
---				AddMagic(351)		--ÂÒ»·»÷  [351]£¨90¼¶£©
---			end
---		end
		if (HaveMagic(351) <= 0) then AddMagic(351) end		--90×çÖä¸¨Öú¼¼ÄÜ
		if (HaveMagic(710) <= 0) then AddMagic(710,20) end		--ÃÅÅÉ120¼¼ÄÜ
		if (HaveMagic(1069) <= 0) then AddMagic(1069,20) end		--ÃÅÅÉ150¼¼ÄÜ
		if (HaveMagic(1070) <= 0) then AddMagic(1070,20) end		--ÃÅÅÉ150¼¼ÄÜ
		if (HaveMagic(1071) <= 0) then AddMagic(1071,20) end		--ÃÅÅÉ150¼¼ÄÜ
		if (HaveMagic(1110) <= 0) then AddMagic(1110) end		--ÃÅÅÉ150¼¼ÄÜ
		--AddItem(6,1,2841,1,0,0)
	end
end

function add_wu(lvl)			-- ¸ù¾İÈÎÎñµÈ¼¶¼ÓÏàÓ¦µÄÎå¶¾¼¼ÄÜ
	AddMagic(210,1)
	if (lvl >= 10) then			-- ÒÑ¾­ÈëÃÅ£¨¼ÓÈëÃÅ¼¼ÄÜ£©
		if (HaveMagic(63) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(63)		--¶¾É°ÕÆ  [63]£¨ÈëÃÅ£©
		end
		if (HaveMagic(65) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(65)		--Ñªµ¶¶¾É±[65]£¨ÈëÃÅ£©
		end
	end
	if (lvl >= 20) then		-- 10¼¶ÈÎÎñ£¨¼Ó10¼¶¼¼ÄÜ£©
		if (HaveMagic(62) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(62)		--Îå¶¾ÕÆ·¨[62]£¨10¼¶£©
		end
		if (HaveMagic(60) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(60)		--Îå¶¾µ¶·¨[60]£¨10¼¶£©
		end
		if (HaveMagic(67) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(67)		--¾ÅÌì¿ñÀ×[67]£¨10¼¶£©
		end
	end
	if (lvl >= 30) then		-- 20¼¶ÈÎÎñ£¨¼Ó20¼¶¼¼ÄÜ£©
		if (HaveMagic(70) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(70)		--³àÑæÊ´Ìì[70]£¨20¼¶£©
		end
		if (HaveMagic(66) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(66)		--ÔÓÄÑÒ©¾­[66]£¨20¼¶£©
		end
	end
	if (lvl >= 40) then		-- 30¼¶ÈÎÎñ£¨¼Ó30¼¶¼¼ÄÜ£©
		if (HaveMagic(68) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(68)		--ÓÄÚ¤÷¼÷Ã[68 ]£¨30¼¶£©
		end
		if (HaveMagic(384) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(384)		--°Ù¶¾´©ĞÄ[384]£¨30¼¶£©
		end
		if (HaveMagic(64) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(64)		--±ùÀ¶Ğş¾§[64 ]£¨30¼¶£©
		end
		if (HaveMagic(69) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(69)		--ÎŞĞÎ¹Æ  [69]£¨30¼¶£©
		end
	end
	if (lvl >= 50) then		-- 40¼¶ÈÎÎñ£¨¼Ó40¼¶¼¼ÄÜ£©
		if (HaveMagic(356) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(356)		--´©ÒÂÆÆ¼×  [356]£¨40¼¶£©
		end
		if (HaveMagic(73) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(73)		--Íò¹ÆÊ´ĞÄ[73 ]£¨40¼¶£©
		end
	end
	if (lvl >= 60) then		-- 50¼¶ÈÎÎñ£¨¼Ó50¼¶¼¼ÄÜ£©
		if (HaveMagic(72) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(72)		--´©ĞÄ¶¾´Ì[72]£¨50¼¶£©
		end
	end
	if (lvl >= 70) then		-- »ØÊ¦ÈÎÎñ£¨¼ÓÕòÅÉ¾øÑ§£©
		if (HaveMagic(71) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(71)		--Ììî¸µØÉ·ÊÖ[71 ]£¨60¼¶£©
		end
		if (HaveMagic(75) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(75)		--Îå¶¾Ææ¾­[75]£¨ÕòÅÉ£©
		end
		if (HaveMagic(74) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(74)		--Öì¸òÇàÚ¤  [74 ]£¨60¼¶£©
		end
	end
	if (lvl >= 90) then		-- 90¼¶ÈÎÎñ£¨¼Ó90¼¶¼¼ÄÜ£©
		if (HaveMagic(353) <= 0) then AddMagic(353,20) end		--Òõ·çÊ´¹Ç[353]£¨90¼¶£©
		if (HaveMagic(355) <= 0) then AddMagic(355,20) end		--ĞşÒõÕ¶  [355]£¨90¼¶£©
---		if (GetTaskTemp(20) == 390) then					-- Èç¹û·¢ÏÖÓĞ¸Ã¼¼ÄÜÔò¼Ó»Ø£¬ÆäËü90¼¼ÄÜÎ´É¾
---			if (HaveMagic(390) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
---				AddMagic(390)		-- [390]£¨90¼¶£©
---			end
---		end
		if (HaveMagic(390) <= 0) then AddMagic(390) end		--90×çÖä¸¨Öú¼¼ÄÜ
		if (HaveMagic(711) <= 0) then AddMagic(711,20) end		--ÃÅÅÉ120¼¼ÄÜ
		if (HaveMagic(1066) <= 0) then AddMagic(1066,20) end		--ÃÅÅÉ150¼¼ÄÜ
		if (HaveMagic(1067) <= 0) then AddMagic(1067,20) end		--ÃÅÅÉ150¼¼ÄÜ
		--AddItem(6,1,2841,1,0,0)
	end
end

function add_em(lvl)			-- ¸ù¾İÈÎÎñµÈ¼¶¼ÓÏàÓ¦µÄ¶ëáÒ¼¼ÄÜ
	AddMagic(210,1)
	if (lvl >= 10) then			-- ÒÑ¾­ÈëÃÅ£¨¼ÓÈëÃÅ¼¼ÄÜ£©
		if (HaveMagic(85) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(85)		--Ò»Ò¶ÖªÇï[85]£¨ÈëÃÅ£©
		end
		if (HaveMagic(80) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(80)		--Æ®Ñ©´©ÔÆ[80]£¨ÈëÃÅ£©
		end
	end
	if (lvl >= 20) then		-- 10¼¶ÈÎÎñ£¨¼Ó10¼¶¼¼ÄÜ£©
		if (HaveMagic(77) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(77)		--¶ëáÒ½£·¨[77]£¨10¼¶£©
		end
		if (HaveMagic(79) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(79)		--¶ëáÒÕÆ·¨[79]£¨10¼¶£©
		end
	end
	if (lvl >= 30) then		-- 20¼¶ÈÎÎñ£¨¼Ó20¼¶¼¼ÄÜ£©
		if (HaveMagic(93) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(93)		--´Èº½ÆÕ¶É[93]£¨20¼¶£©
		end
	end
	if (lvl >= 40) then		-- 30¼¶ÈÎÎñ£¨¼Ó30¼¶¼¼ÄÜ£©
		if (HaveMagic(385) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(385)		--ÍÆ´°ÍûÔÂ[385]£¨30¼¶£©
		end
		if (HaveMagic(82) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(82)		--ËÄÏóÍ¬¹é[82]£¨30¼¶£©
		end
		if (HaveMagic(89) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(89)		--ÃÎµû    [89]£¨30¼¶£©
		end
	end
	if (lvl >= 50) then		-- 40¼¶ÈÎÎñ£¨¼Ó40¼¶¼¼ÄÜ£©
		if (HaveMagic(86) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(86)		--Á÷Ë®    [86 ]£¨40¼¶£©
		end
	end
	if (lvl >= 60) then		-- 50¼¶ÈÎÎñ£¨¼Ó50¼¶¼¼ÄÜ£©
		if (HaveMagic(92) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(92)		--·ğĞÄ´ÈÓÓ[92]£¨50¼¶£©
		end
	end
	if (lvl >= 70) then		-- »ØÊ¦ÈÎÎñ£¨¼ÓÕòÅÉ¾øÑ§£©
		if (HaveMagic(88) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(88)		--²»Ãğ²»¾ø[88]£¨60¼¶£©
		end
		if (HaveMagic(252) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(252)		--·ğ·¨ÎŞ±ß[252]£¨ÕòÅÉ£©
		end
		if (HaveMagic(91) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(91)		--·ğ¹âÆÕÕÕ[91]£¨60¼¶£©
		end
		if (HaveMagic(282) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(282)		--ÇåÒôèó³ª[282]£¨60¼¶£©
		end
	end
	if (lvl >= 90) then		-- 90¼¶ÈÎÎñ£¨¼Ó90¼¶¼¼ÄÜ£©
		if (HaveMagic(328) <= 0) then AddMagic(328,20) end		--Èı¶ëö«Ñ©[328]£¨90¼¶£©
		if (HaveMagic(380) <= 0) then AddMagic(380,20) end		--·çËªËéÓ°[380]£¨90¼¶£©
---		if (GetTaskTemp(20) == 332) then					-- Èç¹û·¢ÏÖÓĞ¸Ã¼¼ÄÜÔò¼Ó»Ø£¬ÆäËü90¼¼ÄÜÎ´É¾
---			if (HaveMagic(332) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
---				AddMagic(332)		--ÆÕ¶ÉÖÚÉú[332]£¨90¼¶£©
---			end
---		end
		if (HaveMagic(332) <= 0) then AddMagic(332) end		--90×çÖä¸¨Öú¼¼ÄÜ
		if (HaveMagic(712) <= 0) then AddMagic(712,20) end		--ÃÅÅÉ120¼¼ÄÜ
		if (HaveMagic(1061) <= 0) then AddMagic(1061,20) end		--ÃÅÅÉ150¼¼ÄÜ
		if (HaveMagic(1062) <= 0) then AddMagic(1062,20) end		--ÃÅÅÉ150¼¼ÄÜ
		if (HaveMagic(1114) <= 0) then AddMagic(1114,20) end		--ÃÅÅÉ150¼¼ÄÜ
		--AddItem(6,1,2841,1,0,0)
	end
end

function add_cy(lvl)			-- ¸ù¾İÈÎÎñµÈ¼¶¼ÓÏàÓ¦µÄ´äÑÌ¼¼ÄÜ
	AddMagic(210,1)
	if (lvl >= 10) then			-- ÒÑ¾­ÈëÃÅ£¨¼ÓÈëÃÅ¼¼ÄÜ£©
		if (HaveMagic(99) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(99)		--·ç»¨Ñ©ÔÂ[99 ]£¨ÈëÃÅ£©
		end
		if (HaveMagic(102) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(102)		--·ç¾í²ĞÑ©[102]£¨ÈëÃÅ£©
		end
	end
	if (lvl >= 20) then		-- 10¼¶ÈÎÎñ£¨¼Ó10¼¶¼¼ÄÜ£©
		if (HaveMagic(95) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(95)		----´äÑÌµ¶·¨[95 ]£¨10¼¶£©
		end
		if (HaveMagic(97) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(97)		--´äÑÌË«µ¶[97 ]£¨10¼¶£©
		end
	end
	if (lvl >= 30) then		-- 20¼¶ÈÎÎñ£¨¼Ó20¼¶¼¼ÄÜ£©
		if (HaveMagic(269) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(269)		--±ùĞÄÙ»Ó°[269]£¨20¼¶£©
		end
	end
	if (lvl >= 40) then		-- 30¼¶ÈÎÎñ£¨¼Ó30¼¶¼¼ÄÜ£©
		if (HaveMagic(105) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(105)		--Óê´òÀæ»¨[105]£¨30¼¶£©
		end
		if (HaveMagic(113) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(113)		--¸¡ÔÆÉ¢Ñ©[113]£¨30¼¶£©
		end
	end
	if (lvl >= 50) then		-- 40¼¶ÈÎÎñ£¨¼Ó40¼¶¼¼ÄÜ£©
		if (HaveMagic(100) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(100)		--»¤Ìåº®±ù[100]£¨30¼¶£©
		end
	end
	if (lvl >= 60) then		-- 50¼¶ÈÎÎñ£¨¼Ó50¼¶¼¼ÄÜ£©
		if (HaveMagic(109) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(109)		--Ñ©Ó°    [109]£¨40¼¶£©
		end
	end
	if (lvl >= 70) then		-- »ØÊ¦ÈÎÎñ£¨¼ÓÕòÅÉ¾øÑ§£©
		if (HaveMagic(108) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(108)		--ÄÁÒ°Á÷ĞÇ[108]£¨60¼¶£©
		end
		if (HaveMagic(114) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(114)		--±ù¹ÇÑ©ĞÄ[114]£¨ÕòÅÉ£©
		end
		if (HaveMagic(111) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(111)		--±Ìº£³±Éú[111]£¨60¼¶£©
		end
	end
	if (lvl >= 90) then		-- 90¼¶ÈÎÎñ£¨¼Ó90¼¶¼¼ÄÜ£©
		if (HaveMagic(336) <= 0) then AddMagic(336,20) end		--±ù×ÙÎŞÓ°[336]£¨90¼¶£©
		if (HaveMagic(337) <= 0) then AddMagic(337,20) end		--±ùĞÄÏÉ×Ó[337]£¨90¼¶£©
		if (HaveMagic(713) <= 0) then AddMagic(713,20) end		--ÃÅÅÉ120¼¼ÄÜ
		if (HaveMagic(1063) <= 0) then AddMagic(1063,20) end		--ÃÅÅÉ150¼¼ÄÜ
		if (HaveMagic(1065) <= 0) then AddMagic(1065,20) end		--ÃÅÅÉ150¼¼ÄÜ
		--AddItem(6,1,2841,1,0,0)
	end
end

function add_tr(lvl)			-- ¸ù¾İÈÎÎñµÈ¼¶¼ÓÏàÓ¦µÄÌìÈÌ¼¼ÄÜ
	AddMagic(210,1)
	if (lvl >= 10) then			-- ÒÑ¾­ÈëÃÅ£¨¼ÓÈëÃÅ¼¼ÄÜ£©
		if (HaveMagic(135) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(135)		--²ĞÑôÈçÑª[135]£¨ÈëÃÅ£©
		end
		if (HaveMagic(145) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(145)		--µ¯Ö¸ÁÒÑæ[145]£¨ÈëÃÅ£©
		end
	end
	if (lvl >= 20) then		-- 10¼¶ÈÎÎñ£¨¼Ó10¼¶¼¼ÄÜ£©
		if (HaveMagic(132) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(132)		--ÌìÈÌÃ¬·¨[132]£¨10¼¶£©
		end
		if (HaveMagic(131) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(131)		--ÌìÈÌµ¶·¨[131]£¨10¼¶£©
		end
		if (HaveMagic(136) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(136)		--»ğ·ÙÁ«»ª[136]£¨10¼¶£©
		end
	end
	if (lvl >= 30) then		-- 20¼¶ÈÎÎñ£¨¼Ó20¼¶¼¼ÄÜ£©
		if (HaveMagic(137) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(137)		--»ÃÓ°·Éºü[137]£¨20¼¶£©
		end
	end
	if (lvl >= 40) then		-- 30¼¶ÈÎÎñ£¨¼Ó30¼¶¼¼ÄÜ£©
		if (HaveMagic(141) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(141)		--ÁÒ»ğÇéÌì[141]£¨30¼¶£©
		end
		if (HaveMagic(138) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(138)		--ÍÆÉ½Ìîº£[138]£¨30¼¶£©
		end
		if (HaveMagic(140) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(140)		--·ÉºèÎŞ¼£[140]£¨30¼¶£©
		end
	end
	if (lvl >= 50) then		-- 40¼¶ÈÎÎñ£¨¼Ó40¼¶¼¼ÄÜ£©
		if (HaveMagic(364) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(364)		--±¯ËÖÇå·ç[364]£¨40¼¶£©
		end
	end
	if (lvl >= 60) then		-- 50¼¶ÈÎÎñ£¨¼Ó50¼¶¼¼ÄÜ£©
		if (HaveMagic(143) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(143)		--À÷Ä§¶á»ê[143]£¨50¼¶£©
		end
	end
	if (lvl >= 70) then		-- »ØÊ¦ÈÎÎñ£¨¼ÓÕòÅÉ¾øÑ§£©
		if (HaveMagic(142) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(142)		--ÍµÌì»»ÈÕ[142]£¨60¼¶£©
		end
		if (HaveMagic(150) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(150)		--ÌìÄ§½âÌå[150]£¨ÕòÅÉ£©
		end
		if (HaveMagic(148) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(148)		--Ä§ÑæÆßÉ±[148]£¨60¼¶£©
		end
	end
	if (lvl >= 90) then		-- 90¼¶ÈÎÎñ£¨¼Ó90¼¶¼¼ÄÜ£©
		if (HaveMagic(361) <= 0) then AddMagic(361,20) end		--ÔÆÁú»÷  [361]£¨90¼¶£©
		if (HaveMagic(362) <= 0) then AddMagic(362,20) end		--ÌìÍâÁ÷ĞÇ[362]£¨90¼¶£©
---		if (GetTaskTemp(20) == 391) then					-- Èç¹û·¢ÏÖÓĞ¸Ã¼¼ÄÜÔò¼Ó»Ø£¬ÆäËü90¼¼ÄÜÎ´É¾
---			if (HaveMagic(391) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
---				AddMagic(391)		-- [391]£¨90¼¶£©
---			end
---		end
		if (HaveMagic(391) <= 0) then AddMagic(391) end		--90×çÖä¸¨Öú¼¼ÄÜ
		if (HaveMagic(715) <= 0) then AddMagic(715,20) end		--ÃÅÅÉ120¼¼ÄÜ
		if (HaveMagic(1075) <= 0) then AddMagic(1075,20) end		--ÃÅÅÉ150¼¼ÄÜ
		if (HaveMagic(1076) <= 0) then AddMagic(1076,20) end		--ÃÅÅÉ150¼¼ÄÜ
		--AddItem(6,1,2841,1,0,0)
	end
end

function add_gb(lvl)			-- ¸ù¾İÈÎÎñµÈ¼¶¼ÓÏàÓ¦µÄØ¤°ï¼¼ÄÜ
	AddMagic(210,1)
	if (lvl >= 10) then			-- ÒÑ¾­ÈëÃÅ£¨¼ÓÈëÃÅ¼¼ÄÜ£©
		if (HaveMagic(122) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(122)		--¼ûÈËÉìÊÖ[122]£¨ÈëÃÅ£©
		end
		if (HaveMagic(119) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(119)		--ÑØÃÅÍĞ²§[119]£¨ÈëÃÅ£©
		end
	end
	if (lvl >= 20) then		-- 10¼¶ÈÎÎñ£¨¼Ó10¼¶¼¼ÄÜ£©
		if (HaveMagic(116) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(116)		--Ø¤°ïÕÆ·¨[116]£¨10¼¶£©
		end
		if (HaveMagic(115) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(115)		--Ø¤°ï°ô·¨[115]£¨10¼¶£©
		end
	end
	if (lvl >= 30) then		-- 20¼¶ÈÎÎñ£¨¼Ó20¼¶¼¼ÄÜ£©
		if (HaveMagic(129) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(129)		--»¯ÏÕÎªÒÄ[129]£¨20¼¶£©
		end
	end
	if (lvl >= 40) then		-- 30¼¶ÈÎÎñ£¨¼Ó30¼¶¼¼ÄÜ£©
		if (HaveMagic(274) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(274)		--½µÁúÕÆ[274]£¨30¼¶£©
		end
		if (HaveMagic(124) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(124)		--´ò¹·Õó[124]£¨30¼¶£©
		end
	end
	if (lvl >= 50) then		-- 40¼¶ÈÎÎñ£¨¼Ó40¼¶¼¼ÄÜ£©
		if (HaveMagic(277) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(277)		--»¬²»ÁôÊÖ[277]£¨40¼¶£©
		end
	end
	if (lvl >= 60) then		-- 50¼¶ÈÎÎñ£¨¼Ó50¼¶¼¼ÄÜ£©
		if (HaveMagic(128) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(128)		--¿ºÁúÓĞ»Ú[128]£¨50¼¶£©
		end
		if (HaveMagic(125) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(125)		--°ô´ò¶ñ¹·[125]£¨50¼¶£©
		end
	end
	if (lvl >= 70) then		-- »ØÊ¦ÈÎÎñ£¨¼ÓÕòÅÉ¾øÑ§£©
		if (HaveMagic(130) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(130)		--×íµû¿ñÎè[130]£¨ÕòÅÉ£©
		end
		if (HaveMagic(360) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(360)		--åĞÒ£¹¦[360]£¨60¼¶£©
		end
	end
	if (lvl >= 90) then		-- 90¼¶ÈÎÎñ£¨¼Ó90¼¶¼¼ÄÜ£©
		if (HaveMagic(357) <= 0) then AddMagic(357,20) end		--·ÉÁúÔÚÌì[357]£¨90¼¶£©
		if (HaveMagic(359) <= 0) then AddMagic(359,20) end		--ÌìÏÂÎŞ¹·[359]£¨90¼¶£©
		if (HaveMagic(714) <= 0) then AddMagic(714,20) end		--ÃÅÅÉ120¼¼ÄÜ
		if (HaveMagic(1073) <= 0) then AddMagic(1073,20) end		--ÃÅÅÉ150¼¼ÄÜ
		if (HaveMagic(1074) <= 0) then AddMagic(1074,20) end		--ÃÅÅÉ150¼¼ÄÜ
		--AddItem(6,1,2841,1,0,0)
	end
end

function add_wd(lvl)			-- ¸ù¾İÈÎÎñµÈ¼¶¼ÓÏàÓ¦µÄÎäµ±¼¼ÄÜ
	AddMagic(210,1)
	if (lvl >= 10) then			-- ÒÑ¾­ÈëÃÅ£¨¼ÓÈëÃÅ¼¼ÄÜ£©
		if (HaveMagic(153) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(153)		--Å­À×Ö¸  [153]£¨ÈëÃÅ£©
		end
		if (HaveMagic(155) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(155)		--²×º£Ã÷ÔÂ[155]£¨ÈëÃÅ£©
		end
	end
	if (lvl >= 20) then		-- 10¼¶ÈÎÎñ£¨¼Ó10¼¶¼¼ÄÜ£©
		if (HaveMagic(152) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(152)		--Îäµ±È­·¨[152]£¨10¼¶£©
		end
		if (HaveMagic(151) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(151)		--Îäµ±½£·¨[151]£¨10¼¶£©
		end
	end
	if (lvl >= 30) then		-- 20¼¶ÈÎÎñ£¨¼Ó20¼¶¼¼ÄÜ£©
		if (HaveMagic(159) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(159)		--ÆßĞÇÕó  [159]£¨30¼¶£©
		end
	end
	if (lvl >= 40) then		-- 30¼¶ÈÎÎñ£¨¼Ó30¼¶¼¼ÄÜ£©
		if (HaveMagic(164) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(164)		--°ş¼°¶ø¸´[164]£¨30¼¶£©
		end
		if (HaveMagic(158) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(158)		--½£·É¾ªÌì[158]£¨30¼¶£©
		end
	end
	if (lvl >= 50) then		-- 40¼¶ÈÎÎñ£¨¼Ó40¼¶¼¼ÄÜ£©
		if (HaveMagic(160) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(160)		--ÌİÔÆ×İ  [160]£¨40¼¶£©
		end
	end
	if (lvl >= 60) then		-- 50¼¶ÈÎÎñ£¨¼Ó50¼¶¼¼ÄÜ£©
		if (HaveMagic(157) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(157)		--×øÍûÎŞÎÒ[157]£¨50¼¶£©
		end
	end
	if (lvl >= 70) then		-- »ØÊ¦ÈÎÎñ£¨¼ÓÕòÅÉ¾øÑ§£©
		if (HaveMagic(165) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(165)		--ÎŞÎÒÎŞ½£[165]£¨60¼¶£©
		end
		if (HaveMagic(166) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(166)		--Ì«¼«Éñ¹¦[166]£¨ÕòÅÉ£©
		end
		if (HaveMagic(267) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(267)		--Èı»·Ì×ÔÂ[267]£¨60¼¶£©
		end
	end
	if (lvl >= 90) then		-- 90¼¶ÈÎÎñ£¨¼Ó90¼¶¼¼ÄÜ£©
		if (HaveMagic(365) <= 0) then AddMagic(365,20) end		--ÌìµØÎŞ¼«[365]£¨90¼¶£©
		if (HaveMagic(368) <= 0) then AddMagic(368,20) end		--ÈË½£ºÏÒ»[368]£¨90¼¶£©
		if (HaveMagic(716) <= 0) then AddMagic(716,20) end		--ÃÅÅÉ120¼¼ÄÜ
		if (HaveMagic(1078) <= 0) then AddMagic(1078,20) end		--ÃÅÅÉ150¼¼ÄÜ
		if (HaveMagic(1079) <= 0) then AddMagic(1079,20) end		--ÃÅÅÉ150¼¼ÄÜ
		--AddItem(6,1,2841,1,0,0)
	end
end

function add_kl(lvl)			-- ¸ù¾İÈÎÎñµÈ¼¶¼ÓÏàÓ¦µÄÀ¥ÂØ¼¼ÄÜ
	AddMagic(210,1)
	if (lvl >= 10) then			-- ÒÑ¾­ÈëÃÅ£¨¼ÓÈëÃÅ¼¼ÄÜ£©
		if (HaveMagic(169) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(169)		--ºô·ç·¨  [169]£¨ÈëÃÅ£©
		end
		if (HaveMagic(179) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(179)		--¿ñÀ×ÕğµØ[179]£¨ÈëÃÅ£©
		end
	end
	if (lvl >= 20) then		-- 10¼¶ÈÎÎñ£¨¼Ó10¼¶¼¼ÄÜ£©
		if (HaveMagic(167) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(167)		--À¥ÂØµ¶·¨[167]£¨10¼¶£©
		end
		if (HaveMagic(168) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(168)		--À¥ÂØ½£·¨[168]£¨10¼¶£©
		end
		if (HaveMagic(392) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(392)		--²ø×Ö¾÷[392]£¨10¼¶£©
		end
		if (HaveMagic(171) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(171)		--Çå·ç·û  [171]£¨10¼¶£©
		end
	end
	if (lvl >= 30) then		-- 20¼¶ÈÎÎñ£¨¼Ó20¼¶¼¼ÄÜ£©
		if (HaveMagic(174) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(174)		--î¿°í·û  [174]£¨20¼¶£©
		end
	end
	if (lvl >= 40) then		-- 30¼¶ÈÎÎñ£¨¼Ó30¼¶¼¼ÄÜ£©
		if (HaveMagic(178) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(178)		--Ò»ÆøÈıÇå[178]£¨30¼¶£©
		end
		if (HaveMagic(172) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(172)		--Ñ¸À×Öä  [172]£¨30¼¶£©
		end
		if (HaveMagic(393) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(393)	-- È±ÉÙID£¨30¼¶£©
		end
		if (HaveMagic(173) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(173)		--ÌìÇåµØ×Ç[173]£¨30¼¶£©
		end
	end
	if (lvl >= 50) then		-- 40¼¶ÈÎÎñ£¨¼Ó40¼¶¼¼ÄÜ£©
		if (HaveMagic(175) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(175)		--ÆÛº®°ÁÑ©[175]£¨40¼¶£©
		end
		if (HaveMagic(181) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(181)		--ÆúĞÄ·û  [181]£¨40¼¶£©
		end
	end
	if (lvl >= 60) then		-- 50¼¶ÈÎÎñ£¨¼Ó50¼¶¼¼ÄÜ£©
		if (HaveMagic(176) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(176)		--¿ñ·çÖèµç[176]£¨50¼¶£©
		end
		if (HaveMagic(90) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(90)		--ÃÔ×Ù»ÃÓ°[90 ]£¨50¼¶£©
		end
	end
	if (lvl >= 70) then		-- »ØÊ¦ÈÎÎñ£¨¼ÓÕòÅÉ¾øÑ§£©
		if (HaveMagic(275) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(275)		--Ëª°ÁÀ¥ÂØ[275]£¨ÕòÅÉ£©
		end
		if (HaveMagic(182) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(182)		--ÎåÀ×Õı·¨[182]£¨60¼¶£©
		end
		if (HaveMagic(630) == -1) then
			AddMagic(630);		--µÚÈı×ÊÁÏÆ¬£¬Ôö¼ÓÀ¥ÂØĞÂ¼¼ÄÜ"ĞşÌìÎŞ¼«"
		end
	end
	if (lvl >= 90) then		-- 90¼¶ÈÎÎñ£¨¼Ó90¼¶¼¼ÄÜ£©
		if (HaveMagic(372) <= 0) then AddMagic(372,20) end		--°ÁÑ©Ğ¥·ç[372]£¨90¼¶£©
		if (HaveMagic(375) <= 0) then AddMagic(375,20) end		--À×¶¯¾ÅÌì[375]£¨90¼¶£©
---		if (GetTaskTemp(20) == 394) then
---			if (HaveMagic(394) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
---				AddMagic(394)		-- [394]£¨90¼¶£©
---			end
---		end
		if (HaveMagic(394) <= 0) then AddMagic(394) end		--90×çÖä¸¨Öú¼¼ÄÜ
		if (HaveMagic(717) <= 0) then AddMagic(717,20) end		--ÃÅÅÉ120¼¼ÄÜ
		if (HaveMagic(1080) <= 0) then AddMagic(1080,20) end		--ÃÅÅÉ150¼¼ÄÜ
		if (HaveMagic(1081) <= 0) then AddMagic(1081,20) end		--ÃÅÅÉ150¼¼ÄÜ
		--AddItem(6,1,2841,1,0,0)
	end
end

function add_hs(lvl)			-- ¸ù¾İÈÎÎñµÈ¼¶¼ÓÏàÓ¦µÄ»ªÉ½¼¼ÄÜ
	AddMagic(210,1)
	if (lvl >= 10) then			-- ÒÑ¾­ÈëÃÅ£¨¼ÓÈëÃÅ¼¼ÄÜ£©
		if (HaveMagic(1347) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(1347)		--°×ºç¹áÈÕ£¨ÈëÃÅ£©
		end
		if (HaveMagic(1372) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(1372)		--Çå·çËÍË¬£¨ÈëÃÅ£©
		end
	end
	if (lvl >= 20) then		-- 10¼¶ÈÎÎñ£¨¼Ó10¼¶¼¼ÄÜ£©
		if (HaveMagic(1349) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(1349)		--½£×Ú×Ü¾ö£¨10¼¶£©
		end
		if (HaveMagic(1374) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(1374)		--ÁúÈÅÉí£¨10¼¶£©
		end
	end
	if (lvl >= 30) then		-- 20¼¶ÈÎÎñ£¨¼Ó20¼¶¼¼ÄÜ£©
		if (HaveMagic(1350) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(1350)		--ÑøÎá½£·¨£¨20¼¶£©
		end
		if (HaveMagic(1375) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(1375)		--º£ÄÉ°Ù´¨£¨20¼¶£©
		end
	end
	if (lvl >= 40) then		-- 30¼¶ÈÎÎñ£¨¼Ó30¼¶¼¼ÄÜ£©
		if (HaveMagic(1351) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(1351)		--½ğÑãºá¿Õ£¨30¼¶£©
		end
		if (HaveMagic(1376) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(1376)		--ÁúĞı½£Æø£¨30¼¶£©
		end
	end
	if (lvl >= 50) then		-- 40¼¶ÈÎÎñ£¨¼Ó40¼¶¼¼ÄÜ£©
		if (HaveMagic(1354) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(1354)		--Ï£ÒÄ½£·¨£¨40¼¶£©
		end
		if (HaveMagic(1378) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(1378)		--ÆøÕğÉ½ºÓ£¨40¼¶£©
		end
	end
	if (lvl >= 60) then		-- 50¼¶ÈÎÎñ£¨¼Ó50¼¶¼¼ÄÜ£©
		if (HaveMagic(1355) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(1355)		--ÌìÉğµ¹Ğü£¨50¼¶£©
		end
		if (HaveMagic(1379) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(1379)		--Æø¹á³¤ºç£¨50¼¶£©
		end
	end
	if (lvl >= 70) then		-- »ØÊ¦ÈÎÎñ£¨¼ÓÕòÅÉ¾øÑ§£©
		if (HaveMagic(1358) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(1358)		--»ÃÑÛÔÆäÎ£¨60¼¶£©
		end
		if (HaveMagic(1360) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(1360)		--²ÔËÉÓ­¿Í£¨60¼¶£©
		end
		if (HaveMagic(1380) == -1) then
			AddMagic(1380);		--Ä¦ÔÆ½£Æø£¨60¼¶£©
		end
	end
end

function del_all_skill()
	i = HaveMagic(210)		-- Çá¹¦ÁíÍâ²Ù×÷
	j = HaveMagic(400)		-- ¡°½Ù¸»¼ÃÆ¶¡±ÁíÍâ²Ù×÷
	n = RollbackSkill()		-- Çå³ı¼¼ÄÜ²¢·µ»ØËùÓĞ¼¼ÄÜµã£¨°üÀ¨Çá¹¦µÈÌØÊâ¼¼ÄÜ£©
	x = 0
	if (i ~= -1) then x = x + i end		-- ÕâÁ½¾äÅĞ¶ÏÊÇÅÅ³ı´ÓÎ´Ñ§¹ıÇá¹¦µÄÈË·µ»Ø-1´Ó¶øµ¼ÖÂµãÊı¼ÆËã´íÎóÇé¿ö
	if (j ~= -1) then x = x + j end
	SetTaskTemp(21,n + GetMagicPoint() - x)			-- °Ñ¼¼ÄÜµãµ±×ö¿ÕÏĞµãÊı·µ»¹£¬µ«ÏÈ¿Û³ıÇá¹¦µÈ

---------------- ¹«¹²¼¼ÄÜ ------------------------
	if (i ~= -1) then AddMagic(210,i) end			-- Èç¹ûÑ§¹ıÇá¹¦Ôò¼Ó»ØÔ­ÓĞµÈ¼¶
	if (j ~= -1) then AddMagic(400,j) end			-- Èç¹ûÑ§¹ı¡°½Ù¸»¼ÃÆ¶¡±Í¬Ñù´¦Àí
--	DelMagic(396)
--	DelMagic(397)

------------------ °×Ãû --------------------------
--	DelMagic(395)

------------------ ¸÷ÃÅÅÉ ------------------------
	DelMagic(29)			-- ÌìÍõ
	DelMagic(23)
	DelMagic(24)
	DelMagic(26)
	DelMagic(30)
	DelMagic(31)
	DelMagic(32)
	DelMagic(33)
	DelMagic(34)
	DelMagic(35)
	DelMagic(36)
	DelMagic(37)
	DelMagic(38)
	DelMagic(40)
	DelMagic(41)
	DelMagic(42)
	DelMagic(324)
--	DelMagic(322)
--	DelMagic(323)
--	DelMagic(325)
	
	DelMagic(10)			-- ÉÙÁÖ
	DelMagic(3)
	DelMagic(4)
	DelMagic(5)
	DelMagic(6)
	DelMagic(7)
	DelMagic(8)
	DelMagic(9)
	DelMagic(12)
	DelMagic(14)
	DelMagic(13)
	DelMagic(15)
	DelMagic(271)
	DelMagic(16)
	DelMagic(18)
	DelMagic(20)
	DelMagic(11)
	DelMagic(19)
	DelMagic(21)
	DelMagic(273)
--	DelMagic(318)
--	DelMagic(319)
--	DelMagic(321)

	DelMagic(45)			-- ÌÆÃÅ
	DelMagic(43)
	DelMagic(347)
	DelMagic(303)
	DelMagic(44)
	DelMagic(47)
	DelMagic(48)
	DelMagic(50)
	DelMagic(51)
	DelMagic(54)
	DelMagic(343)
	DelMagic(345)
	DelMagic(349)
	DelMagic(55)
	DelMagic(57)
	DelMagic(58)
	DelMagic(249)
	DelMagic(253)
	DelMagic(341)
--	DelMagic(339)
--	DelMagic(302)
--	DelMagic(342)
	if (HaveMagic(351) ~= -1) then
		SetTaskTemp(20,351)
		DelMagic(351)
	end

	DelMagic(63)			-- Îå¶¾
	DelMagic(60)
	DelMagic(61)
	DelMagic(62)
	DelMagic(64)
	DelMagic(65)
	DelMagic(66)
	DelMagic(67)
	DelMagic(68)
	DelMagic(384)
	DelMagic(69)
	DelMagic(356)
	DelMagic(70)
	DelMagic(72)
	DelMagic(73)
	DelMagic(74)
	DelMagic(76)
	DelMagic(71)
	DelMagic(75)
--	DelMagic(353)
--	DelMagic(355)
	if (HaveMagic(390) ~= -1) then
		SetTaskTemp(20,390)
		DelMagic(390)
	end

	DelMagic(80)			-- ¶ëáÒ
	DelMagic(101)
	DelMagic(77)
	DelMagic(79)
	DelMagic(385)
	DelMagic(81)
	DelMagic(82)
	DelMagic(83)
	DelMagic(84)
	DelMagic(85)
	DelMagic(86)
	DelMagic(87)
	DelMagic(88)
	DelMagic(89)
	DelMagic(91)
	DelMagic(93)
	DelMagic(252)
	DelMagic(92)
	DelMagic(282)
--	DelMagic(328)
--	DelMagic(330)
	if (HaveMagic(332) ~= -1) then
		SetTaskTemp(20,332)
		DelMagic(332)
	end

	DelMagic(99)			-- ´äÑÌ
	DelMagic(95)
	DelMagic(96)
	DelMagic(97)
	DelMagic(100)
	DelMagic(102)
	DelMagic(103)
	DelMagic(269)
	DelMagic(105)
	DelMagic(109)
	DelMagic(270)
	DelMagic(108)
	DelMagic(113)
	DelMagic(111)
	DelMagic(114)
--	DelMagic(336)
--	DelMagic(337)

	DelMagic(117)			-- Ø¤°ï
	DelMagic(115)
	DelMagic(116)
	DelMagic(118)
	DelMagic(119)
	DelMagic(120)
	DelMagic(121)
	DelMagic(122)
	DelMagic(123)
	DelMagic(124)
	DelMagic(126)
	DelMagic(127)
	DelMagic(277)
	DelMagic(274)
	DelMagic(125)
	DelMagic(129)
	DelMagic(130)
	DelMagic(128)
	DelMagic(360)
--	DelMagic(357)
--	DelMagic(359)

	DelMagic(135)			-- ÌìÈÌ
	DelMagic(131)
	DelMagic(132)
	DelMagic(134)
	DelMagic(136)
	DelMagic(137)
	DelMagic(138)
	DelMagic(139)
	DelMagic(140)
	DelMagic(364)
	DelMagic(141)
	DelMagic(142)
	DelMagic(143)
	DelMagic(145)
	DelMagic(146)
	DelMagic(147)
	DelMagic(148)
	DelMagic(149)
	DelMagic(150)
	DelMagic(254)
--	DelMagic(361)
--	DelMagic(362)
	if (HaveMagic(391) ~= -1) then
		SetTaskTemp(20,391)
		DelMagic(391)
	end

	DelMagic(153)			-- Îäµ±
	DelMagic(151)
	DelMagic(152)
	DelMagic(155)
	DelMagic(156)
	DelMagic(157)
	DelMagic(158)
	DelMagic(159)
	DelMagic(160)
	DelMagic(161)
	DelMagic(162)
	DelMagic(164)
	DelMagic(165)
	DelMagic(166)
	DelMagic(267)
--	DelMagic(365)
--	DelMagic(368)

	DelMagic(169)			-- À¥ÂØ
	DelMagic(167)
	DelMagic(168)
	DelMagic(392)
	DelMagic(170)
	DelMagic(171)
	DelMagic(393)
	DelMagic(174)
	DelMagic(175)
	DelMagic(177)
	DelMagic(178)
	DelMagic(179)
	DelMagic(180)
	DelMagic(173)
	DelMagic(90)
	DelMagic(181)
	DelMagic(183)
	DelMagic(184)
	DelMagic(172)
	DelMagic(176)
	DelMagic(182)
	DelMagic(275)
--	DelMagic(372)
--	DelMagic(374)
	if (HaveMagic(394) ~= -1) then
		SetTaskTemp(20,394)
		DelMagic(394)
	end
end

----------------- ÖØÖÃÇ±ÄÜµã£¬Í¬Ê±½øĞĞ¼ì²éĞŞ¸´ ------------------------------
function rollback_prop()			-- ÓÉÓÚµÀ¾ß¼ÓÇ±ÄÜµã´æÔÚ²»È·¶¨ĞÔ£¬ÔİÊ±È¡ÏûĞŞ¸´¹¦ÄÜ£¨Ö»Ğ´ÈÕÖ¾±¸²é£©
	if (GetTask(137) >= 20) then			-- ¸üĞÂ¹ı¼¼ÄÜµÄÒ²²»ÔÙ¸üĞÂÇ±ÄÜ
		return 1
	else
		base_str = {35,20,25,30,20}			-- ÎåĞĞÈËÎïµÄÌìÉúÊôĞÔÖµ
		base_dex = {25,35,25,20,15}
		base_vit = {25,20,25,30,25}
		base_eng = {15,25,25,20,40}
		player_series = GetSeries() + 1
--		AddProp(100)			-- Îª±ÜÃâÃ»ÓĞÎ´·ÖÅäÇ±ÄÜµã¿É¹©ĞŞ¸´µÄ¼«¶ËÇé¿ö£¬ÔİÊ±¡°½è¡±¸øËû100µã
		Utask88 = GetTask(88)
		AddStrg(base_str[player_series] - GetStrg(1) + GetByte(Utask88,1))			-- ½«ÒÑ·ÖÅäÇ±ÄÜÖØÖÃ£¨task(88)ÊÇÈÎÎñÖĞÖ±½Ó½±ÀøµÄÁ¦Á¿¡¢Éí·¨µÈ£©
		AddDex(base_dex[player_series] - GetDex(1) + GetByte(Utask88,2))
		AddVit(base_vit[player_series] - GetVit(1) + GetByte(Utask88,3))
		AddEng(base_eng[player_series] - GetEng(1) + GetByte(Utask88,4))
--		AddProp(-100)			-- »¹Õ®
--		if (GetTask(81) == 0) then		-- Èç¹ûÓÃ¹ıÏ´Ëè¾­£¬Ç±ÄÜµãÃ»ÓĞ¹Ì¶¨±ê×¼£¬ÔòÎŞ·¨¼ìÑéĞŞ¸´£¨Òò´ËÖ»ÓĞÎ´ÓÃ¹ıÊéµÄ²Å¼ìÑéĞŞ¸´£©
			player_prop = GetProp()										-- ¼ì²éÍæ¼ÒÇ±ÄÜ×ÜÊıÊÇ·ñÕıÈ·¡£°üº¬ÈÎÎñÓëµÀ¾ß¼ÓµÄÇ±ÄÜµã£¬²»°üº¬ÁÙÊ±µãÊı
			std_prop = (GetLevel()-1)*5 + GetByte(GetTask(86),1)
			if (player_prop ~= std_prop) then						-- Èç¹û²»Ò»ÖÂÔòĞŞÕı£¨È¡ÏûĞŞÕı£¬Ö»Ğ´ÈÕÖ¾£©
--				AddProp(std_prop - player_prop)
				x = GetByte(Utask88,1)+GetByte(Utask88,2)+GetByte(Utask88,3)+GetByte(Utask88,4)
				WriteLog(date("%Hgiê%Mphót%Sgi©y")..": tµi kho¶n'"..GetAccount().."'nh©n vËt'"..GetName().."'Phôc håi kü n¨ng ®· lui vÒ kû lôc ban ®Çu: §¼ng cÊp"..GetLevel()..", ®iÓm tiÒmn¨ng ban ®Çu"..player_prop..", ®­îc tiÒm n¨ng s½n cã "..std_prop.."®iÓm (NhiÖm vô céng"..GetByte(GetTask(86),1).."®iÓm, ®¹o cô céng"..GetTask(81).."®iÓm) ."..x..".")
			end
--		end
		Msg2Player("Phôc håi tiÒm n¨ng ®· hoµn tÊt! Xin h·y ph©n phèi l¹i ®iÓm! ")
	end
end
tbAllSkill = {
	shaolin = {
		[1] = {10,14},
		[2] = {4,6,8},
		[3] = {15},
		[4] = {16},
		[5] = {20},
		[6] = {11,19,271},
		[7] = {21,273},
		[9] = {318,319,321,709},
	},
	tianwang = {
		[1] = {29,30,34},
		[2] = {23,24,26},
		[3] = {33},
		[4] = {31,35,37},
		[5] = {40},
		[6] = {42},
		[7] = {32,36,41,324},
		[9] = {322,323,325,708},
	},
	tangmen = {
		[1] = {45},
		[2] = {43,347},
		[3] = {303},
		[4] = {47,50,54,343},
		[5] = {345},
		[6] = {349},
		[7] = {48,58,249,341},
		[9] = {302,339,342,351,710},
	},
	wudu = {
		[1] = {63,65},
		[2] = {60,62,67},
		[3] = {66,70},
		[4] = {64,68,69,384},
		[5] = {73,356},
		[6] = {72},
		[7] = {71,74,75},
		[9] = {353,355,390,711},
	},
	emei = {
		[1] = {80,85},
		[2] = {77,79},
		[3] = {93},
		[4] = {82,89,385},
		[5] = {86},
		[6] = {92},
		[7] = {88,91,252,282},
		[9] = {328,332,380,712},
	},
	cuiyan = {
		[1] = {99,102},
		[2] = {95,97},
		[3] = {269},
		[4] = {105,113},
		[5] = {100},
		[6] = {109},
		[7] = {108,111,114},
		[9] = {336,337,713},
	},
	gaibang = {
		[1] = {119,122},
		[2] = {115,116},
		[3] = {129},
		[4] = {124,274},
		[5] = {277},
		[6] = {125,128},
		[7] = {130,360},
		[9] = {357,359,714},
	},
	tianren = {
		[1] = {135,145},
		[2] = {131,132,136},
		[3] = {137},
		[4] = {138,140,141},
		[5] = {364},
		[6] = {143},
		[7] = {142,148,150},
		[9] = {361,362,391,715},
	},
	wudang = {
		[1] = {153,155},
		[2] = {151,152},
		[3] = {159},
		[4] = {158,164},
		[5] = {160},
		[6] = {157},
		[7] = {165,166,267},
		[9] = {365,368,716},
	},
	kunlun = {
		[1] = {169,179},
		[2] = {167,168,171,392},
		[3] = {174},
		[4] = {172,173,178,393},
		[5] = {175,181},
		[6] = {90,176},
		[7] = {182,275,630},
		[9] = {372,375,394,717},
	},
}
function HoTroSkill()
	local szFaction = GetFaction()
	if tbAllSkill[szFaction] == nil then
		return
	end
	for i=1, 7 do
		if tbAllSkill[szFaction][i] ~= nil then
			for j=1, getn(tbAllSkill[szFaction][i]) do
				if HaveMagic(tbAllSkill[szFaction][i][j]) == -1 then
						AddMagic(tbAllSkill[szFaction][i][j])
				end
			end
		end
	end
end
