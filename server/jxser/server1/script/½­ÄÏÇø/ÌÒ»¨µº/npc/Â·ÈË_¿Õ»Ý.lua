-- ½­ÄÏÇø ÌÒ»¨µº ÉÙÁÖ Â·ÈË_¿Õ»İ.lua
-- by: Dan_deng(2004-05-15)
-- ÎªÉÙÁÖµÜ×Ó¼°Æä³öÊ¦µÜ×Ó¸üĞÂ¼¼ÄÜ

Include("\\script\\global\\skills_table.lua")

function main()
--	Uworld137 = GetTask(137)
--	if (Uworld137 == 7) then			-- ÔÊĞí¸üĞÂ¼¼ÄÜ
--		del_all_skill()
--		Talk(1,"skills_update","¿Õ»İ£ºÀÏñÄ´Ë·¬ÏÂÉ½£¬ÒâÓûÑ°ÕÒ¾ÈÊÀÖ®·¨£¬ÔÚ´ËÏàÓöÒ²ÊÇ»úÔµÇÉºÏ¡£")
--	elseif (Uworld137 == 27) then		-- ÒÑ¾­¸üĞÂ¹ı¼¼ÄÜ
--		Talk(1,"","¿Õ»İ£ºÌ°³ÕàÁÅ­£¬Í÷Õ«ÆÆ½ä¡£½ñºóĞĞÊÂ£¬ÎğÒªÍü¼ÇÃÅ¹æ½äÂÉ£¬½÷¼ÇÕÆÃÅ½Ì»å¡£")
--	else										-- ·ÇÌìÍõµÄ
		Talk(1,"","ThiÖn tai! C¸i gäi lµ kiÕp sè, ®Òu lµ thiªn mÖnh, khæ ¶i chØ lµ mét kiÕp sè mµ th«i. ")
--	end
end

function skills_update()			-- ÏÈ¸ù¾İÈÎÎñµÈ¼¶É¾³ı¡¢ÖØĞÂ¼ÓÈë¼¼ÄÜ£¬È»ºó²¹»Ø¼¼ÄÜµã
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
	add_sl(the_lvl)			-- ¼Ó»ØÓ¦Ñ§»áµÄ¼¼ÄÜ
	-- ×ÔÉí¼¼ÄÜµã×ÜÊı = (µÈ¼¶-1) + ¼Ó¼¼ÄÜÈÎÎñ + ¼Ó¼¼ÄÜµÀ¾ß - ÏÖÓĞÎ´·ÖÅäµãÊı				£¨»ØÌå¼¼ÄÜ£¿£©
	MagicPoint_total = GetLevel() + GetByte(GetTask(86),2) + GetByte(GetTask(80),1) - GetMagicPoint() - 1
	AddMagicPoint(MagicPoint_total)
	SetTask(137,27)
	Talk(1,"UpdateSkill","NÕu h­ t©m lóc nµo còng hoµi niÖm vÒ nh©n t©m, v× ng­êi hµnh thiÖn th× sÏ kh«ng uæng phİ t©m huyÕt cña l·o n¹p. ")
end
