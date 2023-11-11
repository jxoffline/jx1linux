-- Ø¤°ï Ö´·¨³¤ÀÏÃÏ²ÔÀË 20¼¶ÈÎÎñ
-- by£ºDan_Deng(2003-07-28)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_gb = GetTask(8);
	if (GetSeries() == 3) and (GetFaction() == "gaibang") then
		if (UTask_gb == 20*256+20) then			--´ø×Å20¼¶ÈÎÎñ
			Talk(2,"L20_prise","Ta võa d¹y cho M¹nh ViÔn Tµi mét bµi häc, c¶nh c¸o h¾n sau nµy kh«ng ®­îc øc hiÕp huynh ®Ö trong bang, nÕu nh­ ta cã lµm sai, xin M¹nh tr­ëng l·o tr¸ch ph¹t!","Ng­¬i lµm rÊt ®óng! ChØ t¹i ta th­êng ngµy qu¸ nu«ng chiÒu ®øa ch¸u nµy, lÇn nµy ng­¬i cho nã mét bµi häc. RÊt tèt! Ta c«ng t­ ph©n minh. LÇn nµy phogn ng­¬i lµ ®Ö tö cÊp 20!")
		else
			Talk(1,"","M¹nh ViÔn tµi ngµy cµng kªu ng¹o, chØ t¹i v× ta ®· qu¸ c­ng chiÒu nã!")
		end
	else
		Talk(1,"","C¸i Bang chóng ta ®èi ®Şch víi Kim Quèc, Kim Quèc xem chóng ta nh­ c¸i gai trong m¾t, toµn lùc giÕt ®Ö tö C¸i Bang.")
	end
end;

function L20_prise()
	SetTask(8,30*256)
	SetRank(39)
--	AddMagic(129)
	add_gb(30)			-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
	Msg2Player("Chóc mõng B¹n!. §· ®­îc th¨ng lµ: C¸i Bang ChÊp B¸t ®Ö tö. Häc ®­îcHãa hiÓm Vi Di ")
	AddNote("Chóc mõng B¹n!. §· ®­îc th¨ng lµ: C¸i Bang  ChÊp B¸t ®Ö tö. Häc ®­îc Hãa HiÓm Vi Di ")
end
