-- ÑïÖİ Â·ÈËNPC ÈçÒâ£¨ÈëÃÅÈÎÎñ£©
-- by£ºDan_Deng(2003-07-28)

function main()
	Uworld30 = GetByte(GetTask(30),2)
	if (Uworld30 == 10) and (HaveItem(74) == 0) then		--ÈëÃÅÈÎÎñÖĞ²¢ÇÒÃ»ÓĞ¸ÃÎïÆ·
		Say("Ph¶i khen thÕ nµo ®©y?",4,"T­íng m¹o /prise_1","Häc thøc /prise_2","B¹n bÌ /prise_3","Rêi khái/prise_exit")
	else					--ÔÚÆÕÍ¨¶Ô»°ÖĞ¸øÒ»µãµãÈÎÎñÌáÊ¾¡£
		i = random(0,2)
		if (i == 0) then
			Talk(1,"","§µn «ng tõ 8 tuæi trë lªn, 80 tuæi trë xuèng ®Òu quú mäp tr­íc s¾c ®Ñp cña bæn c« n­¬ng!")
		elseif (i == 1) then
			Talk(1,"","TiÓu n÷ tuy v« ®µi nh­ng l¹i cã ®øc")
		else
			Talk(1,"","V× sao hä lu«n ghen ghĞt s¾c ®Ñp cña ta? LÏ nµo ®Ñp còng lµ c¸i téi hay sao?")
		end
	end
end;

function prise_1()
--	if (GetSex() == 1) then		--ÈôÍæ¼Ò½ÇÉ«ÊÇÅ®ĞÔ£¬¶Ô»°Ó¦¸ÃĞŞ¸Ä¡£ÏÈÁô³ö½Ó¿Ú£¬¾ßÌåµÄÑÔ´ÊÒÔºóÔÙ¸Ä¡£
--		Talk(4,"","Íæ¼Ò£ºÕâÎ»¹ÃÄïÃ¼Èç´äÓğ£¬¼¡Èç°×Ñ©£¬ÑüÈçÊøËØ£¬³İÈçº¬±´¡£ÔöÖ®Ò»·ÖÔòÌ«³¤£¬¼õÖ®Ò»·ÖÔòÌ«¶Ì¡£Öø·ÛÔòÌ«°×£¬Ê©ÖìÔòÌ«³à¡£µ±ÕæÓĞÎ÷Ê©Ö®Ã²£¬¹óåúÖ®Èİ°¡£¡","Å®×Ó£ºÄãÕæÓĞÑÛ¹â£¬¹ÃÄïÎÒºÅ³ÆÑïÖİµÚÒ»ÃÀÈË£¬°ËËêÒÔÉÏ£¬°ËÊ®ËêÒÔÏÂ£¬Ö»ÒªÊÇÄĞÈË£¬Ã»ÓĞ²»°İµ¹ÔÚ±¾¹ÃÄïµÄÈ¹ÏÂµÄ£¡","Íæ¼Ò£ºÎÒÕæÊÇÈÙĞÒ£¬¾¹ÄÜ¼ûÊ¶µ½ÑïÖİµÚÒ»ÃÀÅ®£¬²»Öª¹ÃÄïÄÜ·ñËÍÎÒÒ»ÌõÊÖÅÁ£¬ÈÃÎÒ¼ûÅÁÈç¼ûÈË£¬ÓÀÔ¶¼Ç×¡¹ÃÄïµÄÃÀÃ²£¿","Å®×Ó£ºÕâÓĞºÎÄÑ£¿")
--	else
		Talk(4,"","VŞ c« n­¬ng nµy mµi nh­ phØ thóy, da tr¾ng nh­ tuyÕt, r¨ng tr¾ng nh­ ngäc kh«ng thua kĞm g× T©y Thi, Quı Phi!","Ng­¬i thËt biÕt nh×n, bæn c« n­¬ng hiÖu x­ng lµ D­¬ng Ch©u ®Ö nhÊt mü nh©n. §µn «ng tõ 8 tuæi trë lªn,80 tuæi trë xuèng ®Òu quú mäp d­íi ch©n bæn c« n­¬ng!","Ta qu¶ thËt vinh h¹nh, cuèi cïng còng cã thÓ chiªm ng­ìng vÎ ®Ñp cña ®Ö nhÊt mü nh©n D­¬ng Ch©u. Ch¼ng hay c« n­¬ng cã thÓ tÆng ta 1 chiÕc kh¨n tay? Ta muèn nh×n kh¨n nh­ nh×n thÊy ng­êi, m·i m·i ghi nhí nĞt xinh ®Ñp mü miÒu cña c« n­¬ng!","VËy cã g× khã?")
--	end
	AddEventItem(74)
	Msg2Player("Th­ Sinh tÆng b¹n chiÕc qu¹t ")
	AddNote("§­îc tÆng mét miÕng Thñ Ph¸ch. ")
end;

function prise_2()
	Talk(2,"","VŞ c« n­¬ng nµy khİ chÊt thanh khiÕt, ch¾c lµ con nhµ tr©m anh thÕ kiÖt, häc vÊn uyªn th©m! ThËt lµ 1 n÷ trung Tr¹ng nguyªn.","TiÓu n÷ kh«ng cã tµi th× còng cã ®øc. Ch÷ nghÜa th× lµm ®­îc g×? ChØ giµu sang phó quı lµ ®­îc råi!")
end;

function prise_3()
	Talk(2,"","VŞ c« n­¬ng nµy thËt dÔ mÕn! Ch¾c c« n­¬ng cã rÊt nhiÒu b»ng h÷u?","Hõ! Bän hä ®è kş ta xinh ®Ñp h¬n hä nªn ta míi kh«ng kÕt b¹n víi hä th«i!")
end;

function prise_exit()
end;
