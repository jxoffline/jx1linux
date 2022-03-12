-- ½­ÄÏÇø ÌÒ»¨µº ´äÑÌ Â·ÈË_Éò°¬±ù.lua
-- by: Dan_deng(2004-05-15)
-- Îª´äÑÌµÜ×Ó¼°Æä³öÊ¦µÜ×Ó¸üĞÂ¼¼ÄÜ

Include("\\script\\global\\skills_table.lua")

function main()
--	Uworld137 = GetTask(137)
--	if (Uworld137 == 6) then			-- ÔÊĞí¸üĞÂ¼¼ÄÜ
--		del_all_skill()
--		Talk(1,"skills_update","Éò°¬±ù£ºÃÃÃÃ£¬ÊÀ¼äºÃÄĞ¶ùºÎ´¦¿ÉÑ°°¦£¬°Õ°Õ°Õ¡£´äÑÌÃÅµÄ½ãÃÃÃÇ£¬¿É²»ÄÜÈÃÅÔÈËÃÇ¿´ÁËĞ¦»°£¬ÃÃÃÃÔÚÍâĞĞ×ßÁËÕâÃ´¾Ã£¬²»Öª±¾ÃÅ¹¦·òÊÇ·ñÓĞĞ©½ø²½£¬ÈÃ½ã½ã°ïÄãÌ½Ò»Ì½¡£")
--	elseif (Uworld137 == 26) then		-- ÒÑ¾­¸üĞÂ¹ı¼¼ÄÜ
--		Talk(1,"","Éò°¬±ù£ºÃÃÃÃ¹¦·òÒÑÂ¯»ğ´¿Çà£¬ÎŞĞè½ã½ãÖ¸µãÁË£¬Ò²Ï£ÍûÄãÄÜÕÒµ½×Ô¼ºµÄºÃ¹éËŞ¡£")
--	else										-- ·ÇÌìÍõµÄ
		Talk(1,"","V©n Phiªu sa; nguyÖt quang méng ¶o §µo Hoa ®¶o; §µo Hoa ®¶o, ®Çu ®Çu th¶o s¾c, TiÓu ®µo hång tiªu ")
--	end
end

function skills_update()			-- ÏÈ¸ù¾İÈÎÎñµÈ¼¶É¾³ı¡¢ÖØĞÂ¼ÓÈë¼¼ÄÜ£¬È»ºó²¹»Ø¼¼ÄÜµã
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
	add_cy(the_lvl)			-- ¼Ó»ØÓ¦Ñ§»áµÄ¼¼ÄÜ
	-- ×ÔÉí¼¼ÄÜµã×ÜÊı = (µÈ¼¶-1) + ¼Ó¼¼ÄÜÈÎÎñ + ¼Ó¼¼ÄÜµÀ¾ß - ÏÖÓĞÎ´·ÖÅäµãÊı				£¨»ØÌå¼¼ÄÜ£¿£©
	MagicPoint_total = GetLevel() + GetByte(GetTask(86),2) + GetByte(GetTask(80),1) - GetMagicPoint() - 1
	AddMagicPoint(MagicPoint_total)
	SetTask(137,26)
	Talk(1,"UpdateSkill","Cã nhiÒu chç ng­¬i luyÖn vÉn cßn ch­a ®óng, nh­ng còng kh«ng trë ng¹i g× l¾m. ChØ cÇn n¾m ch¾c ®­îc nh÷ng khÈu quyÕt nµy th× cã thÓ thµnh c«ng. ")
end
