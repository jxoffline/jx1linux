--Created by fangjieying 2003-5-17 
--¡¶ÉÙÁÖµ¶·¨¡¤¾íÈı¡·
--Ñ§»áÎŞÏàÕ¶¼¼ÄÜ
--ÉÙÁÖ£¬80¼¶ÒÔÉÏ¿ÉÓÃ
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(321)
	if(party ~= "shaolin") then							-- ²»ÊÇÉÙÁÖ
		Msg2Player("B¹n nghiªn cøu ThiÕu L©m §ao ph¸p - QuyÓn 3 ®­îc nöa ngµy, nh­ng vÉn ch­a lÜnh ngé ®­îc g×. ")
		return 1
	elseif(GetLever < 80) then							-- ÊÇÉÙÁÖµ«Î´µ½80¼¶
		Msg2Player("B¹n nghiªn cøu ThiÕu L©m §ao ph¸p - QuyÓn 3 ®­îc nöa ngµy, lÜnh ngé ®­îc rÊt İt. ")
		return 1
	elseif(skill ~= -1) then							-- ÒÑÑ§¹ı¸Ã¼¼ÄÜ
		Msg2Player("B¹n ®· nghiªn cøu kü ThiÕu L©m §ao ph¸p - QuyÓn 3, nh­ng vÉn ch­a häc ®­îc g×. ")
		return 1
	else
		AddMagic(321,1)										-- Ñ§»á¼¼ÄÜ
		Msg2Player("Häc ®­îc kü n¨ng V« T­íng Tr¶m. ")
		return 0
	end
end