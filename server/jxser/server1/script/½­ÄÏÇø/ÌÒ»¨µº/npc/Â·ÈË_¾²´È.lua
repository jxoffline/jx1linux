-- ½­ÄÏÇø ÌÒ»¨µº ¶ëáÒ Â·ÈË_¾²´È.lua
-- by: Dan_deng(2004-05-15)
-- Îª¶ëáÒµÜ×Ó¼°Æä³öÊ¦µÜ×Ó¸üĞÂ¼¼ÄÜ

Include("\\script\\global\\skills_table.lua")

function main()
--	Uworld137 = GetTask(137)
--	if (Uworld137 == 1) then			-- ÔÊĞí¸üĞÂ¼¼ÄÜ
--		del_all_skill()
--		Talk(1,"skills_update","¾²´È£ºÊ¦Ö¶Ô¶µÀ¶øÀ´£¬Èô¾õµÃÈ­½Å¹¦·òÉÏÓĞºÎ²»Ã÷Ö®´¦£¬´ó¿ÉÑ¯ÎÊ¡£")
--	elseif (Uworld137 == 21) then		-- ÒÑ¾­¸üĞÂ¹ı¼¼ÄÜ
--		Talk(1,"","¾²´È£ºËäÓĞ¼¸´¦ĞŞÏ°²»¶Ô£¬µ¹Ò²²»ÊÇÊ²Ã´´ó°­£¬ÕÕ¸Õ²Å¿Ú¾÷ËùÑÔ£¬ÇÚ¼ÓĞŞÏ°¼´¿É¡£Ê¦Ö¶¶ÀÉíÔÚÍâ£¬ÍòÊÂ½ÔÒªĞ¡ĞÄ¡£")
--	else										-- ·ÇÌìÍõµÄ
		Talk(1,"","Kh«ng biÕt trËn ®¹i läan cña hai m­¬i n¨m tr­íc,b©y giê mÊy ai cßn nhí? ")
--	end
end

function skills_update()			-- ÏÈ¸ù¾İÈÎÎñµÈ¼¶É¾³ı¡¢ÖØĞÂ¼ÓÈë¼¼ÄÜ£¬È»ºó²¹»Ø¼¼ÄÜµã
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
	add_em(the_lvl)			-- ¼Ó»ØÓ¦Ñ§»áµÄ¼¼ÄÜ
	-- ×ÔÉí¼¼ÄÜµã×ÜÊı = (µÈ¼¶-1) + ¼Ó¼¼ÄÜÈÎÎñ + ¼Ó¼¼ÄÜµÀ¾ß - ÏÖÓĞÎ´·ÖÅäµãÊı				£¨»ØÌå¼¼ÄÜ£¿£©
	MagicPoint_total = GetLevel() + GetByte(GetTask(86),2) + GetByte(GetTask(80),1) - GetMagicPoint() - 1
	AddMagicPoint(MagicPoint_total)
	SetTask(137,21)
	Talk(1,"UpdateSkill","Cã nhiÒu chç ng­¬i luyÖn vÉn cßn ch­a ®óng, nh­ng còng kh«ng trë ng¹i g× l¾m. ChØ cÇn n¾m ch¾c ®­îc nh÷ng khÈu quyÕt nµy th× cã thÓ thµnh c«ng. ")
end
