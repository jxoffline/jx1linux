--description: ÌìÍõ°ïµØ»¤·¨ÏÄ³Ï¡¡ÌìÍõ50¼¶ÈÎÎñ
--author: yuanlan	
--date: 2003/4/28
--Dan_Deng(2003-07-22), ¼ÓÈëÃÅÅÉÈÎÎñµÄµÈ¼¶ÒªÇó
-- Update: Dan_Deng(2003-08-16)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_tw = GetTask(3)
	if (GetSeries() == 0) and (GetFaction() == "tianwang") then
		if (UTask_tw == 50*256) and (GetLevel() >= 50) then
			Say("GÇn ®©y trong Thñy tr¹i cã lêi ®ån lµ §éng §×nh Hå xuÊt hiÖn <color=Red>Thñy Qu¸i<color>, giÕt chÕt rÊt nhiÒu ng­ d©n, khiÕn cho lßng ng­êi lo sî, ng­¬icã b»ng lßng ®i ®iÒu tra thö kh«ng? ", 2, "§ång ı!/L50_get_yes", "Xin h·y ph¸i ng­êi kh¸c /L50_get_no")
		elseif (UTask_tw == 50*256+20) and (HaveItem(95) == 1) then
			L50_prise()
		elseif (UTask_tw > 50*256) and (UTask_tw < 60*256) then					--ÒÑ¾­½Óµ½50¼¶ÈÎÎñ£¬ÉĞÎ´Íê³É
			Talk(1,"","Cã vµi ng­êi nh×n thÊy <color=Red>Thñy Qu¸i<color>th­êng xuÊt hiÖn ë <color=Red>phİa ®«ng<color>. Phİa §«ng cã mét <color=Red>S¬n ®éng th«ng qua ®¸y §éng §×nh hå<color>. Ta nghi lµ trong ®éng cã Cæ qu¸i!")
		else					--ÒÑ¾­Íê³É50¼¶ÈÎÎñ£¬ÉĞÎ´³öÊ¦£¨È±Ê¡¶Ô»°£©
			Talk(1,"","Thiªn h¹ ngµy nay rÊt hçn ®én, nh­ng ı trêi ®· phï hé bæn bang ")
		end
	elseif (UTask_tw >= 70*256) then							--ÒÑ¾­³öÊ¦
		Talk("Mét ngµy lµm huynh ®Ö th× suèt ®êi lµ huynh ®Ö, ng­¬i nªn b¶o träng ")
	else
		Talk(1,"","Ta mÊy ngµy nay th­êng nh×n thÊy ngò s¾c xuÊt hiÖn trªn mÆt hå! Kh«ng biÕt ®©y lµ ®iÒm lµnh hay d÷!")
	end
end;

function L50_get_yes()
	Talk(1,"","Cã vµi ng­êi nh×n thÊy <color=Red>Thñy Qu¸i<color>th­êng xuÊt hiÖn ë <color=Red>phİa ®«ng<color>. Phİa §«ng cã mét <color=Red>S¬n ®éng th«ng qua ®¸y §éng §×nh hå<color>. Ta nghi lµ trong ®éng cã Cæ qu¸i!")
	SetTask(3, 50*256+20)
	AddNote("§Õn phİa §«ng HiÖu lÖnh ®µi gÆp Phóc Thµnh, nhËn<color=Red> nhiÖm vô thuû qu¸i<color>, ®i xuèng ®¸y §éng §×nh Hå xem h­ thùc thÕ nµo. ")
	Msg2Player("§Õn phİa §«ng HiÖu lÖnh ®µi gÆp Phóc Thµnh, nhËn nhiÖm vô thuû qu¸, ®i xuèng ®¸y §éng §×nh Hå xem h­ thùc thÕ nµo ")
end;

function L50_get_no()
end;

function L50_prise()
	Talk(1,"","Ngò S¾c th¹ch nµy kh«ng chØ cã thÓ an ®Şnh lßng ng­êi mµ cßn mang h¹nh phóc cho bæn bang. ThËt lµ trêimuèn gióp ta!")
	DelItem(95)
	SetTask(3, 60*256)
	SetRank(48)
--	AddMagic(42)
	add_tw(60)			-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
	Msg2Player("Hoµn thµnh nhiÖm vô thñy qu¸i, trë thµnh Hé §¶o T­íng qu©n, häc ®­îc vâ c«ng Kim Chung Tr¸o. ")
	AddNote("Trë l¹i Thiªn V­¬ng Bang, giao Ngò s¾c th¹ch cho Phóc Thµnh hoµn thµnh nhiÖm vô, trë thµnh Hé §¶o t­íng qu©n. ")
end;
