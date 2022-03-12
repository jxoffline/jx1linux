--description: Îäµ±ÅÉ40¼¶ÈÎÎñ ·üÅ£É½¼¦¹Ú¶´ÆÕÍ¨¹ÖÎï
--author: yuanlan	
--date: 2003/5/15
-- Update: Dan_Deng(2003-08-17)

function OnDeath()
	UTask_wd = GetTask(5);
	if (UTask_wd == 40*256+60) and (HaveItem(164) == 0) and (random(0, 99) < 33) then
		AddEventItem(164)
		Msg2Player("NhËn th­ håi ©m cña NhuËn N­¬ng ")
--		SetTask(5, 48)
		AddNote("Thu phôc ®­îc n¨m con  B¹ch Ngäc Hæ cña NhuËn N­¬ng, nhËn ®­îc th­ håi ©m ")
	end
end;
