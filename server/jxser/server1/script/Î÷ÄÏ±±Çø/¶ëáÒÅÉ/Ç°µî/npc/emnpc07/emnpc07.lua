--description: ¶ëáÒÅÉÃîÒş 
--author: yuanlan	
--date: 2003/3/4
--update: Dan_Deng(2003-07-22), ¼ÓÈëÃÅÅÉÈÎÎñµÄµÈ¼¶ÒªÇó
-- Update: Dan_Deng(2003-08-12)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_em = GetTask(1)
--	player_Faction = GetFaction()
	if (GetSeries() == 2) and (GetFaction() == "emei") then
		if (UTask_em == 10*256) and (GetLevel() >= 10) then		--10¼¶ÈÎÎñÆô¶¯
			Talk(5,"L10_talk2", "PhËt Tæ! §Ö tö cã téi, xin h·y trõng ph¹t ®Ö tö, ®õng gi¸ng téi cho huynh Êy....", "S­ tû, xem tû ®uém nĞt u sÇu, cã chuyÖn g× kh«ng?", "Nãi ra dµi l¾m -- Tr­íc khi ta xuÊt gia ®Çu PhËt, ®· tõng cã mét gia ®×nh h¹nh phóc ngËp trµn. Nµo ngê cuéc chiÕn Tèng Kim næ ra, t­íng c«ng ta bŞ l«i ra chiÕn tr­êng lµm Tr¸ng §inh. Chµng ra ®i nhiÒu n¨m nh­ng kh«ng cã tin tøc g×!", "VÒ sau cã tin chµng ®· tö trËn n¬i chiÕn tr­êng. Ta v« cïng ®au khæ, xuèng tãc lµm ni c«, ®Şnh sèng cuéc sèng ®¹m b¹c trong qu·ng ®êi tµn. Nµo ngê, t­íng c«ng ta vÉn cßn sèng!", "Sau khi chµng trë vÒ, ®au khæ khÈn thiÕt mong ta hoµn tôc. Nh­ng, ta ®· ph¸t nguyÖn n­¬ng nhê cöa PhËt, sao cã thÓ v× chuyÖn luyÕn ¸i hång trÇn mµ quay l­ng l¹i víi PhËt Tæ? Ta thËt cã téi! ")
		elseif (UTask_em == 10*256+20) and (HaveItem(18) == 0) then			-- Í­¾µ¶ªÁË
			AddEventItem(18)
			Talk(1,"","¸i da! C¸i tªn tiÓu quû nµy, nöa mÆt g­¬ng ®ång ta ch­a lÊy ®· ch¹y mÊt!")
			Msg2Player("NhËn ®­îc nöa m¶nh g­¬ng ®ång. ")
		elseif ((UTask_em == 10*256+60) and (HaveItem(20) == 1)) then					--µÃµ½ĞŞ¸´ºÃµÄÍêÕûÍ­¾µ
			Talk(2, "", "S­ tû, nh×n xem! G­¬ng ®ång ®· söa xong! G­¬ng vì l¹i lµnh, nÕu PhËt Tæ biÕt tÊm ch©n t×nh cña phu phô tû, nhÊt ®Şnh sÏ kh«ng tr¸ch tû ®©u!", "§a t¹ s­ muéi! H·y gióp ta mang tÊm g­¬ng ®ång trao cho t­íng c«ng. Nh¾n víi chµng nÕu b»ng lßng ®îi ta 3 n¨m. 3 n¨m sau ta nhÊt ®Şnh trë vÒ bªn chµng. Trong 3 n¨m ta ph¶i chuyªn t©m tu hµnh ®Ó cÇu xin PhËt Tæ tha thø.")
			SetTask(1,10*256+70)
			AddNote("Quay vÒ Nga Mi nhËn nhiÖm vô cña DiÖu Èn phã th¸c, ®em g­¬ng ®ång trao cho t­íng c«ng bµ ta. ")
			Msg2Player("Quay vÒ Nga Mi nhËn nhiÖm vô cña DiÖu Èn phã th¸c, ®em g­¬ng ®ång trao cho t­íng c«ng bµ ta. ")
		elseif ((UTask_em == 10*256+70) and (HaveItem(20) == 0)) then		-- ÈÎÎñÖĞ£¬Í­¾µ¡°ÓÖ¡±¶ªÁË
			AddEventItem(20)
			Talk(1,"","DiÖu Èn:TiÓu quû µ! Quªn cÇm g­¬ng ®ång råi!")
		elseif (UTask_em == 10*256+80) then
			Talk(2,"L10_prise","G­¬ng ®ång ®· giao cho t­íng c«ng tû, ®¹i ca nãi sÏ m·i m·i ®îi tû trë vÒ!", "S­ muéi! Ta thËt kh«ng biÕt ph¶i c¶m ¬n muéi thÕ nµo!")
		else   					--ÒÑ¾­Íê³É10¼¶ÈÎÎñ£¨È±Ê¡¶Ô»°£©
			Talk(1,"","S­ muéi! Ta thËt kh«ng biÕt ph¶i c¶m ¬n muéi thÕ nµo!")
		end
	elseif (UTask_em >= 70*256) then								--ÒÑ¾­³öÊ¦
		Talk(1,"","Muéi ph¶i h¹ s¬n sao? H·y chó ı b¶o träng.")
	else
		Talk(1,"","PhËt Tæ! §Ö tö cã téi, xin h·y trõng ph¹t ®Ö tö, ®õng gi¸ng téi cho huynh Êy....")
	end
end;

function L10_talk2()
	Talk(3,"L10_get","S­ tû! §õng tù tr¸ch m×nh! Cã tr¸ch h·y tr¸ch chuyÖn ®êi ngang tr¸i, t¹o hãa trªu ng­êi.", "NÕu ta kh«ng hoµn tôc, chµng sÏ kh«ng chŞu rêi khái Nga Mi. Chµng nãi ngµy ngµy sÏ ®øng d­íi nói ®îi ta, mong ta håi t©m chuyÓn ı. Ta ph¶i lµm sao ®©y? Lßng ta rèi nh­ t¬ vß!", "S­ tû, t©m ı s­ tû rèt cuéc lµ thÕ nµo? Tû cßn yªu t­íng c«ng kh«ng?")
end;

function L10_get()
	Say("NÕu t×nh duyªn kiÕp nµy ®· ®Şnh s½n nh­ thÕ, ta lµm sao d¸m c­ìng l¹i? N¨m x­a khi chµng tßng qu©n, ®· tõng chia m¶nh g­¬ng lµm 2 m¶nh ®Ó lµm tİn vËt cho ngµy sau gÆp l¹i, lÏ nµo g­¬ng vì l¹i lµnh sao?", 2, "§Ó ta thö xem. /L10_get_yes", "Kh«ng cã c¸ch/L10_get_no")
end;

function L10_get_yes()
	Talk(1, "select1", "G­¬ng vì ch­a nèi kh«ng thÓ nµo lµnh ®­îc! Tû h·y ®­a <color=Red>nöa m¶nh g­¬ng ®ång <color> cho muéi. Muéi ®Õn <color=Red>Thµnh §«<color> t×m <color=Red> Thî rÌn<color> thö xem cã c¸ch nµo kh«ng!")
end;

function select1()
	Talk(1,"","Cã thËt ®­îc kh«ng? Tèt l¾m!<color=Red>nöa m¶nh g­¬ng kia<color> ë chç <color=Red>t­íng c«ng<color> ta. Chµng ®ang ë <color=Red>trong rõng c©y<color> d­íi ch©n nói.")
	AddEventItem(18)
	Msg2Player("NhËn nhiÖm vô cña DiÖu Èn Nga Mi ph¸i, nhËn ®­îc nöa m¶nh g­¬ng ®ång. ")
	SetTask(1,10*256+20)
	AddNote("GÆp ni c« DiÖu Èn ë ch¸nh ®iÖn (273, 311) , tiÕp nhËn <color=Red>nhiÖm vô g­¬ng ®ång<color>. NhËn nöa m¶nh g­¬ng ®ång. ")
end;

function L10_get_no()
end;

function L10_prise()
	SetRank(14)
	SetTask(1,20*256)
--	AddMagic(77)
--	AddMagic(79)
	add_em(20)			-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
	Msg2Player("Chóc mõng b¹n! B¹n ®­îc th¨ng lµm Vò Y Ni, häc ®­îc Nga Mi kiÕm ph¸p, Nga Mi ch­ëng ph¸p. ")
	AddNote("Quay vÒ Nga Mi ph¸i, phôc mÖnh DiÖu Èn, hoµn thµnh nhiÖm vô g­¬ng ®ång. ")
end;
