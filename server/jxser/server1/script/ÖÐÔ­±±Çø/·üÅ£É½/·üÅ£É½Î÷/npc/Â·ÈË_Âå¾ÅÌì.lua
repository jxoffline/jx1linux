-- ÖĞÔ­±±Çø ·üÅ£É½ ·üÅ£É½Î÷ Â·ÈË_Âå¾ÅÌì.lua¡¡£¨È­ÇãÌìÏÂÈÎÎñ(Ò°ÇòÈ­ÈÎÎñ)£©
-- By: Dan_Deng(2004-05-24)

Include("\\script\\global\\repute_head.lua")

function main(sel)
	Uworld75 = GetTask(75)
	U75_sub1 = GetTask(52)
	U75_sub2 = GetTask(53)
	U75_sub3 = GetTask(54)
	U75_sub4 = GetTask(55)
	U75_sub5 = GetTask(56)
--	if (Uworld75 < 10) and (GetLevel() >= 30) and (GetCamp() == 0) and (GetReputeLevel(GetRepute()) >= 3) then		-- ÈÎÎñÆô¶¯
--		Talk(10,"U75_get","Âå¾ÅÌì£ºÈ­·¨Ìì£¬ÕÆ·¨µØ£¬Ö¸·¨ĞÄ¡£Ï¦ÈÕÁúÕ½ÓÚÒ°£¬ÎÀÀÏÒ»È­µÃÌìµØÁéÆø£¬¾¢ÓÉĞÄÉú£¬¶ÙÊ±Íõ°ÔÖ®Æø±¼Ó¿£¬ÆÆ¾ŞÁúÓÚÎŞĞÎ£¬È­ÊÔÌìÏÂ£¡åä¸ÄÃûÎÀÌìÏÂ£¬È­ÃûÒ°Çò¡£","Íæ¼Ò£ºÇëÎÊ×ğ¼İ¸Õ¸ÕÄîµÄÊÇÊ²Ã´£¿ÔÚÏÂÎªºÎÔÚËÄÊéÎå¾­ÖĞ´ÓÎ´¼ûÊ¶¡£","Âå¾ÅÌì£ººÇ£¬Ğ¡ÏÀ²»Öª£¬´ËÄËÇ°´úÎäÁÖÉñ»°¡°È­ºÀ¡±ÎÀÌìÏÂµÄ×Ô´«¡£","Íæ¼Ò£ºÔÚÏÂÔøÌıËµÇ°´úÎäÁÖËÄÆæÖĞµÄ¡°Ò»Ç¹ÍÀÁú¡±Áú×·ÎèÉÃÊ¹É±ÁúÇ¹·¨£¬²»ÖªÏÈÉúËùËµ´óÏÀ¿ÉÓëÖ®¹¦·¨ÏàËÆ£¿","Âå¾ÅÌì£º¹ş¹ş¹ş¹ş¡­¡­ÁúÊÏĞ¡¶ù£¬Æñ¿ÉÓë¿áÔÂÕù»Ô¡£ÎÀÀÏµ±Äê±âÖÛ¶Éº££¬ÓÚÅîÀ³´óÕ½ÉñÁú£¬ÔÚÅìÅÈ×ÔÈ»ÖĞÁìÎòÒ°ÇòÈ­·¨£¬ÈıÕĞ¾øÉ±¶ñÁú¡£ÊµÎª¹Å½ñµÚÒ»ÈË£¬ÄÇÊÇºÎµÈµÄºÀÓÂ£¡ÁúĞ¡×ÓÇ¹ÃûÍÀÁú£¬¿ÖÅÂÁ¬ÁúµÄÓ°×Ó¶¼Ã»¼û¹ı¡£","Íæ¼Ò£ºÃ»Ïëµ½½­ºşÖĞ»¹ÓĞÈç´ËÀ÷º¦µÄÈËÎï£¬ÎªºÎ´ÓÎ´ÌıËµ£¿","Âå¾ÅÌì£ºÎÀÀÏÒÔÌìÏÂÎªÖØ£¬ÓÖÔõ»áÔÚÕâÖÖÌøÁºĞ¡³óµÄÎèÌ¨ÖĞ³öÏÖ¡£¸üºÎ¿öµ±ÄêÈ­ÊÔÌìÏÂºó£¬½­ºşºÚµÀĞÄµ¨¾ãÁÑ£¬»Ì»Ì²»¿ÉÖÕÈÕ¡£¼¸Ê®ÄêµÄÌ«Æ½Ê¢ÊÀ£¬ÓÖÔõÖµµÃÎÀÏÈÉúÔÙ³öÈ­¡£","Íæ¼Ò£º¾ÓÈ»ÓĞÈç´ËÆæÕĞ£¿²»Öª´óÏÀ¿ÉÏşµÃ´ËÌ×È­Æ×ÏÂÂä¡£","Âå¾ÅÌì£º²»²ÅÂåÄ³£¬ÕıÊÇÏÈÊ¦µÜ×Ó£¬Ò²ÔøÏ°µÃÆ¤Ã«¡£","Íæ¼Ò£º°¡£¡ÍûÏÈÉú½ÌÎÒ£¡")
	if (Uworld75 == 10) and (U75_sub1 == 20) and (U75_sub2 == 20) and (U75_sub3 == 20) and (U75_sub4 == 20) and (U75_sub5 == 20) and (HaveItem(384) == 1) then			-- ÈÎÎñÍê³É
		DelItem(384)
		Talk(2,"U75_prise","H¶o tiÓu tö! Qu¶ nhiªn ta kh«ng nh×n lÇm ng­¬i! §Õn ®©y nµo! Häc nhanh th«i."," Vâ häc nhÊt ®¹o, thiªn ngo¹i h÷u thiªn. Ng­¬i ph¶i kh«ng ngõng luyÖn tËp, bªn c¹nh cã c¸i bia thö c«ng phu cã thÓ thö c«ng lùc. ChØ cÇn tung mét quyÒn cã thÓ ®¸nh vì nã, lóc ®ã quyÒn n¨ng cña ng­¬i ®· thuéc vµo bËc thÇn tiªn cña thiªn h¹ råi. ")
	elseif (Uworld75 == 10) and (HaveItem(384) == 0) then			-- ÈÎÎñÖĞ£¬ĞÅ¶ªÁË
		AddEventItem(384)
		Msg2Player("L¹i nhËn ®­îc bøc th­ giíi thiÖu cña L¹c Cöu Thiªn. ")
		Talk(1,"","Cø lµm mÊt thÕ nµy, sao cã thÓ lµm chuyÖn lín ®­îc? Th«i ®­îc, cho ng­¬i thªm mét c¬ héi n÷a, ta viÕt l¹i mét bøc th­ kh¸c cho ng­¬i, nhí ®õng lµm mÊt n÷a nhĞ!")
	elseif (Uworld75 == 10) then
		Talk(1,""," Tr­íc tiªn ng­¬i ph¶i v­ît qua n¨m s­ ®Ö kh¸c, ta míi cã thÓ d¹y cho ng­¬i!")
	elseif (Uworld75 == 255) then
		Talk(1,""," D· CÇu QuyÒn ph¶i luyÖn tËp hµng ngµy míi cã thÓ luyÖn thµnh tµi ®­îc, ng­¬i cÇn cã lßng nhÉn n¹i.")
	else
		Talk(1,""," QuyÒn Ph¸p Thiªn, Ch­ëng Ph¸p §Şa, ChØ Ph¸p T©m. QuyÒn Ph¸p....khã nhí qu¸!")
	end
end;

function U75_get()
	Say(" Bé quyÒn ph¸p nµy kh«ng thÓ cïng luyÖn tËp víi c¸c chiªu néi c«ng kh¸c. NÕu ng­¬i muèn gia nhËp vµo c¸c m«n ph¸i kh¸c, th× kh«ng thÓ häc ®­îc. Ng­¬i ®· c©n nh¾c kü ch­a?",2,"Ta ®· nghÜ kü råi, h·y cho ta häc D· CÇu QuyÒn. /U75_get_yes","§Ó ta suy nghÜ l¹i!/no")
end

function U75_get_yes()
	Talk(5,"U75_go","T¹i muèn häc D· CÇu QuyÒn, kh«ng muèn nhËp ph¸i kh¸c."," Ha ha! §óng lµ Thiªn tø kú tµi! Ta thÊy g©n cèt ng­¬i rÊt kháe, thËt hiÕm cã trªn chèn giang hå. Nh­ng tÊt ph¶i nhê ®Õn c¸c huynh ®Ö kh¸c míi cã thÓ d¹y ng­¬i ®­îc.","§a t¹ S­ phô! ","ë ®©y ta cã mét bøc th­, ng­¬i ®em ®Õn Thµnh §«, §¹i Lı, Ph­îng T­êng, BiÖn Kinh t×m Ph­¬ng Thİch, Hoa N«ng, Th¸i ®¹i thóc, Phã Nam B¨ng vµ Tr­¬ng TuÊn. N¨m ng­êi nµy cã vÎ ®Òu ®· ®ång ı cho ng­¬i luyÖn tËp kü n¨ng nµy. ","V©ng! S­ b¸.")
end

function U75_go()
	Talk(1,""," §­êng ®i rÊt hiÓm trë khã kh¨n, ng­¬i nªn chuÈn bŞ kü. Tõ x­a ®Õn nay nh÷ng ng­êi lµm nªn nghiÖp lín, ch­a ai lµ ch­a tõng nÕm qua ®au khæ. ")
	AddEventItem(384)				-- Âå¾ÅÌì½éÉÜĞÅ
	SetTask(75,10)
	SetTask(52,0)					-- ×Ó±äÁ¿³õÊ¼»¯
	SetTask(53,0)
	SetTask(54,0)
	SetTask(55,0)
	SetTask(56,0)
	AddNote("NhËn nhiÖm vô QuyÒn Khuynh Thiªn H¹: CÇm th­ giíi thiÖu cña L¹c Cñu Thiªn, ®i Thµnh §« t×m ph­¬ng Thİch, §¹i Lı t×m Hoa N«ng, Ph­îng T­êng t×m Th¸i ®¹i thóc, BiÖn Kinh t×m Phô Nam B¨ng, L©m An t×m Tr­¬ng TuÊn, cÇu häc D· CÇu QuyÒn. ")
	Msg2Player("NhËn nhiÖm vô QuyÒn Khuynh Thiªn H¹: CÇm th­ giíi thiÖu cña L¹c Cñu Thiªn, ®i Thµnh §« t×m ph­¬ng Thİch, §¹i Lı t×m Hoa N«ng, Ph­îng T­êng t×m Th¸i ®¹i thóc, BiÖn Kinh t×m Phô Nam B¨ng, L©m An t×m Tr­¬ng TuÊn, cÇu häc D· CÇu QuyÒn. ")
end

function U75_prise()
	Talk(1,"","§Ö tö xin nhËn lêi chØ d¹y.")
	DelItem(384)
	SetTask(75,255)
	AddRepute(30)
	if (HaveMagic(395) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
		AddMagic(395)
	end
	AddNote("NhiÖm vô QuyÒn Khuynh Thiªn H¹: NhiÖm vô hoµn thµnh, häc ®­îc kü n¨ng D· CÇu QuyÒn, danh väng cña b¹n t¨ng thªm 30 ®iÓm. ")
	Msg2Player("NhiÖm vô QuyÒn Khuynh Thiªn H¹: NhiÖm vô hoµn thµnh, häc ®­îc kü n¨ng D· CÇu QuyÒn, danh väng cña b¹n t¨ng thªm 30 ®iÓm. ")
end

function no()
end
