--Create by yfeng 2004-3-9
--Modified by fangjieying 2003-5-16
--ÎäÁÖÃØ¼®£¬×÷ÓÃ80¼¶ÒÔÉÏµÄÍæ¼ÒÊ¹ÓÃÖ®ºó£¬¿ÉÒÔ¼Ó1µã¼¼ÄÜµã
--°üÀ¨³öÊ¦£¬²»°üÀ¨×ªÃÅÅÉÒÔÇ°µÄ
--¸ÃÎïÆ·×î¶àÖ»ÄÜÊ¹ÓÃ15´Î
--ÈÎÎñ±äÁ¿80µÍ4Î»±íÊ¾Ê¹ÓÃ¸ÃÎïÆ·µÄ´ÎÊı
function main(sel) 
	times = mod(GetTask(80),16)
	str={
		"B¹n cÇm quyÓn Vâ L©m MËt TŞch nghiªn cøu c¶ nöa ngµy, kÕt qu¶ còng kh«ng lÜnh ngé ®­îc g×. ",
		"B¹n cÇm quyÓn Vâ L©m MËt TŞch nghiªn cøu c¶ nöa ngµy, kÕt qu¶ lÜnh ngé ®­îc chót İt. ",
		"B¹n cÇm quyÓn Vâ L©m MËt TŞch nghiªn cøu c¶ nöa ngµy, kÕt qu¶ còng thu ®­îc mét vµi ®iÒu t©m ®¾c liªn quan ®Õn vâ c«ng ",
		"B¹n ®· nghiÒn ngÉm kü quyÓn Vâ L©m MËt TŞch, nh­ng kh«ng thu ®­îc ®iÒu g× t©m ®¾c "
		}
	if(times >14) then                -- Ê¹ÓÃ´ÎÊıÒÑ´ïµ½ÉÏÏŞ
		Msg2Player(str[4])
		return 1
	elseif (GetLevel() < 80) then     -- µÈ¼¶Ğ¡ÓÚ80
		Msg2Player(str[2])
		return 1
	else                            	-- ½±Àø1µã¼¼ÄÜµã
		AddMagicPoint(1)
		SetTask(80,times+1)
		Msg2Player(str[3])
		return 0
	end
end