-- Created by fangjieying 2003-5-17
-- ¡¶Ì«¼«È­Æ×¡¤¾íÈı¡·
-- Ñ§»á¼¼ÄÜ ÌìµØÎŞ¼«
-- Îäµ±£¬80¼¶ÒÔÉÏ¿ÉÓÃ
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(365)
	if(party ~= "wudang") then							-- ²»ÊÇÎäµ±
		Msg2Player("B¹n nghiªn cøu Th¸i Cùc KiÕm Phæ - QuyÓn 3 ®­îc nöa ngµy, nh­ng vÉn ch­a lÜnh ngé ®­îc g×. ")
		return 1
	elseif(GetLever < 80) then							-- ÊÇÎäµ±µ«Î´µ½80¼¶
		Msg2Player("B¹n nghiªn cøu Th¸i Cùc KiÕm Phæ - QuyÓn 3 ®­îc nöa ngµy, lÜnh ngé ®­îc rÊt İt. ")
		return 1
	elseif(skill ~= -1) then							-- ÒÑÑ§¹ı¸Ã¼¼ÄÜ
		Msg2Player("B¹n ®· nghiªn cøu kü Th¸i Cùc KiÕm Phæ - QuyÓn 3, nh­ng vÉn ch­a häc ®­îc g×. ")
		return 1
	else
		AddMagic(365,1)	
		Msg2Player("Häc ®­îc kü n¨ng Thiªn §Şa V« Cùc. ")
		return 0
	end
end