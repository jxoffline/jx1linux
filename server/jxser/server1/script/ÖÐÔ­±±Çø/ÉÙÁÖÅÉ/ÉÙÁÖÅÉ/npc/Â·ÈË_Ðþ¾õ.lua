-- ÉÙÁÖ Â·ÈËNPC Ğş¾õ 30¼¶ÈÎÎñ
-- by£ºDan_Deng(2003-08-01)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_sl = GetTask(7)
	if (GetSeries() == 0) and (GetFaction() == "shaolin") then
		if (UTask_sl == 30*256+20) and (HaveItem(27) == 1) then		--30¼¶ÈÎÎñÍê³É
			Talk(2,"L30_prise","S­ thóc! MÊy ng­êi trong TÇm Th¸p lµ tay ch©n cña ng­êi Kim, bän hä ®· ©m thÇm trém mÊt quyÓn 'B¸t Nh· Ba La MËt §a T©m Kinh', nh­ng ®Ö tö ®· ®o¹t l¹i ®­îc, xin mêi s­ thóc xem qua.","A Di §µ PhËt! ThËt may ng­¬i sím ph¸t hiÖn ra ©m m­u cña bän hä, ®o¹t vÒ kinh th­, nÕu kh«ng th× hËu qu¶ khã l­êng, lÇn nµy ng­¬i lËp c«ng lín råi, bæn täa sÏ th¨ng ng­¬i lµm ®Ö tö 30 cÊp!")
		elseif ((UTask_sl == 30*256) and (GetLevel() >= 30)) then		--30¼¶ÈÎÎñ
			Say("Võa lóc n·y cã vŞ t¨ng nh©n l¹i b¸o c¸o, nãi r»ng ph¸t hiÖn mét sè ng­êi l¹ mÆt ®ang cã hµnh vi bİ Èn trong ThiÕt Th¸p, ng­¬i ®ång ı ®Õn ®ã xem thö kh«ng?",2,"§ång ı!/L30_get_yes","Ta cßn cã viÖc kh¸c. /L30_get_no")
		else							-- ³£¹æ¶Ô»°
			Talk(1,"","Kim Quèc xem chóng ta nh­ c©y kim trong m¾t hä, mÊy lÇn ph¸i ng­êi ®Õn g©y sù víi ThiÕu L©m.")
		end
	else
		Talk(1,"","Vâ c«ng ThiÕu L©m chóng ta x­a ®Õn nay ®­êng ®­êng ch¸nh ch¸nh, lßng d¹ ®é l­îng tõ bi.")
	end
end;

function L30_get_yes()
	Talk(1,"","VÊt v¶ cho ng­¬i qu¸, ph¶i cÈn thËn ®ã!")
	SetTask(7,30*256+10)
	AddNote("§i Th¸p L©m ®iÒu tra bän ng­êi kh¶ nghi. ")
	Msg2Player("§i Th¸p L©m ®iÒu tra bän ng­êi kh¶ nghi. ")
end;

function L30_get_no()
end;

function L30_prise()
	Talk(1,"","§a t¹ s­ thóc!")
	DelItem(27)
	SetTask(7,40*256)
	SetRank(4)
--	AddMagic(16)
	add_sl(40)			-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
	AddNote("LÊy l¹i ®­îc B¸t Nh· Ba La MËt §a T©m Kinh, th¨ng chøc Hé Ph¸p La H¸n. ")
	Msg2Player("Chóc mõng b¹n! B¹n ®· th¨ng chøc Hé Ph¸p La H¸n cña ThiÕu L©m ph¸i! Häc ®­îc vâ c«ng La H¸n TrËn. ")
end;
