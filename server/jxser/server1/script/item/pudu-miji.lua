-- Created by fangjieying 2003-5-17
-- ¡¶ÆÕ¶ÉÃØ¼®¡·
-- Ñ§»á¼¼ÄÜÆÕ¶ÉÖÚÉú
-- ¶ëáÒ£¬80¼¶ÒÔÉÏ¿ÉÓÃ
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(332)	
	if(party ~= "emei") then							-- ²»ÊÇ¶ëáÒ
		Msg2Player("B¹n nghiªn cøu Phæ §é MËt TŞch ®­îc nöa ngµy, nh­ng vÉn ch­a lÜnh ngé ®­îc g×. ")
		return 1
	elseif(GetLever < 80) then							-- ÊÇ¶ëáÒµ«Î´µ½80¼¶
		Msg2Player("B¹n nghiªn cøu Phæ §é MËt TŞch ®­îc nöa ngµy, lÜnh ngé ®­îc rÊt İt. ")
		return 1
	elseif(skill ~= -1) then							-- ÒÑÑ§¹ı¸Ã¼¼ÄÜ
		Msg2Player("B¹n ®· nghiªn cøu kü Phæ §é MËt TŞch, nh­ng vÉn ch­a häc ®­îc g×. ")
		return 1
	else
		AddMagic(332)										-- Ñ§»á¼¼ÄÜ
		Msg2Player("Häc ®­îc kü n¨ng Phæ §é Chóng Sinh. ")
		return 0
	end
end