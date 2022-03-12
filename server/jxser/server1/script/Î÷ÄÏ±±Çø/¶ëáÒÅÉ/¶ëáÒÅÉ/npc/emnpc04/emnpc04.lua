--description: ¶ëáÒÅÉºÎÁ¯Æ®
--author: yuanlan	
--date: 2003/3/3
-- Update: Dan_Deng(2003-08-12)

function main()
	UTask_em = GetTask(1);
	Uworld36 = GetByte(GetTask(36),1)
	if (Uworld36 == 40) then		--ÈëÃÅÈÎÎñ
		Msg2Player("Thö th¸ch thø ba cña Hµ Linh Phiªu lµ ®èi 3 c©u ®èi. ")
		Say("Muéi ®· v­ît qua 2 thö th¸ch, còng cã chót b¶n lÜnh! Nh­ng nÕu ®èi ®­îc 3 vÕ ®èi cña ta, ta míi phôc muéi. VÕ ®èi thø nhÊt lµ: NhÊt ®¹n l­u thñy t¸i ®¹n nguyÖt.", 3, "B¸n nhËp giang phong b¸n nhËp v©n /True7", "NhÊt thèn t­¬ng t­ nhÊt thèn kh«i /False7", "B¸n hµo xu©n thñy nhÊt thµnh hoa /False7")
	elseif (Uworld == 60) then 					--Íê³ÉÇ°Èı¹Ø
		Talk(1,"","Chóc mõng muéi ®· qua 3 cöa thö th¸ch, h·y ®i t×m S­ muéi <color=Red>T¹ V©n L©u<color>! C« ta ®ang ë <color=Red>lèi vµo Toµn Thiªn Ph¸<color>.")
--	elseif ((UTask_em > 5*256) and (UTask_em < 10*256)) then 					--ÉĞÎ´ÈëÃÅ
--		Talk(1,"","ºÎÁ¯Æ®£ºÒªÏë¼ÓÈë±¾ÅÉ£¬±ØĞëÏÈÍ¨¹ı²èÇÙÊéµÄ¿¼Ñé£¬È»ºóÔÙ´³×êÌìÆÂµÃµ½°×ÓñÈçÒâ£¬Äã¶¼×öµ½ÁËÂğ£¿")
--	elseif (GetFaction() == "emei") then   				--ÒÑ¾­ÈëÃÅ£¬ÉĞÎ´³öÊ¦
--		Talk(1,"","ºÎÁ¯Æ®£ºÏÖÔÚÔÛÃÇÊÇÍ¬ÃÅºÃ½ãÃÃÁË£¬ÎÒÕæ¿ªĞÄ£¡")
	elseif (UTask_em == 70*256) then							--ÒÑ¾­³öÊ¦
		Talk(1,"","Trªn ®­êng phiªu b¹t giang hå, nhí ®õng quªn nh÷ng tû muéi n¬i nµy! ")
	else
		Talk(1,"","Giang hå ®Çy hiÓm ¸c, vâ l©m ®Çy chuyÖn thŞ phi!")
	end
end;

function False7()
Say("§èi kh«ng ra µ?", 3, "B¸n nhËp giang phong b¸n nhËp v©n /True7", "NhÊt thèn t­¬ng t­ nhÊt thèn kh«i /False7", "B¸n hµo xu©n thñy nhÊt thµnh hoa /False7");
end;

function True7()
Say("§èi rÊt chØnh. VÕ ®èi thø 2: T¾c th©n thiªn ®Şa c¸nh hoµi cæ ", 3, "V¹n lİ bi thu th­êng t¸c kh¸ch /False8", "§¬n ®éc Th­¬ng m·ng tù vŞnh th¬ /True8", "Kh«ng mÖnh tuÕ nguyÖt dŞch tha ®µ /False8");
end;

function False8()
Say("ChŞu thua sao?", 3, "V¹n lİ bi thu th­êng t¸c kh¸ch /False8", "§¬n ®éc Th­¬ng m·ng tù vŞnh th¬ /True8", "Kh«ng mÖnh tuÕ nguyÖt dŞch tha ®µ /False8");
end;

function True8()
Say("Hay l¾m! VÕ ®èi thø 3 lµ: NhÊt minh ph©n nhËt nguyÖt", 3, "T­ canh t©m th­îng ®iÒn /False9", "Nhµn khan m«n trung méc /False9", "Ngò nh¹c c¸c kh©u s¬n /True9");
end;

function False9()
Say("H·y nghÜ l¹i ®i, ®õng phİ c«ng v« İch! ", 3, "T­ canh t©m th­îng ®iÒn /False9", "Nhµn khan m«n trung méc /False9", "Ngò nh¹c c¸c kh©u s¬n /True9");
end;

function True9()
	Talk(1,"","Chóc mõng muéi ®· qua 3 cöa thö th¸ch, h·y ®i t×m S­ muéi <color=Red>T¹ V©n L©u<color>! C« ta ®ang ë <color=Red>lèi vµo Toµn Thiªn Ph¸<color>.")
	Uworld36 = SetByte(GetTask(36),1,60)
	SetTask(36,Uworld36)
	AddNote("T¹i B¸n S¬n yªu gÆp Hµ Linh Phiªu, tr¶ lêi chİnh x¸c ba c©u ®èi, qua cöa ¶i thø ba ")
	Msg2Player("T¹i B¸n S¬n Yªu gÆp Hµ Linh Phiªu, tr¶ lêi chİnh x¸c ba c©u ®èi, qua cöa ¶i thø ba. VÒ Toµn Thiªn Pha NhËp KhÈu cña B¸n s¬n Yªu t×m T¹ V©n La s­ muéi tiÕp nhËn thö th¸ch 'vâ c«ng'. ")
end;
