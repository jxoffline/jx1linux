-- ½­ÄÏÇø ÌÒ»¨µº À¥ÂØ Â·ÈË_Ò¶·É.lua
-- by: Dan_deng(2004-05-15)
-- ÎªÀ¥ÂØµÜ×Ó¼°Æä³öÊ¦µÜ×Ó¸üĞÂ¼¼ÄÜ

Include("\\script\\global\\skills_table.lua")

function main()
--	Uworld137 = GetTask(137)
--	if (Uworld137 == 9) then			-- ÔÊĞí¸üĞÂ¼¼ÄÜ
--		del_all_skill()
--		Talk(4,"skills_update","Ò¶·É£º°¥£¬Ò»±ßÊÇ²»¿ÉÎ¥¿¹µÄÊ¦Ãü£¬Ò»±ßÈ´ÊÇÈÕÒ¹Ç£¹ÒµÄĞÄÉÏÈË£¬ÎÒ¡­¡­ÎÒ¸ÃÈçºÎÊÇºÃ£¿","Íæ¼Ò£ºÊ¦ĞÖ¡­¡­","Ò¶·É£ºÊ¦¸¸±¾ÁîÎÒÀ´Ñ°ÕÒÆæÃÅÃØóÅ£¬ÒÔÇ£ÖÆÕÆÃÅ£¬µ«Ò»Ïëµ½Ï¦ÑÕµÄĞ¦£¬ÎÒ¾Í¾õµÃÁ½ÏÂÎªÄÑ¡£","Ò¶·É£º°¦£¬»òĞí¸úÄãËµµÃÌ«¶àÁË£¬ÔÙÍí»ØÈ¥£¬Ê¦¸¸¶¨»áÔğ·£¡£ÕâĞ©ÊÇÊ¦¸¸½Ì¸øÎÒµÄĞÄ·¨£¬»òĞíÓëÕÆÃÅËùÊÚÓĞËù²»Í¬£¬Äã¿ÉÒÔ¿´¿´£¬¹ıºóÇë×ÔĞĞÏú»Ù¡£")
--	elseif (Uworld137 == 29) then		-- ÒÑ¾­¸üĞÂ¹ı¼¼ÄÜ
--		Talk(1,"","Ò¶·É£ºÄãÏÈ»ØÈ¥°É£¬ÎÒ×ÔÓĞÖ÷ÕÅ¡£")
--	else										-- ·ÇÌìÍõµÄ
		Talk(1,"","Cø nh­ vËy ®i, h·y vÒ nghØ ng¬i tr­íc, ta sÏ cã c¸ch!")
--	end
end

function skills_flush()			-- Ë¢ĞÂ¼¼ÄÜ
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
	add_kl(the_lvl)			-- ¼Ó»ØÓ¦Ñ§»áµÄ¼¼ÄÜ
	-- ×ÔÉí¼¼ÄÜµã×ÜÊı = (µÈ¼¶-1) + ¼Ó¼¼ÄÜÈÎÎñ + ¼Ó¼¼ÄÜµÀ¾ß - ÏÖÓĞÎ´·ÖÅäµãÊı £¨¡°»ØÌåÊõ¡±ÏÖÔÚÃ»¿ª£¬ÒÔºóÔÙ¼Ó£©
	MagicPoint_total = GetLevel() + GetByte(GetTask(86),2) + GetByte(GetTask(80),1) - GetMagicPoint() - 1
	AddMagicPoint(MagicPoint_total)
	SetTask(137,29)
	Talk(1,"UpdateSkill","Cø nh­ vËy ®i, h·y vÒ nghØ ng¬i tr­íc, ta sÏ cã c¸ch!")
end
