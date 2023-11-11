--Ï´¼¼ÄÜµãµÄÅÑÉ®¡¡£¨ÄÚ²â×¨ÓÃ°æ£©
-- By: Dan_Deng(2003-08-29)
-- Update: Dan_Deng(2003-12-10)

function main()
	Say("Ng­¬i muèn tÈy tòy ­? §­îc! L¹i ®Êm l­ng cho ta tr­íc ®i! Cã biÕt c¸ch lµm kh«ng vËy?",2,"§©y lµ 10 v¹n l­îng, xin ®¹i s­ nhËn cho. /pay_yes","VËy th«i ®i/rollback_no")
end;

function pay_yes()
	if (GetCash() >= 100000) then
		Pay(100000)
		i = HaveMagic(210)		-- Çá¹¦ÁíÍâ²Ù×÷
		j = HaveMagic(400)		-- ¡°½Ù¸»¼ÃÆ¶¡±ÁíÍâ²Ù×÷
		n = RollbackSkill()		-- Çå³ı¼¼ÄÜ²¢·µ»ØËùÓĞ¼¼ÄÜµã£¨°üÀ¨Çá¹¦µÈÌØÊâ¼¼ÄÜ£©
		x = 0
		if (i ~= -1) then x = x + i end		-- ÕâÁ½¾äÅĞ¶ÏÊÇÅÅ³ı´ÓÎ´Ñ§¹ıÇá¹¦µÄÈË·µ»Ø-1´Ó¶øµ¼ÖÂµãÊı¼ÆËã´íÎóÇé¿ö
		if (j ~= -1) then x = x + j end
		rollback_point = n - x			-- °Ñ¼¼ÄÜµãµ±×ö¿ÕÏĞµãÊı·µ»¹£¬µ«ÏÈ¿Û³ıÇá¹¦µÈ
		AddMagicPoint(rollback_point)
		if (i ~= -1) then AddMagic(210,i) end			-- Èç¹ûÑ§¹ıÇá¹¦Ôò¼Ó»ØÔ­ÓĞµÈ¼¶
		if (j ~= -1) then AddMagic(400,j) end			-- Èç¹ûÑ§¹ı¡°½Ù¸»¼ÃÆ¶¡±Í¬Ñù´¦Àí
		if (GetTask(13) > 256) then		-- ÊÇÓÃ±¦Ê¯Ï´µÄµã
			Msg2Player("Dïng 3 viªn Thñy Tinh tiÕn hµnh tÈy ®iÓm kü n¨ng. B¹n nªn vÒ nhµ nghØ mét l¸t!")
			Say("Dïng 3 viªn Thñy Tinh tiÕn hµnh tÈy ®iÓm kü n¨ng. B¹n nªn vÒ nhµ nghØ mét l¸t!",1,"§­îc. /KickOutSelf")
		else
			Msg2Player("Dïng 3 viªn Thñy Tinh tiÕn hµnh tÈy ®iÓm kü n¨ng. Nh­ng ®iÓm kü n¨ng bŞ mÊt ®i 3 ®iÓm. B¹n nªn vÒ nhµ nghØ mét l¸t!")
			Say("Dïng 3 viªn Thñy Tinh tiÕn hµnh tÈy ®iÓm kü n¨ng. Nh­ng ®iÓm kü n¨ng bŞ mÊt ®i 3 ®iÓm. B¹n nªn vÒ nhµ nghØ mét l¸t!",1,"§­îc. /KickOutSelf")
		end
	else
		Talk(1,"","§©y lµ thµnh ı cña ng­¬i sao?Nh­ thÕ th× ng­¬i quay vÒ ®i! ")
	end
end

function no()
end
