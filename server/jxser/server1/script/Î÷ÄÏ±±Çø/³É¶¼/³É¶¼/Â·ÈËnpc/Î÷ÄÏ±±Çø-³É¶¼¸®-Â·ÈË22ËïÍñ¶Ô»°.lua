--Î÷ÄÏ±±Çø ³É¶¼¸® Â·ÈË22ËïÍñµÄ¶Ô»°
--author: yuanlan	
--date: 2003/3/10
-- Update: Dan_Deng(2003-08-13)

function main(sel)
	UTask_tm = GetTask(2);
	if (UTask_tm == 10*256+20) or (UTask_tm == 10*256+30) then						--ÌÆÃÅÊ®¼¶ÈÎÎñ¹ı³ÌÖĞ
		Talk(5, "", "ThËt lµ tøc chÕt! ThËt lµ lßng d¹ th©m ®éc!", "VŞ c« n­¬ng nµy cã chuyÖn g× vËy?", "Võa råi ë trªn ®­êng cã ng­êi cÇm mét tói ®å nãi lµ Thiªn y V« Phßng Ch©m v« cïng hiÕm, ta nghÜ ®­¬ng nhiªn råi. KÕt qu¶ ph¶i tèn 10 l­äng b¹c míi mua ®­îc. VÒ ®Õn më ra xem, ë trong bao lµ nh÷ng c©y kim nhá xİu ®en thñi ®en thui, kh«ng dïng ®Ó thªu ®­îc. Ng­¬i nãi xem cã ®¸ng giËn kh«ng?", " (Chİnh lµ Ma Vò Ch©m mµ ta muèn t×m, may mµ ng­êi lÊy ®­îc) . C« n­¬ng kh«ng dïng ®­îc, chi b»ng nh­îng l¹i cho ta!", "Ch©m nµy ta ph¶i tèn 10 l­îng b¹c míi mua ®­îc, lµm sao mµ tuú tiÖn cho ng­¬i ®­îc! NÕu ng­¬i muèn ®æi th× ph¶i lÊy nhÉn m· n·o ®Õn ®æi lÊy ch©m.")
		SetTask(2, 10*256+40)
		Msg2Note("T«n UyÓn yªu c©u b¹n dïng chiÕc nhÉn M· N·o ®Õn ®æi Ma Vò Ch©m ")
		AddNote("T×m ®­îc T«n UyÓn (394, 323) , biÕt ®­îc t«ng tİch cña Ma Vò Ch©m, nh­ng cÇn ph¶i dïng nhÉn M· n·o ®æi. ")
	elseif ((UTask_tm == 10*256+40) and ( HaveItem(165) == 1)) then				--ÓĞÂêè§½äÖ¸
		Talk(1,"","A! NhÉn m· n·o ®Ñp qu¸! Bao kim thªu nµy ng­¬i cÇm ®i.")
		DelItem(165)
		AddEventItem(36)
		Msg2Player("T×m ®­îc Ma Vò Ch©m. ")
		SetTask(2, 10*256+80)
		AddNote("§em nhÉn M· n·o tÆng cho T«n UyÓn sÏ ®­îc Ma Vò Ch©m ")
	elseif ((UTask_tm == 10*256+80) and (HaveItem(36) == 0)) then		-- µÀ¾ß¶ªÁË
		AddEventItem(36)
		Talk(1,"","Ng­êi kia! Ng­¬i ®¸nh r¬i bao kim nµy! Gäi ng­¬i còng kh«ng quan t©m! Tr¶ l¹i cho ng­¬i ®©y! LÇn nµy ®õng lµm r¬i n÷a!")
	else
		Talk(1,"","L¹c Ph¸ch Tö §Ö: å,ng­¬imuèn xem b¶o bèi cña ta h¶? Ta nh×n ng­¬ith× biÕt ng­¬ilµ ng­êi kh«ng biÕt xem hµng ho¸.")
	end
end;
