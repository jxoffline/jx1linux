--Î÷±±±±Çø ÁôÏÉ¶´¶þ²ã5toÁôÏÉ¶´Èý²ã2
--TrapID£ºÎ÷±±±±Çø 29
--»ÆºÓÔ´Í·ÃÔ¹¬ F2-F3 trap
-- by£ºDan_Deng(2003-07-31)

function main(sel)
	Talk(1,"L60_q2","B¹n nh×n thÊy mét c¬ quan, trªn cã kh¾c mÊy dßng ch÷: ")
--	AddTermini(47)		--ÕâÊÇÊ²Ã´¶«Î÷£¿
end;

function L60_q2()
	Say("Viªm §Õ vèn lµ thÇn Th¸i D­¬ng, còng lµ vÞ thÇn n«ng nghiÖp, «ng Êy b¶o mÆt trêi ph¸t ra ¸nh s¸ng, gióp cho ngò cèc sinh tr­ëng. Tõ ®ã con ng­êi trªn mÆt ®Êt kh«ng ph¶i lo miÕng c¬m manh ¸o, v× vËy mäi ng­êi t«n x­ng «ng lµ ThÇn N«ng thÞ. ThÇn N«ng thÞ cßn lµ vÞ thÇn vÒ y d­îc, «ng ®· v× ng­êi ta nÕm qua hµng tr¨m lo¹i cá, cuèi cïng tróng ®éc mµ chÕt. ThÇn Löa cã mét c« con g¸i, trong lóc ®i ch¬i ë §«ng h¶i ch¼ng may bÞ chÕt ®uèi, tõ ®ã biÕn thµnh mét con chim nhá, miÖng ngËm hßn ®¸ cµnh c©y th¶ vµo §«ng H¶i, muèn lÊp ®Çy biÓn lín. B¹n cã biÕt con chim nhá ®ã tªn g× kh«ng?",4,"Khoa Phô /L60_S2_wrong","Ngu C«ng /L60_S2_wrong","HËu NghÖ /L60_S2_wrong","Tinh VÖ /L60_S2_correct")
end

function L60_S2_correct()
	UTask_kl = GetTask(9)
	if (GetFaction() == "kunlun") and ((UTask_kl >= 70*256) or ((UTask_kl == 60*256+20) and (HaveItem(12) == 1))) then
--	if ((UTask_kl == 60*256+20) and (HaveItem(12) == 1)) then
		Msg2Player("B¹n nhÊn vµo ®¸p ¸n thø t­, C¬ quan sÏ ®­a b¹n ®Õn tÇng thø ba. ")
		SetFightState(1);
		NewWorld(127, 1614, 3083);
	else
		Msg2Player("B¹n Ên lo¹n x¹ vµo nh÷ng ký tù, nh­ng kh«ng thÊy ph¶n øng g× ")
	end
end;

function L60_S2_wrong()
	Msg2Player("B¹n Ên lo¹n x¹ vµo nh÷ng ký tù, nh­ng kh«ng thÊy ph¶n øng g× ")
end;
