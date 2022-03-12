-- ½­ÄÏÇø ÌÒ»¨µº Ø¤°ï Â·ÈË_³ğÑÓ.lua
-- by: Dan_deng(2004-05-15)
-- ÎªØ¤°ïµÜ×Ó¼°Æä³öÊ¦µÜ×Ó¸üĞÂ¼¼ÄÜ

Include("\\script\\global\\skills_table.lua")

function main()
--	Uworld137 = GetTask(137)
--	if (Uworld137 == 8) then			-- ÔÊĞí¸üĞÂ¼¼ÄÜ
--		del_all_skill()
--		Talk(1,"skills_update","³ğÑÓ£º³ğÑÓ×î½üµÃÒ»ÆæÓö£¬Ò²Ñ§ÁËĞ©ÆæÃÅ¹¦·ò£¬¿´Ğ¡ĞÖµÜ¸ùÖÊ²»´í£¬Ö¸µãÄã¼¸ÕĞ°É¡£")
--	elseif (Uworld137 == 28) then		-- ÒÑ¾­¸üĞÂ¹ı¼¼ÄÜ
--		Talk(1,"","³ğÑÓ£ºĞ¡ĞÖµÜ¸ùÖÊÆæ¼Ñ£¬ÈôÄÜÇÚÁ·±ØÓĞ´ó³É¡£Ğ¡ĞÖµÜÄãÏÈĞĞÒ»²½£¬ÎÒÒªÔÚ´Ë×¥×¡ÄÇ¸ö½ğ¹ú¼éÏ¸£¬ºó»áÓĞÆÚ¡£")
--	else										-- ·ÇÌìÍõµÄ
		Talk(1,"","C¸i tªn gian tÕ Kim quèc ®ã, ta nhÊt ®Şnh sÏ kh«ng tha cho h¾n ")
--	end
end

function skills_update()			-- ÏÈ¸ù¾İÈÎÎñµÈ¼¶É¾³ı¡¢ÖØĞÂ¼ÓÈë¼¼ÄÜ£¬È»ºó²¹»Ø¼¼ÄÜµã
	UTask = GetTask(8)
	if (GetTask(128) == 255) then		-- Ñ§»áÁË90¼¶¼¼ÄÜ
		the_lvl = 90
	elseif (HaveMagic(128) >= 0) then		-- ÓĞÕòÅÉ¾øÑ§¼¼ÄÜ
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
	add_gb(the_lvl)			-- ¼Ó»ØÓ¦Ñ§»áµÄ¼¼ÄÜ
	-- ×ÔÉí¼¼ÄÜµã×ÜÊı = (µÈ¼¶-1) + ¼Ó¼¼ÄÜÈÎÎñ + ¼Ó¼¼ÄÜµÀ¾ß - ÏÖÓĞÎ´·ÖÅäµãÊı				£¨»ØÌå¼¼ÄÜ£¿£©
	MagicPoint_total = GetLevel() + GetByte(GetTask(86),2) + GetByte(GetTask(80),1) - GetMagicPoint() - 1
	AddMagicPoint(MagicPoint_total)
	SetTask(137,28)
	Talk(1,"UpdateSkill","TiÓu huynh ®Ö anh tµi xuÊt chóng. NÕu nh­ cã muèn ë ®©y luyÖn c«ng th× cø tiÕp tôc. Ta sÏ ®i b¾t c¸i tªn gian tÕ Kim quèc kia tr­íc. SÏ gÆp l¹i sau nhĞ! ")
end
