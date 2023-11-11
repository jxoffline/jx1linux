-- »ÆºÓÔ´Í· Â·ÈËNPC ÀÏÕß£¨À¥ÂØÅÉ³öÊ¦ÈÎÎñ£©
-- by£ºDan_Deng(2003-07-31)

function main()
	UTask_kl = GetTask(9);
	if (UTask_kl == 60*256+10) then		--³öÊ¦ÈÎÎñÖĞ
		Talk(1,"","Chµng Thanh niªn! Ng­¬icòng ®ang muèn ®i t×m Ngò s¾c th¹ch ph¶i kh«ng? Nghe nãi mª cung ®i vµo ®· bŞ 5 vŞ Thiªn ®Õ thêi thiªn cæ dïng khãa trêi khãa l¹i råi! Muèn lÊy ®­îc Ngò S¾c th¹ch, ng­¬i ph¶i cã ®­îc 5 chiÕc 'Thiªn Táa'")
		SetTask(9,60*256+20)
		AddNote("Ph¶i lµm theo sù chØ dÉn, ®i vµo s¬n ®éng ®Ó t×m 5 chiÕc ch×a khãa, míi lÊy ®­îc Ngò S¾c Th¹ch ")
		Msg2Player("Ph¶i lµm theo sù chØ dÉn, ®i vµo s¬n ®éng ®Ó t×m 5 chiÕc ch×a khãa, míi lÊy ®­îc Ngò S¾c Th¹ch ")
	else
		Talk(1,"","Ngò S¾c th¹ch bŞ t¶n l¹c trong nh©n gian, ®· g©y nªn biÕt bao nhiªu trËn m¸u ®æ. Rèt cuéc lµ nã mang nªn 'häa'hay lµ 'phóc'?")
	end
end;
