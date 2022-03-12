-- ÉÙÁÖ Â·ÈËNPC Ğş´È 50¼¶ÈÎÎñ
-- by£ºDan_Deng(2003-08-04)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_sl = GetTask(7)
	if (GetSeries() == 0) and (GetFaction() == "shaolin") then
		if ((UTask_sl == 50*256+30) and (HaveItem(28) == 1)) then		-- 50¼¶ÈÎÎñ½øĞĞÖĞ
			L50_prise()
		elseif ((UTask_sl == 50*256) and (GetLevel() >= 50)) then		--50¼¶ÈÎÎñÆô¶¯
			Talk(2,"L50_get","DŞch Cèt Kinh, 'DŞch C©n kinh' vµ 'TÈy Tñy Kinh' ®­îc gäi lµ 'ThiÕu L©m Tam Kinh', t­¬ng truyÒn do §¹t Ma S­ Tæ viÕt, chİnh lµ tinh tóy vâ häc cña bæn ph¸i.","N¨m x­a Kim binh Nam h¹, ®Ó tr¸nh B¶o ®iÓn r¬i vµo tay giÆc, trong lóc hçn lo¹n, ®Ö tö cña bæn täa lµ Trõng ViÔn ®· ®em tam kinh ®i giÊu trong khu rõng tïng phİa sau tù. Trong cuéc chiÕn, Trõng ViÔn do b¶o vÖ Tµng Kinh c¸c nªn ®· tö th­¬ng. VÒ sau c¸c t¨ng chóng vµo rõng tïng chØ t×m ®­îc 'DŞch C©n Kinh' vµ 'TÈy Tñy Kinh' cßn 'DŞch Cèt Kinh' th× vÉn ch­a t×m thÊy.")
--		elseif (UTask_sl == 70*256+10) then			-- ÖØ·µÃÅÅÉÈÎÎñÍê³É
--			Say("Ğş´È£ºÊ®¶¥É®Ã±ÄãÊÕ¼¯ÆëÁËÂğ£¿",2,"ÒÑ¾­×¼±¸ºÃÁË/return_completed","ÇëÔÙµÈÒ»¶ÎÊ±¼ä/return_sele_no")
--		elseif (UTask_sl == 70) then			-- ÖØ·µÃÅÅÉÈÎÎñ
--			Talk(1,"return_sele","Íæ¼Ò£ºÊ¦¸¸£¬ÎÒ³öÊ¦ÁË»¹¿ÉÒÔ½èÔÄ²Ø¾­¸óÖĞµÄÊé¼®Âğ£¿")
		else							-- ³£¹æ¶Ô»°
			Talk(1,"","Cæ tŞch b¶o ®iÓn cña bæn tù rÊt nhiÒu, Kim quèc nhßm ngã ®· l©u.")
		end
	else
		Talk(1,"","Tµng Kinh C¸c cßn lµ ph¸p ®­êng, lµ n¬i c¸c cao t¨ng thuyÕt kinh gi¶ng ph¸p, Tµng Kinh C¸c cña bæn tù cã rÊt nhiÒu kinh PhËt, rÊt nhiÒu tuyÖt b¶n tr©n phÈm.")
	end
end;

function L50_get()
	Say("NÕu 'DŞch Cèt Kinh' thËt sù ®· bŞ ®Ö tö ta lµm mÊt, th× thËt hæ thÑn víi PhËt Tæ!",2,"T×m gióp /L50_get_yes","Ta kh«ng quan t©m!/L50_get_no")
end

function L50_get_yes()
	SetTask(7,50*256+10)
	AddNote("NhËn nhiÖm vô t×m kinh cña ThiÕu L©m: T×m l¹i quyÓn DŞch Cèt Kinh ®­îc Trõng ViÔn giÊu. ")
	Msg2Player("NhËn nhiÖm vô t×m kinh cña ThiÕu L©m: T×m l¹i quyÓn DŞch Cèt Kinh ®­îc Trõng ViÔn giÊu. ")
end;

function L50_get_no()
end;

function L50_prise()
	Talk(1,"","§©y ®óng lµ 'DŞch Cèt Kinh'! Hay qu¸.....")
	SetTask(7,60*256)
	DelItem(28)
	SetRank(6)
--	AddMagic(271)
--	AddMagic(11)
--	AddMagic(19)
	add_sl(60)			-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
	AddNote("T×m ®­îc DŞch Cèt Kinh, hoµn thµnh nhiÖm vô t×m kinh. Th¨ng cÊp Phôc ma Thiªn V­¬ng. ")
	Msg2Player("Chóc mõng b¹n! B¹n ®· th¨ng chøc Phôc ma Thiªn V­¬ng cña ThiÕu L©m ph¸i! Häc ®­îc vâ c«ng Long Tr¶o Hæ Tr¶o, Hoµnh Quy Lôc Hîp, Ma Ha V« L­îng. ")
end;
