-- ´óÀí³Ç Â·ÈËNPC ¶Î»¨Å©£¨´äÑÌÃÅ30¼¶ÈÎÎñ£©
-- by£ºDan_Deng(2003-07-26)

function main()
	UTask_cy = GetTask(6)
	if (UTask_cy == 30*256+10) then		--30¼¶ÈÎÎñ½øĞĞÖĞ£¨¾ÈËïÅ®Æô¶¯£©
		Talk(6,"","§oµn ®¹i gia, nghe nãi ng­êi lµ mét tay trång trµ giái, ta ®Õn ®©y muèn nhê l·o b¸ chØ bİ quyÕt trång c©y trµ 'Vò Y Nghª Th­êng'.","Hu hu hu.....ch¸u g¸i ®¸ng th­¬ng cña ta.....","§¹i ®¹i gia! Ch¸u g¸i «ng thÕ nµo?","Nã bŞ mét tªn thæ phØ ë §iÓm Th­¬ng s¬n b¾t ®i råi, b©y giê kh«ng biÕt sèng chÕt ra sao?.....","§oµn ®¹i gia! §õng lo l¾ng! Ta sÏ ®i cøu ch¸u g¸i cña «ng.","N÷ hiÖp! Ng­¬i ®óng lµ mét ng­êi tèt! ChØ cÇn cøu ®­îc ch¸u ta, chuyÖn g× ta còng høa! ")
		SetTask(6,30*256+20)
		AddNote("§Õn §iÓm Th­¬ng s¬n, t×m thæ phØ gi¶i cøu ch¸u g¸i cña ng­êi trång trµ ")
		Msg2Player("§Õn §iÓm Th­¬ng s¬n, t×m thæ phØ gi¶i cøu ch¸u g¸i cña ng­êi trång trµ ")
	elseif (UTask_cy == 30*256+30) then		--30¼¶ÈÎÎñ½øĞĞÖĞ£¨¾ÈËïÅ®Íê³É£©
		Talk(5,"","C¸m ¬n ng­¬i ®· cøu ch¸u ta. §¹i ¬n ®¹i ®øc nµy ta sÏ kh«ng quªn.","§oµn ®¹i gia! ¤ng biÕt c¸ch trång ' Vò Y Nghª Th­êng' ph¶i kh«ng?","TiÓu c« n­¬ng! Coi nh­ c« n­¬ng hái ®óng ng­êi,bİ quyÕt trång Vò Y Nghª Th­êng chØ cã l·o míi biÕt, tõ tr­íc tíi nay vèn kh«ng truyÒn cho ng­êi ngoµi nh­ng ng­¬i ®· cøu m¹ng ch¸u g¸i cña ta th× ta sÏ truyÒn l¹i cho ng­¬i.","Trång c©y trµ Vò Y Nghª Th­êng th× ph¶i cã ®ñ 3 lo¹i nguyªn liÖu: mét lµ Ng©n TuyÕt Ng­ ë NhÜ H¶i. Hai lµ Bİch Th­êng Phông §iÖp bªn suèi Hå §iÖp, ba lµ con giun ®á ë V©n N«ng ®×nh.","§a t¹ §¹i Gia! ")
		SetTask(6,30*256+40)
		AddNote("Trång Vò Y Nghª Th­êng nhÊt ®Şnh ph¶i cã Ng©n TuyÕt Ng­ ë NhÜ H¶i, Bİch Th­êng Ph­îng §iÖp bªn suèi Hå §iÖp, con giun ®á ë gÇn V©n N«ng ®×nh ")
		Msg2Player("Trång Vò Y Nghª Th­êng nhÊt ®Şnh ph¶i cã Ng©n TuyÕt Ng­ ë NhÜ H¶i, Bİch Th­êng Ph­îng §iÖp bªn suèi Hå §iÖp, con giun ®á ë gÇn V©n N«ng ®×nh ")
	elseif (UTask_cy == 30*256+20) then
		Talk(1,"","N÷ hiÖp! ChØ cÇn cã thÓ cøu ®­îc ch¸u g¸i cña ta chuyÖn g× ta còng høa víi ng­¬i! ")
	else
		Talk(1,"","Trång lo¹i hoa nµy võa lµ mét m«n häc võa lµ mét m«n nghÖ thuËt.")
	end
end
