-- Ï´Ç±ÄÜµÄµÀÊ¿.lua £¨Ò©Íõ¹È£¬õËµÀÈË£©
-- By Dan_deng(2004-01-06)
-- ±äÁ¿£ºGetTask(92): Ï´¹ıµÄ´ÎÊı£¨Ä¿Ç°×î¶à5´Î£©
--			GetTaskTemp(8)£ºÔİ´æÏ´Ç±ÄÜ¼Û¸ñ
--			GetTaskTemp(50): ÊÇ·ñÓÃ±¦Ê¯Ï´µÄ
-- Update: Dan_Deng(2004-05-24) Ãû¾Ô±¼»ğÈÎÎñ (Uworld76 = GetTask(76))
-- Update: Dan_Deng(2004-05-27) Ğ¡¶ùÊ§×ÙÈÎÎñ (Uworld42 = GetTask(42))

function main()
	Uworld92 = GetTask(92)
	Uworld76 = GetTask(76)
	Uworld42 = GetTask(42)
	if (Uworld76 == 30) then    -- Ãû¾Ô±¼»ğÈÎÎñ£ºÕÒµ½õËµÀÈË£¬ÈÎÎñ½øĞĞÖĞ
		if (HaveItem(393) == 1) then
			Talk(11,"W76_step","§¹o tr­ëng! Chóng ta l¹i gÆp mÆt råi","T×m ta cã viÖc g×? ","ë ®©y cã 1 bøc th­, ng­êi xem xong råi nãi. ","Ah! Thø lçi cho bÇn ®¹o ®· xem th­êng","Th× ra lµ th­ cña l·o V­¬ng, ®¸ng tiÕc bÇn ®¹o ®ang v­íng bËn viÖc riªng, t¹m thêi kh«ng rêi khái ®©y ®­îc","VËy th× ph¶i lµm sao ®©y? Ta ®· vç ngùc ch¾c ch¾n tr­íc mÆt ®¹i l·o gia. ","§ã lµ lêi høa cña ng­¬i! Liªn quan g× ®Õn bÇn ®¹o! ","§¹o tr­ëng nì lßng nµo thÊy chÕt kh«ng cøu! VËy ……… ","Ha ha! Ta chØ ®ïa víi ng­¬i th«i. BÇn ®¹o ®©y tuy kh«ng ®i ®­îc, nh­ng ng­¬i cã thÓ ®i. Tr­íc hÕt ng­¬i h·y ®i t×m lÊy 3 vËt,®ã chİnh lµ r¨ng ¸nh ®iÖn, n­íc nhiÔm phÌn vµ c¸nh b¹ch v©n. C¸c thø ®ã lµ thuèc pha chÕ, kÕt hîp víi thÇn d­îc cña bÇn ®¹o cã thÓ gi¶i ®­îc chøng mÊt søc.","TiÓu tö hµnh tÈu giang hå, nhiÒu lóc còng c¶m thÊy lao lùc, ®©y ch¼ng ph¶i lµ ph­¬ng ph¸p ®Ó ch÷a trŞ sao?","§óng vËy! §Õn lóc ®ã bÇn ®¹o sÏ truyÒn cho ng­¬i håi thÓ kú thuËt nµy, ng­¬i lÇn nµy xem nh­ võa cøu ng­êi võa tù cøu, chØ lµ 3 lo¹i d­îc pha chÕ kh«ng dÔ cã ®­îc, ph¶i nhanh chãng t×m kiÕm. ","§¹o tr­ëng an t©m!")
		else
			Talk(2,"","Ng­¬i nãi l·o Bµnh nhê ta gióp ®ì, vËy tİn vËt ®©u? İt nhÊt còng ph¶i cã lÊy 1 bøc th­ chø?","¤ng ®õng trîn trßn m¾t nh­ vËy, ta sÏ quay vÒ nhê Bµnh ®¹i l·o gia viÕt ngay 1 bøc cho «ng ®©y. ")
   	end
	elseif (Uworld76 == 40) then
		if (HaveItem(370) == 1) and (HaveItem(371) == 1) and (HaveItem(372) == 1) then
			Talk(6,"W76_end","§¹o tr­ëng! Nh÷ng thø «ng cÇn ta ®Òu ®· chuÈn bŞ ®ñ","….","Kh«ng ngê ng­¬i thËt sùc cã b¶n lÜnh nh­ vËy. HuyÕt Dòng hoµn ®©y,mau mau mang®i!","Ch¼ng ph¶i cßn Håi ThÓ thuËt sao?","C¸i g× håi thÓ hay kh«ng håi thÓ? Kh«ng hiÓu râ. ","Th«i thÕ còng ®­îc! §¹o tr­ëng kh«ng chŞu truyÒn thô tøc cã lı do bÊt tiÖn, nÕu cøu ®­îc tuÊn m·, häc hay kh«ng häc ®­îc vâ c«ng th× cã quan träng g× ®©u")
		else
			Talk(1,"","3 lo¹i d­îc liÖu ®ã lµ: r¨ng ¸nh ®iÖn, n­íc nhiÔm phÌn vµ c¸nh b¹ch v©n. Ng­¬i ph¶i nhanh lªn, nÕu kh«ng bÖnh t×nh trÇm träng th× kh«ng liªn quan ®Õn bÇn ®¹o ®©y!")
		end
	elseif (Uworld76 == 50) and (HaveItem(375) == 0) then			-- Ãû¾Ô±¼»ğÈÎÎñ£ºÑªÓÂÍè¶ªÁË
		SetTask(76,40)
		Talk(1,"","HuyÕt Dòng hoµn ®¸nh r¬i råi? VËy ta còng kh«ng cã c¸ch nµo kh¸c, ng­¬i ph¶i l¹i t×m kiÕm 3 lo¹i d­îc liÖu")
	elseif (Uworld42 == 10)  then  								-- Ğ¡¶ùÊ§×ÙÈÎÎñ£ºÈ¥É±Ê®Ãû´©É½
		Talk(4,"","§¹o tr­ëng! Xin hái «ng cã biÕt vô ¸n mÊt tİch trÎ con ë §¹i Lı? ","ThÕ gian nµy ®· tr¾ng ®en ®iªn ®¶o, lßng ng­êi thay ®æi l©u råi. Ng­¬i hµ tÊt ®i lo nhiÒu chuyÖn kh«ng liªn can? ","Ng­êi kh¸c lµm g× th× mÆc ng­êi kh¸c, ta th× cã c¸ch hµnh sù riªng cña ta. Kh«ng lÏ nh×n tr¨m hé ngµn nhµ ngµy ngµy dïng n­íc m¾t röa mÆt lµ chİnh ®¹o sao","Kh«ng ngê vÉn cßn ng­êi cøng ®Çu nh­ ng­¬i. D­îc V­¬ng ®éng cã rÊt nhiÒu tªn Xuyªn S¬n rÊt ®¸ng ghĞt. Ng­¬i ®i giÕt 10 tªn, nÕu cßn m¹ng quay trë l¹i ®©y th× ta sÏ nghe ng­¬i nãi chuyÖn. ")
		SetTask(42,20)
		AddNote("NhiÖm vô trÎ con mÊt tİch: §¹o nh©n quÌ cÇn b¹n ®Õn D­îc V­¬ng ®éng giÕt chÕt 10 tªn s¬n tÆc ")
		Msg2Player("NhiÖm vô trÎ con mÊt tİch: §¹o nh©n quÌ cÇn b¹n ®Õn D­îc V­¬ng ®éng giÕt chÕt 10 tªn s¬n tÆc ")
	elseif (Uworld42 == 30) then									-- Ğ¡¶ùÊ§×ÙÈÎÎñ£ºÍê³É×ÓÈÎÎñ
		Talk(1,"","ChuyÖn nµy ta còng kh«ng gióp ®­îc g×! Nh­ng ta cã 1 ng­êi b¹n biÖt hiÖu lµ V« Danh T¨ng, nÕu ng­¬i t×m gÆp ®­îc l·o ta, ch¾c ch¾n mäi viÖc ®Òu râ rµng")
		SetTask(42, 40)
		AddNote("TiÕp nhËn nhiÖm vô: §i t×m V« danh T¨ng ®Ó hái tin tøc vÒ viÖc trÎ con mÊt tİch ")
		Msg2Player("TiÕp nhËn nhiÖm vô: §i t×m V« danh T¨ng ®Ó hái tin tøc vÒ viÖc trÎ con mÊt tİch ")
	elseif (GetItemCountEx(353) >= 1) then				-- Ï´Ç±ÄÜ£ºÓÃ±¦Ê¯Ï´
		Say("Tinh Hång b¶o th¹ch? Ta còng ®ang ®Şnh t×m vµi viªn ®©y. Nh­ vÇy ®i,ta sÏ gióp ng­¬i c¶i t¹o kinh m¹ch ®Ó ®æi viªn Tinh hång b¶o th¹ch cña ng­¬i",3,"Häc chø!/tuneprop_jewel","Kh«ng høng thó /no","Tinh Hång B¶o th¹ch cÇn dïng vµo viÖc kh¸c, dïng tiÒn ®Ó nhê ng­¬i gióp ta c¶i t¹o kinh m¹ch cã ®­îc kh«ng? /sele3")
	elseif (GetLevel() >= 50) then			-- and ((GetCamp() == 0) or (GetCamp()== 4)) then		-- Ï´Ç±ÄÜµÄ»ù±¾ÒªÇó£º¹ı50¼¶£¬ºìÃû»ò°×Ãû£¨²»ÔÙÏŞÖÆÕóÓª£©
		if (Uworld92 == 0) then			-- Ã»Ï´¹ı
			Talk(1,"tuneprop_get","C¶i t¹o kinh m¹ch gióp ng­¬i? Lµ ai nhiÒu chuyÖn b¶o ng­¬i ®Õn t×m ta vËy?")
		elseif (Uworld92 < 5) then		-- Ï´¹ı´ÎÊıÎ´µ½ÉÏÏŞ
			Talk(1,"tuneprop_get","¡n qua mét lÇn ngät ngµo ban ®Çu th× m·i m·i kh«ng quªn. Ta ph¶i c¶nh b¸o ng­¬i, mçi lÇn c¶i t¹o kinh m¹ch còng ®Òu tæn thÊt thÓ khİ cña ng­¬i, chuyÖn nµy kh«ng ph¶i tïy ı l¹m dông ®­îc ®©u. ")
		elseif (Uworld92 >= 5) then		-- Ï´¹ı´ÎÊı´ïµ½ÉÏÏŞ
			Talk(1,"","Sè lÇn ta gióp ng­¬i c¶i t¹o kinh m¹ch ®· qu¸ nhiÒu, hiÖn nay thÓ khİ cña ng­¬i ®· khuyÕt, nÕu tiÕp tôc c¶i t¹o kinh m¹ch n÷a ch¾c ch¾n sÏ gÆp nh÷ng nguy hiÓm kh«ng l­êng. ChuyÖn nµy ta thËt kh«ng d¸m lµm, ng­¬i h·y ®i t×m cao nh©n kh¸c vËy!")
		else										-- ÒâÍâ´íÎó£¬ÈÃÍæ¼ÒÕÒGM±¨BUG
			Talk(1,"","Ta xem ng­¬i thÇn s¾c ¶m ¹m, ¸m khİ ®Çy mÆt, sÏ bŞ ®¹i n¹n trong nay mai. Ng­¬i b©y giê ®õng nªn t×m ta, nhanh chãng ®i t×m <color=red>Thiªn thÇn<color> ®i!")
		end
	elseif (Uworld76 == 50) then
		Talk(1,"B¶ §¹o nh©n: ngµy nay thÒ sù ®¶o lo¹n, nh÷ng ng­êi cã ®­îc lßng nhiÖt huyÕt nh­ tiÓu huynh ®Ö ®©y kh«ng ph¶i lµ nhiÒu")			
	else
		Talk(1,"","Trong D­îc V­¬ng ®éng b¸ch th¶o phong phó, qu¶ thùc lµ 1 n¬i tèt. T©y b¾c hoang nguyªn mµ còng cã ®­îc 1 n¬i nh­ vËy, ®ñ thÊy ®­îc sù diÖu kú cña thÕ gian, sù tuyÖt vêi cña t¹o hãa. ")
	end
end

function sele3()
	Talk(2,"","Ng­¬i t­ëng gióp ng­êi kh¸c c¶i t¹o kinh m¹ch lµ c«ng viÖc nhÑ nhµng µ? Ta ph¶i tèn rÊt nhiÒu søc lùc, xong viÖc l¹i ph¶i mÊt thêi gian rÊt dµi ®Ó tÜnh d­ìng! Viªn Tinh Hång b¶o th¹ch cña ng­¬i cã thÓ gióp ta kh«i phôc nguyªn khİ!","NÕu kh«ng cho xem th× th«i vËy, râ rµng ®· mang ra cho ta nh×n thÊy råi, vËy mµ cßn tiÕc kh«ng d¸m ®em 1 viªn Tinh Hång b¶o th¹ch ra! VËy mµ cßn muèn ta gióp ng­¬i c¶i t¹o kinh m¹ch sao? Hõm! Th«i®õng nghÜ ®Õn n÷a!")
end

function W76_step()
	DelItem(393)
	SetTask(76,40)
	Msg2Player("§¹o nh©n quÌ nãi víi ng­¬i, muèn trŞ bÖnh nµy, ph¶i cÇn r¨ng ¸nh ®iÖn, n­íc nhiÔm ®á vµ c¸nh b¹ch v©n 3 lo¹i thuèc pha chÕ ")
	AddNote("§¹o nh©n quÌ nãi víi ng­¬i, muèn trŞ bÖnh nµy, ph¶i cÇn r¨ng ¸nh ®iÖn, n­íc nhiÔm ®á vµ c¸nh b¹ch v©n 3 lo¹i thuèc pha chÕ ")
end

function W76_end()                                   -- Ãû¾Ô±¼»ğÈÎÎñ½áÊø
	Talk(1,"","Kh«ng ngê l¹i cã ng­êi nhiÖt huyÕt ®¹o nghÜa nh­ ng­¬i, truyÒn l¹i cho nhµ ng­¬i còng kh«ng ph¶n l¹i s­ ®¹o! ")
	DelItem(370)                  -- Ê§È¥ÉÁµçÖ®ÑÀ
	DelItem(371)                  -- Ê§È¥µ¤ÔóÖ®Ë®
	DelItem(372)                  -- Ê§È¥°×ÔÆÖ®Òí
	AddEventItem(375)                  -- µÃµ½ÑªÓÂÍè
	AddMagic(396)          -- Ñ§»á¡°´º·çÓêÂ¶¡±
	SetTask(76,50)
	Msg2Player("§­a c¸c thuèc pha chÕ ®ã cho ®¹o nh©n quÌ, lÊy ®­îc HuyÕt Dòng §¬n, ®ång thêi häc ®­îc kü n¨ng  Xu©n Phong Vò Lé ")
	AddNote{"B¶ §¹o nh©n c¶m kİch lßng nhiÖt huyÕt cña b¹n, ®· truyÒn thô cho b¹n HuyÕt Dòng hoµn vµ 'Vò lé Trïng sinh', h·y mau ®i cøu trŞ B«n Háa ®i! "}
end

function tuneprop_get()				-- ½ÓÈÎÎñ
	pay_money = {20,40,60,80,100}		-- ¶¨Òå¼Û¸ñ£¬Êµ¼ÊÊ¹ÓÃÊ±Òª*10000
	i = (GetTask(92) + 1)
	SetTaskTemp(8,pay_money[i]*10000)
	SetTaskTemp(50,0)
	Say("Thµnh thËt, sè tiÒn İt ái nµy ®Ó kİnh l·o §¹o tr­ëng míi ®­îc. "..GetTaskTemp(8).."§ã kh«ng ph¶i lµ con sè nhá, ta ph¶i ®i kiÕm míi ®­îc. ",2,"Coi nh­ ng­¬i còng cã tÊm lßng ®ã, th«i ®­îc, ng­¬i muèn trŞ khái phÇn nµo? /tuneprop_go","Søc m¹nh /no")
end

function tuneprop_jewel()
	SetTaskTemp(50,1)			-- Ê¹ÓÃ±¦Ê¯
	SetTaskTemp(8,0)			-- Ãâ·Ñ
	tuneprop_go()
end

function tuneprop_go()
	pay_money = GetTaskTemp(8)
	if (GetCash() >= pay_money) then
		Say("Th©n ph¸p ",5,"Søc m¹nh/tune_str","Th©n ph¸p/tune_dex","ViÖc nµy. ta cßn ph¶i vÒ suy nghÜ l¹i /tune_vit","Néi c«ng/tune_eng","Søc lùc cña ng­¬i ®· ®Õn møc cao nhÊt råi, vÉn cßn ch­a võa ı sao? ThÕ th× qu¶ thùc ta còng hÕt c¸ch.  /no")
	else
		Talk(1,"","ThËt ra kh«ng cã tiÒn còng kh«ng sao, dï sao ng­¬i vÉn lµ mét h¶o h¸n!")
	end
end

function tune_str()
	base_str = {35,20,25,30,20}			-- ÎåĞĞÈËÎïµÄÌìÉúÁ¦Á¿£¬Ï´Ç±ÄÜÊ±²»ÔÊĞíµÍÓÚ´ËÖµ
	i = GetSeries() + 1
	if (GetStrg(1) < base_str[i] + 5) then		-- Ï´ÍêºóÁ¦Á¿»áµÍÓÚÌìÉúÁ¦Á¿£¬²»ÔÊĞíÏ´
		Talk(1,"","Søc lùc cña ng­¬i ®· ®Õn møc cao nhÊt råi, ng­¬i vÉn cßn ch­a võa ı sao? ThÕ th× qu¶ thùc ta còng hÕt c¸ch!")
	else											-- ¿ªÊ¼Ï´Ç±ÄÜ£¬Íê³Éºó×Ô¶¯ÌßÏÂÏß
		AddStrg(-5)
		check_jewel()			-- ¼ì²éÊÇ·ñĞèÒªÏûºÄ±¦Ê¯£¬»òÊÇ¿ÛÇ®¼ÆÏ´Ç±ÄÜ´ÎÊı
		Say("§­îc råi! Theo ı ng­¬i vËy! Ta mÖt chÕt ®i ®­îc! §Ó ta nghØ ng¬i mét l¸t nhĞ!",1,"§a t¹ /no")
	end
end

function tune_dex()
	base_dex = {25,35,25,20,15}
	i = GetSeries() + 1
	if (GetDex(1) < base_dex[i] + 5) then		-- Ï´ÍêºóÉí·¨»áµÍÓÚÌìÉúÉí·¨£¬²»ÔÊĞíÏ´
		Talk(1,"","Søc lùc cña ng­¬i ®· ®Õn møc cao nhÊt råi, ng­¬i vÉn cßn ch­a võa ı sao? ThÕ th× qu¶ thùc ta còng hÕt c¸ch!")
	else											-- ¿ªÊ¼Ï´Ç±ÄÜ£¬Íê³Éºó×Ô¶¯ÌßÏÂÏß
		AddDex(-5)
		check_jewel()			-- ¼ì²éÊÇ·ñĞèÒªÏûºÄ±¦Ê¯£¬»òÊÇ¿ÛÇ®¼ÆÏ´Ç±ÄÜ´ÎÊı
		Say("§­îc råi! Theo ı ng­¬i vËy! Ta mÖt chÕt ®i ®­îc! §Ó ta nghØ ng¬i mét l¸t nhĞ!",1,"§a t¹ /no")
	end
end

function tune_vit()
	base_vit = {25,20,25,30,25}
	i = GetSeries() + 1
	if (GetVit(1) < base_vit[i] + 5) then		-- Ï´ÍêºóÍâ¹¦»áµÍÓÚÌìÉú£¬²»ÔÊĞíÏ´
		Talk(1,"","Søc lùc cña ng­¬i ®· ®Õn møc cao nhÊt råi, ng­¬i vÉn cßn ch­a võa ı sao? ThÕ th× qu¶ thùc ta còng hÕt c¸ch!")
	else											-- ¿ªÊ¼Ï´Ç±ÄÜ£¬Íê³Éºó×Ô¶¯ÌßÏÂÏß
		AddVit(-5)
		check_jewel()			-- ¼ì²éÊÇ·ñĞèÒªÏûºÄ±¦Ê¯£¬»òÊÇ¿ÛÇ®¼ÆÏ´Ç±ÄÜ´ÎÊı
		Say("§­îc råi! Theo ı ng­¬i vËy! Ta mÖt chÕt ®i ®­îc! §Ó ta nghØ ng¬i mét l¸t nhĞ!",1,"§a t¹ /no")
	end
end

function tune_eng()
	base_eng = {15,25,25,20,40}
	i = GetSeries() + 1
	if (GetEng(1) < base_eng[i] + 5) then		-- Ï´ÍêºóÄÚ¹¦»áµÍÓÚÌìÉú£¬²»ÔÊĞíÏ´
		Talk(1,"","Søc lùc cña ng­¬i ®· ®Õn møc cao nhÊt råi, ng­¬i vÉn cßn ch­a võa ı sao? ThÕ th× qu¶ thùc ta còng hÕt c¸ch!")
	else											-- ¿ªÊ¼Ï´Ç±ÄÜ£¬Íê³Éºó×Ô¶¯ÌßÏÂÏß
		AddEng(-5)
		check_jewel()			-- ¼ì²éÊÇ·ñĞèÒªÏûºÄ±¦Ê¯£¬»òÊÇ¿ÛÇ®¼ÆÏ´Ç±ÄÜ´ÎÊı
		Say("§­îc råi! Theo ı ng­¬i vËy! Ta mÖt chÕt ®i ®­îc! §Ó ta nghØ ng¬i mét l¸t nhĞ!",1,"§a t¹ /no")
	end
end

function check_jewel()
	if (GetTaskTemp(50) == 1) then			-- ÊÇ±¦Ê¯Ï´µÄ
		DelItemEx(353)
	else
		Pay(GetTaskTemp(8))
		SetTask(92,GetTask(92)+1)
	end
	SetTaskTemp(50,0)			-- ¸´Î»ÁÙÊ±±äÁ¿
	SetTaskTemp(8,0)
	return
end

function no()
end
