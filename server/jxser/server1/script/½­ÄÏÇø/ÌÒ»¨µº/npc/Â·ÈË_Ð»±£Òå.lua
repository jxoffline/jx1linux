-- ½­ÄÏÇø ÌÒ»¨µº ÌìÍõ Â·ÈË_Ğ»±£Òå.lua
-- by: Dan_deng(2004-05-15)
-- ÎªÌìÍõµÜ×Ó¼°Æä³öÊ¦µÜ×Ó¸üĞÂ¼¼ÄÜ

Include("\\script\\global\\skills_table.lua")

function main()
--	Uworld137 = GetTask(137)
--	if (Uworld137 == 3) then			-- ÔÊĞí¸üĞÂ¼¼ÄÜ
--		del_all_skill()
--		Talk(1,"skills_update","Ğ»±£Òå£ºĞ¡ĞÖµÜ£¬ÄãÁ·µÄºÃÏó²»ÊÇºÜºÃ°¡¡£À´À´£¬ÎÒ°ïÄãË³Ë³¹¦·ò¡£")
--	elseif (Uworld137 == 23) then		-- ÒÑ¾­¸üĞÂ¹ı¼¼ÄÜ
--		Talk(1,"","Ğ»±£Òå£ºÄãÔÚÕâÀï¶à´ôÒ»¶ÎÊ±¼ä£¬¶ÔÄãµÄĞŞÎª´óÓĞºÃ´¦¡£")
--	else										-- ·ÇÌìÍõµÄ
		Talk(1,"","C¸i g× 'quèc hËn',c¸i g× 'gia cõu', hµng tr¨m n¨m sau vÉn chØ lµ méng ¶o!")
--	end
end

function skills_update()			-- ÏÈ¸ù¾İÈÎÎñµÈ¼¶É¾³ı¡¢ÖØĞÂ¼ÓÈë¼¼ÄÜ£¬È»ºó²¹»Ø¼¼ÄÜµã
	UTask = GetTask(3)
	if (GetTask(121) == 255) then		-- Ñ§»áÁË90¼¶¼¼ÄÜ
		the_lvl = 90
	elseif (HaveMagic(42) >= 0) then		-- ÓĞÕòÅÉ¾øÑ§¼¼ÄÜ
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
	add_tw(the_lvl)			-- ¼Ó»ØÓ¦Ñ§»áµÄ¼¼ÄÜ
	-- ×ÔÉí¼¼ÄÜµã×ÜÊı = (µÈ¼¶-1) + ¼Ó¼¼ÄÜÈÎÎñ + ¼Ó¼¼ÄÜµÀ¾ß - ÏÖÓĞÎ´·ÖÅäµãÊı				£¨»ØÌå¼¼ÄÜ£¿£©
	MagicPoint_total = GetLevel() + GetByte(GetTask(86),2) + GetByte(GetTask(80),1) - GetMagicPoint() - 1
	AddMagicPoint(MagicPoint_total)
	SetTask(137,23)
	Talk(1,"UpdateSkill","Hay l¾m! Ng­¬i h·y chuyªn t©m luyÖn c«ng, nhÊt ®Şnh sÏ th©m hËu! ")
end
