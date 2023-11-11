--Created by fangjieying 2003-5-17
--¡¶Ø¤°ïÕÆ·¨¡·
--Ñ§»á·ÉÁúÔÚÌì¼¼ÄÜ
--Ø¤°ï£¬80¼¶ÒÔÉÏ¿ÉÓÃ
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(357)
	if(party ~= "gaibang") then							-- ²»ÊÇØ¤°ï
		Msg2Player("B¹n nghiªn cøu quyÓn C¸i Bang C«n Ph¸p ®­îc nöa ngµy, nh­ng vÉn ch­a lÜnh ngé ®­îc g×. ")
		return 1
	elseif(GetLever < 80) then							-- ÊÇØ¤°ïµ«Î´µ½80¼¶
		Msg2Player("B¹n nghiªn cøu quyÓn C¸i Bang C«n Ph¸p ®­îc nöa ngµy, lÜnh ngé ®­îc rÊt İt, kh«ng hiÖu qu¶. ")
		return 1
	elseif(skill ~= -1) then							-- ÒÑÑ§¹ı¸Ã¼¼ÄÜ
		Msg2Player("B¹n ®· nghiªn cøu kü quyÓn C¸i Bang C«n Ph¸p, nh­ng vÉn ch­a häc ®­îc g×. ")
		return 1
	else
		AddMagic(357,1)
		Msg2Player("Häc ®­îc kü n¨ng Phi Long T¹i Thiªn ")
		return 0
	end
end