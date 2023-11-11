-- Created by fangjieying 2003-5-17
-- ¡¶Ç§·ğÃØ¼®¡·
-- Ñ§»á¼¼ÄÜÇ§·ğÇ§Ò¶
-- ¶ëáÒ£¬80¼¶ÒÔÉÏ¿ÉÓÃ
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(380)
	if(party ~= "emei") then							-- ²»ÊÇ¶ëáÒ
		Msg2Player("B¹n nghiªn cøu Nga Mi PhËt Quang Ch­ëng MËt TŞch ®­îc nöa ngµy, nh­ng vÉn ch­a lÜnh ngé ®­îc g×. ")
		return 1
	elseif(GetLever < 80) then							-- ÊÇ¶ëáÒµ«Î´µ½80¼¶
		Msg2Player("B¹n nghiªn cøu Nga Mi PhËt Quang Ch­ëng MËt TŞch ®­îc nöa ngµy, lÜnh ngé ®­îc rÊt İt. ")
		return 1
	elseif(skill ~= -1) then							-- ÒÑÑ§¹ı¸Ã¼¼ÄÜ
		Msg2Player("B¹n ®· nghiªn cøu kü Nga Mi PhËt Quang Ch­ëng MËt TŞch, nh­ng vÉn ch­a häc ®­îc g×. ")
		return 1
	else
		AddMagic(380,1)										-- Ñ§»á¼¼ÄÜ
		Msg2Player("Häc ®­îc kü n¨ng Phong S­¬ng To¸i ¶nh. ")
		return 0
	end
end