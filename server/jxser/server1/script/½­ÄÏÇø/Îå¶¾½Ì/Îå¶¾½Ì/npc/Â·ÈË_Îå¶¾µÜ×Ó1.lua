-- Îå¶¾ Â·ÈËNPC Îå¶¾µÜ×Ó1 ÈëÃÅÈÎÎñ
-- by£ºDan_Deng(2003-08-05)

function main()
	Uworld37 = GetByte(GetTask(37),2)
	if (Uworld37 == 10) then		-- ÈëÃÅÈÎÎñÖĞ
		if ((HaveItem(227) == 1) and (HaveItem(223) == 1) and (HaveItem(225) == 1) and (HaveItem(226) == 1) and (HaveItem(227) == 1)) then
			Talk(1,"","Oa! T¹i sao l¹i Khæng t­íc vò tÆng cho ta vËy. Ph¶i mang ®Õn tÆng cho s­ huynh ë trong ®éng nµy míi ®óng. ")
		else
			Talk(1,"","Thêi gian luyÖn c«ng vÉn ch­a ®ñ, t¹i sao ng­¬i l¹i ra ®©y? Xem c¸i bé d¹ng ®ê ®Én cña ng­¬i k×a. Lµm sao cã thÓ trë thµnh ®Ö tö cña bæn m«n? Suèt ®êi chØ cã m¬ mµ th«i. ")
		end
	elseif (Uworld37 == 0) and (GetLevel() >= 10) and (GetFaction ~= "wudu") then		--ÈëÃÅÈÎÎñ
		Say("Muèn trë thµnh ®Ö tö kı danh cña bæn m«n, cÇn ph¶i thö luyÖn qua Ngò §éc ®éng nµy. Ng­¬i cã muèn thö kh«ng",2,"D¹! §Ó ta thö xem! /enroll_get_yes","Kh«ng, ta chØ ®Õn tham quan. /no")
	else							-- ³£¹æ¶Ô»°
		Talk(1,"","§õng cã ch¹y lo¹n nh­ vËy. §éc trïng nu«i trong ®éng mµ c¾n th× ng­¬i v« ph­¬ng cøu ch÷a. ")
	end
end;

function enroll_get_yes()
	Uworld37 = SetByte(GetTask(37),2,10)
	SetTask(37,Uworld37)
	AddNote("NhËn nhiÖm vô ®Õn Ngò §éc ®éng luyÖn c«ng, ®i vµo trong ®éng, b¹n sÏ nhËn ®­îc 5 sîi l«ng mao chim Khæmg T­íc. ")
	Msg2Player("NhËn nhiÖm vô ®Õn Ngò §éc ®éng luyÖn c«ng, ®i vµo trong ®éng, b¹n sÏ nhËn ®­îc 5 sîi l«ng mao chim Khæmg T­íc. ")
end;

function no()
end;
