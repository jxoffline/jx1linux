--description: ÌìÈÌ½Ì»ğÌÃÌÃÖ÷
--author: yuanlan	
--date: 2003/5/18
--Dan_Deng(2003-07-22), ¼ÓÈëÃÅÅÉÈÎÎñµÄµÈ¼¶ÒªÇó
-- Update: Dan_Deng(2003-08-14)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_tr = GetTask(4);
	if (GetSeries() == 3) and (GetFaction() == "tianren") then
		if (UTask_tr == 10*256) and (GetLevel() >= 10) then
			Say("T¹i tÇng hai cña bæn gi¸o, ë <color=Red>ThÊt S¸t §éng<color> cã giam <color=Red>b¶y tªn tö tï<color>, bän chóng ®Òu lµ nh÷ng kÎ ph¶n béi bæn gi¸o, nÕu ng­¬i cã thÓ ®¸nh b¹i ba tªn trong sè bän chóng, lÊy ®­îc <color=Red>m¶nh ThÊt S¸t lÖnh bµi<color>, lµ cã thÓ th¨ng lªn cÊp V« ¶nh S¸t Thñ cña bæn gi¸o, ng­¬i cã muèn vµo trong ThÊt S¸t §éng kh«ng?", 2, "X«ng vµo ThÊt S¸t ®éng /L10_get_yes", "T¹m thêi ch­a vµo /L10_get_no")
--		elseif (UTask_tr == 10*256+50) and (HaveItem(51) == 1) and  HaveItem(52) == 1 and HaveItem(53) == 1 and HaveItem(54) == 1 and HaveItem(55) == 1 and HaveItem(56) == 1 and (HaveItem(57) == 1) then
		elseif (UTask_tr == 10*256+50) then		-- ĞŞ¸ÄÈÎÎñÍê³ÉÌõ¼ş£¨2003-09-27£©
			i = check_token()
			if (i >= 3) then
				Talk(1,"L10_prise","RÊt tèt! vµo ThÊt S¸t §éng h¹ ®ñ sè ng­êi míi cã thÓ trë ra, ng­îc l¹i ng­¬i cã chuyÖn g× th× tù m×nh xö lı!")
			else
				Talk(1,"","ThÕ nµo? Mét cuéc kh¶o nghiÖm nhá nh­ thÕ mµ ng­¬i còng lµm kh«ng xong ­?")
			end
		elseif (UTask_tr < 20*256) then								--ÉĞÎ´½Ó10¼¶ÈÎÎñ
			Talk(1,"","§õng nghÜ gia nhËp bæn gi¸o sÏ ¨n kh«ng ngåi råi, bæn gi¸o kh«ng chøa chÊp nh÷ng ng­êi thõa th·i ®©u!")
		else
			Talk(1,"","Ng­¬i míi gia nhËp bæn gi¸o, ng­êi m¹nh cßn cã ng­êi m¹nh h¬n, ng­¬i ph¶i cÈn thËn ®Êy!")
		end
	else
		Talk(1,"","ChØ cã kÎ m¹nh míi cã thÓ sinh tån trªn thÕ gian, kÎ m¹nh th¾ng kÎ yÕu, nh÷ng ng­êi tu luyÖn ch­a tíi th× sÏ bŞ kÎ kh¸c tiªu diÖt, ©u còng lµ do tù chuèc lÊy, ®õng nªn o¸n tr¸ch ng­êi kh¸c.")
	end
end;

function L10_get_yes()
	Talk(1,"","<color=Red>ThÊt S¸t lÖnh bµi<color> cã tÊt c¶ b¶y m¶nh, ph©n ra trªn ng­êi <color=Red>b¶y tªn tö tï<color>, ng­¬i chØ cÇn lÊy 3 m¶nh lµ ®­îc.")
	SetTask(4, 10*256+50)
	AddNote("NhËn nhiÖm vô ThÊt S¸t ®éng cña Vµo ThÊt S¸t ®éng lÊy ba m¶nh ThÊt S¸t lÖnh bµi. ")
	Msg2Player("NhËn nhiÖm vô ThÊt S¸t ®éng cña Vµo ThÊt S¸t ®éng lÊy ba m¶nh ThÊt S¸t lÖnh bµi. ")
end;

function L10_get_no()
	Talk(1,"","Khi ®· lµm xong råi h·y quay l¹i t×m ta!")
end;

function L10_prise()
	SetTask(4, 20*256)
	SetRank(56)
--	AddMagic(132)
--	AddMagic(131)
--	AddMagic(136)
	add_tr(20)			-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
	Msg2Player("B¹n ®­îc phong lµ V« ¶nh S¸t Thñ! Häc ®­îc Thiªn NhÉn M©u Ph¸p, Thiªn NhÉn §ao ph¸p, Háa PhÇn Liªn Hoa. ")
	AddNote("§­a c¸c m¶nh ThÊt S¸t lÖnh bµi cho §­êng chñ Ngét Ng¹o, hoµn thµnh nhiÖm vô ThÊt S¸t ®éng, th¨ng cÊp V« ¶nh S¸t Thñ. ")
end;

function check_token()
	i = 0
	if (HaveItem(51) == 1) then
		i = i + 1
		DelItem(51)
	end
	if (HaveItem(52) == 1) then
		i = i + 1
		DelItem(52)
	end
	if (HaveItem(53) == 1) then
		i = i + 1
		DelItem(53)
	end
	if (HaveItem(54) == 1) then
		i = i + 1
		DelItem(54)
	end
	if (HaveItem(55) == 1) then
		i = i + 1
		DelItem(55)
	end
	if (HaveItem(56) == 1) then
		i = i + 1
		DelItem(56)
	end
	if (HaveItem(57) == 1) then
		i = i + 1
		DelItem(57)
	end
	return i
end;
