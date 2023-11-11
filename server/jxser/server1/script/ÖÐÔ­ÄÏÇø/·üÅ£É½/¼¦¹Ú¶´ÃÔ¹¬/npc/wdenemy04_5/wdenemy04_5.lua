--description: Îäµ±ÅÉ40¼¶ÈÎÎñ ·üÅ£É½¼¦¹Ú¶´ÎåÖ»°×Óñ»¢5¡¡Îäµ±40¼¶ÈÎÎñ
--author: yuanlan	
--date: 2003/5/15
-- Update: Dan_Deng(2003-08-17)

function OnDeath()
	if (GetTask(5) == 40*256+20) then
		UTask_wd40tmp = SetBit(GetTaskTemp(16),5,1)
		if (UTask_wd40tmp == 31) then
			SetTask(5,40*256+40)
			AddNote("Thu phôc ®­îc n¨m con  B¹ch Ngäc Hæ cña NhuËn N­¬ng. ")
			Msg2Player("Thu phôc ®­îc n¨m con  B¹ch Ngäc Hæ cña NhuËn N­¬ng. ")
		else
			SetTaskTemp(16, UTask_wd40tmp)
		end
	end
end;
