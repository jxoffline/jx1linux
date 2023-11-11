--description: ¶ëáÒÅÉ»ğºüË®ÃæµĞÈË
--author: yuanlan	
--date: 2003/3/5
-- Update: Dan_Deng(2003-08-12)

function OnDeath()
	UTask_em = GetTask(1)
	if (UTask_em == 30*256+50) and (HaveItem(120) == 0) and (random(0,99) < 50) then
		if (HaveItem(119) == 0) then			--Ã»ÓĞ¼¦ÍÈ
			Msg2Player("Ph¸t hiÖn ra Háa Hå, nh­ng kh«ng cã ®ïi gµ, Háa Hå kh«ng chŞu ®i theo ng­êi l¹. ")
		else							--ÓĞ¼¦ÍÈ		
			DelItem(119)
			AddEventItem(120) 
			Msg2Player("Cøu tho¸t Háa Hå ")
--			SetTask(1, 38)
			AddNote("T¹i hå c¸ sÊu ë hËu s¬n, ®¸nh b¹i r¾n mèi, t×m thÊy Háa Hå. ")
		end			
	end
end;	
