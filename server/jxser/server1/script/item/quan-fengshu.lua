--Created by fangjieying 2003-5-17
--¡¶Ô¦·çÊõ¡·
--Ñ§»á°ÁÑ©Ğ¥·ç¼¼ÄÜ
--À¥ÂØ£¬80¼¶ÒÔÉÏ¿ÉÓÃ
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(372)
	if(party ~= "kunlun") then							-- ²»ÊÇÀ¥ÂØ
		Msg2Player("B¹n nghiªn cøu Ngù Phong ThuËt ®­îc nöa ngµy, nh­ng vÉn ch­a lÜnh ngé ®­îc g×. ")
		return 1
	elseif(GetLever < 80) then							-- ÊÇÀ¥ÂØµ«Î´µ½80¼¶
		Msg2Player("B¹n nghiªn cøu Ngù Phong ThuËt ®­îc nöa ngµy, lÜnh ngé ®­îc rÊt İt. ")
		return 1
	elseif(skill ~= -1) then							-- ÒÑÑ§¹ı¸Ã¼¼ÄÜ
		Msg2Player("B¹n ®· nghiªn cøu kü Ngù Phong ThuËt, nh­ng vÉn ch­a häc ®­îc g×. ")
		return 1
	else
		AddMagic(372,1)
		Msg2Player("Häc ®­îc kü n¨ng Ng¹o TuyÕt TiÕu Phong. ")
		return 0
	end
end