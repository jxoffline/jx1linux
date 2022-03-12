-- Created by fangjieying 2003-5-17
-- ¡¶ÌìÍõÇ¹·¨¡¤¾í¶ş¡·
-- Ñ§»á¼¼ÄÜ×·ĞÇÖğÔÂ
-- ÌìÍõ£¬80¼¶ÒÔÉÏ¿ÉÓÃ
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(323)
	if(party ~= "tianwang") then							-- ²»ÊÇÌìÍõ
		Msg2Player("B¹n nghiªn cøu Thiªn V­¬ng Th­¬ng Ph¸p - QuyÓn 2 ®­îc nöa ngµy, nh­ng vÉn ch­a lÜnh ngé ®­îc g×. ")
		return 1
	elseif(GetLever < 80) then							-- ÊÇÌìÍõµ«Î´µ½80¼¶
		Msg2Player("B¹n nghiªn cøu Thiªn V­¬ng Th­¬ng Ph¸p - QuyÓn 2 ®­îc nöa ngµy, lÜnh ngé ®­îc rÊt İt. ")
		return 1
	elseif(skill ~= -1) then							-- ÒÑÑ§¹ı¸Ã¼¼ÄÜ
		Msg2Player("B¹n ®· nghiªn cøu kü Thiªn V­¬ng Th­¬ng Ph¸p - QuyÓn 2, nh­ng vÉn ch­a häc ®­îc g×. ")
		return 1
	else
		AddMagic(323,1)										-- Ñ§»á¼¼ÄÜ
		Msg2Player("Häc ®­îc kü n¨ng Truy Tinh Trôc NguyÖt. ")
		return 0
	end
end