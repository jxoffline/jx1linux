-- Created by fangjieying 2003-5-17
-- ¡¶Îå¶¾×çÖä¡¤¾íÈı¡·
-- Ñ§»á¼¼ÄÜ¶Ï½î¸¯¹Ç
-- Îå¶¾£¬80¼¶ÒÔÉÏ¿ÉÓÃ
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(390) 
	if(party ~= "wudu") then							-- ²»ÊÇÎå¶¾
		Msg2Player("B¹n nghiªn cøu Ngò §éc NhiÕp T©m ThuËt - QuyÓn 3 ®­îc nöa ngµy, nh­ng vÉn ch­a lÜnh ngé ®­îc g×. ")
		return 1
	elseif(GetLever < 80) then							-- ÊÇÎå¶¾µ«Î´µ½80¼¶
		Msg2Player("B¹n nghiªn cøu Ngò §éc NhiÕp T©m ThuËt - QuyÓn 3 ®­îc nöa ngµy, lÜnh ngé ®­îc rÊt İt. ")
		return 1
	elseif(skill ~= -1) then							-- ÒÑÑ§¹ı¸Ã¼¼ÄÜ
		Msg2Player("B¹n ®· nghiªn cøu kü Ngò §éc NhiÕp T©m ThuËt - QuyÓn 3, nh­ng vÉn ch­a häc ®­îc g×. ")
		return 1
	else
		AddMagic(390,0)										-- Ñ§»á¼¼ÄÜ
		Msg2Player("Häc ®­îc kü n¨ng §o¹n C©n hñ Cèt. ")
		return 0
	end
end