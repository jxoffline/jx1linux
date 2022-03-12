--description: ÌÆÃÅÌÆÏĞ 50¼¶ÈÎÎñ 
--author: yuanlan	
--date: 2003/3/12
--Dan_Deng(2003-07-22), ¼ÓÈëÃÅÅÉÈÎÎñµÄµÈ¼¶ÒªÇó
-- Update: Dan_Deng(2003-08-13)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_tm = GetTask(2)
	if (GetFaction() == "tangmen") and (GetSeries() == 1) then
		if (UTask_tm == 50*256) and (GetLevel() >= 50) then		--50¼¶ÈÎÎñÆô¶¯
			Talk(3, "L50_step0", "VËy thÕ nµo míi lµ tèt!", "§­êng Nhµn s­ thóc cã chuyÖn g× vËy?", "Ng­¬i kh«ng biÕt µ! Bæn §­êng næi tiÕng cã <color=Red>1 bé<color>'¸m Khİ Phæ', chia thµnh 2 quyÓn, bªn trªn cã ghi râ c¸ch chÕ t¹o vµ c¸ch dïng tÊt c¶ ¸m khİ cña bæn m«n. §©y lµ bİ kiÕp bæn m«n kh«ng bao giê truyÒn ra ngoµi. Bİ kiÕp do ta gi÷, ®Ó an toµn, ta ®Æt trong 2 hép s¾t, nh­ng ®Õn h«m nay ta míi ph¸t hiÖn hép s¾t ®· bŞ kÎ gian ®¸nh tr¸o thµnh 1 quyÓn V« Tù Thiªn Th­. Bİ kiÕp bŞ thÊt l¹c, thËt lµ chuyÖn lín råi!")
		elseif (UTask_tm == 50*256+80) then
			if ( HaveItem(48) == 1) then					--ÓĞ°µÆ÷Æ×
				Talk(2, "L50_prise", "§­êng Nhµn s­ thóc, hãa ra ng­êi trém '¸m khİ phæ' lµ Tam s­ huynh §­êng Hßa. TaŞ h¹ ®· ®o¹t bİ kiÕp trë vÒ, huynh xem cã ph¶i kh«ng?", "§óng råi! §©y chİnh lµ quyÓn '¸m khİ phæ' bŞ mÊt, ng­¬i ®· hãa gi¶i ®­îc mét trËn ®¹i häa cho bæn §­êng. C«ng lao cña ng­¬i thËt lín!")
			else									--¶ªÊ§´¦Àí
				Talk(1,"","Tuy ®· t×m ra ph¶n ®å §­êng Hßa, nh­ng ch­a t×m ¸m khİ phæ vÒ lµ ch­a ®­îc ®©u!")
			end
		elseif (UTask_tm > 50*256) and (UTask_tm < 60*256) then					--ÉĞÎ´Íê³É50¼¶ÈÎÎñ
			Talk(1,"","§­êng Nhµn:Bİ kiÕp bŞ c­íp thËt kh«ng ph¶i chuyÖn ®ïa. Kh«ng nh÷ng l·o phu mang tr¸ch nhiÖm nÆng nÒ mµ cßn g©y h¹i cho ng­êi v« téi!")
		elseif (UTask_tm >= 60*256) then					--ÒÑ¾­Íê³É50¼¶ÈÎÎñ£¬ÉĞÎ´³öÊ¦
			Talk(1,"","May mµ cã ng­¬i hãa gi¶i ®­îc ®¹i häa, nÕu kh«ng th× hËu qu¶ kh«n l­êng!")
		else
			Talk(1,"","C«ng phu ¸m khİ, ng­¬i cã chç nµo kh«ng hiÓu cø ®Õn hái l·o phu!")
		end
	elseif (UTask_tm >= 70*256) then							--ÒÑ¾­³öÊ¦
		Talk(1,"","Trªn giang hå, ®ao th­¬ng dÔ tr¸nh nĞ nh­ng ¸m tiÔn khã phßng.")
	else											-- È±Ê¡¶Ô»°
		Talk(1,"","C«ng phu ¸m khİ trong thiªn h¹, nÕu ta kh«ng ®øng ®Çu thiªn h¹ th× cßn ai n÷a! Ng­¬i phôc kh«ng?")
	end
end;

function L50_step0()
	Talk(2,"L50_get","Bæn m«n canh phßng nghiªm ngÆt, ng­êi ngoµi kh«ng c¸ch nµo biÕt ®­îc bİ kiÕp giÊu ë ®©u, cã muèn trém còng kh«ng trém ®­îc. V× thÕ ng­êi trém bİ kiÕp xuÊt quû nhËp thÇn c¸ch mÊy, nhÊt ®Şnh còng cã thÓ tiÕp cËn ®­îc kÎ trém. Ta nghi r»ng cã néi gian, nh­ng chuyÖn nµy liªn lôy qu¸ lín, nÕu b¸o lªn ch­ëng m«n sÏ g©y nªn chuyÖn tµy ®×nh! Ta chØ hy väng mau sím t×m ra kÎ trém, sÏ dÇn dÇn che lÊp ®i chuyÖn nµy!", "Bİ kiÕp bŞ mÊt khi nµo?")
end;

function L50_get()
	Say("Dùa theo suy ®o¸n, bİ kiÕp bŞ mÊt trém h«m qua!", 2, "Gióp t×m bİ kiÕp /L50_get_yes", "Kh«ng ®ñ kh¶ n¨ng /L50_get_no")
end;

function L50_get_yes()
	Talk(1,"","T¹i h¹ ®i hái th¨m <color=Red>ng­êi kh¸c<color>, nãi kh«ng chõng sÏ t×m ra ®Çu mèi!")
	SetTask(2, 50*256+20)
	AddNote("GÆp §­êng Nhµn t¹i ¸m khİ phßng (504, 317) , nhËn <color=red>nhiÖm vô t×m ¸m Khİ Phæ<color> ")
	Msg2Player("NhËn nhiÖm vô ¸m Khİ Phæ. §i t×m ¸m Khİ Phæ bŞ ®¸nh c¾p. ")
end;

function L50_get_no()
end;

function L50_prise()
	DelItem(48)
	SetRank(30)
	SetTask(2, 60*256)
--	AddMagic(349)
	add_tm(60)			-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
	Msg2Player("Giao ¸m Khİ Phæ cho §­êng Nhµn, th¨ng lµm §­êng M«n Tø L·o M«n Nh©n! Häc ®­îc L«i Kİch ThuËt. ")
	AddNote("Giao ¸m Khİ Phæ cho §­êng Nhµn, nhiÖm vô hoµn thµnh, th¨ng lµ: Tø L·o M«n Nh©n. ")
end;
