--Î÷±±±±Çø ÁôÏÉ¶´Èý²ã3toÁôÏÉ¶´ËÄ²ã1
--TrapID£ºÎ÷±±±±Çø 33
--»ÆºÓÔ´Í·ÃÔ¹¬ F3-F4 trap
-- by£ºDan_Deng(2003-07-31)

function main(sel)
	Talk(1,"L60_q3","B¹n nh×n thÊy mét c¬ quan, trªn cã kh¾c mÊy dßng ch÷: ")
--	AddTermini(47)		--ÕâÊÇÊ²Ã´¶«Î÷£¿
end;

function L60_q3()
	Say("Cha cña ThiÕu Ng« lµ Th¸i B¹ch Kim Tinh,«ng sèng trong mét th«n lµng nghÌo khã,v× vËy ®­îc gäi  lµ Cïng Tang thÞ...ThiÕu Ng« ®· tõng thiÕt lËp v­¬ng quèc chim ë §«ng ph­¬ng,b¸ch quan v¨n vâ trong n­íc ®Òu lµ chim. Trong ®ã,chim yÕn lµ mét trong bèn lý quan,ng­¬icã biÕt ch­ëng quan cña nã lµ lý quan nµo kh«ng? ",4,"Xu©n /L60_S3_correct","H¹ /L60_S3_wrong","Thu/L60_S3_wrong","§«ng /L60_S3_wrong")
end

function L60_S3_correct()
	UTask_kl = GetTask(9)
	if (GetFaction() == "kunlun") and ((UTask_kl >= 70*256) or ((UTask_kl == 60*256+20) and (HaveItem(13) == 1))) then
--	if ((UTask_kl == 60*256+20) and (HaveItem(13) == 1)) then
		Msg2Player("B¹n nhÊn vµo ®¸p ¸n thø nhÊt, C¬ quan sÏ ®­a b¹n ®Õn tÇng thø t­. ")
		SetFightState(1);
		NewWorld(128, 1586, 3217);
	else
		Msg2Player("B¹n Ên lo¹n x¹ vµo nh÷ng ký tù, nh­ng kh«ng thÊy ph¶n øng g× ")
	end
end;

function L60_S3_wrong()
	Msg2Player("B¹n Ên lo¹n x¹ vµo nh÷ng ký tù, nh­ng kh«ng thÊy ph¶n øng g× ")
end;
