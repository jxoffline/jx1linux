--Create by yfeng ,2004-3-9
--¸ĞÎòÖ®Êé£¬80¼¶ÒÔÉÏÍæ¼ÒÊ¹ÓÃÖ®ºó£¬¿ÉÒÔ»ñµÃ1µãÇ±ÄÜ
--Íæ¼ÒÃ¿Éı2¼¶£¬¿ÉÒÔ¶àÒ»µãÇ±ÄÜµã£¬×ö¶à»ñµÃ5µãÇ±ÄÜµã
--¼´£º89¼¶ÒÔÉÏÍæ¼ÒÊ¹ÓÃ¿ÉÒÔ»ñµÃ5µãÇ±ÄÜµã
--¸ÃÎïÆ·Í¬Ò»Íæ¼ÒÖ»ÄÜÊ¹ÓÃ15´Î
--ÈÎÎñ±äÁ¿81µÍ4Î»±íÊ¾Ê¹ÓÃ¸ÃÎïÆ·µÄ´ÎÊı
function main(sel)
	times = mod(GetTask(81),16)
	point= {
		{pot=1,msg="Mét ®iÓm "},
		{pot=2,msg="Ch­a høa "},
		{pot=3,msg="Mét sè "},
		{pot=4,msg="Kh«ng İt "},
		{pot=5,msg="H¬i nhiÒu "}
	}
	str ={
		"B¹n ®· xem kü quyÓn TÈy Tñy kinhnh­ng kh«ng thÓ hiÓu: ( ",
		"B¹n ®· ®äc 'TÈy Tñy Kinh', nhËn ®­îc %s",
		"B¹n ®· xem kü quyÓn TÈy Tñy kinhnh­ng kh«ng thÓ hiÓu: ( "
	}
	level = GetLevel()
	if(level < 80) then  --µÈ¼¶Ì«µÍ£¬²»ÈÃÊ¹ÓÃ
		Msg2Player(str[1])
		return 1
	end
	if(times > 14) then --Ê¹ÓÃ³¬¹ı´ÎÊı
		Msg2Player(str[3])
		return 1
	end
	if(level > 89) then --°´µÈ¼¶·ÖÅäÇ±ÄÜ
		level = 89
	end
	index = floor((level -80)/2) +1
	AddProp(point[index].pot)
	SetTask(81,times+1)
	Msg2Player(format(str[2],point[index].msg))
	return 0
end

