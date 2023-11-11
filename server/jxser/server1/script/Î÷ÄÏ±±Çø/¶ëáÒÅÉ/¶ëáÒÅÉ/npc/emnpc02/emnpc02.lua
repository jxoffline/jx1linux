--description: ¶ëáÒÅÉÒ¶±ùºÛ
--author: yuanlan	
--date: 2003/3/3
--update: Dan_Deng(2003-07-22), ¼ÓÈëÃÅÅÉÈÎÎñµÄµÈ¼¶ÒªÇó
--update: Dan_Deng(2003-07-24), ¼Ó¡°ÖØ·µÃÅÅÉ¡±ÈÎÎñ
-- Update: Dan_Deng(2003-08-12)
-- Update: Dan_Deng(2003-09-21)ÖØĞÂÉè¼ÆÖØ·µÃÅÅÉÓëÕòÅÉ¾øÑ§Ïà¹Ø£¨È¡ÏûÓë´Ë½Å±¾Ïà¹Ø²¿·İ£©
-- Update: Dan_Deng(2004-01-13)ÖØĞÂÉè¼ÆÈëÃÅÈÎÎñ£¬¸ÄÎª¼ÇÃûµÜ×ÓÈÎÎñ

function main()
	UTask_em = GetTask(1)
	UTask_cy = GetTask(6)
	Uworld36 = GetByte(GetTask(36),1)
	if (Uworld36 == 0)	and (GetLevel() >= 10) and (GetFaction() ~= "emei") then			-- ÈÎÎñÆô¶¯
		Say("Nga Mi s¬n lµ vïng ®Êt thiªng liªng mét câi cña Nga Mi, kh«ng ®ãn tiÕp kÎ phµm trÇn dung tôc.Ng­¬i cã høng thó x«ng vµo Liªn Hoµn quan sao?", 2, "§Ó ta thö xem. /Uworld36_get_yes", "Ta chÊp nhËn thua cuéc /no")
	elseif (Uworld36 == 20) then 					--Íê³ÉµÚÒ»¹Ø
		Talk(1,"","Ng­¬i cã thÓ tiÕp tôc thö th¸ch, vŞ tiÕp theo lµ S­ muéi <color=Red>TÇn û Phong<color> ë <color=Red>Nghªnh Kh¸ch Th¹ch<color>")
--	elseif ((UTask_em > 5*256) and (UTask_em < 10*256)) then 					--ÉĞÎ´ÈëÃÅ£¨¿ÉÈ¡ÏûÈëÃÅÈÎÎñ£©
--		Say("Ò¶±ùºÛ£ºÒªÏë¼ÓÈë±¾ÅÉ£¬±ØĞëÏÈÍ¨¹ı²èÇÙÊéµÄ¿¼Ñé£¬È»ºóÔÙ´³×êÌìÆÂµÃµ½°×ÓñÈçÒâ£¬Äã¶¼×öµ½ÁËÂğ£¿",2,"ÎÒ²»Ïë¼ÓÈë¶ëáÒÅÉÁË/enroll_cancel","¼ÌĞø½ÓÊÜ¿¼Ñé/no")
	elseif (GetFaction() == "emei") then   				--ÒÑ¾­ÈëÃÅ£¬ÉĞÎ´³öÊ¦
		Talk(1,"","S­ muéi! Cã thİch uèng trµ kh«ng?")
	else							--ÆäËü¶Ô»°
		Talk(1,"","Th¹ch chiÓn khinh phi s¾t s¾t trÇn; Nhò h­¬ng phanh xuÊt tiÕn khª xu©n; ThÕ gian tuyÖt phÈm nh©n nan thøc; Nhµn ®èi trµ kinh øc cè nh©n..")
	end
end;

function Uworld36_get_yes()
	AddNote("GÆp DiÖp B¨ng Ng©n, nhËn nhiÖm vô x«ng Liªn Hoµn Quan ")
	Msg2Player("GÆp DiÖp B¨ng Ng©n, nhËn nhiÖm vô x«ng Liªn Hoµn Quan ")
	Talk(3, "select", "Kh¸ l¾m! Muéi cÇn qua <color=Red>4 ¶i<color>, chç cña ta lµ <color=Red>¶i thø 1<color>.", "Ta rÊt thİch uèng trµ, nµo cïng ta uèng 3 ly! ChØ cÇn muéi cã thÓ tr¶ lêi 3 c©u hái vÓ trµ, lµ cã thÓ qua ¶i thuËn lîi!.", "NÕu kh«ng tr¶ lêi ®­îc, h·y quay vÒ ®i! Nga Mi S¬n kh«ng hoan nghªnh nh÷ng kÎ tÇm th­êng!")
end;

function no()
end;

------------------- ÈëÃÅÈÎÎñÎÊ´ğ -----------------------
function select()
	Msg2Player("Dïng xong chĞn trµ thø nhÊt, tr¶ lêi c©u hái thø nhÊt. ")
	Say("Ly thø nhÊt lµ ThiÕt Quan ¢m, muéi cã biÕt ThiÕt Quan ¢m thuéc lo¹i trµ nµo kh«ng?", 3, "Hång trµ /False1", "Lôc trµ /False1", "¤ Long trµ. /True1");
end;

function False1()
	Say("Kh«ng ®óng råi! Cho muéi thªm 1 lÇn c¬ héi, suy nghÜ thËt kü nhĞ!.", 3, "Hång trµ /False1", "Lôc trµ /False1", "¤ Long trµ. /True1");
end;

function True1()
	Msg2Player("Dïng xong chĞn trµ thø 2, tr¶ lêi c©u hái thø 2. ")
	Say("Kh¸ l¾m! Mêi uèng ly trµ thø 2: Ly nµy lµ B¸ch Hoa Trµ ®­îc phèi hîp víi lôc trµ vµ c¸c loµi hoa nhµi, hoa hång, t­êng vi, thu cóc, chi tö, méc tª...H­¬ng trµ hßa quyÖn víi h­¬ng hoa thµnh mét thÓ. Muéi cã biÕt dïng lo¹i n­íc g× ®Ó pha trµ kh«ng?", 3, "N­íc m­a th¸ng 3 /False2", "Suèi ë Th©m s¬n /False2", "TuyÕt trªn hoa mai /True2");
end;

function False2()
	Say("Tr¶ lêi sai råi, h·y thö l¹i ®i!", 3, "N­íc m­a th¸ng 3 /False2", "Suèi ë Th©m s¬n /False2", "TuyÕt trªn hoa mai /True2");
end;

function True2()
	Msg2Player("Ng­¬i h·y uèng ly trµ cuèi cïng ®i råi tr¶ lêi c©u hái thø 3 ")
	Say("Xem ra muéi còng cßn chót th«ng minh. Ly cuèi cïng lµ HÇu Kh«i Trµ, lo¹i trµ nµy mäc trªn nói cao chãt vãt rõng s©u nói th¼m.Con ng­êi kh«ng thÓ h¸i vÒ, chØ cã thÓ huÊn luyÖn loµi khØ lªn nói h¸i vÒ, tõ ®ã míi cã c©u chuyÖn lµ HÇu kh«i, víi mu«n vµn vÊt v¶ míi cã ®­îc lo¹i lôc trµ quı hiÕm. Muéi cã biÕt n¬i s¶n xuÊt HÇu Kh«i Trµ ë ®©u kh«ng?", 3, "Th¸i B×nh, Huy Ch©u /True3", "Nói §éng §×nh Qu©n /False3", "T©y Hå, Hµng Ch©u /False3");
end;

function False3()
	Say("Cã ph¶i muéi nhí nhÇm ch¨ng? H·y nghÜ l¹i ®i!", 3, "Th¸i B×nh, Huy Ch©u /True3", "Nói §éng §×nh Qu©n /False3", "T©y Hå, Hµng Ch©u /False3");
end;

function True3()
	Talk(1,"","Ng­¬i cã thÓ tiÕp tôc thö th¸ch, vŞ tiÕp theo lµ S­ muéi <color=Red>TÇn û Phong<color> ë <color=Red>Nghªnh Kh¸ch Th¹ch<color>")
	Uworld36 = SetByte(GetTask(36),1,20)
	SetTask(36, Uworld36)
	AddNote("B¹n tr¶ lêi chİnh x¸c 3 c©u hái vÒ trµ, qua ¶i thø nhÊt. ")
	Msg2Player("Tr¶ lêi ®óng 3 c©u hái vÒ trµ coi nh­ ng­¬i ®· qua cöa ¶i thø nhÊt, h·y ®Õn ' Nghªnh Kh¸ch Th¹ch' gÆp s­ muéi TÇn û Phong ®Ó nhËn thö th¸ch tiÕp theo ")
end;
