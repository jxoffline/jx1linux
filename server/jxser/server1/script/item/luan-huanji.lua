--Create by yfeng 2004-3-15
--Modified by fangjieying 2003-5-17
--¡¶ÏİÚåÊõ¡¤ÂÒ»·»÷¡·
--Ñ§»áÂÒ»·»÷¼¼ÄÜ
--ÌÆÃÅ£¬80¼¶ÒÔÉÏ¿ÉÓÃ
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(351)
	if(party ~= "tangmen") then							-- ²»ÊÇÌÆÃÅ
		Msg2Player("B¹n nghiªn cøu H·m TÜnh thuËt - Lo¹n Hoµn Kİch ®­îc nöa ngµy, nh­ng vÉn ch­a lÜnh ngé ®­îc g×. ")
		return 1
	elseif(GetLever < 80) then							-- ÊÇÌÆÃÅµ«Î´µ½80¼¶
		Msg2Player("B¹n nghiªn cøu H·m TÜnh thuËt - Lo¹n Hoµn Kİch ®­îc nöa ngµy, lÜnh ngé ®­îc rÊt İt, kh«ng hiÖu qu¶. ")
		return 1
	elseif(skill ~= -1) then							-- ÒÑÑ§¹ı¸Ã¼¼ÄÜ
		Msg2Player("B¹n ®· nghiªn cøu kü H·m TÜnh thuËt - Lo¹n Hoµn Kİch, nh­ng vÉn ch­a häc ®­îc g×. ")
		return 1
	else
		AddMagic(351,0)
		Msg2Player("Häc ®­îc kü n¨ng Lo¹n Hoµn Kİch. ")
		return 0
	end
end