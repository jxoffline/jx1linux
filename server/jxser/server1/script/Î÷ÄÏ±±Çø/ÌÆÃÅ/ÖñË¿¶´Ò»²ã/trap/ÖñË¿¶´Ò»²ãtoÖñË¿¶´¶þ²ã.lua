--Î÷ÄÏ±±Çø ÖñË¿¶´Ò»²ãtoÖñË¿¶´¶ş²ã
--Trap ID£ºÎ÷ÄÏ±±Çø 7
-- Update: Dan_Deng(2003-08-13)

function main(sel)
	UTask_tm = GetTask(2);
	if ((UTask_tm == 60*256+20) and (HaveItem(99) == 1)) then			--ÈÎÎñÖĞ²¢ÇÒÓĞÔ¿³×
		DelItem(99)
		SetFightState(1)
		NewWorld(27, 1522, 3205)
		SetTask(2, 60*256+40)
	elseif (UTask_tm > 60*256+20) and (GetFaction() == "tangmen") then		-- ¹ıÁËÕâÒ»²½µÄ±¾ÃÅµÜ×Ó¿ÉÒÔ×ÔÓÉÁ·¼¶
		SetFightState(1)
		NewWorld(27, 1522, 3205)
	else
		Talk(1,"","Kh«ng cã ch×a khãa, b¹n kh«ng thÓ vµo tÇng 2 Tróc T¬ ®éng.")
	end
end;
