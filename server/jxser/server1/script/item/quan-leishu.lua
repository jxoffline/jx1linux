--Created by fangjieying 2003-5-17
--¡¶Ô¦À×Êõ¡·
--Ñ§»á²ø×Ö¾÷¼¼ÄÜ
--À¥ÂØ£¬80¼¶ÒÔÉÏ¿ÉÓÃ
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(375)
	if(party ~= "kunlun") then							-- ²»ÊÇÀ¥ÂØ
		Msg2Player("B¹n nghiªn cøu Ngù L«i ThuËt ®­îc nöa ngµy, nh­ng vÉn ch­a lÜnh ngé ®­îc g×. ")
		return 1
	elseif(GetLever < 80) then							-- ÊÇÀ¥ÂØµ«Î´µ½80¼¶
		Msg2Player("B¹n nghiªn cøu Ngù L«i ThuËt ®­îc nöa ngµy, lÜnh ngé ®­îc rÊt İt. ")
		return 1
	elseif(skill ~= -1) then							-- ÒÑÑ§¹ı¸Ã¼¼ÄÜ
		Msg2Player("B¹n ®· nghiªn cøu kü Ngù L«i ThuËt, nh­ng vÉn ch­a häc ®­îc g×. ")
		return 1
	else
		AddMagic(375,1)
		Msg2Player("Häc ®­îc kü n¨ng L«i §éng Cöu Thiªn. ")
		return 0
	end
end