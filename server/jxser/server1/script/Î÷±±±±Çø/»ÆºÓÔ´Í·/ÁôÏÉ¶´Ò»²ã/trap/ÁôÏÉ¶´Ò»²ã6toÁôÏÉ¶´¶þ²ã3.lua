--Î÷±±±±Çø ÁôÏÉ¶´Ò»²ã6toÁôÏÉ¶´¶þ²ã3
--TrapID£ºÎ÷±±±±Çø 25
-- by£ºDan_Deng(2003-07-31)

function main(sel)
	Talk(1,"L60_q1","B¹n nh×n thÊy mét c¬ quan, trªn cã kh¾c mÊy dßng ch÷: ")
--	AddTermini(47)		--ÕâÊÇÊ²Ã´¶«Î÷£¿
end;

function L60_q1()
	Say("Trong truyÒn thuyÕt Phôc Hy lµ con trai thÇn SÊm,«ng ta ®· lÊy ®­îc c¸i chu«ng löa tõ trong löa sÊm tù nhiªn mµ ®em cho nh©n gian, sau thêi Phôc Hy, l¹i cã c¸i khoan...c¸ch thøc lÊy löa nµy do ai ph¸t minh ra vËy? ",4,"M¹c MÉu /L60_S1_wrong","Tôy Nh©n /L60_S1_correct","N÷ Oa /L60_S1_wrong","V­¬ng MÉu /L60_S1_wrong")
end

function L60_S1_correct()
	UTask_kl = GetTask(9)
	if (GetFaction() == "kunlun") and ((UTask_kl >= 70*256) or ((UTask_kl == 60*256+20) and (HaveItem(11) == 1))) then
		Msg2Player("B¹n nh×n thÊy mét C¬ quan, bªn trªn cã kh¾c mÊy dßng ch÷: ")
		SetFightState(1);
		NewWorld(126,1483,3039)
	else
		Msg2Player("B¹n Ên lo¹n x¹ vµo nh÷ng ký tù, nh­ng kh«ng thÊy ph¶n øng g× ")
	end
end;

function L60_S1_wrong()
	Msg2Player("B¹n Ên lo¹n x¹ vµo nh÷ng ký tù, nh­ng kh«ng thÊy ph¶n øng g× ")
end;
