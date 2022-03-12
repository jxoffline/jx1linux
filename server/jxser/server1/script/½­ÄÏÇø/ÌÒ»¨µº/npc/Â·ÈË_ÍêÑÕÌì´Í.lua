-- ½­ÄÏÇø ÌÒ»¨µº ÌìÈÌ Â·ÈË_ÍêÑÕÌì´Í.lua
-- by: Dan_deng(2004-05-15)
-- ÎªÌìÈÌµÜ×Ó¼°Æä³öÊ¦µÜ×Ó¸üĞÂ¼¼ÄÜ

Include("\\script\\global\\skills_table.lua")

function main()
--	Uworld137 = GetTask(137)
--	if (Uworld137 == 4) then			-- ÔÊĞí¸üĞÂ¼¼ÄÜ
--		del_all_skill()
--		Talk(1,"skills_update","ÍêÑÕÌì´Í£ººß£¬¿´¼ûµºÉÏÄÇ¸ö³ô½Ğ»¯ÁËÃ»£¿Èô²»ÊÇÕâĞ¡×ÓÒ»Â·×·É±£¬ÏëÎÒÌÃÌÃ½ğ¹úËÄÍõ×Ó£¬ÔõÃ´»áÂÙÂäµ½Á÷Âä»ÄµºµÄµØ²½£¡ÄãĞ¡×Ó¹ıÀ´£¬ÎÒÏÖÔÚÖ¸µãÄã¼¸ÊÖ£¬·Å»úÁæĞ©£¬Ò»ÓĞÊ²Ã´ÏûÏ¢¾ÍÂíÉÏ»ØÈ¥±¨¸æ£¡")
--	elseif (Uworld137 == 24) then		-- ÒÑ¾­¸üĞÂ¹ı¼¼ÄÜ
--		Talk(1,"","ÍêÑÕÌì´Í£ºÄãĞ¡×ÓÊ¶Ïàµã£¬¹¦·òÒ²Ñ§ÁË£¬»¹²»¿ì¹ö»ØÈ¥°ìÊÂ£¡")
--	else										-- ·ÇÌìÍõµÄ
		Talk(1,"","Hõ! C¸i tªn thèi tha ®ã. Ta ®­êng ®­êng lµ Kim Quèc V­¬ng tö, vËy mµ bŞ h¾n h¹i ®Õn nh­ vÇy. ")
--	end
end

function skills_update()			-- ÏÈ¸ù¾İÈÎÎñµÈ¼¶É¾³ı¡¢ÖØĞÂ¼ÓÈë¼¼ÄÜ£¬È»ºó²¹»Ø¼¼ÄÜµã
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
	add_tr(the_lvl)			-- ¼Ó»ØÓ¦Ñ§»áµÄ¼¼ÄÜ
	-- ×ÔÉí¼¼ÄÜµã×ÜÊı = (µÈ¼¶-1) + ¼Ó¼¼ÄÜÈÎÎñ + ¼Ó¼¼ÄÜµÀ¾ß - ÏÖÓĞÎ´·ÖÅäµãÊı				£¨»ØÌå¼¼ÄÜ£¿£©
	MagicPoint_total = GetLevel() + GetByte(GetTask(86),2) + GetByte(GetTask(80),1) - GetMagicPoint() - 1
	AddMagicPoint(MagicPoint_total)
	SetTask(137,24)
	Talk(1,"UpdateSkill","§­îc råi! Cø lµm theo nh÷ong g× ta ®· dÆn dß! Cã tin tèt th× h·y mau trë vÒ b¸o c¸o víi ta ")
end
