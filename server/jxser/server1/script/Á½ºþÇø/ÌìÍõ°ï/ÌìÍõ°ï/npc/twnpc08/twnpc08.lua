--description: ÌìÍõ°ïÀÏÓæÎÌ
--author: yuanlan
--date: 2003/4/28
-- Update: Dan_Deng(2003-08-16)

function main()
	UTask_tw = GetTask(3)
	if (UTask_tw == 40*256+50) then 		--40¼¶ÈÎÎñ
		UTask_tw40sub = GetTask(14)
		if (UTask_tw40sub == 0) then		-- ×ÓÈÎÎñÆô¶¯
			Talk(4,"","L·o ®¹i gia, ®©y lµ Lôc Thñ Quy ng­êi c©u ®­îc µ?","§óng! H«m nay thËt may m¾n! §©y kh«ng ph¶i lµ chuyÖn cã thÓ dÔ dµng gÆp®©u!","T¹i h¹ ®ang cÇn dïng nã ®Ó lµm thuèc gi¶i cøu ng­êi, l·o cã thÓ ®Ó l¹i nã cho ta kh«ng?","Ta h«m nay mang måi c©u tíi h×nh nh­ lµ kh«ng ®ñ, ng­¬icã thÓ t×m cho ta vµi con giun th× ta sÏ tÆng nã cho ng­¬i!")
			AddNote("TiÕp nhËn nhiÖm vô t×m giun ®Êt vÒ ®æi rïa Lôc M·o ")
			Msg2Player("T×m mÊy con giun ®Êt vÒ cho L·o Ng­ «ng míi cã thÓ ®æi ®­îc rïa Lôc M·o ")
			SetTask(14,1)
		elseif (UTask_tw40sub == 9) and (HaveItem(150) == 1) then
			Talk(3, "", "ThÕ nµo? §· cã giun ch­a?", "L·o ®¹i gia! Ng­êi xem ®©y ®· ®ñ ch­a?", "Tèt! Lôc Thñ Quy nµy tÆng cho ng­¬i!")
			DelItem(150)
			AddEventItem(94)
			Msg2Player("T×m ®­îc rïa Lôc M·o ")
			SetTask(14,10)
			AddNote("§em con giun ®Êt tÆng cho §iÕu Ng­ «ng ®Ó ®­îc rïa Lôc M·o ")
		elseif (UTask_tw40sub >= 10) then
			if (HaveItem(94) == 0) then
				AddEventItem(94)
				Talk(2,"","L·o ®¹i gia! Lôc Thñ Quy «ng tÆng cho ta,ta lµm mÊt råi!","¸i! Ng­¬i sao mµ tètsèm thÕ! Ta míi võa c©u ®­îc mét con, ng­¬icÇm ®i cøu ng­êi!")
			else
				Talk(1,"","L·o H¸n ta mçi ngµy ®Òu c©u ë ®©y, c¸ ë ®©y ®Òu biÕt ta")
			end
		else
			if (UTask_tw40sub ~= 0) and (UTask_tw40sub ~= 1) and (UTask_tw40sub ~= 3) and (UTask_tw40sub ~= 5) and (UTask_tw40sub ~= 7) and (UTask_tw40sub ~= 9) and (UTask_tw40sub ~= 10) then
				SetTask(14,0)
				Talk(1,"","TiÓu tö! Xem khİ s¾c cña ng­¬i kh«ng tèt l¾m. Tr­íc hÕt h·y ngåi xuèng nghØ ng¬i mét chót,cã g× tõ tõ mµ nãi. ")
			else
				Talk(1,"","T×m cho ta mÊy con giun ®Êt, th× ta sÏ cho ng­¬i Lôc Thñ Quy. ")
			end
		end
	else
		if (random(0,1) == 0) then
			Talk(1,"","NhÌ nhÑ! §õng lµm ®éng c¸ cña ta! ")
		else
			Talk(1,"","L·o H¸n ta mçi ngµy ®Òu c©u ë ®©y, c¸ ë ®©y ®Òu biÕt ta")
		end
	end
end;
