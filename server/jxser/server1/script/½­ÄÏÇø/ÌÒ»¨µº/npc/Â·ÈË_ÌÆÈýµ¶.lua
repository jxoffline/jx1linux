-- ½­ÄÏÇø ÌÒ»¨µº ÌÆÃÅ Â·ÈË_ÌÆÈıµ¶.lua
-- by: Dan_deng(2004-05-15)
-- ÎªÌÆÃÅµÜ×Ó¼°Æä³öÊ¦µÜ×Ó¸üĞÂ¼¼ÄÜ

Include("\\script\\global\\skills_table.lua")

function main()
--	Uworld137 = GetTask(137)
--	if (Uworld137 == 2) then			-- ÔÊĞí¸üĞÂ¼¼ÄÜ
--		del_all_skill()
--		Talk(1,"skills_update","ÌÆÈıµ¶£ºµ±ÄêÎÒÀë¿ªÌÆÃÅÀ´µ½ÕâµºÉÏ£¬¼û´Ë´¦ÇåÓÄĞãÑÅ£¬ÊÇ¸öĞŞÁ¶µÄºÃµØ·½£¬±ã×¡ÁËÏÂÀ´£¬Ë­ÖªµÀÒ»»Î¾ÍÊÇ¶şÊ®Äê¡£µÃÖªÈıµÜ»¹ºÃ£¬ÎÒÒ²°²ĞÄÁË£¬ÕâĞ©ÄêÎÒÏ°Îä²»ê¡,¶Ô±¾ÃÅµÄµ¶½£Óë°µÆ÷Ö®·¨×öÁËĞ©¸Ä¶¯£¬¾Í´Ë´«ÊÚÓÚÄã°É¡£")
--	elseif (Uworld137 == 22) then		-- ÒÑ¾­¸üĞÂ¹ı¼¼ÄÜ
--		Talk(1,"","ÌÆÈıµ¶£ºÎÒÒÑ½«±ÏÉú¼¼ÒÕ´«ÊÚÓëÄã£¬½­ºşÖ®´ó£¬ºÃºÃµØÈ¥´³µ´£¬¸É³öÒ»·¬ºäºäÁÒÁÒµÄÊÂÒµÀ´£¡")
--	else										-- ·ÇÌìÍõµÄ
		Talk(1,"","Kh«ng biÕt lµ §­êng Tam ®Ö ë nhµ cã ®­îc m¹nh kháe kh«ng. Huynh tr­ëng rÊt lµ lo l¾ng! ")
--	end
end

function skills_update()			-- ÏÈ¸ù¾İÈÎÎñµÈ¼¶É¾³ı¡¢ÖØĞÂ¼ÓÈë¼¼ÄÜ£¬È»ºó²¹»Ø¼¼ÄÜµã
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
	add_tm(the_lvl)			-- ¼Ó»ØÓ¦Ñ§»áµÄ¼¼ÄÜ
	-- ×ÔÉí¼¼ÄÜµã×ÜÊı = (µÈ¼¶-1) + ¼Ó¼¼ÄÜÈÎÎñ + ¼Ó¼¼ÄÜµÀ¾ß - ÏÖÓĞÎ´·ÖÅäµãÊı				£¨»ØÌå¼¼ÄÜ£¿£©
	MagicPoint_total = GetLevel() + GetByte(GetTask(86),2) + GetByte(GetTask(80),1) - GetMagicPoint() - 1
	AddMagicPoint(MagicPoint_total)
	SetTask(137,22)
	Talk(1,"UpdateSkill","Ta ®· truyÒn thô hÕt tuyÖt kü vâ nghÖ cho ng­¬i råi Giang Hå réng lín,nh­ng kh«ng ph¶i kh«ng cã ®Êt dông vâ. Ng­¬i h·y mang nh÷ng tuyÖt häc cña m×nh ®Ó ph¸t huy")
end
