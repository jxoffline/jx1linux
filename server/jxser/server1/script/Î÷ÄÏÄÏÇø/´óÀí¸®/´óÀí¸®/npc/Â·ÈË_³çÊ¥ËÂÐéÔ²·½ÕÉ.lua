-- ´óÀí³Ç¡¡Â·ÈË¡¡³çÊ¥ËÂĞéÔ²·½ÕÉ£¨´äÑÌÃÅ50¼¶ÈÎÎñ£©
-- by£ºDan_Deng(2003-07-27)

function main()
	UTask_cy = GetTask(6)
	if (UTask_cy == 50*256+10) then		--50¼¶ÈÎÎñ
		SetTask(6,50*256+32)
		Talk(4,"","Ph­¬ng tr­îng ®¹i s­! ta lµ ®Ö tö Thóy Yªn, Ch­ëng m«n b¶o ta ®Õn gióp quı tù t×m l¹i b¶o vËt.","A Di §µ PhËt! VËy lµm phiÒn Thİ chñ! Bän c­oíp ®· trèn vµo Thiªn TÇm Th¸p.","Th¸p nµy lµ th¸nh ®Şa cña §¹i Lı, cho nªn ®Ó phßng ng­êi kh¸c x©m nhËp vµo nªn trong th¸p cã rÊt nhiÒu ®ång nh©n. Khi Thİ chñ vµo b¾t tªn trém cÇn ph¶i cÈn thËn!","§¹i s­ yªn t©m! ")
	elseif (UTask_cy == 50*256+32) and (HaveItem(5) == 1) then		-- Íê³É
		SetTask(6,50*256+50)
		DelItem(5)
		Talk(3,"","Ph­¬ng Tr­îng §¹i S­! §©y lµ Vò §ång Quan ¢m mµ quı tù ®· bŞ mÊt, b©y giê xin ®­îc hoµn tr¶ l¹i.","A Di §µ PhËt! B¶o vËt trÊn tù ®· t×m l¹i ®­îc, ®óng lµ Bå T¸t phï hé! C¶m ¬n Thİ chñ! Xin chuyÓn lêi c¶m ¬n ®Õn Ch­ëng m«n quı ph¸i.","§¹i s­ kh«ng nªn kh¸ch s¸o!")
		Msg2Player("Giao Vò §ång Quan ¢m cho H­ viªn ph­¬ng tr­îng ")
		AddNote("Giao Vò §ång Quan ¢m cho H­ viªn ph­¬ng tr­îng ")
	elseif (UTask_cy >= 50*256+32) and (UTask_cy < 50*256+50) then		-- ÈÎÎñ¹ı³ÌÖĞ
		Talk(1,"","TÊt c¶ tr«ng nhê vµo n÷ thİ chñ ta sÏ ë ®©y ®éc kinh cÇu nguyÖn cho thİ chñ.")
	elseif (UTask_cy >= 50*256+50) then						-- ÈÎÎñÍê³ÉÒÔºó
		Talk(1,"","Xin ®a t¹ Thİ chñ! ¢n ®øc cña Thİ chñ Bæn tù kh«ng biÕt lÊy g× ®Ó c¶m kİch.")
	else
		Talk(3,"","Vò §ång Quan ¢m lµ mét trong nh÷ng Sïng Th¸nh Ngò B¶o cña bæn tù, ®©y lµ niÒm tù hµo cña Sïng Th¸nh Tù ","Ng­êi xuÊt gia sao mµ cã lßng kiªu ng¹o hiÕu th¾ng chø? ","Lêi gi¸o huÊn cña thİ chñ thËt khiÕn bÇn t¨ng ph¶i suy xĞt l¹i. A Di §µ PhËt, A Di §µ PhËt, A Di §µ PhËt. ")
	end
end;
