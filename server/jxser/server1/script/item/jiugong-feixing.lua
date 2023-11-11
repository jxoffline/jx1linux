--Created by fangjieying 2003-5-17
--¡¶·ÉïÚÊõ¡¤¾Å¹¬·ÉĞÇ¡·
--Ñ§»á¾Å¹¬·ÉĞÇ¼¼ÄÜ
--ÌÆÃÅ£¬80¼¶ÒÔÉÏ¿ÉÓÃ
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(342)
	if(party ~= "tangmen") then							-- ²»ÊÇÌÆÃÅ
		Msg2Player("B¹n nghiªn cøu Phi Tiªu ThuËt-Cöu Cung Phi Tinh ®­îc nöa ngµy, nh­ng vÉn ch­a lÜnh ngé ®­îc g×. ")
		return 1
	elseif(GetLever < 80) then							-- ÊÇÌÆÃÅµ«Î´µ½80¼¶
		Msg2Player("B¹n nghiªn cøu Phi Tiªu ThuËt-Cöu Cung Phi Tinh ®­îc nöa ngµy, lÜnh ngé ®­îc rÊt İt. ")
		return 1
	elseif(skill ~= -1) then							-- ÒÑÑ§¹ı¸Ã¼¼ÄÜ
		Msg2Player("B¹n ®· nghiªn cøu kü Phi Tiªu ThuËt-Cöu Cung Phi Tinh, nh­ng vÉn ch­a häc ®­îc g×. ")
		return 1
	else
		AddMagic(342,1)
		Msg2Player("Häc ®­îc kü n¨ng Cöu Cung Phi Tinh. ")
		return 0
	end
end