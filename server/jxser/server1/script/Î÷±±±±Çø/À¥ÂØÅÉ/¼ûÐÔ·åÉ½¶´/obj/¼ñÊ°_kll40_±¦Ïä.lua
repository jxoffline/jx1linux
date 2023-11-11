-- ¼ûĞÔ·åÉ½¶´ ±¦Ïä À¥ÂØ40¼¶ÈÎÎñ
-- by£ºDan_Deng(2003-07-30)

function main()
	UTask_kl = GetTask(9)
	if ((UTask_kl == 40*256+20) and (HaveItem(212) == 1)) then		-- Ô¿³×Ó¦Ê¹ÓÃIDºÅ
		Msg2Player("B¹n thö dïngch×a khãamë chiÕc r­¬ng ")
		DelItem(212)
		AddEventItem(9)
		AddNote("B¹n nhËn ®­îc HuyÕt Hån ThÇn KiÕm ")
		Msg2Player("B¹n nhËn ®­îc HuyÕt Hån ThÇn KiÕm ")
	else
		Talk(1,"","B¶o r­¬ng nµy ®· khãa råi")
	end
end;
