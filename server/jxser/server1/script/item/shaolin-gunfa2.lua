--Created by fangjieying 2003-5-17
--¡¶ÉÙÁÖ¹÷·¨¡¤¾í¶ş¡·
--Ñ§»áºáÉ¨Ç§¾ü¼¼ÄÜ
--ÉÙÁÖ£¬80¼¶ÒÔÉÏ¿ÉÓÃ
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(319)
	if(party ~= "shaolin") then							-- ²»ÊÇÉÙÁÖ
		Msg2Player("B¹n nghiªn cøu ThiÕu L©m C«n Ph¸p - QuyÓn 2 ®­îc nöa ngµy, nh­ng vÉn ch­a lÜnh ngé ®­îc g×. ")
		return 1
	elseif(GetLever < 80) then							-- ÊÇÉÙÁÖµ«Î´µ½80¼¶
		Msg2Player("B¹n nghiªn cøu ThiÕu L©m C«n Ph¸p - QuyÓn 2 ®­îc nöa ngµy, lÜnh ngé ®­îc rÊt İt. ")
		return 1
	elseif(skill ~= -1) then							-- ÒÑÑ§¹ı¸Ã¼¼ÄÜ
		Msg2Player("B¹n ®· nghiªn cøu kü ThiÕu L©m C«n Ph¸p - QuyÓn 2, nh­ng vÉn ch­a häc ®­îc g×. ")
		return 1
	else
		AddMagic(319,1)										-- Ñ§»á¼¼ÄÜ
		Msg2Player("Häc ®­îc kü n¨ng Hoµnh T¶o Thiªn Qu©n. ")
		return 0
	end
end