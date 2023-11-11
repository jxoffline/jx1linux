-- Created by fangjieying 2003-5-17
-- ¡¶ÌìÍõ´¸·¨¡¤¾íÒ»¡·
-- Ñ§»á¼¼ÄÜÆÆÌìÕ¶
-- ÌìÍõ£¬80¼¶ÒÔÉÏ¿ÉÓÃ
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(325)
	if(party ~= "tianwang") then							-- ²»ÊÇÌìÍõ
		Msg2Player("B¹n nghiªn cøu Thiªn V­¬ng Chïy Ph¸p - QuyÓn 1 ®­îc nöa ngµy, nh­ng vÉn ch­a lÜnh ngé ®­îc g×. ")
		return 1
	elseif(GetLever < 80) then							-- ÊÇÌìÍõµ«Î´µ½80¼¶
		Msg2Player("B¹n nghiªn cøu Thiªn V­¬ng Chïy Ph¸p - QuyÓn 1 ®­îc nöa ngµy, lÜnh ngé ®­îc rÊt İt. ")
		return 1
	elseif(skill ~= -1) then							-- ÒÑÑ§¹ı¸Ã¼¼ÄÜ
		Msg2Player("B¹n ®· nghiªn cøu kü Thiªn V­¬ng Chïy Ph¸p - QuyÓn 1, nh­ng vÉn ch­a häc ®­îc g×. ")
		return 1
	else
		AddMagic(325,1)										-- Ñ§»á¼¼ÄÜ
		Msg2Player("Häc ®­îc kü n¨ng Truy Phong QuyÕt. ")
		return 0
	end
end