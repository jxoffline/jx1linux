-- Created by fangjieying 2003-5-17
-- ¡¶ÌìÍõµ¶·¨¡¤¾íÈı¡·
-- Ñ§»á¼¼ÄÜ×··ç¾÷
-- ÌìÍõ£¬80¼¶ÒÔÉÏ¿ÉÓÃ
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(322)	
	if(party ~= "tianwang") then							-- ²»ÊÇÌìÍõ
		Msg2Player("B¹n nghiªn cøu Thiªn V­¬ng §ao ph¸p - QuyÓn 3 ®­îc nöa ngµy, nh­ng vÉn ch­a lÜnh ngé ®­îc g×. ")
		return 1
	elseif(GetLever < 80) then							-- ÊÇÌìÍõµ«Î´µ½80¼¶
		Msg2Player("B¹n nghiªn cøu Thiªn V­¬ng §ao ph¸p - QuyÓn 3 ®­îc nöa ngµy, lÜnh ngé ®­îc rÊt İt. ")
		return 1
	elseif(skill ~= -1) then							-- ÒÑÑ§¹ı¸Ã¼¼ÄÜ
		Msg2Player("B¹n ®· nghiªn cøu kü Thiªn V­¬ng §ao ph¸p - QuyÓn 3, nh­ng vÉn ch­a häc ®­îc g×. ")
		return 1
	else
		AddMagic(322,1)										-- Ñ§»á¼¼ÄÜ 
		Msg2Player("Häc ®­îc kü n¨ng Ph¸ Thiªn Tr¶m. ")
		return 0
	end
end