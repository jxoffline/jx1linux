--description: ÌìÈÌ½ÌĞ¡ÄĞº¢
--author: yuanlan	
--date: 2003/5/18
-- Update: Dan_Deng(2003-08-14)

function main()
	UTask_tr = GetTask(4);
	if (UTask_tr == 20*256+30) then
		AddNote("T×m ®­îc ®øa bĞ ë khu rõng phİa ®«ng qu¶ng tr­êng, tr¶ lêi c©u ®è cña nã. ")
		Msg2Player("T×m ®­îc ®øa bĞ ë khu rõng phİa ®«ng qu¶ng tr­êng, tr¶ lêi c©u ®è cña nã. ")
		Talk(3, "L20_Q1", "Anh b¹n nhá, tr¶ l¹i NhËt NguyÖt Song Lu©n cho ta, ®­îc kh«ng?", "Muèn ta tr¶ l¹i NhËt NguyÖt Song Lu©n còng §­îc!nh­ng ®Ó xem huynh cã th«ng minh h¬n ng­êi võa råi kh«ng ®·?","C©u ®è lÇn nµy cña ta sÏ kh¸c, nghe kü nhĞ:")
	elseif (UTask_tr == 20*256+40) then 
		L20_Q1()
	elseif (UTask_tr == 20*256+50) then
		if (HaveItem(125) == 1) and  (HaveItem(126) == 1) then
			Talk(1,"","A! TiÓu Hoµng! TiÓu Kh«i! Bän ng­¬i ch¼ng kh«n lanh g× c¶, lÇn sau kh«ng ®­îc ch¹y lung tung n÷a! Hai c¸i b¸nh xe nµy kh«ng ¨n ®­îc còng kh«ng mÆc ®­îc,chØ ®­îc c¸i ®Ñp mét chót chø thËt v« dông, chØ cã mÊy ng­êi ngu ngèc nµy míi cho lµ cña quı, th«i cÇm lÊy ®i.")
			DelItem(125)
			DelItem(126)
			AddEventItem(58)
			Msg2Player("§em con TiÓu Hoµng cÈu vµ con TiÓu Kh«i la tr¶ l¹i cho cËu bĞ, ®æi l¹i cÆp NhËt NguyÖt Song Lu©n. ")
			SetTask(4, 20*256+80)
			AddNote("§em con TiÓu Hoµng cÈu vµ con TiÓu Kh«i la tr¶ l¹i cho cËu bĞ, ®æi l¹i cÆp NhËt NguyÖt Song Lu©n. ")
		else							--ÒÑ¾­»Ø´ğÎÊÌâ£¬ÉĞÎ´ÕÒµ½Ğ¡»Æ¹·ºÍĞ¡»ÒÂ¿
			Talk(1,"","Huynh gióp ta t×m l¹i <color=Red>TiÓu Hoµng cÈu<color> vµ <color=Red>TiÓu Kh«i l­<color>, ta sÏ tr¶ NhËt NguyÖt Song Lu©n l¹i cho.")
		end
	elseif (UTask_tr == 20*256+80) and (HaveItem(58) == 0) then
		AddEventItem(58)
		Talk(1,"","Th«i cÇm l¹i NhËt NguyÖt Song Lu©n nµy ®i.")
	else				-- È±Ê¡¶Ô»°
		if (random(0,1) == 0) then
			Talk(1,"","TiÓu Hoµng vµ TiÓu Kh«i rÊt ®­îc viÖc vµ trung thµnh, cã thÓ nãi kh«ng thÓ con thó nµo h¬n ®­îc chóng!")
		else
			Talk(1,"","Ta cã con chã TiÓu Hoµng vµ con lõa TiÓu Kh«i, chóng nã rÊt th«ng minh, lµ b¹n ®­êng tèt nhÊt cña ta.")
		end
	end
end;

function L20_Q1()
	Say("Mét nhµ cã 3 anh em, trong ®ã chØ mét ng­êi thİch nãi thËt, anh C¶ nãi anh Hai nãi dèi, anh Hai nãi em ót nãi dèi. Ng­êi em ót nghe ®­îc th× nãi c¶ anh C¶ vµ anh Hai ®Òu nãi dèi, vËy trong ba ng­êi ai lµ ng­êi nãi thËt?", 3, "Anh c¶ /no", "Anh hai /L20_Q1_true", "Em ót /no")
end;

function L20_Q1_true()
	Talk(1,"","å.....Tuy huynh cã th«ng minh h¬n mét chót, nh­ng ngoµi ra còng ph¶i nhê huynh t×m gióp <color=Red>TiÓu Hoµng <color> vµ <color=Red>TiÓu Kh«i<color> ®i l¹c, ta míi tr¶ NhËt NguyÖt Song Lu©n.")
	SetTask(4, 20*256+50)
	AddNote("Tr¶ lêi chİnh x¸c, cËu bĞ yªu cÇu b¹n gióp t×m TiÓu Hoµng cÈu vµ TiÓu Kh«i la ®i l¹c. ")
	Msg2Player("Sau khi ®¸p ®óng c©u ®è cña cËu bĞ, nã yªu cÇu b¹n gióp t×m TiÓu Hoµng cÈu vµ TiÓu Kh«i la ®i l¹c. ")
end;

function no()
	Talk(1,"","Huynh còng nh­ «ng kia, toµn ng­êi ngu ngèc c¶!")
	SetTask(4, 20*256+40)
end;
