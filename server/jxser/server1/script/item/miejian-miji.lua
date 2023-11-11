-- Created by fangjieying 2003-5-17
-- ¡¶Ãğ½£ÃØ¼®¡·
-- Ñ§»á¼¼ÄÜÈı¶ëö«Ñ©
-- ¶ëáÒ£¬80¼¶ÒÔÉÏ¿ÉÓÃ
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(328)	
	if(party ~= "emei") then							-- ²»ÊÇ¶ëáÒ
		Msg2Player("B¹n nghiªn cøu DiÖt KiÕm MËt TŞch ®­îc nöa ngµy, nh­ng vÉn ch­a lÜnh ngé ®­îc g×. ")
		return 1
	elseif(GetLever < 80) then							-- ÊÇ¶ëáÒµ«Î´µ½80¼¶
		Msg2Player("B¹n nghiªn cøu DiÖt KiÕm MËt TŞch ®­îc nöa ngµy, lÜnh ngé ®­îc rÊt İt. ")
		return 1
	elseif(skill ~= -1) then							-- ÒÑÑ§¹ı¸Ã¼¼ÄÜ
		Msg2Player("B¹n ®· nghiªn cøu kü DiÖt KiÕm MËt TŞch, nh­ng vÉn ch­a häc ®­îc g×. ")
		return 1
	else
		AddMagic(328,1)										-- Ñ§»á¼¼ÄÜ
		Msg2Player("Häc ®­îc kü n¨ng Tam Nga TÒ TuyÕt. ")
		return 0
	end
end