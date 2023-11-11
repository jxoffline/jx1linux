--description: ∂Î·“≈…≥§Ω≠‘¥Õ∑«Â∫Õ
--author: yuanlan	
--date: 2003/3/6
-- Update: Dan_Deng(2003-08-12)

function OnDeath()
	UTask_em = GetTask(1);
	if ((UTask_em == 60*256+50) and (HaveItem(24) == 0) and (random(0,99) < 20)) then		--»ŒŒÒ÷–£¨≤¢«“√ª”–—Ã”Ò÷∏ª∑£¨‘Ú”–20%ª˙¬ 
		AddEventItem(24) 
--		SetTask(1, 68)
		AddNote("ß∏nh bπi ph∂n ÆÂ Thanh Hﬂa, l y lπi Y™n Ng‰c Chÿ Hoµn ")
		Msg2Player("ß∏nh bπi ph∂n ÆÂ Thanh Hﬂa, l y lπi Y™n Ng‰c Chÿ Hoµn ")
	end
end;	
