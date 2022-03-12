
function main()
	Uworld43 = GetTask(43)
	if (Uworld43 == 90) and (HaveItem(381) == 1) and (HaveItem(382) == 1) then
		SetTask(43,100)
		DelItem(381)
		DelItem(382)
		Talk(7,"U43_go","Cøu m¹ng! Xin cøu m¹ng!","Dõng tay!","To gan! D¸m can thiÖp vµo chuyÖn cña bæn c«ng tö µ?","Ng­¬i lµ mét tªn bÈn thØu gi¶ danh thµnh kÎ phong l­u! Ng­¬i cßn muèn h¹i thªm bao nhiªu ng­êi n÷a?","Ha! Ha! Ha! TriÒu ®×nh th× thèi n¸t. ChiÕn lo¹n x¶y ra kh¾p n¬i. Ai còng chØ muèn sèng yªn th©n. Ngay c¶ Hoµng Th­îng cßn kh«ng chó ı ®Õn ta. Ng­¬i l¹i cø muèn nhóng tay?","§õng nhiÒu lêi! §¸nh ®i!","Hõm! Muèn lµm anh hïng ­? §Ó xem ng­¬i cã b¶n lÜnh g×!")
	elseif (Uworld43 == 100) then
		Talk(1,"U43_go","Ha!Ha! Bän thñ h¹ cña ta cßn n­¬ng tay nªn míi ®Ó cho ng­¬i gi÷ ®­îc m¹ng ®Õn ®©y. ")
	elseif (Uworld43 == 90) then			-- ÈÎÎñÖĞ£¬µÀ¾ß¶ªÁË²»ÈÃ½øµÄÌáÊ¾
		Talk(1,"","B¹n ®· thö håi l©u nh­ng c¸nh cöa vÉn kh«ng më! ChØ nghe ®­îc tiÕng con g¸i kªu la!")
		Msg2Player("Kh«ng cã hai chiÕc ch×a khãa V©n-L«i th× ng­¬i sÏ kh«ng thÓ vµo n¬i cña c«ng tö ®Ó chÕ ngù h¾n. ")
	end
end

function U43_go()
	SetFightState(1)
	NewWorld(233, 1597,3207)
end
