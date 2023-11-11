--Î÷ÄÏ±±Çø ³É¶¼¸® ĞÅÏàËÂ´Èº£´óÊ¦¶Ô»°
--author: yuanlan	
--date: 2003/3/6
-- Update: Dan_Deng(2003-08-12)

function main(sel)
	UTask_em = GetTask(1);
	if (UTask_em <10) then				--Ã»ÓĞ¼ÓÈë¶ëáÒÅÉ
		Talk(4, "", "Thİ chñ! Xem d¸ng lµ ng­êi cã luyÖn vâ! Kh«ng biÕt cã ®Şnh ®Õn Nga Mi hay §­êng m«n thØnh gi¸o kh«ng?", "NÕu thËt sù cã ı ®ã, tr­íc tiªn xin nghe vµi lêi khuyªn cña l·o n¹p!", "Nga mi Thanh HiÓu s­ th¸i vµ trô tr× cña tù nµy lµ chç tri giao, bµ tõ bi víi mäi ng­êi, sÏ kh«ng lµm khã cho ng­¬i. Nh­ng mÊy ®Ö tö tôc gia cña hä vâ c«ng cao c­êng vµ rÊt ng¹o m¹n. NÕu nh­ ng­¬i muèn lªn nói Nga Mi, ph¶i th«ng qua sù kh¶o nghiÖm cña hä míi ®­î ", "Nãi ®Õn Thôc Nam tróc H¶i ®­êng m«n, l·o n¹p khuyªn ng­¬i ®õng ®i! Ng­êi trong ®­êng m«n hµnh sù bİ hiÓm, chİnh tµ lÉn lén, bªn trong rÊt lµ nghiªm ngÆt, muèn x«ng vµo Tróc H¶i, e r»ng lµnh İt d÷ nhiÒu!")
	elseif (UTask_em == 40*256+50) then 		--¶ëáÒÅÉ40¼¶ÈÎÎñ
		UTask_emsub02 = GetByte(GetTask(29),2)
		if (UTask_emsub02 == 0) then 
			Say("A di §µ phËt! Th× ra lµ n÷ hiÖp cña Nga Mi ph¸i. PhËt lı cña ch­ëng m«n Thanh hiÓu s­ th¸i quı ph¸i rÊt cao th©m, nh­ng tr×nh ®é phËt häc cña ®Ö tö m«n h¹ còng kh«ng kĞm, l·o t¨ng kh«ng tù l­îng søc, muèn thØnh gi¸o, thØnh gi¸o!", 2, "Mêi ®¹i s­ chØ b¶o /L40_V2_Q1", "V·n bèi cßn bËn viÖc kh¸c n÷a /no")
		elseif (UTask_emsub02 == 3) then
			L40_V2_Q1()
		elseif (UTask_emsub02 == 5) then
			L40_V2_Q2()
		elseif (UTask_emsub02 == 7) then
			L40_V2_Q3()
		else
			if (HaveItem(167) == 0) then
				AddEventItem(167)
				Talk(1,"","N÷ hiÖp qu¶ kh«ng hæ danh ®Ö tö Nga Mi. ¦ng T×nh Hé Th©n phï ®©y! Xin nhËn lÊy!")
			else
				Talk(1,"","Tr×nh ®é PhËt häc cña ®Ö tö Nga Mi kh«ng kĞm g× vâ häc! L·o t¨ng béi phôc!")
			end
		end
	elseif ((UTask_em == 50*256+50) and (HaveItem(23) == 1)) then		--¶ëáÒÅÉ50¼¶ÈÎÎñ
		Talk(5, "","Tõ V©n Ph¸p s­:A Di §µ PhËt! N÷ hiÖp cã g× chØ gi¸o?","T¹i h¹ theo lÖnh s­ t«n, biÕu lÔ vËt cho quı tù, lµm phiÒn ®¹i s­ hái Ph­¬ng tr­îng Tõ H¶i cña quı tù mét tiÕng.","§a t¹ ı tèt cña t«n s­,ch¼ng qua bÇn t¨ng kh«ng biÕt Ph­¬ng tr­îng hiÖn giê ë ®©u, ®ang lo l¾ng cho sù an nguy cña «ng Êy.","Kh«ng biÕt x¶y ra chuyÖn g×?","ThËt lµ kú l¹! Ph­¬ng tr­îng s¸ng nay sau khi nhËn ®­îc mét phong th­ th× ®i vµo hËu viÖn, ®Õn bay giê vÉn ch­a thÊy ra, còng kh«ng biÕt ®· x¶y ra chuyÖn g×.")
		SetTask(1, 50*256+60)
		AddNote("Sau khi trß chuyÖn víi Tõ V©n Ph¸p s­ ë Tİn T­íng tù Thµnh §«, ®­îc biÕt Tõ H¶i ®¹i s­ ®· ®i vµo ®Şa ®¹o hËu viÖn. ")
		Msg2Player("Sau khi trß chuyÖn víi Tõ V©n Ph¸p s­, ®­îc biÕt ph­¬ng tr­îng Tõ H¶i ®¹i s­ ®· ®i vµo ®Şa ®¹o hËu viÖn. ")
	elseif (UTask_em == 50*256+60) then
		Talk(1,"","ThËt lµ kú l¹! Ph­¬ng tr­îng s¸ng nay sau khi nhËn ®­îc mét phong th­ th× ®i vµo hËu viÖn, ®Õn bay giê vÉn ch­a thÊy ra, còng kh«ng biÕt ®· x¶y ra chuyÖn g×.")
	elseif (UTask_em >= 50*256+80) and (GetFaction() == "emei") then
		Talk(1,"","§a t¹ n÷ hiÖp cøu Ph­¬ng tr­îng! N÷ hiÖp Nga Mi qu¶ lµ danh bÊt h­ truyÒn.")
	elseif (UTask_em == 70*256) then
		Talk(1,"","N÷ hiÖp ngµy sau hµnh tÈu giang hå, cã g× cÇn trî gióp th× xin cø nãi, bÇn tù sÏ hÕt lßng gióp ®ì.")
	else
		Say("L©u råi kh«ng gÆp, Thanh HiÓu S­ Th¸i vÉn b×nh an chø? ")	--¼ÓÈë¶ëáÒÅÉºóµÄ·ÇÈÎÎñ¶Ô»°
	end
end;

function no()
	Talk(1,"","VËy bÇn t¨ng kh«ng lµm phiÒn n÷ hiÖp n÷a.")
end;

function L40_V2_Q1()
	Say("PhËt gi¸o truyÒn nhËp trung thæ tõ triÒu ®¹i nµo?", 4, "ChiÕn quèc /f1", "§êi H¸n /L40_V2_Q2", "§êi §­êng /f1", "§êi Minh /f1")
end;

function f1()
	Say("A Di §µ PhËt! Xem ra n÷ thİ chñ kh«ng hiÓu s©u s¾c phËt häc. ")
	SetTask(29, SetByte(GetTask(29),2,3))
end;

function L40_V2_Q2()
	Say("Tèt l¾m! N÷ hiÖp cã biÕt Cao t¨ng tõ §­êng triÒu ®Õn Thiªn Tróc thØnh kinh lµ ai kh«ng?", 4, "BiÖn C¬ /f2", "KiÕm Ch©n /f2", "NhÊt Hµnh /f2", "HuyÒn Trang /L40_V2_Q3")
end;

function f2()
	Say("N÷ hiÖp cã nhí sai kh«ng?", 0)
	SetTask(29, SetByte(GetTask(29),2,5))
end;

function L40_V2_Q3()
	Say("Hay l¾m! Quı ph¸i ë Nga mi s¬n lµ mét trong bèn thiªn h¹ tø ®¹i phËt s¬n. N÷ hiÖp cã biÕt lµ m«n ph¸i nµo kh«ng thuéc tø ®¹i PhËt s¬n kh«ng?", 4, "Phæ §µ s¬n /f3", "Cöu Hoa s¬n /f3", "Tung s¬n /L40_V2_prise", "Ngò §µi s¬n /f3")
end;

function f3()
	Say("LÏ nµo t«n s­ ch­a d¹y qua cho c¸c ®Ö tö sao?", 0)
	SetTask(29, SetByte(GetTask(29),2,7))
end;

function L40_V2_prise()
	Talk(1,"","Tr×nh ®é PhËt häc cña ®Ö tö Nga Mi kh«ng kĞm g× vâ häc! L·o t¨ng béi phôc! N÷ hiÖp qu¶ kh«ng hæ danh ®Ö tö Nga Mi. ¦ng T×nh Hé Th©n phï ®©y! Xin nhËn lÊy!")
	AddEventItem(167)
	SetTask(29, SetByte(GetTask(29),2,10))
	AddNote("LÊy ®­îc ¦ng T×nh Hé Th©n Phï ë chç Tõ V©n ph¸p s­ Tİn T­íng tù t¹i Thµnh §«. ")
	Msg2Player("§­îc ¦ng T×nh Hé Th©n Phï. ")
end;
