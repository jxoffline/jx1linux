--Î÷±±±±Çø ÁôÏÉ¶´ËÄ²ã4toÁôÏÉ¶´Îå²ã1
--TrapID£ºÎ÷±±±±Çø 37
--»ÆºÓÔ´Í·ÃÔ¹¬ F4-F5 trap
-- by£ºDan_Deng(2003-07-31)

function main(sel)
	Talk(1,"L60_q4","B¹n nh×n thÊy mét c¬ quan, trªn cã kh¾c mÊy dßng ch÷: ")
--	AddTermini(47)		--ÕâÊÇÊ²Ã´¶«Î÷£¿
end;

function L60_q4()
	Say("Vò trô lóc khai s¬, ®Êt trêi c¸ch nhau kh«ng xa, loµi ng­êi cã thÓ b­íc qua nh÷ng bËc thang ®Ó lªn Thiªn ®×nh. Ngäc Hoµng cho r»ng: ng­êi phµm vµ thiªn thÇn gÇn gòi víi nhau nh­ vËy thËt lµ hçn ®én, bÌn lÖnh c¸c thiªn thÇn lµm cho trêi ®Êt c¸ch xa nhau. Ng­¬icã hiÓu ®­îc ý nghÜa huyÒn bÝ cña nh÷ng c©u thµnh ng÷ phÝa d­íi kh«ng?",4,"Trêi hoang, ®Êt giµ /L60_S4_wrong","§Êt trêi ph©n ®«i /L60_S4_correct","Trêi Nam, ®Êt B¾c /L60_S4_wrong","Trêi cao, ®Êt dÇy /L60_S4_wrong")
end

function L60_S4_correct()
	UTask_kl = GetTask(9)
	if (GetFaction() == "kunlun") and ((UTask_kl >= 70*256) or ((UTask_kl == 60*256+20) and (HaveItem(14) == 1))) then
--	if ((UTask_kl == 60*256+20) and (HaveItem(14) == 1)) then
		Msg2Player("B¹n h·y Ên vµo ®¸p ¸n thø 2 ngay tr­íc mÆt, c¬ quan sÏ khëi ®éng ®­a ng­¬i lªn tÇng thø 5 ")
		SetFightState(1);
		NewWorld(129, 1694, 3143);
	else
		Msg2Player("B¹n Ên lo¹n x¹ vµo nh÷ng ký tù, nh­ng kh«ng thÊy ph¶n øng g× ")
	end
end;

function L60_S4_wrong()
	Msg2Player("B¹n Ên lo¹n x¹ vµo nh÷ng ký tù, nh­ng kh«ng thÊy ph¶n øng g× ")
end;
