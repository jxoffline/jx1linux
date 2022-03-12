--description: ¶ëáÒÅÉÇØÒĞ·ç
--author: yuanlan	
--date: 2003/3/3
-- Update: Dan_Deng(2003-08-12)

function main()
	UTask_em = GetTask(1);
	Uworld36 = GetByte(GetTask(36),1)
	if (Uworld36 == 20) then					--ÈëÃÅÈÎÎñ
		Msg2Player("TiÕp nhËn thö th¸ch thø hai cña TÇn û Phong ®ã lµ tr¶ lêi 3 c©u hái vÒ 'Nh¹c' ")
		Say("Muéi cã biÕt cÇm kú thi häa? §Ó ta thö muéi xem sao! Muéi cã biÕt ca khóc nµo sau ®©y ph¶i dïng ®µn Tú Bµ ®Ó diÔn tÊu?", 3, "T« Vò Môc D­¬ng /False4", "Cao S¬n L­u Thñy /False4", "ThËp DiÖn Mai Phôc /True4")
	elseif (Uworld36 == 40) then 					--ÈëÃÅÈÎÎñ£ºÒÑÍê³ÉÇ°Á½¹Ø
		Talk(1,"","Xem ra muéi chØ lµ mét kÎ tÇm th­êng. Nh­ng ®Ó S­ muéi <color=Red>Hµ Linh Phiªu<color> thö muéi xem sao! C« ta ®ang ë <color=Red>B¸n S¬n Ph¸ <color>!")
--	elseif ((UTask_em > 5*256) and (UTask_em < 10*256)) then 					--ÉĞÎ´ÈëÃÅ
--		Talk(1,"","ÇØÒĞ·ç£ºÒªÏë¼ÓÈë±¾ÅÉ£¬±ØĞëÏÈÍ¨¹ı²èÇÙÊéµÄ¿¼Ñé£¬È»ºóÔÙ´³×êÌìÆÂµÃµ½°×ÓñÈçÒâ£¬Äã¶¼×öµ½ÁËÂğ£¿")
	elseif (GetFaction() == "emei") then   				--ÒÑ¾­ÈëÃÅ£¬ÉĞÎ´³öÊ¦
		Talk(1,"","S­ muéi! R¶nh rçi ta cïng trao ®æi cÇm nghÖ!")
	else							-- ÆäËü¶Ô»°
		Talk(1,"","Muèn göi g¾m t©m sù vµo ngãn ®µn Dao CÇm. ThiÕu kh¸ch tri ©m, huyÒn ®o¹n cã mÊy ai nghe?")
	end
end;

function False4()
	Say("Kh«ng ®óng!", 3, "T« Vò Môc D­¬ng /False4", "Cao S¬n L­u Thñy /False4", "ThËp DiÖn Mai Phôc /True4");
end;

function True4()
	Say("Tr¶ lêi ®óng råi! C©u hái thø 2: C¸i nµo d­íi ®©y kh«ng thuéc tø ®¹i danh cÇm?", 3, "Hoµng Chung /True5", "Lôc Khëi /False5", "Tiªu VÜ /False5");
end;

function False5()
	Say("Kh«ng tr¶ lêi ®­îc µ?", 3, "Hoµng Chung /True5", "Lôc Khëi /False5", "Tiªu VÜ /False5");
end;

function True5()
	Say("Kh«ng khã kh¨n víi muéi chø? Giái l¾m! Muéi cã biÕt khóc 'Qu¶ng L¨ng T¸n' lµ ai viÕt kh«ng?", 3, "L·o Tö /False6", "Kª KiÖn /True6", "KhuÊt Nguyªn /False6");
end;

function False6()
	Say("Kh«ng biÕt µ? Hay lµ muéi thÊy khã kh¨n mµ lïi b­íc?!", 3, "L·o Tö /False6", "Kª KiÖn /True6", "KhuÊt Nguyªn /False6");
end;

function True6()
	Talk(1,"","Xem ra muéi chØ lµ mét kÎ tÇm th­êng. Nh­ng ®Ó S­ muéi <color=Red>Hµ Linh Phiªu<color> thö muéi xem sao! C« ta ®ang ë <color=Red>B¸n S¬n Ph¸ <color>!")
	Uworld36 = SetByte(GetTask(36),1,40)
	SetTask(36,Uworld36)
	AddNote("T¹i Nghªnh Kh¸ch Th¹ch gÆp TÇn û Phong, tr¶ lêi chİnh x¸c ba c©u hái vÒ Nh¹c, qua ¶i thø hai ")
	Msg2Player("T¹i Nghªnh Kh¸ch Th¹ch gÆp TÇn û Phong, tr¶ lêi chİnh x¸c 3 vÊn ®Ò vÒ Khóc nh¹c, qua ¶i thø hai, ®Õn B¸n s¬n Pha tiÕp nhËn sù thö th¸ch cña Hµ Linh Phiªu. ")
end;
