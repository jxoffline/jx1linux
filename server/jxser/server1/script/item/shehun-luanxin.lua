-- Created by fangjieying 2003-5-17
-- ¡¶Éã»ê¡¤×çÖä¡·
-- Ñ§»á¼¼ÄÜÉã»êÂÒĞÄ
-- ÌìÈÌ£¬80¼¶ÒÔÉÏ¿ÉÓÃ
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(391)
	if(party ~= "tianren") then							-- ²»ÊÇÌìÈÌ
		Msg2Player("B¹n nghiªn cøu NhiÕp Hån - Tæ Chó ®­îc nöa ngµy, nh­ng vÉn ch­a lÜnh ngé ®­îc g×. ")
		return 1
	elseif(GetLever < 80) then							-- ÊÇÌìÈÌµ«Î´µ½80¼¶
		Msg2Player("B¹n nghiªn cøu NhiÕp Hån - Tæ Chó ®­îc nöa ngµy, lÜnh ngé ®­îc rÊt İt. ")
		return 1
	elseif(skill ~= -1) then							-- ÒÑÑ§¹ı¸Ã¼¼ÄÜ
		Msg2Player("B¹n ®· nghiªn cøu kü NhiÕp Hån - Tæ Chó, nh­ng vÉn ch­a häc ®­îc g×. ")
		return 1
	else
		AddMagic(391,0)	
		Msg2Player("Häc ®­îc kü n¨ng NhiÕp Hån Lo¹n T©m. ")
		return 0
	end
end