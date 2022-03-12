--Î÷ÄÏ±±Çø ÖñË¿¶´¶ş²ãtoÖñË¿¶´Èı²ã
--Trap ID£ºÎ÷ÄÏ±±Çø 9
-- Update: Dan_Deng(2003-08-13)

function main(sel)
	UTask_tm = GetTask(2)
	if (UTask_tm >= 60*256+60) and (GetFaction() == "tangmen") then		-- ¹ıÁËÕâÒ»²½µÄ±¾ÃÅµÜ×Ó¿ÉÒÔ×ÔÓÉÁ·¼¶
		SetFightState(1)
		NewWorld(28, 1551, 3192)
	elseif ((UTask_tm == 60*256+40) and (HaveItem(100) == 1)) then			--ÈÎÎñÖĞ²¢ÇÒÓĞÔ¿³×
		DelItem(100)
		SetFightState(1)
		NewWorld(28, 1551, 3192)
		SetTask(2, 60*256+60)
	else
		Talk(1,"","Kh«ng cã ch×a khãa, b¹n kh«ng thÓ vµo TÇng 3 Tróc T¬ ®éng.")
	end
end;
