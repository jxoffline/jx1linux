--Create by yfeng 2004-3-15
--Modified by fangjieying 2003-5-17
--¡¶Ğä¼ıÊõ¡¤±©ÓêÀæ»¨¡·
--Ñ§»á±©ÓêÀæ»¨¼¼ÄÜ
--ÌÆÃÅ£¬80¼¶ÒÔÉÏ¿ÉÓÃ
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(302)
	if(party ~= "tangmen") then							-- ²»ÊÇÌÆÃÅ
		Msg2Player("B¹n cÇm quyÓn Tô TiÔn ThuËt, B¹o Vò Lª Hoa nghiªn cøu ®· nöa ngµy, kÕt qu¶ ch¼ng lÜnh ngé ®­îc g×. ")
		return 1
	elseif(GetLevel() < 80) then							-- ÊÇÌÆÃÅµ«Î´µ½80¼¶
		Msg2Player("B¹n cÇm quyÓn Tô TiÔn ThuËt, B¹o Vò Lª Hoa nghiªn cøu ®· nöa ngµy, kÕt qu¶ lÜnh ngé chót İt. ")
		return 1
	elseif(skill ~= -1) then							-- ÒÑÑ§¹ı¸Ã¼¼ÄÜ
		Msg2Player("B¹n ®· nghiªn cøu kü quyÓn Tô TiÔn ThuËt, B¹o Vò Lª Hoa, nhung kh«ng rót ra ®­îc g×. ")
		return 1
	else
		AddMagic(302,1)										-- Ñ§»á¼¼ÄÜ
		Msg2Player("Häc ®­îc kü n¨ng 'B¹o Vò Lª Hoa'. ")
		return 0
	end
end