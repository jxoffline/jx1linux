-- Created by fangjieying 2003-5-17
-- ¡¶´äÑÌµ¶·¨¡·
-- Ñ§»á¼¼ÄÜ±ù×ÙÎŞÓ°
-- ´äÑÌ£¬80¼¶ÒÔÉÏ¿ÉÓÃ
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(336)
	if(party ~= "cuiyan") then							-- ²»ÊÇ´äÑÌ
		Msg2Player("B¹n cÇm quyÓn Thóy Yªn §ao ph¸p  nghiªn cøu ®· nöa ngµy, kÕt qu¶ ch¼ng lÜnh ngé ®­îc g×. ")
		return 1
	elseif(GetLever < 80) then							-- ÊÇ´äÑÌµ«Î´µ½80¼¶
		Msg2Player("B¹n cÇm quyÓn Thóy Yªn §ao ph¸p  nghiªn cøu ®· nöa ngµy, kÕt qu¶ lÜnh ngé chót İt. ")
		return 1
	elseif(skill ~= -1) then							-- ÒÑÑ§¹ı¸Ã¼¼ÄÜ
		Msg2Player("B¹n nghiªn cøu kü quyÓn Thóy Yªn §ao ph¸p, kh«ng rót ra ®­îc g×. ")
		return 1
	else
		AddMagic(336,1)										-- Ñ§»á¼¼ÄÜ
		Msg2Player("Häc ®­îc kü n¨ng B¨ng T«ng V« ¶nh ")
		return 0
	end
end