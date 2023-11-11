-- Created by fangjieying 2003-5-17
-- ¡¶Á÷ĞÇ¡¤µ¶·¨¡·
-- Ñ§»á¼¼ÄÜÌìÍâÁ÷ĞÇ
-- ÌìÈÌ£¬80¼¶ÒÔÉÏ¿ÉÓÃ
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(362)
	if(party ~= "tianren") then							-- ²»ÊÇÌìÈÌ
		Msg2Player("B¹n nghiªn cøu L­u Tinh - §ao ph¸p  ®­îc nöa ngµy, nh­ng vÉn ch­a lÜnh ngé ®­îc g×. ")
		return 1
	elseif(GetLever < 80) then							-- ÊÇÌìÈÌµ«Î´µ½80¼¶
		Msg2Player("B¹n nghiªn cøu L­u Tinh - §ao ph¸p  ®­îc nöa ngµy, lÜnh ngé ®­îc rÊt İt. ")
		return 1
	elseif(skill ~= -1) then							-- ÒÑÑ§¹ı¸Ã¼¼ÄÜ
		Msg2Player("B¹n ®· nghiªn cøu kü L­u Tinh - §ao ph¸p, nh­ng vÉn ch­a häc ®­îc g×. ")
		return 1
	else
		AddMagic(362,1)										-- Ñ§»á¼¼ÄÜ
		Msg2Player("Häc ®­îc kü n¨ng Thiªn Ngo¹i L­u Tinh. ")
		return 0
	end
end