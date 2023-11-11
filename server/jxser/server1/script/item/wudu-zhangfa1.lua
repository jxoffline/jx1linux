-- Created by fangjieying 2003-5-17
-- ¡¶Îå¶¾ÕÆ·¨¡¤¾íÒ»¡·
-- Ñ§»á¼¼ÄÜÒõ·çÊ´¹Ç
-- Îå¶¾£¬80¼¶ÒÔÉÏ¿ÉÓÃ
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(353)
	if(party ~= "wudu") then							-- ²»ÊÇÎå¶¾
		Msg2Player("B¹n nghiªn cøu Ngò §éc Ch­ëng Ph¸p - QuyÓn 1 ®­îc nöa ngµy, nh­ng vÉn ch­a lÜnh ngé ®­îc g×. ")
		return 1
	elseif(GetLever < 80) then							-- ÊÇÎå¶¾µ«Î´µ½80¼¶
		Msg2Player("B¹n nghiªn cøu Ngò §éc Ch­ëng Ph¸p - QuyÓn 1 ®­îc nöa ngµy, lÜnh ngé ®­îc rÊt İt. ")
		return 1
	elseif(skill ~= -1) then							-- ÒÑÑ§¹ı¸Ã¼¼ÄÜ
		Msg2Player("B¹n ®· nghiªn cøu kü Ngò §éc Ch­ëng Ph¸p - QuyÓn 1, nh­ng vÉn ch­a häc ®­îc g×. ")
		return 1
	else
		AddMagic(353,1)										-- Ñ§»á¼¼ÄÜ
		Msg2Player("Häc ®­îc kü n¨ng ¢m Phong Thùc Cèt. ")
		return 0
	end
end