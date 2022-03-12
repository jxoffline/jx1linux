--description: ÌÆÃÅ20¼¶ÈÎÎñ ¹ÖÊ¯ÕóÊ¯ÎİÃÅÇ°Ğ¡Ê¯±®
--author: yuanlan	
--date: 2003/3/11
-- Update: Dan_Deng(2003-08-13)

function main()
	UTask_tm = GetTask(2);
	if (UTask_tm == 20*256+20) then		-- 20¼¶ÈÎÎñ£¬µÚÒ»²½£º´òËÄ¸ö×Ö
		if (HaveItem(37) == 1) and (HaveItem(38) == 1) and (HaveItem(39) == 1) and (HaveItem(40) == 1) then
			Talk(9, "", "Cho dï ng­¬i ®· t×m ®­îc 4 ch÷ 'ThiÖn NhËp Gi¶ Tö', t¹i sao cßn d¸m ë l¹i? Ch¼ng lÏ trªn ®êi nµy cã ng­êi kh«ng sî chÕt?", "Thiªn h¹ kh«ng cã ai kh«ng sî chÕt, nh­ng kh«ng thÓ gÆp ®­îc ng­êi th©n ch¼ng ph¶i ®au khæ h¬n chÕt sao?", "Rèt côc ng­¬i lµ ai?", "V·n bèi lµ §Ö tö §­êng M«n, ®Õn mêi S­ c« trë vÒ §­êng M«n ®oµn tô víi Ch­ëng m«n s­ huynh! ", "Ta kh«ng cã huynh tr­ëng g× hÕt! Ng­êi th©n cña ta ®· chÕt hÕt råi! N¨m x­a lóc ta bŞ ®uæi khái S­ m«n, kh«ng cã ai nãi gióp ta mét lêi nµo! Lóc ®ã ta ®· thÒ, ®êi nµy sÏ kh«ng b­íc vµo §­êng M«n n÷a b­íc! ", "NÕu S­ c« kh«ng cã chót l­u luyÕn víi §­êng M«n, t¹i sao l¹i Èn c­ ë Tróc H¶i hËu s¬n?", "§­êng U:.....", "S­ c«, ®· nhiÒu n¨m nay, Ch­ëng m«n cø hèi tiÕc ®· kh«ng c¶n S­ phô ®uæi S­ c« ra khái gia m«n, t¹i sao ng­êi kh«ng cho «ng ta mét c¬ héi bï ®¾p? Huèng chi huynh muéi t×nh th©m hµ tÊt chØ v× mét lóc nãng giËn mµ ©n hËn c¶ ®êi?", "Ng­¬i kh«ng cÇn nhiÒu lêi! §­îc! Ta cho ng­¬i mét c¬ héi. N¨m ®ã lóc ta rêi khái gia m«n. NhÊt thêi vøt Kim H¹ng khuyªn cña cha tÆng xuèng PhØ Thóy hå. NÕu ng­¬i cã thÓ t×m gióp ta, ta sÏ tha thø cho bän hä! ")
   		DelItem(37)	
			DelItem(38)
			DelItem(39)
			DelItem(40)
			SetTask(2, 20*256+40)
			AddNote("Trªn bia ®¸ tr­íc phßng §­êng U, nhËn nhiÖm vô ®i hå PhØ Thóy t×m Kim H¹ng QuyÓn ")
		else
			Talk(1,"","B¹n kh«ng cã khÈu quyÕt, kh«ng thÓ th«ng qua bia ®¸ nãi chuyÖn víi §­êng U.")
			AddNote("ë phİa tr­íc bia ®¸ t¹i V« T©m Cèc biÕt lµ ph¶i t×m khÈu quyÕt bia ®¸ trong cèc tr­íc. ")
		end
	elseif (UTask_tm == 20*256+40) then
		if (HaveItem(41) == 1) then
			Talk(2, "", "S­ c«! §Ö tö ®· ®· t×m ®­îc Kim H¹ng khuyªn d­íi PhØ Thóy hå, S­ c« cã thÓ suy nghÜ l¹i kh«ng?", "Ng­¬i ®­a Kim H¹ng khuyªn cho §¹i ca ta, thÊy chiÕc vßng nµy sÏ biÕt ta ®· tha thø cho huynh Êy.")
	  		SetTask(2, 20*256+60)
	  		Msg2Player("§­êng U lÖnh cho b¹n mang Kim H¹ng QuyÓn giao cho §­êng Cõu ch­ëng m«n. ")
  			AddNote("§­êng U lÖnh cho b¹n mang Kim H¹ng QuyÓn giao cho §­êng Cõu ch­ëng m«n. ")
		else								--Ã»ÓĞµÃµ½»òÕß¶ªÊ§£¬½ğÏîÈ¦¿ÉÒÔ·´¸´´ò
			Talk(1,"","NÕu ng­¬i cã thÓ t×m ®­îc cho ta chiÕc Kim H¹ng khuyªn d­íi PhØ Thóy hå, ta sÏ tha thø cho bän hä! ")
		end
	elseif ((UTask_tm == 20*256+60) and (HaveItem(41) == 0)) then		-- µÀ¾ß¶ªÁË
		AddEventItem(41)
		Talk(1,"","Sao ng­¬i nhiÒu chuyÖn thÕ! §Ó chiÕc vßng l¹i ®©y! Cßn ng­¬i th× biÕn mau ®i!")
	elseif (UTask_tm >= 30*256) then
		Say("Ta sèng thanh tŞnh mét m×nh quen råi, kh«ng thİch ai quÊy nhiÔu! ChuyÖn cò qua råi, nãi nhiÒu v« İch, ng­¬i vÒ ®i!", 0)
	else
		Talk(1,"","Trªn bia ®¸ cã viÕt: 'ThiÖn NhËp Gi¶, s¸t v« x¸'. Ch÷ 's¸t' viÕt b»ng mµu m¸u rÊt lµ ®Æc biÖt. ")
	end
end;
