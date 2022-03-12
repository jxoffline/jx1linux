--description: ¶ëáÒÅÉĞ»ÔÆÂÜ
--author: yuanlan	
--date: 2003/3/3
-- Update: Dan_Deng(2003-08-12)

function main()
	UTask_em = GetTask(1);
	Uworld36 = GetByte(GetTask(36),1)
	if (Uworld36 == 60) then		--ÈëÃÅÈÎÎñ
		Msg2Player("TiÕp nhËn thö th¸ch vâ c«ng cña Tõ Toµn Thiªn pha ®ãn kh¸ch ®­îc B¹ch Ngäc nh­ ı ")
		Say("Thö th¸ch cña 3 s­ tû kh«ng khã kh¨n víi muéi! Cöa 'v¨n' xem nh­ muéi ®· qua, nh­ng còng cÇn ph¶i qua ¶i 'vâ'. Trong thö th¸ch ®Çu tiªn cÇn ph¶i qua Toµn Thiªn Ph¸ Nghªnh Kh¸ch TrËn, lÊy ®­îc <color=Red>B¹ch Ngäc Nh­ ı<color>, muéi muèn x«ng trËn kh«ng?", 2, "X«ng trËn /yes", "Kh«ng x«ng /no")
	elseif (Uworld36 == 70) then
		if (HaveItem(17) == 0) then
			Talk(1,"","Sau khi lÊy ®­îc <color=Red>B¹ch Ngäc Nh­ ı<color>, rêi khái Toµn Thiªn Ph¸ ë cöa ra vµ trao cho DiÖu TrÇn s­ tû.")
		else
			Talk(1,"","Trao <color=Red>B¹ch Ngäc Nh­ ı<color> cho DiÖu TrÇn ë <color=Red>lèi ra Toµn Thiªn Ph¸<color>.")
		end
--	elseif ((UTask_em > 5*256) and (UTask_em < 5*256+60)) then 					--ÉĞÎ´Íê³ÉÇ°Èı¹Ø
--		Talk(1,"","Ğ»ÔÆÂÜ£ºÒªÏë¼ÓÈë±¾ÅÉ£¬±ØĞëÏÈÍ¨¹ı²èÇÙÊéµÄ¿¼Ñé£¬Äã¶¼×öµ½ÁËÂğ£¿")
--	elseif (GetFaction() == "emei") then   				--ÒÑ¾­ÈëÃÅ£¬ÉĞÎ´³öÊ¦
--		Talk(1,"","Ğ»ÔÆÂÜ£ºÄãÒÑ¾­ÊÇ±¾ÅÉµÜ×Ó£¬²»±ØÔÙ´³×êÌìÆÂÁË¡£")
	elseif (UTask_em == 70*256) then   						--ÒÑ³öÊ¦
		Talk(1,"","R¶nh rçi h·y vÓ th¨m tû muéi ta!")
	else
		Talk(1,"","….§×nh tiÒn t¹c d¹ nhÊt chi mai")
	end
end;

function yes()
--	SetPos(1766, 5136);				--°ÑÍæ¼Ò´«ËÍÈëÃÔ¹¬
	Uworld36 = SetByte(GetTask(36),1,70)
	SetTask(36,Uworld36)
	AddNote("Khi vµo Toµn Thiªn Pha ph¶i chŞu sù thö th¸ch cña T¹ V©n La, x«ng vµo Toµn Thiªn Pha vµ ®o¹t B¹ch Ngäc Nh­ ı tõ trong Nghªnh kh¸ch trËn ")
	Msg2Player("Khi vµo Toµn Thiªn Pha ph¶i chŞu sù thö th¸ch cña T¹ V©n La, x«ng vµo Toµn Thiªn Pha vµ ®o¹t B¹ch Ngäc Nh­ ı tõ trong Nghªnh kh¸ch trËn ")
end;

function no()
end;
