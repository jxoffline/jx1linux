--Created by fangjieying 2003-5-17
--¡¶Ø¤°ï¹÷·¨¡·
--Ñ§»áÌìÏÂÎŞ¹·¼¼ÄÜ
--Ø¤°ï£¬80¼¶ÒÔÉÏ¿ÉÓÃ
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(359)
	if(party ~= "gaibang") then							-- ²»ÊÇØ¤°ï
		Msg2Player("B¹n nghiªn cøu quyÓn C¸i Bang C«n Ph¸p ®­îc nöa ngµy, nh­ng vÉn ch­a lÜnh ngé ®­îc g×. ")
		return 1
	elseif(GetLever < 80) then							-- ÊÇØ¤°ïµ«Î´µ½80¼¶
		Msg2Player("B¹n nghiªn cøu quyÓn C¸i Bang C«n Ph¸p ®­îc nöa ngµy, lÜnh ngé ®­îc rÊt İt. ")
		return 1
	elseif(skill ~= -1) then							-- ÒÑÑ§¹ı¸Ã¼¼ÄÜ
		Msg2Player("B¹n ®· nghiªn cøu kü quyÓn C¸i Bang C«n Ph¸p, nh­ng vÉn ch­a häc ®­îc g×. ")
		return 1
	else
		AddMagic(359,1)
		Msg2Player("Häc ®­îc kü n¨ng Thiªn H¹ V« CÈu ")
		return 0
	end
end