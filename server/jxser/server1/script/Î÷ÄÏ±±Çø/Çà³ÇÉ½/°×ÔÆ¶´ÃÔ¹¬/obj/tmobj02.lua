--description: ÌÆÃÅ30¼¶ÈÎÎñ Çà³ÇÉ½°×ÔÆ¶´±¦Ïä
--author: yuanlan	
--date: 2003/3/11
-- Update: Dan_Deng(2003-08-13)

function main()
	UTask_tm = GetTask(2);
	if (UTask_tm == 30*256+30) and (HaveItem(98) == 1) then					--µÃµ½Ô¿³×Ò»
		DelItem(98)
		AddEventItem(42) 
		Msg2Player("LÊy ®­îc Háa KhÝ Phæ ")
		SetTask(2, 30*256+50)
		AddNote("Më r­¬ng lÊy ®­îc Ho¶ KhÝ Phæ ")
	elseif (UTask_tm >= 30*256+50) and (UTask_tm <= 30*256+60) and (HaveItem(42) == 0) then			-- µÀ¾ß¶ªÁË
		AddEventItem(42) 
		Talk(1,"","Hãa ra 'Háa KhÝ Phæ' ng­¬i ®· bá quªn trong r­¬ng b¸u!")
	elseif (UTask_tm > 30*256+30) then 
		Talk(1,"","B¶o r­¬ng ®· rçng")
	else
		Talk(1,"","Kh«ng cã ch×a khãa, kh«ng më ®­îc r­¬ng b¸u!.")
	end
end;
