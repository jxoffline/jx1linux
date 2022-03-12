--ÖĞÔ­±±Çø ÉÙÁÖÅÉtoÉÙÁÖÃÜÊÒ
--Trap ID£ºÖĞÔ­±±Çø 67
-- by£ºDan_Deng(2003-08-04)

function main(sel)
	UTask_sl = GetTask(7)
	if (GetSeries() == 0) and (GetFaction() == "shaolin") then
		if (UTask_sl == 40*256+10) then
			SetTaskTemp(43,0)		-- ÁÙÊ±±äÁ¿Ôİ¶¨Îª43£¬ÒªÈı¸öÎÊÌâ´ğ¶Ô£¨ÁÙÊ±±äÁ¿ÖµÎª3£©·½¿É½øÈëÃÜÊÒ¡£
			Talk(1,"L40_sele1_1","Tr­íc Th¹ch m«n cã kh¾c mÊy hµng ch÷: Muèn vµo mËt thÊt, ph¶i tr¶ lêi 3 c©u hái d­íi ®©y!")
		elseif (UTask_sl >= 40*256+10) then
			NewWorld(113, 1675, 3361)
		else
			Msg2Player("CÊm ®Şa cña bæn ph¸i, kh«ng ®­îc vµo! ")
		end
	else
		Msg2Player("N¬i ®©y lµ cÊm ®Şa cña bæn ph¸i, ng­êi ngoµi kh«ng ®­îc vµo! ")
	end
--	AddTermini(47)		--ÕâÊÇÊ²Ã´¶«Î÷£¿
end;

function L40_sele1_1()
	Say("C©u thø nhÊt: N¨m x­a §­êng HuyÒn Trang mang tõ Thiªn Tróc bé kinh lµ: ",2,"§¹i Thõa PhËt Kinh /L40_S1_correct1","TiÓu Thõa PhËt Kinh /L40_sele1_2")
end;

function L40_S1_correct1()
	SetTaskTemp(43,GetTaskTemp(43) + 1)		-- ´ğ¶ÔÒ»¸öÎÊÌâÖµ¼Ó1£¬Èı¸öÈ«¶Ô·½¿É½øÈë
	L40_sele1_2()
end;

function L40_sele1_2()
	Say("C©u thø 2: X¸ LŞ cña PhËt tæ lµ:",2,"Sau khi PhËt Tæ vÒ câi NiÕt Bµn tù ®éng hãa thµnh /L40_sele1_3","Do chİnh th©n PhËt Tæ thiªu ch¸y mµ thµnh /L40_S1_correct2")
end;

function L40_S1_correct2()
	SetTaskTemp(43,GetTaskTemp(43) + 1)		-- ´ğ¶ÔÒ»¸öÎÊÌâÖµ¼Ó1£¬Èı¸öÈ«¶Ô·½¿É½øÈë
	L40_sele1_3()
end;

function L40_sele1_3()
	Say("C©u thø 3: PhËt ph¸p cña bæn tù lµ thuéc:",3,"ThiÒn T«ng /L40_S1_correct3","MËt T«ng /L40_sele1_result","LuËt T«ng /L40_sele1_result")
end;

function L40_S1_correct3()
	SetTaskTemp(43,GetTaskTemp(43) + 1)		-- ´ğ¶ÔÒ»¸öÎÊÌâÖµ¼Ó1£¬Èı¸öÈ«¶Ô·½¿É½øÈë
	L40_sele1_result()
end;

function L40_sele1_result()
	if (GetTaskTemp(43) >= 3) then
		SetTaskTemp(43,0)				--Ã¿´Î½øÈëÒªÖØ´ò¶şÃÅµÄ¿Ú¾÷
		Talk(1,"","Tr¶ lêi ®óng 3 ®¸p ¸n, th¹ch m«n lËp tøc chuyÓn ®éng më ra 1 lèi ®i")
		NewWorld(113, 1675, 3361);
	else
		SetTaskTemp(43,0)				--Ã¿´Î½øÈëÒªÖØ´ò¶şÃÅµÄ¿Ú¾÷
		Talk(1,"","Tr¶ lêi ®óng 3 ®¸p ¸n, nh­ng hÇu nh­ th¹ch m«n vÉn tr¬ tr¬ ")
--		SetPos()		--°ÑÍæ¼ÒÒÆ³ötrapµã
	end
end;
