--ÖĞÔ­±±Çø ÖìÏÉÕò Â·ÈËĞ¡ĞÜµÄ¶Ô»°
--ÖìÏÉÕòĞÂÊÖÈÎÎñ: ÕÒÊÖ»·
--by Dan_Deng(2003-07-21)

--Ê¹ÓÃ±äÁ¿: UTask_world40,GetTask(68)

function main()
	UTask_world40 = GetTask(68)
	if (UTask_world40 == 1) then
		Talk(2,"","TiÓu huynh ®Ö, cã thÊy chiÕc nhÉn cña Song Song tû tû kh«ng?","Ta thÊy ng­êi ¨n mµy phİa T©y trÊn nhÆt ®­îc mét chiÕc nhÉn, kh«ng biÕt cã ph¶i cña Song Song tû tû kh«ng?")
		AddNote("ChiÕc nhÉn cña Song Song c« n­¬ng cã thÓ ®· bŞ ng­êi ¨n mµy lÊy ®i. ")
		SetTask(68,2)
		Msg2Player("ChiÕc nhÉn cña Song Song c« n­¬ng cã thÓ ®· bŞ ng­êi ¨n mµy lÊy ®i. ")
	else
		i = random(0,1)
		if (i == 0) then
			Talk(1,"","Song Song tû tû rÊt tèt víi ta.")
		else
			Talk(1,"","a c¶m thÊy ng­êi ¨n mµy ë phİa T©y trÊn cã c¸i g× ®ã h¬i kú qu¸i.")
		end
	end
end;
