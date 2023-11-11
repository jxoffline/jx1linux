--Create by yfeng 2004-3-9
--Modified by fangjieying 2003-5-16
--¶ëáÒÃØ¼®£¬×÷ÓÃ80¼¶ÒÔÉÏµÄ¶ëáÒµÜ×ÓÊ¹ÓÃÖ®ºó£¬¿ÉÒÔ¼Ó1µã¼¼ÄÜµã
--°üÀ¨³öÊ¦£¬²»°üÀ¨×ªÃÅÅÉÒÔÇ°µÄ
--¸ÃÎïÆ·×î¶àÖ»ÄÜÊ¹ÓÃ15´Î
--ÈÎÎñ±äÁ¿80µÍ4Î»±íÊ¾Ê¹ÓÃ¸ÃÎïÆ·µÄ´ÎÊı
function main(sel)
	times = mod(GetTask(80),16)
	party = GetLastAddFaction()
	str={
		"B¹n cÇm quyÓnNga Mi MËt TŞchnghiªn cøu ®· nöa ngµy, kÕt qu¶ kh«ng lÜnh ngé ®­îc g×. ",
		"B¹n cÇm quyÓnNga Mi MËt TŞchnghiªn cøu ®· nöa ngµy, kÕt qu¶ lÜnh ngé chót İt. ",
		"B¹n cÇm quyÓnNga Mi MËt TŞchnghiªn cøu ®· nöa ngµy, kÕt qu¶ ®¹t ®­îc mét vµi ®iÒu t©m ®¾c ",
		"B¹n ®· ®äcNga Mi MËt TŞchrÊt kü, ngé ra ®­îc mét vµi ®iÒu t©m ®¾c. "
		}
	if(party ~= "emei") then     -- ²»ÊÇ¶ëáÒÅÉ 
		Msg2Player(str[1])
		return 1
	elseif (GetLevel()<80) then    -- ÊÇ¶ëáÒÅÉ£¬µ«µÈ¼¶Ğ¡ÓÚ80
		Msg2Player(str[2])
		return 1
	elseif(times > 14) then        -- Ê¹ÓÃ´ÎÊıÒÑ´ïµ½ÉÏÏŞ
			Msg2Player(str[4])
		return 1
	else
		AddMagicPoint(1)            -- ¼Ó¼¼ÄÜµã1
		SetTask(80,times+1)
		Msg2Player(str[3])
		return 0
	end
end