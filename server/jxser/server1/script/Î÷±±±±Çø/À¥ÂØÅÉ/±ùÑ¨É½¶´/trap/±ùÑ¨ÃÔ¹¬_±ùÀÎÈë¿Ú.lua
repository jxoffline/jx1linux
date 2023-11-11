--±ùÑ¨ÃÔ¹¬ ±ùÀÎÈë¿Ú trap
-- by£ºDan_Deng(2003-07-31)

function main(sel)
	UTask_kl = GetTask(9)
	if (UTask_kl == 50*256+64) and (HaveItem(213) == 1) and (HaveItem(10) == 0) then		-- À¥ÂØ50¼¶ÈÎÎñÖĞ
		SetTask(9,50*256+128)
		DelItem(213)		-- Ô¿³×Ó¦Ê¹ÓÃIDºÅ
		Msg2Player("B¹n dïng ch×a khãa më ®­îc c¸nh cöa b¨ng lao ")
		AddNote("B¹n dïng ch×a khãa më ®­îc c¸nh cöa b¨ng lao ")
	elseif (UTask_kl == 50*256+128) then
--		SetPos()
		Msg2Player("B¹n ®i vµo trong b¨ng lao ")
	else
		Msg2Player("Cöa nhµ lao ®ang bŞ khãa ")
	end
end;
