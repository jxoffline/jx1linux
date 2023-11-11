-- ½­ÄÏÇø ÂŞÏüÉ½ Â·ÈË_ÔÆ²¿Ó¥Ö÷.lua £¨ÏûÃğ²É»¨ÔôÈÎÎñ£©
-- By: Dan_Deng(2004-05-28)

function main(sel)
	Uworld43 = GetTask(43)
	if (Uworld43 == 50) then
		Talk(5,"U43_50","Ng­¬i ®· cã ®­îc ch×a khãa råi. Cßn muèn hái ta g× n÷a?","Gióp cho kÎ ¸c, sÏ bŞ thiªn h¹ nguyÒn rña!","Nãi xµm! C¸i g× ch¸nh? C¸i g× tµ?! Ta thİch lµm ®iÒu ¸c ®ã! Ng­¬i lµm g× ta nµo?","VËy ta xin ®¾c téi!","Hõm! Ng­¬i ch­a cã t­ c¸ch ®Ó ®Êu víi ta! §Ó ta cho bän ®Ö tö S¬n ¦ng ®ïa víi ng­¬i mét chót")
	elseif (Uworld43 == 70) then						-- ´òÍêÉ½Ó¥£¬À´ÄÃÔ¿³×
		Talk(2,"U43_70","H·y mau giao ch×a khãa ra ®©y!","H¶o tiÓu tö! Ng­¬i ®îi ®Êy! Chñ nh©n nhÊt ®Şnh sÏ b¸o thï cho L«i V©n nhŞ bé ")
	elseif (Uworld43 >= 80) and (Uworld43 < 100) and (HaveItem(382) == 0) then				-- »òÖ®ºóµÄÈÎÒ»²½ÖèÖĞÔ¿³×¶ªÊ§
		AddEventItem(382)
		Msg2Player("TiÕp tôc lÊy ®­îc V©n th­îc. ")
		Talk(1,"","H¹ng tiÓu tèt nh­ ng­¬i thö xem cã thÓ lµm ®­îc c¸i g×. Ch×a khãa ®ang ë ®©y, nÕu nh­ ng­¬i cã thÓ tiÕp ®­îc ta 3 chiªu, th× sÏ giao cho ng­¬i")
	elseif (Uworld43 >= 80) and (Uworld43 < 255) and (HaveItem(382) == 1) then
		Talk(1,"","Ng­¬i ®· cã ®­îc ch×a khãa råi. Cßn muèn hái ta g× n÷a?")
	elseif (Uworld43 == 60) then		-- ¶Ô»°Íê³É£¬´ò¿ñÀÇÎ´Íê³É
		Talk(1,"","Hõm! Ng­¬i ch­a cã t­ c¸ch ®Ó ®Êu víi ta! §Ó ta cho bän ®Ö tö S¬n ¦ng ®ïa víi ng­¬i mét chót")
	elseif (Uworld43 >= 255) then
		Talk(1,"","Ng­¬i…Ng­¬i thËt sù ®· giÕt thiÕu chñ?")
	else
		Talk(1,"","§õng cã l¶m nh¶m n÷a! Ch­a thÊy bé d¹ng nµy bao giê sao?")
	end
end;

function U43_50()
	SetTask(43,60)
	Msg2Player("Ng­¬i thËt sù ®· giÕt chÕt thiÕu chñ? ")
end

function U43_70()
	SetTask(43,80)
	AddEventItem(382)
	Msg2Player("§· lÊy ®­îc V©n th­îc, trë vÒ L©m An giao cho C«ng Sai ®¹i ca, bµn bµn kÕ ho¹ch tiÕp theo ")
end
