--Created by fangjieying 2003-5-17
--¡¶·Éµ¶Êõ¡¤Éã»êÔÂÓ°¡·
--Ñ§»áÉã»êÔÂÓ°¼¼ÄÜ
--ÌÆÃÅ£¬80¼¶ÒÔÉÏ¿ÉÓÃ
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(339)
	if(party ~= "tangmen") then							-- ²»ÊÇÌÆÃÅ
		Msg2Player("B¹n nghiªn cøu Phi §ao ThuËt - NhiÕp Hån NguyÖt ¶nh ®­îc nöa ngµy, nh­ng vÉn ch­a lÜnh ngé ®­îc g×. ")
		return 1
	elseif(GetLever < 80) then							-- ÊÇÌÆÃÅµ«Î´µ½80¼¶
		Msg2Player("B¹n nghiªn cøu Phi §ao ThuËt - NhiÕp Hån NguyÖt ¶nh ®­îc nöa ngµy, lÜnh ngé ®­îc rÊt İt. ")
		return 1
	elseif(skill ~= -1) then							-- ÒÑÑ§¹ı¸Ã¼¼ÄÜ
		Msg2Player("B¹n ®· nghiªn cøu kü NhiÕp Hån - Tæ Chó, nh­ng vÉn ch­a häc ®­îc g×. ")
		return 1
	else
		AddMagic(339,1)
		Msg2Player("Häc ®­îc kü n¨ng NhiÕp Hån NguyÖt ¶nh. ")
		return 0
	end
end