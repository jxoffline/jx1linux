-- Created by fangjieying 2003-5-17
-- ¡¶Îå¶¾µ¶·¨¡¤¾í¶ş¡·
-- Ñ§»á¼¼ÄÜĞşÒõÕ¶
-- Îå¶¾£¬80¼¶ÒÔÉÏ¿ÉÓÃ
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(355)
	if(party ~= "wudu") then							-- ²»ÊÇÎå¶¾
		Msg2Player("B¹n nghiªn cøu Ngò ®éc §ao ph¸p - QuyÓn 2 ®­îc nöa ngµy, nh­ng vÉn ch­a lÜnh ngé ®­îc g×. ")
		return 1
	elseif(GetLever < 80) then							-- ÊÇÎå¶¾µ«Î´µ½80¼¶
		Msg2Player("B¹n nghiªn cøu Ngò ®éc §ao ph¸p - QuyÓn 2 ®­îc nöa ngµy, lÜnh ngé ®­îc rÊt İt. ")
		return 1
	elseif(skill ~= -1) then							-- ÒÑÑ§¹ı¸Ã¼¼ÄÜ
		Msg2Player("B¹n ®· nghiªn cøu kü Ngò ®éc §ao ph¸p - QuyÓn 2, nh­ng vÉn ch­a häc ®­îc g×. ")
		return 1
	else
		AddMagic(355,1)										-- Ñ§»á¼¼ÄÜ
		Msg2Player("Häc ®­îc kü n¨ng HuyÒn ¢m Tr¶m ")
		return 0
	end
end