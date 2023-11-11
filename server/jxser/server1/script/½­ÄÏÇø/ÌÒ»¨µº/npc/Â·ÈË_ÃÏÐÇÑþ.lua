-- ½­ÄÏÇø ÌÒ»¨µº Îå¶¾ Â·ÈË_ÃÏĞÇÑş.lua
-- by: Dan_deng(2004-05-15)
-- ÎªÎå¶¾µÜ×Ó¼°Æä³öÊ¦µÜ×Ó¸üĞÂ¼¼ÄÜ

Include("\\script\\global\\skills_table.lua")

function main()
--	Uworld137 = GetTask(137)
--	if (Uworld137 == 10) then			-- ÔÊĞí¸üĞÂ¼¼ÄÜ
--		del_all_skill()
--		Talk(2,"skills_update","Íæ¼Ò£ºÔÚÏÂ²¢·Ç·îÕÆÃÅÖ®Áî¶øÀ´£¬ÌıÎÅÊ¦£¬Ê¦¡­¡­½ãÔÚÕâµºÉÏ£¬ÌØÏëÇ°À´Çë½Ì¡£µÜ×Ó¾õµÃÕÆÃÅËùÊÚÎä¹¦ËÆºõÓĞ²»¶ÔÖ®´¦£¬½üÈÕÎå¾­ÁùÂöÖ®Æø£¬³£ÓĞ×èÈû£¬¿ÒÇëÊ¦½ãÖ¸µã¡£","ÃÏĞÇÑş£ººß£¡Ê¦ĞÖÕâ¼éÈË£¬Á¬Í½µÜ¾¹Ò²²»·Å¹ı£¬Îå¶¾¹¦·ò×îÒª½ôµÄÊÇÚ²Æ­¶ş×Ö£¬ĞéÊµÎ¯Óë£¬ÓÕÊ¹¶ÔÊÖ·ÖĞÄ£¬Ê¹¶¾·¢ÓÚÎŞĞÎÖ®ÖĞ¡£ÄãÈô´ğÓ¦ÌæÎÒ°ìÊÂ£¬ÎÒ±ãÖ¸µãÄã¹¦·ò¡£","Íæ¼Ò£ºµÜ×ÓÔ¸Ìı²îÇ²¡£")
--	elseif (Uworld137 == 30) then		-- ÒÑ¾­¸üĞÂ¹ı¼¼ÄÜ
--		Talk(1,"","ÃÏĞÇÑş£ºÎä¹¦ÎÒÒÑ¾­Ö¸µãÄãÁË£¬Ï£ÍûÄãÊÖ½ÅÀûÂäĞ©£¬ÔçÈÕÊÂ³É¡£")
--	else										-- ·ÇÌìÍõµÄ
		Talk(1,"","M¹nh Tinh Dao ta vèn ch¼ng ®am mª g× ng«i vŞ V­¬ng Chñ. S­ huynh cña ta hµ tÊt cø ph¶i cho ng­êi ®i theo dß xĞt ta nh­ vËy. ")
--	end
end

function skills_update()			-- ÏÈ¸ù¾İÈÎÎñµÈ¼¶É¾³ı¡¢ÖØĞÂ¼ÓÈë¼¼ÄÜ£¬È»ºó²¹»Ø¼¼ÄÜµã
	UTask = GetTask(2)
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
	add_wu(the_lvl)			-- ¼Ó»ØÓ¦Ñ§»áµÄ¼¼ÄÜ
	-- ×ÔÉí¼¼ÄÜµã×ÜÊı = (µÈ¼¶-1) + ¼Ó¼¼ÄÜÈÎÎñ + ¼Ó¼¼ÄÜµÀ¾ß - ÏÖÓĞÎ´·ÖÅäµãÊı				£¨»ØÌå¼¼ÄÜ£¿£©
	MagicPoint_total = GetLevel() + GetByte(GetTask(86),2) + GetByte(GetTask(80),1) - GetMagicPoint() - 1
	AddMagicPoint(MagicPoint_total)
	SetTask(137,30)
	Talk(1,"UpdateSkill","Ta ®· truyÒn hÕt vâ c«ng cho ng­¬i råi! Cã g¾ng luyÖn tËp nhĞ!")
end
