-- ½­ÄÏÇø ÂÞÏüÉ½ Â·ÈË_À×²¿ÀÇÖ÷.lua £¨ÏûÃð²É»¨ÔôÈÎÎñ£©
-- By: Dan_Deng(2004-05-28)

function main(sel)
	Uworld43 = GetTask(43)
	if (Uworld43 == 10) then
		Talk(6,"U43_10","Lang Chñ! Ch¾c ng­êi cã biÕt chuyÖn m«t thanh niªn trªn nói, trªn tay th­êng cÇm phiÕn qu¹t, thÝch ng©m th¬ nh­ng l¹i lµm tÆc ","§å ngèc! Lµm g× cã!","Ta kÝnh ng­¬i vèn cã tiÕng trong vâ l©m. Nãi chuyÖn ®õng th« lç ","§õng cã hï däa ta! Khi ta l¨n lãc trong giang hå th× ng­¬i cßn ch­a sinh ra","Ta biÕt r»ng tªn ®ã gÇn ®©y th­êng hay giao du víi Th¸i Hoa tÆc, gian d©m phô n÷! Ng­¬i tèt nhÊt nªn nãi ra chç tró Èn cña h¾n, nÕu kh«ng còng sÏ bÞ liªn lôy","Cø cho lµ ng­¬i ®· biÕt hÕt sù t×nh ®i! Råi sao h¶? §¸nh th¾ng ®­îc ta råi míi nãi!Ha! Ha! Ha! Ha! Ha!")
	elseif (Uworld43 == 30) then						-- ´òÍê¿ñÀÇ£¬À´ÄÃÔ¿³×
		Talk(4,"U43_30","Xin thø lçi! T¹i h¹ cßn ch­a xuèng Diªm La nh­ng mµ ®¸m thuéc h¹ cña ngµi th× ®Òu xuèng s«ng N¹i Hµ hÕt råi","Hõm! TiÓu tö muèn lµm anh hïng? Anh hïng kh«ng ph¶i ai muèn lµ ®­îc ®©u!","§õng nãi nh¶m n÷a! NÕu kh«ng th× ng­¬i còng sÏ cïng ®i hîp mÆt víi ®¸m ®Ö tö kia","TiÓu tö! Xem nh­ ng­oi cã b¶n lÜnh! NÕu nh­ ta giao ch×a khãa nµy cho ng­¬i th× ng­¬i cã tha m¹ng cho ta kh«ng?")
	elseif (Uworld43 >= 40) and (Uworld43 < 100) and (HaveItem(381) == 0) then				-- »òÖ®ºóµÄÈÎÒ»²½ÖèÖÐÔ¿³×¶ªÊ§
		AddEventItem(381)
		Msg2Player("TiÕp tôc nhËn ®­îc L«i th­îc ")
		Talk(1,"","H¹ng tiÓu tèt nh­ ng­¬i thö xem cã thÓ lµm ®­îc c¸i g×. Ch×a khãa ®ang ë ®©y, nÕu nh­ ng­¬i cã thÓ tiÕp ®­îc ta 3 chiªu, th× sÏ giao cho ng­¬i")
	elseif (Uworld43 >= 40) and (Uworld43 < 255) and (HaveItem(381) == 1) then
		Talk(1,"","Ng­¬i ®· cã ®­îc ch×a khãa råi. Cßn muèn hái ta g× n÷a?")
	elseif (Uworld43 == 20) then		-- ¶Ô»°Íê³É£¬´ò¿ñÀÇÎ´Íê³É
		Talk(1,"","Ngu ngèc! NÕu ng­¬i th¾ng ®­îc ®¸m thñ h¹ cña ta th× míi cã t­ c¸ch ®Êu víi ta")
	elseif (Uworld43 >= 255) then
		Talk(1,"","Ng­¬i…Ng­¬i thËt sù ®· giÕt thiÕu chñ?")
	else
		Talk(1,"","§õng cã l¶m nh¶m n÷a! Ch­a thÊy bé d¹ng nµy bao giê sao?")
	end
end;

function U43_10()
	SetTask(43,20)
	Msg2Player("Ng­¬i ®· cã ®­îc ch×a khãa råi. Cßn muèn hái ta g× n÷a? ")
end

function U43_30()
	SetTask(43,40)
	AddEventItem(381)
	Msg2Player("§· lÊy ®­îc L«i th­îc, trë vÒ L©m An giao cho C«ng Sai ®¹i ca, bµn bµn kÕ ho¹ch tiÕp theo ")
end
