--Î÷ÄÏ±±Çø ½­½ò´å ÎäÊ¦¶Ô»° ĞÂÊÖ´åÁ·Çá¹¦ÈÎÎñ(²»¿ÉÖØ¸´µÄÈÎÎñ)
-- Update: Dan_Deng(2003-08-09)
-- ÈÎÎñÒªÇó: µÈ¼¶(>=2), ½ğÇ®(>=100Á½)
-- Update: Dan_Deng(2003-11-04)¸ÄÎªÄ£°å·½Ê½£¬È«·şÍ³Ò»µ÷ÓÃÒ»¸öº¯ÊıÒÔÀûÓÚÎ¬»¤¡¢À©Õ¹

Include("\\script\\global\\¸÷ÅÉ½ÓÒıµÜ×Ó\\Çá¹¦_ÎäÊ¦Ä£°å.lua")

function main(sel)
	UTask_world20 = GetTask(44)		-- »¢×Ó°İÊ¦ÈÎÎñ
	if (UTask_world20 == 10) then			-- »¢×Ó°İÊ¦ÈÎÎñ½øĞĞÖĞ
		Talk(1,"","ña? Hæ Tö muèn häc vâ µ? §øa trÎ nµy ngµy th­êng rÊt hiÕu ®éng, xem ra t­ chÊt kh«ng tåi. §­îc, vÒ nãi víi cha nã, ta thu Hæ Tö lµm ®å ®Ö. §Òu lµ ng­êi trong lµng c¶, ®õng tİnh tíi chuyÖn tiÒn nong! Mçi dŞp lÔ tÕt mang lªn x©u thŞt sÊy lµ ®­îc råi!")
		SetTask(44, 20)
		AddNote("Vâ s­ ®ång ı d¹y vâ miÔn phİ cho Hæ tö, mau vÒ b¸o tin nµy cho cha cña Hæ tö biÕt ")
		Msg2Player("Vâ s­ ®ång ı d¹y vâ miÔn phİ cho Hæ tö, mau vÒ b¸o tin nµy cho cha cña Hæ tö biÕt ")
	else
		learn()
	end
end;
