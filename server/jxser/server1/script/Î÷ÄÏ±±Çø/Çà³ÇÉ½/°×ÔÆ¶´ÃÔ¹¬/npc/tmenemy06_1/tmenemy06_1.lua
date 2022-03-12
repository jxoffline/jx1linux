--description: ÌÆÃÅ30¼¶ÈÎÎñ Çà³ÇÉ½°×ÔÆ¶´°ó·Ë
--author: yuanlan	
--date: 2003/3/11
-- Update: Dan_Deng(2003-08-13)

function OnDeath()
	UTask_tm = GetTask(2);
	if (UTask_tm == 30*256+20) then 
		Talk(1,"","Hõ! Muèn ®¸nh b¹i ta µ! §õng t­ëng r»ng dÔ dµng ®o¹t ®­îc 'Háa KhÝ Phæ'. Thµnh thËt nãi víi ng­¬i, 'Háa KhÝ Phæ' ®ang ®Ó trong r­¬ng b¸u. Ch×a khãa r­¬ng ta ®Ó trong ®éng, ng­¬i cã giái h·y vµo ®éng mµ t×m!")
		SetTask(2, 30*256+30)
		AddNote("§¸nh b¹i §¹i §Çu Môc Cuång Sa, biÕt ®­îc Ho¶ KhÝ Phæ ®­îc cÊt trong mét b¶o r­¬ng. CÇn ph¶i t×m ®­îc ch×a khãa! ")
		Msg2Player("§¸nh b¹i §¹i §Çu Môc Cuång Sa, biÕt ®­îc Ho¶ KhÝ Phæ ®­îc cÊt trong mét b¶o r­¬ng. CÇn ph¶i t×m ®­îc ch×a khãa! ")
	end
end;	
