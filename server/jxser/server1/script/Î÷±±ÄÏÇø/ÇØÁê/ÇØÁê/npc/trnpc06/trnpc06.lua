--description: ÇØÁêÅ©·ò¡¡ÌìÈÌ30¼¶ÈÎÎñ
--author: yuanlan	
--date: 2003/5/19
-- Update: Dan_Deng(2003-08-14)

function main()
	UTask_tr = GetTask(4);
	if ((UTask_tr == 30*256+20) and (HaveItem(62) == 0)) then			-- ÈÎÎñ×´Ì¬¶Ô»°
		Talk(3, "select", "H«m qua ta lµm v­ên, nhÆt ®­îc mét viªn ngäc mµu, ph¸t ra ¸nh s¸ng tr«ng rÊt l× l¹. Nh­ng ch¼ng thÓ ¨n ch¼ng thÓ mÆc,vËy dïng vµo viÖc g×? Th¸ng tr­íc V­¬ng ThÊt cïng th«n còng ®µo ®­îc mét tói b¹c, nhµ ®ã sè ®á thÕ kh«ng biÕt? Hä th× ®µo ®­îc tói b¹c cßn ta th× ®µo ®­îc mét côc ®¸, thËt xui xÎo!", " (Ch¼ng lÏ lµ lµ V©n Méng Tö?!) §¹i thóc! Ta muèn mua viªn ®¸ nµy! Thóc b¸n kh«ng?", "Ta kh«ng nghe lÇm chø, thËt sù ng­¬i muèn mua µ? (GÆp may råi, ®óng lµ mét th»ng ngèc!) . §­îc ®­îc! ChØ cÇn ng­¬i ®­a ta 100 l­îng th× viªn ®¸ nµy lµ cña ng­¬i")
	elseif (UTask_tr >=30*256+20) then								--Ö´ÐÐÍê30¼¶ÈÎÎñ
		Talk(1,"","Ng­¬i cßn muèn mua n÷a kh«ng? LÇn sau ta ®µo ®­îc sÏ b¸n rÎ h¬n cho!")
	else						-- È±Ê¡¶Ô»°
		Talk(1,"","C¶ ®êi lµm ruéng, biÕt ®Õn khi nµo míi ®µo ®­îc ch©u b¸u ®Ó ph¸t tµi ®©y!")
	end
end;

function select()
	if (GetCash() >= 100) then
		Pay(100)
		AddEventItem(62)
		Msg2Player("§­îc B¶o Th¹ch V©n Méng Tö ")
		AddNote("Trong khu rõng ngoµi TÇn L¨ng ®Þa, gÆp mét ng­êi n«ng d©n, mua ®­îc B¶o Th¹ch V©n Méng Tö. ")
	else
		Talk(1,"","Khi nµo ®ñ tiÒn, l¹i ®Õn t×m ta nhÐ!")
	end
end;
