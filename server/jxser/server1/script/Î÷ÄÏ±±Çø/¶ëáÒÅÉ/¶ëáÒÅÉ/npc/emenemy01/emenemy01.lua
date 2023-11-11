--description: ¶ëáÒÅÉ×êÌìÆÂµĞÈË
--author: yuanlan	
--date: 2003/3/4
-- Update: Dan_Deng(2003-08-12)

function OnDeath()
	Uworld36 = GetByte(GetTask(36),1)
	if (Uworld36 == 70) and (HaveItem(17) == 0) and (random(0,100) < 40) then			--Ã»ÓĞ°×ÓñÈçÒâÊ±£¬40%¸ÅÂÊ
		AddEventItem(17)
		Msg2Player("NhËn ®­îc B¹ch Ngäc Nh­ ı. ")
		AddNote("§¸nh b¹i Toµn Thiªn Ph¸, nhËn ®­îc B¹ch Ngäc Nh­ ı. ")
	end
end;
