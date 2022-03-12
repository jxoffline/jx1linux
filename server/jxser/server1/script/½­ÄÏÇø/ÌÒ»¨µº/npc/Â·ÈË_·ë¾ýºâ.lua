-- ½­ÄÏÇø ÌÒ»¨µº Îäµ± Â·ÈË_·ë¾ıºâ.lua
-- by: Dan_deng(2004-05-15)
-- ÎªÎäµ±µÜ×Ó¼°Æä³öÊ¦µÜ×Ó¸üĞÂ¼¼ÄÜ

Include("\\script\\global\\skills_table.lua")

function main()
--	Uworld137 = GetTask(137)
--	if (Uworld137 == 5) then			-- ÔÊĞí¸üĞÂ¼¼ÄÜ
--		del_all_skill()
--		Talk(1,"skills_update","·ë¾ıºâ£ºµÀ¼ÒÖ®·¨£¬·¢ºõĞÄÖ¹ºõĞÄ£¬ËæÄî¶ø¾Í¡£ÈôÌ«¾ĞÄàÓÚÎä¹¦Ì×Â·£¬·´¶øÄÑÒÔÌå»áµ½ÆäÖĞµÄ¾³½ç¡£ËùÎ½²½î¸¾Å¹¬°ËØÔ¡¢¶şÊ®°ËËŞÎåĞÇ¸Ù£¬Ê¦µÜ½Ô²»ÓÃÌ«¹ıÔÚÒâ¡£ÈôÄÜÕÆÎÕµ½ÆäÖĞµÄÒâÄîËùÔÚ£¬ÔòÎä¹¦´ó³É¡£¾ÍÏóÈç´Ë£¬Õâ°ã¡­¡­")
--	elseif (Uworld137 == 25) then		-- ÒÑ¾­¸üĞÂ¹ı¼¼ÄÜ
--		Talk(1,"","·ë¾ıºâ£º»°¾¡ÓÚ´Ë£¬ÇëÊ¦µÜ»ØÈ¥ÂıÂıÌå»á°Õ¡£")
--	else										-- ·ÇÌìÍõµÄ
		Talk(1,"","Ta ®ang cã chót vÊn ®Ò ®©y, ®õng cã quÊy rÇy ta!")
--	end
end

function skills_update()			-- ÏÈ¸ù¾İÈÎÎñµÈ¼¶É¾³ı¡¢ÖØĞÂ¼ÓÈë¼¼ÄÜ£¬È»ºó²¹»Ø¼¼ÄÜµã
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
	add_wd(the_lvl)			-- ¼Ó»ØÓ¦Ñ§»áµÄ¼¼ÄÜ
	-- ×ÔÉí¼¼ÄÜµã×ÜÊı = (µÈ¼¶-1) + ¼Ó¼¼ÄÜÈÎÎñ + ¼Ó¼¼ÄÜµÀ¾ß - ÏÖÓĞÎ´·ÖÅäµãÊı				£¨»ØÌå¼¼ÄÜ£¿£©
	MagicPoint_total = GetLevel() + GetByte(GetTask(86),2) + GetByte(GetTask(80),1) - GetMagicPoint() - 1
	AddMagicPoint(MagicPoint_total)
	SetTask(137,25)
	Talk(1,"UpdateSkill","Ng­¬i cø vÒ nghØ ng¬i tr­íc ®i, ta sÏ cã c¸ch!")
end
