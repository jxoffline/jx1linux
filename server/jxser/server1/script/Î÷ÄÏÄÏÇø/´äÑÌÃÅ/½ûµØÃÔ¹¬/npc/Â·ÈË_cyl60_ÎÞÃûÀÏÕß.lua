-- ´äÑÌÃÅ½ûµØÃÔ¹¬ Â·ÈËNPC ÎŞÃûÀÏÕß£¨´äÑÌÃÅ³öÊ¦ÈÎÎñ£©
-- by£ºDan_Deng(2003-07-27)

function main()
	UTask_cy = GetTask(6)
	if ((UTask_cy == 60*256+10) and (HaveItem(237) == 1)) then				--³öÊ¦ÈÎÎñ½øĞĞÖĞ
		Talk(6,"L60_talk1","Ng­¬i lµ ai? D¸m x«ng v« §o¹n Tr­êng Cèc, muèn chÕt µ?","Khoan ®·! L·o b¸! ë ®©y cã mét kh¨n t¬, xin «ng xem qua! ","Kh¨n t¬?! §­a ®©y!...............Ng­¬i.....ng­¬i lµ ai? Kh¨n t¬ nµy tõ ®©u mµ cã? ","V·n bèi lµ ®Ö tö Thóy Yªn, kh¨n t¬ nµy lµ V·n bèi lÊy trong s¬n ®éng. Xu©n H­¬ng bµ bµ b¶o V·n bèi ®Õn t×m «ng!","Xu©n H­¬ng bµ bµ? Xu©n H­¬ng con tiÓu nha ®Çu ®ã ®· trë thµnh 1 bµ l·o? ¤i! Ta kh«ng muèn nh¾c l¹i chuyÖn n¨m x­a n÷a!")
	elseif (UTask_cy >= 60*256+20) and (UTask_cy < 70*256) and (HaveItem(235) == 0) then		--³öÊ¦ÈÎÎñÖĞ£¬ÊéĞÅ¶ªÁË
		AddEventItem(235)
		Msg2Player("NhËn ®­îc bøc th­ nãi râ t×nh h×nh cña «ng l·o v« danh. ")
		AddNote("NhËn ®­îc bøc th­ nãi râ t×nh h×nh cña «ng l·o v« danh. ")
		Talk(1,"","Th­ còng kh«ng cã, ng­¬i lÊy g× ®Ó gi¶i v©y TiÓu Ch©n?")
	elseif (UTask_cy >= 60*256+20) then				-- ÀÏÕßÒÑ¾­ÈÏÊ¶ËıµÄÆäËüÇé¿ö
		Talk(1,"","Ng­¬i kh«ng cÇn ph¶i khuyªn n÷a, suèt ®êi nµy ta sÏ kh«ng rêi cèc.")
	else
		Talk(1,"","Ng­¬i lµ ai? D¸m x«ng v« §o¹n Tr­êng Cèc, muèn chÕt µ?")
		Msg2Player("Nh­ c¶m thÊy søc cña mét ngän nói ®Ì lªn, tr­íc m¾t cña b¹n mäi thø d­êng nh­ ®Òu tan biÕn. ")
		Msg2Player("B¹n bŞ «ng l·o v« danh trong cÊm ®Şa giÕt chÕt råi! ")
		KillPlayer()
	end
end;

function L60_talk1()
	Talk(2,"L60_talk2","N»m ®ã TiÓu TÇn-- còng lµ S­ tæ cña ng­¬i, lµ Tæ s­ s¸ng lËp Thóy Yªn m«n, bŞ ng­êi m×nh yªu bá r¬i nªn ®au khæ mµ tù vÉn. Cßn c¸i kÎ phô t×nh phô nghÜa chİnh lµ ®¹i ca cña ta. TiÓu Ch©n kh«ng cam t©m bŞ bá r¬i, nghe ®­îc tung tİch cña gia m«n ta nªn muèn ®èi diÖn chÊt vÊn sù béi ­íc cña ®¹i ca ta, v« t×nh ph¸t hiÖn ®­îc sù thËt.","Ho¸ ra … ®¹i ca ta vèn cã mét thª tö bŞ bÖnh n»m liÖt gi­êng, do cã h«n ­íc tr­íc. Cßn TiÓu Ch©n sau nµy míi quen biÕt, ban ®Çu huynh Êy muèn tõ h«n nh­ng v× mét lÇn ngoµi ı muèn mµ toµn th©n bŞ b¹i liÖt. §¹i ca kh«ng d¸m më miÖng tõ h«n, ®µnh ph¶i phô lßng TiÓu Ch©n. TiÓu Ch©n sau khi biÕt sù thËt tuy kh«ng biÕt hËn ®¹i ca ta n÷a nh­ng tõ ®ã con tim trë thµnh b¨ng gi¸.")
end;

function L60_talk2()
	Talk(2,"L60_talk3","Cßn ta, võa míi gÆp TiÓu Ch©n kh«ng thÓ kÒm ®­îc lßng m×nh. Tuy yªu nµng Êy, nh­ng ta biÕt m×nh kh«ng xøng ®¸ng. Nµng Êy vµ anh trai ta míi lµ mét ®«i trêi ®Şnh. Ta chØ mong nµng Êy h¹nh phóc vµ kh«ng muèn nh×n nµng ®au khæ. §Ó kÕt nèi anh trai cña ta vµ TiÓu Ch©n, ta ®· lĞn bá thuèc ®éc vµo c¬m cña ®¹i tÈu, nh­ng kh«ng ngê r»ng v× ta nhÊt thêi hå ®å mµ ®· g©y nªn téi lín tµy ®×nh.","Sau khi ®¹i tÈu chÕt th× mÑ c« Êy ®ßi kh¸m tö thi, kÕt qu¶ mäi chuyÖn b¹i lé, ng­êi nhµ c« Êy ®i kiÖn ë quan phñ. Trong lóc ho¶ng sî ®· bŞ ®¹i ca ph¸t hiÖn. §¹i ca v× muèn cøu ta nªn lªn quan phñ ®Çu thó nhËn hÕt téi cña ta, ta vèn gióp anh cña m×nh nh­ng ng­îc l¹i ®· h¹i chÕt anh. Ta ®óng lµ kh«ng b»ng mét con chã. Sau ®ã ta ®em mäi sù thËt nãi víi TiÓu Ch©n.")
end;

function L60_talk3()
	Talk(2,"L60_talk4","ThÕ TiÓu Ch©n... µ kh«ng! S­ tæ cã hËn «ng kh«ng?","Dï cho nµng Êy cã hËn ta nh­ thÕ nµo ®i n÷a, ta còng kh«ng tr¸ch nµng Êy nh­ng ®iÒu lµm cho ta ®au lßng lµ mét c©u tr¸ch cø ta còng kh«ng cã, nµng chØ lÆng lÏ thë dµi, kh«ng nãi víi ta tiÕng nµo. Ta rÊt ®au khæ vµ ®· nãi víi nµng nh÷ng lêi mµ bÊy l©u nay ta gi÷ trong lßng r»ng ta yªu nµng Êy, ta muèn ®­îc ch¨m sãc cho nµng suèt ®êi, bëi v× ta thËt sù yªu nµng!")
end;

function L60_talk4()
	Talk(6,"L60_talk5","Kh«ng ngê sau khi nghe ta nãi nµng kh«ng cã mét biÓu hiÖn g×, chØ nãi duy nhÊt mét c©u: 'Ng­¬i ®i ®i! Ta muèn quªn hÕt c¸c ng­êi'!","ThÕ «ng l·o cã ®i kh«ng?","Ta cßn cã thÓ ®i ®©u ®­îc? Con tim ta ®· trãt trao cho nµng, ta cßn cã thÓ ®i ®©u? T×m ®­îc n¬i nµy, ta ë l¹i ®©y lu«n, hy väng mét ngµy nµng sÏ tha thø cho ta! ","Cã lÏ bµ Êy kh«ng hÒ giËn «ng ®©u, con tim cña bµ Êy ®· chÕt theo ®¹i ca cña ng­êi råi! ","§ªm ®ªm ta ®Òu ®Õn bªn cöa sæ cña nµng van xin nµng tha lçi, cho ®Õn mét ngµy nµng göi cho ta mét bøc th­, trong th­ nãi: '50 n¨m! NÕu ng­¬i cã thÓ ®îi 50 n¨m cã lÏ ta sÏ chÊp nhËn ng­¬i!'","V× lêi høa nµy mµ «ng m·i ®îi ë trong cèc nµy cho ®Õn ngµy h«m nay µ?")
end;

function L60_talk5()
	Talk(3,"L60_talk6","Kh«ng sai! Ta ë trong nµy ngµy chê ®ªm ®îi chØ hy väng mét ngµy nµng chÊp nhËn ta, ®Õn nay, ®Õn nay ta vÉn cßn mong ®îi nµng! Tuy lµ Xu©n H­¬ng kªu ta ®Õn, nµng lµ a hoµn th©n thİch cña TiÓu Ch©n, nh­ vËy cã thÓ nãi TiÓu Ch©n ®· tha thø cho ta! Ng­¬i.... ng­¬i h·y lËp tøc d¾t ta ®i gÆp nµng! ","L·o b¸! ¤ng ®· nhiÒu n¨m råi kh«ng ra khái cèc nªn kh«ng biÒt bªn ngoµi thËt sù ®· thay ®æi, TiÓu Ch©n mµ «ng nãi chİnh lµ s­ tæ cña s­ m«n, ng­êi ®· kh«ng cßn n÷a! ","Ng­¬i nãi c¸i g×? Lµm sao cã thÓ chø? T¹i sao nµng l¹i …Ta khæ së ®îi nµng bao nhiªu n¨m, mµ nµng kh«ng gÆp ta mét lÇn mµ ®· ra ®i, ta kh«ng bao giê ®­îc gÆp nµng n÷a råi, hu hu.....")
end;

function L60_talk6()
	Talk(2,"L60_talk7","L·o b¸! ChuyÖn ®· qua råi xin ®õng qu¸ ®au buån, c¶ ®êi s­ tæ ®· lôy v× t×nh. Ra ®i kh«ng ph¶i lµ mét c¸ch gi¶i tho¸t hay sao? Sinh ly tö biÖt kh«ng ph¶i lµ chuyÖn mµ chóng ta cã thÓ ®Şnh ®­îc. ChØ cÇn t×nh c¶m mµ «ng dµnh cho s­ tæ kh«ng hÒ thay ®æi, th× ng­êi m·i m·i vÉn ë trong lßng «ng, m·i m·i kh«ng rêi nhau.","§· nhiÒu n¨m tr«i qua gièng nh­ lµ mét giÊc m¬, ta vÉn lu«n mong gÆp mÆt nµng, ®Õn h«m nay biÕt ®­îc nµng ®· chÕt, tr¸i l¹i ta nh­ trót ®­îc g¸nh nÆng trong lßng! ")
end;

function L60_talk7()
	Talk(4,"L60_talk8","ChØ ®¸ng tiÕc! Ng­êi kh¸c kh«ng biÕt sù thËt, cßn cho r»ng S­ tæ lµ mét ng­êi l¹nh lïng v« t×nh! ","Mäi ng­êi ®· hiÓu lÇm TiÓu Ch©n råi, nÕu nh­ nµng ta lµ mét ng­êi tuyÖt t×nh th× ta còng sÏ kh«ng ë n¬i ®©y. Ng­êi ®êi chØ biÕt mét mµ kh«ng biÕt hai, ®· ®ån ®¹i kh«ng ®óng lµm h¹i cho ng­êi tèt. Ta ë ®©y vÉn cßn l­u gi÷ nh÷ng bøc th­ mµ khi ®ã TiÓu Ch©n ®· viÕt cho ta, ng­¬i ®em nh÷ng bøc th­ nµy giao cho Ch­ëng m«n, mäi ng­êi xem xong th× sÏ râ ch©n t­íng sù viÖc! ","ThÕ th× tèt qu¸! Sau nµy l·o cã dù ®Şnh g× kh«ng?","TiÓu Ch©n ®· chÕt råi, c¶ ®êi nµy ta sÏ kh«ng rêi khái cèc!")
end;

function L60_talk8()
	SetTask(6,60*256+20)
	DelItem(237)
	AddEventItem(235)
	Talk(1,"","NÕu ®· nh­ thÕ l·o b¸ xin b¶o träng, v·n bèi xin c¸o tõ! ")
end;
