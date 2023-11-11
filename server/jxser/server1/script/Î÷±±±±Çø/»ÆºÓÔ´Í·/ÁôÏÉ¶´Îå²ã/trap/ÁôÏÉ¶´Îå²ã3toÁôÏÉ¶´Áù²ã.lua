--Î÷±±±±Çø ÁôÏÉ¶´Îå²ã3toÁôÏÉ¶´Áù²ã
--TrapID£ºÎ÷±±±±Çø 41
-- by£ºDan_Deng(2003-07-31)

function main(sel)
	Talk(1,"L60_q5","B¹n nh×n thÊy mét c¬ quan, trªn cã kh¾c mÊy dßng ch÷: ")
--	AddTermini(47)		--ÕâÊÇÊ²Ã´¶«Î÷£¿
end;

function L60_q5()
	Say("Hoµng §Õ ë trong trung t©m Thiªn ®×nh, phß t¸ «ng cã thæ thÇn hËu thæ. Hoµng ®Õ kiÕn t¹o ra chiÕc xe, v× vËy gäi lµ 'Hiªn Viªn ThÞ'. Ng­¬i cã biÕt 'Hiªn' lµ chØ bé phËn nµo trong chiÕc xe kh«ng? ",4,"B¸nh xe /L60_S5_wrong","Trôc xe /L60_S5_wrong","Hai bøc t­îng sóc vËt b»ng gç /L60_S5_correct","Khóc gç sau xe /L60_S5_wrong")
end

function L60_S5_correct()
	UTask_kl = GetTask(9)
	if (GetFaction() == "kunlun") and ((UTask_kl >= 70*256) or ((UTask_kl == 60*256+20) and (HaveItem(15) == 1))) then
--	if ((UTask_kl == 60*256+20) and (HaveItem(15) == 1)) then
		Msg2Player("B¹n h·y Ên vµo ®¸p ¸n thø ba, c¬ quan sÏ khëi ®éng ®­a ng­¬i ®Õn mét mËt thÊt ")
		SetFightState(1);
		NewWorld(130, 1547, 3143);
	else
		Msg2Player("B¹n Ên lo¹n x¹ vµo nh÷ng ký tù, nh­ng kh«ng thÊy ph¶n øng g× ")
	end
end;

function L60_S5_wrong()
	Msg2Player("B¹n Ên lo¹n x¹ vµo nh÷ng ký tù, nh­ng kh«ng thÊy ph¶n øng g× ")
end;
