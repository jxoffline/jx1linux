--ÖĞÔ­±±Çø ÖìÏÉÕò Â·ÈËÆòØ¤µÄ¶Ô»°
--ÖìÏÉÕòĞÂÊÖÈÎÎñ: ÕÒÊÖ»·
--by Dan_Deng(2003-07-21)

--Ê¹ÓÃ±äÁ¿: UTask_world40,GetTask(68)

function main()
	UTask_world40 = GetTask(68)
	if (UTask_world40 == 2) then
		Talk(6,"","Nghe nãi ng­¬i nhÆt ®­îc chiÕc nhÉn. §ã lµ cña Song Song c« n­¬ng trong th«n ®¸nh r¬i, ng­¬i cã thÓ tr¶ l¹i kh«ng?"," Ta ch¼ng cã g× ¨n c¶, ph¶i cho ta c¸i g× míi ®­îc.","….. (Ng­¬i ch¼ng ph¶i ¨n c¬m sao?) ......Ng­¬i muèn g×?","Ta muèn ¨n mét phÇn ®Ëu hò Ngò H­¬ng.","Ng­¬i ®ßi hái nhiÒu qu¸ ®Êy.","Muèn hay kh«ng muèn, ng­¬i tù quyÕt ®Şnh ®i.")
		Msg2Player("Ng­êi ¨n mµy muèn ®æi nhÉn cña Song Song c« n­¬ng lÊy ®Ëu phô Ngò H­¬ng. ")
		AddNote("Ng­êi ¨n mµy muèn ®æi nhÉn cña Song Song c« n­¬ng lÊy ®Ëu phô Ngò H­¬ng. ")
		SetTask(68,3)
	elseif ((UTask_world40 == 3) and (HaveItem(187) == 1)) then
		Talk(3,"","§Ëu hò Ngò H­¬ng cña ng­¬i ®©y.","A! §óng lµ ®Ëu hò chİnh t«ng Chu Tiªn råi, th¬m qu¸!","§­îc! VËy ®­a nhÉn cho ta.")
		DelItem(187)
		AddEventItem(191)
		Msg2Player("LÊy ®­îc nhÉn cña Song Song c« n­¬ng. ")
		AddNote("§­a ®Ëu phô Ngò H­¬ng cho ng­êi ¨n mµy, lÊy ®­îc nhÉn cho Song Song c« n­¬ng. ")
--		SetTask(68,5)
	else
		i = random(0,1)
		if (i == 0) then
			Talk(1,"","H·y bè thİ cho kÎ nghÌo nµy b¸t c¬m nguéi!")
		else
			Talk(1,"","N»m ph¬i n¾ng, b¾t con rËn. Nh÷ng lóc thÕ nµy, thÇn tiªn còng kh«ng ®æi!")
		end
	end
end;
