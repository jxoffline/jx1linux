--description: ÌìÍõ°ï×óÊ¹¹Å°Ø¡¡ÌìÍõ30¼¶ÈÎÎñ
--author: yuanlan	
--date: 2003/4/25
--Dan_Deng(2003-07-22), ¼ÓÈëÃÅÅÉÈÎÎñµÄµÈ¼¶ÒªÇó
-- Update: Dan_Deng(2003-08-16)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_tw = GetTask(3)
	if (GetSeries() == 0) and (GetFaction() == "tianwang") then
		if ((UTask_tw == 30*256) and (GetLevel() >= 30) and (GetFaction() == "tianwang")) then
			Say("ThËt xui xÎo! H«m qua ta ®i ngang qua <color=Red>YÕn Tö ®éng<color>, ®· lµm r¬i mÊt <color=Red>Thiªn V­¬ng lÖnh<color>. §ã lµ tİn vËt cña bæn bang. NÕu kh«ng t×m l¹i ®­îc….HÇy!..", 2, "Gióp t×m Thiªn V­¬ng lÖnh /L30_get_yes", "Ta kh«ng quan t©m!/L30_get_no")
		elseif (UTask_tw == 30*256+20) and (HaveItem(145) == 1 ) then
			L30_prise()
		elseif (UTask_tw > 30*256) and (UTask_tw < 40*256) then					--ÒÑ¾­½Óµ½30¼¶ÈÎÎñ£¬ÉĞÎ´Íê³É
			Talk(1,"","<color=Red>Thiªn V­¬ng lÖnh<color> mÊt ë <color=Red>YÕn Tö ®éng<color>. NÕu ng­¬i t×m l¹i ®­îc, ta sÏ phong ng­¬i lµ Ch­ëng §µ §Çu LÜnh.")
		elseif (UTask_tw >= 40*256) then					--ÒÑ¾­Íê³É30¼¶ÈÎÎñ£¬ÉĞÎ´³öÊ¦
			Talk(1,"","H¶o huynh ®Ö! Ng­¬i ®· gióp ta mét viÖc lín råi!")
		else
			Talk(1,"","Chóng ta b¾c kh¸ng Kim binh, Nam phßng TriÖu Tèng, hai bªn ®Òu t¸c chiÕn thËt kh«ng dÔ dµng g× ")
		end
	elseif (UTask_tw >= 70*256) then							--ÒÑ¾­³öÊ¦
		Talk(1,"","XuÊt s­ råi ®õng quªn th­êng xuyªn trë vÒ th¨m c¸c huynh ®Ö nhĞ!")
	else
		Talk(1,"","§õng coi th­êng bang chñ lµ mét n÷ nhi.C« ta xö lı c¸c viÖc trong bang tÊt c¶ ®Òu ®©u ra ®ã, th­ëng ph¹t ph©n minh, trong lßng mäi ng­êi ®Òu rÊt kİnh träng c« ta.")
	end
end;

function L30_get_yes()
	Talk(1,"","<color=Red>Thiªn V­¬ng lÖnh<color> mÊt ë <color=Red>YÕn Tö ®éng<color>. NÕu ng­¬i t×m l¹i ®­îc, ta sÏ phong ng­¬i lµ Ch­ëng §µ §Çu LÜnh.")
	SetTask(3, 30*256+20)
	AddNote("T¹i cöa T©y Thiªn ®iÖn, tiÕp nhËn nhiÖm vô <color=red>Thiªn V­¬ng lÖnh<color>, ®i ®Õn YÕn Tö ®éng t×m Thiªn V­¬ng lÖnh ")
	Msg2Player("T¹i cöa T©y Thiªn ®iÖn tiÕp nhËn nhiÖm vô Thiªn V­¬ng lÖnh, ®i ®Õn YÕn Tö ®éng t×m Thiªn V­¬ng lÖnh ")
end;

function L30_get_no()
end;

function L30_prise()
	Talk(1,"","Th× ra Thiªn V­¬ng LÖnh ®· bŞ bän c­íp ë YÕn Tö ®éng trém mÊt, may lµ t×m l¹i ®­îc, nÕu kh«ng sÏ bŞ bang chñ quë tr¸ch. Ng­¬i thËt ®· gióp ta mét viÖc lín. Bæn sø nãi lêi sÏ gi÷ lÊy lêi, nhÊt ®Şnh sÏ phong ng­¬i lµm Ch­ëng §¸ §Çu LÜnh.")
	DelItem(145)
	SetRank(46)
	SetTask(3, 40*256)
--	AddMagic(37)
--	AddMagic(35)
--	AddMagic(31)
	add_tw(40)			-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
	Msg2Player("Mang Thiªn V­¬ng lÖnh giao cho Cæ B¸ch, hoµn thµnh nhiÖm vô Thiªn V­¬ng lÖnh. §­îc phong lµ: Ch­ëng §µ §Çu LÜnh. Häc ®­îc B¸t Phong Tr¶m, D­¬ng Quan Tam §iÖp, Hµng V©n QuyÕt. ")
	AddNote("Trë l¹i ®¶o Thiªn V­¬ng mang Thiªn V­¬ng lÖnh giao cho Cæ B¸ch, hoµn thµnh nhiÖm vô, ®­îc phong lµ: Ch­ëng §µ §Çu LÜnh ")
end;
