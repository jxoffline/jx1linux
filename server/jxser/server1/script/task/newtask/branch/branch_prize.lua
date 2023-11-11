-- ÕıÅÉÖ§ÏßÈÎÎñ½Å±¾
-- by xiaoyang(2005\1\4)

Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\branch\\branch_head.lua")
Include([[\script\task\newtask\branch\extent_prize.lua]]);


--ÕıÅÉ£º1    ÖĞÁ¢£º2     Ğ°ÅÉ£º3

saying = "Ng­¬i vÊt v¶ qu¸! H·y chän mét mãn cho m×nh ®i!";
ItemText = {
				{"Trang bŞ Hoµng Kim/15/2/get_golditem1","Trang bŞ Hoµng Kim/15/2/get_golditem2","Trang bŞ Hoµng Kim/15/2/get_golditem3"},
				{"Trang bŞ Hoµng Kim/15/3/get_golditem1","Trang bŞ Hoµng Kim/15/3/get_golditem2","Trang bŞ Hoµng Kim/15/3/get_golditem3"},
				{"Trang bŞ Hoµng Kim/15/4/get_golditem1","Trang bŞ Hoµng Kim/15/4/get_golditem2","Trang bŞ Hoµng Kim/15/4, 3/get_golditem3"},
				{"Trang bŞ Hoµng Kim/15/5/get_golditem1","Trang bŞ Hoµng Kim/15/5/get_golditem2","Trang bŞ Hoµng Kim/15/5/get_golditem3"},
				{"TiÒn/3/2/get_qualityitem1","TiÒn/3/2/get_qualityitem2","TiÒn/3/2/get_qualityitem3"},
				{"TiÒn/3/5/get_qualityitem1","TiÒn/3/5/get_qualityitem2","TiÒn/3/5/get_qualityitem3"},
				{"kinh nghiÖm /4/2/get_oreitem1","kinh nghiÖm /4/2/get_oreitem2","kinh nghiÖm /4/2/get_oreitem3"},
				{"kinh nghiÖm /4/3/get_oreitem1","kinh nghiÖm /4/3/get_oreitem2","kinh nghiÖm /4/3/get_oreitem3"},
				{"kinh nghiÖm /4/4/get_oreitem1","kinh nghiÖm /4/4/get_oreitem2","kinh nghiÖm /4/4/get_oreitem3"},
				{"kinh nghiÖm /4/5/get_oreitem1","kinh nghiÖm /4/5/get_oreitem2","kinh nghiÖm /4/5/get_oreitem3"},
				{"VËt phÈm/14/3/get_propitem1","VËt phÈm/14/3/get_propitem2","VËt phÈm/14/3/get_propitem3"},
				{"VËt phÈm/14/4/get_propitem1","VËt phÈm/14/4/get_propitem2","VËt phÈm/14/4/get_propitem3"},
			}

function branchprize()
	Uworld1050 = nt_getTask(1050)
	Uworld1051 = nt_getTask(1051)
	Uworld1052 = nt_getTask(1052)
	Uworld1053 = nt_getTask(1053)
	Uworld1054 = nt_getTask(1054)
	Uworld1055 = nt_getTask(1055)
	Uworld1056 = nt_getTask(1056)
	Uworld1057 = nt_getTask(1057)
	Uworld1058 = nt_getTask(1058)
	Uworld1059 = nt_getTask(1059)
	Uworld1060 = nt_getTask(1060)
	Uworld1061 = nt_getTask(1061)
	Uworld192 = nt_getTask(192) --ÕıÅÉÖ§Ïß½±Àø±äÁ¿£¬¸÷×ÖÎ»ÒâÒå£º
								--1-20~30¼¶ÕıÅÉÒ»£»2-20~30¼¶ÕıÅÉ¶ş£»3-20~30¼¶ÕıÅÉÈı£» 4-30~40¼¶ÕıÅÉÒ»£» 5-30~40¼¶ÕıÅÉ¶ş£» 6-30~40¼¶ÕıÅÉÈı£»
								--7-40~50¼¶ÕıÅÉÒ»£» 8-40~50¼¶ÕıÅÉ¶ş£» 9-40~50¼¶ÕıÅÉÈı£» 10-50~60¼¶ÕıÅÉÒ»£» 11-50~60¼¶ÕıÅÉ¶ş£» 12-50~60¼¶ÕıÅÉÈı£»
	Uworld193 = nt_getTask(193) --ÖĞÁ¢Ö§Ïß½±Àø±äÁ¿£¬¸÷×ÖÎ»ÒâÒå£º
								--1-20~30¼¶ÖĞÁ¢Ò»£»2-20~30¼¶ÖĞÁ¢¶ş£»3-20~30¼¶ÖĞÁ¢Èı£» 4-30~40¼¶ÖĞÁ¢Ò»£» 5-30~40¼¶ÖĞÁ¢¶ş£» 6-30~40¼¶ÖĞÁ¢Èı£»
								--7-40~50¼¶ÖĞÁ¢Ò»£» 8-40~50¼¶ÖĞÁ¢¶ş£» 9-40~50¼¶ÖĞÁ¢Èı£» 10-50~60¼¶ÖĞÁ¢Ò»£» 11-50~60¼¶ÖĞÁ¢¶ş£» 12-50~60¼¶ÖĞÁ¢Èı£»
	Uworld194 = nt_getTask(194) --Ğ°ÅÉÖ§Ïß½±Àø±äÁ¿£¬¸÷×ÖÎ»ÒâÒå£º
								--1-20~30¼¶Ğ°ÅÉÒ»£»2-20~30¼¶Ğ°ÅÉ¶ş£»3-20~30¼¶Ğ°ÅÉÈı£» 4-30~40¼¶Ğ°ÅÉÒ»£» 5-30~40¼¶Ğ°ÅÉ¶ş£» 6-30~40¼¶Ğ°ÅÉÈı£»
								--7-40~50¼¶Ğ°ÅÉÒ»£» 8-40~50¼¶Ğ°ÅÉ¶ş£» 9-40~50¼¶Ğ°ÅÉÈı£» 10-50~60¼¶Ğ°ÅÉÒ»£» 11-50~60¼¶Ğ°ÅÉ¶ş£» 12-50~60¼¶Ğ°ÅÉÈı£»
	Uworld195 = nt_getTask(195)	--È·¶¨Òª·¢½±/·¢¹ı½±£¬¿ª¹Ø

	if ( nt_getTask(1050) == 50 and GetBit(GetTask(192), 1) ~= 1) then 						--È±ÉÙ½±Àø±äÁ¿ÉèÖÃ  ÕıÅÉÖ§Ïß20-30ÈÎÎñÒ»
		nt_setTask(195, 1)
		Prise(saying,ItemText[1][1],ItemText[5][1],ItemText[7][1])

	elseif ( nt_getTask(1050) == 110 and GetBit(GetTask(192), 2) ~= 1 ) then  				--ÕıÅÉÖ§Ïß20-30ÈÎÎñ¶ş
		nt_setTask(195, 1)
		Prise(saying,ItemText[1][1],ItemText[5][1],ItemText[7][1])
		
	elseif ( nt_getTask(1050) == 140 and GetBit(GetTask(192), 3) ~= 1 ) then	 			--ÕıÅÉÖ§Ïß20-30ÈÎÎñÈı
		nt_setTask(195, 1)
		Prise(saying,ItemText[1][1],ItemText[5][1],ItemText[7][1])	
	
	elseif ( nt_getTask(1051) == 30 and GetBit(GetTask(192), 4) ~= 1 ) then   				--ÕıÅÉÖ§Ïß30-40ÈÎÎñÒ»
		--AddItem() --½±ÀøÒ»¼şÒ»¿×µÄ×ÏÉ«×°±¸
		nt_setTask(195, 1)
		Prise(saying,ItemText[2][1],ItemText[11][1],ItemText[8][1])
		
	elseif ( nt_getTask(1051) == 90 and GetBit(GetTask(192), 5) ~= 1 ) then	 			--ÕıÅÉÖ§Ïß30-40ÈÎÎñ¶ş
		--AddItem() --½±ÀøÒ»¿Å¸ÅÂÊ±¦Ê¯
		nt_setTask(195, 1)
		Prise(saying,ItemText[2][1],ItemText[11][1],ItemText[8][1])	
	
	elseif ( nt_getTask(1051) == 180 and GetBit(GetTask(192), 6) ~= 1 ) then	 			--ÕıÅÉÖ§Ïß30-40ÈÎÎñÈı
		--AddItem() --½±ÀøÒ»¿Å½ğÏµµÄ°µÊôĞÔ±¦Ê¯
		nt_setTask(195, 1)
		Prise(saying,ItemText[2][1],ItemText[11][1],ItemText[8][1])	
	
	elseif ( nt_getTask(1052) == 30 and GetBit(GetTask(192), 7) ~= 1 ) then				--ÕıÅÉÖ§Ïß40-50ÈÎÎñÒ»
		nt_setTask(195, 1)
		Prise(saying,ItemText[3][1],ItemText[12][1],ItemText[9][1])
		
	elseif ( nt_getTask(1052) == 70 and GetBit(GetTask(192), 8) ~= 1 ) then  				--ÕıÅÉÖ§Ïß40-50ÈÎÎñ¶ş
		nt_setTask(195, 1)
		Prise(saying,ItemText[3][1],ItemText[12][1],ItemText[9][1])	
	
	elseif ( nt_getTask(1052) == 120 and GetBit(GetTask(192), 9) ~= 1 ) then 				--ÕıÅÉÖ§Ïß40-50ÈÎÎñÈı
		nt_setTask(195, 1)
		Prise(saying,ItemText[3][1],ItemText[12][1],ItemText[9][1])
		
	elseif ( nt_getTask(1053) == 25 and GetBit(GetTask(192), 10) ~= 1 ) then 				--ÕıÅÉÖ§Ïß50-60ÈÎÎñÒ»
		nt_setTask(195, 1)
		Prise(saying,ItemText[4][1],ItemText[6][1],ItemText[10][1])	
	
	elseif ( nt_getTask(1053) == 50 and GetBit(GetTask(192), 11) ~= 1 ) then 				--ÕıÅÉÖ§Ïß50-60ÈÎÎñ¶ş
		nt_setTask(195, 1)
		Prise(saying,ItemText[4][1],ItemText[6][1],ItemText[10][1])	
	
	elseif ( nt_getTask(1053) == 80 and GetBit(GetTask(192), 12) ~= 1 ) then 				--ÕıÅÉÖ§Ïß50-60ÈÎÎñÈı
		nt_setTask(195, 1)
		Prise(saying,ItemText[4][1],ItemText[6][1],ItemText[10][1])		

	elseif ( nt_getTask(1054) == 30 and GetBit(GetTask(193), 1) ~= 1 ) then 				--ÖĞÁ¢Ö§Ïß20-30ÈÎÎñÒ»
		Prise(saying,ItemText[1][2],ItemText[5][2],ItemText[7][2])
		nt_setTask(195, 1)
		
	elseif ( nt_getTask(1054) == 100 and GetBit(GetTask(193), 2) ~= 1 ) then 				--ÖĞÁ¢Ö§Ïß20-30ÈÎÎñ¶ş
		nt_setTask(195, 1)
		Prise(saying,ItemText[1][2],ItemText[5][2],ItemText[7][2])	
	
	elseif ( nt_getTask(1054) == 150 and GetBit(GetTask(193), 3) ~= 1 ) then 				--ÖĞÁ¢Ö§Ïß20-30ÈÎÎñÈı
		nt_setTask(195, 1)
		Prise(saying,ItemText[1][2],ItemText[5][2],ItemText[7][2])	

	elseif ( nt_getTask(1055) == 50 and GetBit(GetTask(193), 4) ~= 1 ) then 				--ÖĞÁ¢Ö§Ïß30-40ÈÎÎñÒ»
		--AddItem() --½±ÀøÒ»¼şÒ»¿×µÄ×ÏÉ«×°±¸
		nt_setTask(195, 1)
		Prise(saying,ItemText[2][2],ItemText[11][2],ItemText[8][2])	
	
	elseif ( nt_getTask(1055) == 90 and GetBit(GetTask(193), 5) ~= 1 ) then 				--ÖĞÁ¢Ö§Ïß30-40ÈÎÎñ¶ş
		--AddItem() --½±ÀøÒ»¿Å¸ÅÂÊ±¦Ê¯
		nt_setTask(195, 1)
		Prise(saying,ItemText[2][2],ItemText[11][2],ItemText[8][2])

	elseif ( nt_getTask(1055) == 140 and GetBit(GetTask(193), 6) ~= 1 ) then 				--ÖĞÁ¢Ö§Ïß30-40ÈÎÎñÈı
		nt_setTask(195, 1)
		Prise(saying,ItemText[2][2],ItemText[11][2],ItemText[8][2])

	elseif ( nt_getTask(1056) == 25 and GetBit(GetTask(193), 7) ~= 1 ) then 				--ÖĞÁ¢Ö§Ïß40-50ÈÎÎñÒ»
		nt_setTask(195, 1)
		Prise(saying,ItemText[3][2],ItemText[12][2],ItemText[9][2])

	elseif ( nt_getTask(1056) == 50 and GetBit(GetTask(193), 8) ~= 1 ) then 				--ÖĞÁ¢Ö§Ïß40-50ÈÎÎñ¶ş
		nt_setTask(195, 1)
		Prise(saying,ItemText[3][2],ItemText[12][2],ItemText[9][2])

	elseif ( nt_getTask(1056) == 80 and GetBit(GetTask(193), 9) ~= 1 ) then 				--ÖĞÁ¢Ö§Ïß40-50ÈÎÎñÈı
		nt_setTask(195, 1)
		Prise(saying,ItemText[3][2],ItemText[12][2],ItemText[9][2])

	elseif ( nt_getTask(1057) == 30 and GetBit(GetTask(193), 10) ~= 1 ) then				--ÖĞÁ¢Ö§Ïß50-60ÈÎÎñÒ»
		nt_setTask(195, 1)
		Prise(saying,ItemText[4][2],ItemText[6][2],ItemText[10][2])

	elseif ( nt_getTask(1057) == 70 and GetBit(GetTask(193), 11) ~= 1 ) then					--ÖĞÁ¢Ö§Ïß50-60ÈÎÎñ¶ş
		nt_setTask(195, 1)
		Prise(saying,ItemText[4][2],ItemText[6][2],ItemText[10][2])

	elseif ( nt_getTask(1057) == 100 and GetBit(GetTask(193), 12) ~= 1 ) then					--ÖĞÁ¢Ö§Ïß50-60ÈÎÎñÈı
		nt_setTask(195, 1)
		Prise(saying,ItemText[4][2],ItemText[6][2],ItemText[10][2])

	elseif ( nt_getTask(1058) == 30 and GetBit(GetTask(194), 1) ~= 1 ) then 				--Ğ°ÅÉÖ§Ïß20-30ÈÎÎñÒ»
		nt_setTask(195, 1)
		Prise(saying,ItemText[1][3],ItemText[5][3],ItemText[7][3])

	elseif ( nt_getTask(1058) == 50 and GetBit(GetTask(194), 2) ~= 1 ) then 				--Ğ°ÅÉÖ§Ïß20-30ÈÎÎñ¶ş
		nt_setTask(195, 1)
		Prise(saying,ItemText[1][3],ItemText[5][3],ItemText[7][3])

	elseif ( nt_getTask(1058) == 100 and GetBit(GetTask(194), 3) ~= 1 ) then 				--Ğ°ÅÉÖ§Ïß20-30ÈÎÎñÈı
		nt_setTask(195, 1)
		Prise(saying,ItemText[1][3],ItemText[5][3],ItemText[7][3])

	elseif ( nt_getTask(1059) == 30 and GetBit(GetTask(194), 4) ~= 1 ) then 				--Ğ°ÅÉÖ§Ïß30-40ÈÎÎñÒ»
		nt_setTask(195, 1)
		Prise(saying,ItemText[2][3],ItemText[11][3],ItemText[8][3])

	elseif ( nt_getTask(1059) == 50 and GetBit(GetTask(194), 5) ~= 1 ) then 				--Ğ°ÅÉÖ§Ïß30-40ÈÎÎñ¶ş
		nt_setTask(195, 1)
		Prise(saying,ItemText[2][3],ItemText[11][3],ItemText[8][3])
		
	elseif ( nt_getTask(1059) == 120 and GetBit(GetTask(194), 6) ~= 1 ) then 				--Ğ°ÅÉÖ§Ïß30-40ÈÎÎñÈı
		nt_setTask(195, 1)
		Prise(saying,ItemText[2][3],ItemText[11][3],ItemText[8][3])

	elseif ( nt_getTask(1060) == 50 and GetBit(GetTask(194), 7) ~= 1 ) then 				--Ğ°ÅÉÖ§Ïß40-50ÈÎÎñÒ»
		nt_setTask(195, 1)
		Prise(saying,ItemText[3][3],ItemText[12][3],ItemText[9][3])

	elseif ( nt_getTask(1060) == 90 and GetBit(GetTask(194), 8) ~= 1 ) then 				--Ğ°ÅÉÖ§Ïß40-50ÈÎÎñ¶ş
		nt_setTask(195, 1)
		Prise(saying,ItemText[3][3],ItemText[12][3],ItemText[9][3])

	elseif ( nt_getTask(1060) == 120 and GetBit(GetTask(194), 9) ~= 1 ) then 				--Ğ°ÅÉÖ§Ïß40-50ÈÎÎñÈı
		nt_setTask(195, 1)
		Prise(saying,ItemText[3][3],ItemText[12][3],ItemText[9][3])

	elseif ( nt_getTask(1061) == 30 and GetBit(GetTask(194), 10) ~= 1 ) then 				--Ğ°ÅÉÖ§Ïß50-60ÈÎÎñÒ»
		nt_setTask(195, 1)
		Prise(saying,ItemText[4][3],ItemText[5][3],ItemText[9][3])

	elseif ( nt_getTask(1061) == 70 and GetBit(GetTask(194), 11) ~= 1 ) then 				--Ğ°ÅÉÖ§Ïß50-60ÈÎÎñ¶ş
		nt_setTask(195, 1)
		Prise(saying,ItemText[4][3],ItemText[5][3],ItemText[9][3])

	elseif ( nt_getTask(1061) == 120 and GetBit(GetTask(194), 12) ~= 1 ) then 				--Ğ°ÅÉÖ§Ïß50-60ÈÎÎñÈı
		nt_setTask(195, 1)
		Prise(saying,ItemText[4][3],ItemText[5][3],ItemText[9][3])

	end
end


function get_golditem1(lel)		--ÕıÅÉ	
	if ((nt_getTask(1050) == 50 and GetBit(GetTask(192), 1) ~= 1) ==1 or (nt_getTask(1050) == 110 and GetBit(GetTask(192), 2) ~= 1) == 1 or (nt_getTask(1050) == 140 and GetBit(GetTask(192), 3) ~= 1) ==1) then			--ÅĞ¶ÏÊôÓÚÄÄ¸öµÈ¼¶ÈÎÎñ
			AddGoldItem(0, 184)
			Msg2Player("B¹n nhËn ®­îc 1 bé Trang bŞ Hoµng Kim")
			zhengpai_lel2()
	elseif((nt_getTask(1051) == 30 and GetBit(GetTask(192), 4) ~= 1) == 1 or (nt_getTask(1051) == 90 and GetBit(GetTask(192), 5) ~= 1) == 1 or (nt_getTask(1051) == 180 and GetBit(GetTask(192), 6) ~= 1) == 1) then	
			AddGoldItem(0, 178)
			Msg2Player("B¹n nhËn ®­îc 1 bé Trang bŞ Hoµng Kim")
			nt_setTask(195, 0)
			zhengpai_lel3()
	elseif((nt_getTask(1052) == 30 and GetBit(GetTask(192), 7) ~= 1) == 1 or (nt_getTask(1052) == 70 and GetBit(GetTask(192), 8) ~= 1) == 1 or (nt_getTask(1052) == 120 and GetBit(GetTask(192), 9) ~= 1) == 1) then
			local array4 = {181, 182, 183}
			local i= random(1, 3)
			AddGoldItem(0, array4[i])			--AddGoldItem(0,181or182or183)
			Msg2Player("B¹n nhËn ®­îc 1 bé Trang bŞ Hoµng Kim")		
			nt_setTask(195, 0)
			zhengpai_lel4()
	elseif((nt_getTask(1053) == 25 and GetBit(GetTask(192), 10) ~= 1) == 1 or (nt_getTask(1053) == 50 and GetBit(GetTask(192), 11) ~= 1) == 1 or (nt_getTask(1053) == 80 and GetBit(GetTask(192), 12) ~= 1) == 1) then
			local array5 = {179, 180, 185}
			local i = random(1, 3)
			AddGoldItem(0, array5[i])
			Msg2Player("B¹n nhËn ®­îc 1 bé Trang bŞ Hoµng Kim")
			nt_setTask(195, 0)
			zhengpai_lel5()
	else
		print("error:transfors parameter was wrong!!")
		Talk(1,"","Xin lçi! Kh«ng thÓ nhËn ®­îc phÇn th­ëng! Xin h·y ph¶n ¶nh víi GM!!")
		return
	end
end


function get_golditem2(lel)		--ÖĞÁ¢	
	if((nt_getTask(1054) == 30 and GetBit(GetTask(193), 1) ~= 1) == 1 or (nt_getTask(1054) == 100 and GetBit(GetTask(193), 2) ~= 1) == 1 or (nt_getTask(1054) == 150 and GetBit(GetTask(193), 3) ~= 1) == 1) then			--ÅĞ¶ÏÊôÓÚÄÄ¸öµÈ¼¶ÈÎÎñ
			AddGoldItem(0, 184)		
			Msg2Player("B¹n nhËn ®­îc 1 bé Trang bŞ Hoµng Kim")
			zhongli_lel2()
	elseif((nt_getTask(1055) == 50 and GetBit(GetTask(193), 4) ~= 1) == 1 or (nt_getTask(1055) == 90 and GetBit(GetTask(193), 5) ~= 1) == 1 or (nt_getTask(1055) == 140 and GetBit(GetTask(193), 6) ~= 1 ) == 1 ) then	
			AddGoldItem(0, 178)
			Msg2Player("B¹n nhËn ®­îc 1 bé Trang bŞ Hoµng Kim")		
			zhongli_lel3()
	elseif((nt_getTask(1056) == 25 and GetBit(GetTask(193), 7) ~= 1) == 1 or (nt_getTask(1056) == 50 and GetBit(GetTask(193), 8) ~= 1) == 1 or (nt_getTask(1056) == 80 and GetBit(GetTask(193), 9) ~= 1) == 1 ) then
			local array4 = {181, 182, 183}
			local i= random(1, 3)
			AddGoldItem(0, array4[i])			--AddGoldItem(0,181or182or183)
			Msg2Player("B¹n nhËn ®­îc 1 bé Trang bŞ Hoµng Kim")		
			zhongli_lel4()
	elseif((nt_getTask(1057) == 30 and GetBit(GetTask(193), 10) ~= 1) == 1 or (nt_getTask(1057) == 70 and GetBit(GetTask(193), 11) ~= 1) == 1 or (nt_getTask(1057) == 100 and GetBit(GetTask(193), 12) ~= 1) == 1 ) then
			local array5 = {179, 180, 185}
			local i = random(1, 3)
			AddGoldItem(0, array5[i])			--AddGoldItem(0,181or182or183)
			Msg2Player("B¹n nhËn ®­îc 1 bé Trang bŞ Hoµng Kim")		
			zhongli_lel5()
	else
		print("error:transfors parameter was wrong!!")
		Talk(1,"","Xin lçi! Kh«ng thÓ nhËn ®­îc phÇn th­ëng! Xin h·y ph¶n ¶nh víi GM!!")
		return
	end
end


function get_golditem3(lel)		--Ğ°ÅÉ	
	if((nt_getTask(1058) == 30 and GetBit(GetTask(194), 1) ~= 1) == 1 or (nt_getTask(1058) == 50 and GetBit(GetTask(194), 2) ~= 1) ==1  or (nt_getTask(1058) == 100 and GetBit(GetTask(194), 3) ~= 1) == 1) then			--ÅĞ¶ÏÊôÓÚÄÄ¸öµÈ¼¶ÈÎÎñ
			AddGoldItem(0, 184)
			Msg2Player("B¹n nhËn ®­îc 1 bé Trang bŞ Hoµng Kim")		
			xiepai_lel2()
	elseif((nt_getTask(1059) == 30 and GetBit(GetTask(194), 4) ~= 1) == 1 or (nt_getTask(1059) == 50 and GetBit(GetTask(194), 5) ~= 1) == 1 or (nt_getTask(1059) == 120 and GetBit(GetTask(194), 6) ~= 1) == 1) then	
			AddGoldItem(0, 178)
			Msg2Player("B¹n nhËn ®­îc 1 bé Trang bŞ Hoµng Kim")
			xiepai_lel3()
	elseif((nt_getTask(1060) == 50 and GetBit(GetTask(194), 7) ~= 1) == 1 or (nt_getTask(1060) == 90 and GetBit(GetTask(194), 8) ~= 1) == 1 or (nt_getTask(1060) == 120 and GetBit(GetTask(194), 9) ~= 1) == 1) then	
			local array4 = {181, 182, 183}
			local i= random(1, 3)
			AddGoldItem(0, array4[i])			--AddGoldItem(0,181or182or183)
			Msg2Player("B¹n nhËn ®­îc 1 bé Trang bŞ Hoµng Kim")
			xiepai_lel4()
	elseif((nt_getTask(1061) == 30 and GetBit(GetTask(194), 10) ~= 1) == 1 or (nt_getTask(1061) == 70 and GetBit(GetTask(194), 11) ~= 1) == 1 or (nt_getTask(1061) == 120 and GetBit(GetTask(194), 12) ~= 1) == 1) then
			local array5 = {179, 180, 185}
			local i = random(1, 3)
			AddGoldItem(0, array5[i])			
			Msg2Player("B¹n nhËn ®­îc 1 bé Trang bŞ Hoµng Kim")
			xiepai_lel5()
	else
		print("error:transfors parameter was wrong!!")
		Talk(1,"","Xin lçi! Kh«ng thÓ nhËn ®­îc phÇn th­ëng! Xin h·y ph¶n ¶nh víi GM!!")
		return
	end
end

-- ¼Ó½ğÇ®
function get_qualityitem1(lel)		--ÕıÅÉ	
	if ((nt_getTask(1050) == 50 and GetBit(GetTask(192), 1) ~= 1) ==1 or (nt_getTask(1050) == 110 and GetBit(GetTask(192), 2) ~= 1) == 1 or (nt_getTask(1050) == 140 and GetBit(GetTask(192), 3) ~= 1) ==1) then			--ÅĞ¶ÏÊôÓÚÄÄ¸öµÈ¼¶ÈÎÎñ
			Earn(20000);
			zhengpai_lel2()
	elseif((nt_getTask(1053) == 25 and GetBit(GetTask(192), 10) ~= 1) == 1 or (nt_getTask(1053) == 50 and GetBit(GetTask(192), 11) ~= 1) == 1 or (nt_getTask(1053) == 80 and GetBit(GetTask(192), 12) ~= 1) == 1) then
			Earn(20000);
			zhengpai_lel5()
	else
		print("error:transfors parameter was wrong!!")
		Talk(1,"","Xin lçi! Kh«ng thÓ nhËn ®­îc phÇn th­ëng! Xin h·y ph¶n ¶nh víi GM!!")
		return
	end
end


-- ¼Ó½ğÇ®
function get_qualityitem2(lel)		--ÖĞÁ¢	
	if((nt_getTask(1054) == 30 and GetBit(GetTask(193), 1) ~= 1) == 1 or (nt_getTask(1054) == 100 and GetBit(GetTask(193), 2) ~= 1) == 1 or (nt_getTask(1054) == 150 and GetBit(GetTask(193), 3) ~= 1) == 1) then			--ÅĞ¶ÏÊôÓÚÄÄ¸öµÈ¼¶ÈÎÎñ
			Earn(20000);
			zhongli_lel2()
	elseif((nt_getTask(1057) == 30 and GetBit(GetTask(193), 10) ~= 1) == 1 or (nt_getTask(1057) == 70 and GetBit(GetTask(193), 11) ~= 1) == 1 or (nt_getTask(1057) == 100 and GetBit(GetTask(193), 12) ~= 1) == 1 ) then
			Earn(20000);
			zhongli_lel5()
	else
		print("error:transfors parameter was wrong!!")
		Talk(1,"","Xin lçi! Kh«ng thÓ nhËn ®­îc phÇn th­ëng! Xin h·y ph¶n ¶nh víi GM!!")
		return
	end
end


-- ¼Ó½ğÇ®
function get_qualityitem3(lel)	
	if((nt_getTask(1058) == 30 and GetBit(GetTask(194), 1) ~= 1) == 1 or (nt_getTask(1058) == 50 and GetBit(GetTask(194), 2) ~= 1) == 1 or (nt_getTask(1058) == 100 and GetBit(GetTask(194), 3) ~= 1) == 1) then			--ÅĞ¶ÏÊôÓÚÄÄ¸öµÈ¼¶ÈÎÎñ
			Earn(20000);
			xiepai_lel2()
	elseif((nt_getTask(1061) == 30 and GetBit(GetTask(194), 10) ~= 1) == 1 or (nt_getTask(1061) == 70 and GetBit(GetTask(194), 11) ~= 1) == 1 or (nt_getTask(1061) == 120 and GetBit(GetTask(194), 12) ~= 1) == 1) then
			Earn(20000);
			xiepai_lel5()
	else
		print("error:transfors parameter was wrong!!")
		Talk(1,"","Xin lçi! Kh«ng thÓ nhËn ®­îc phÇn th­ëng! Xin h·y ph¶n ¶nh víi GM!!")
		return
	end
end


-- ¾­Ñé
function get_oreitem1(lel)		--ÕıÅÉ	
	if ((nt_getTask(1050) == 50 and GetBit(GetTask(192), 1) ~= 1) ==1 or (nt_getTask(1050) == 110 and GetBit(GetTask(192), 2) ~= 1) == 1 or (nt_getTask(1050) == 140 and GetBit(GetTask(192), 3) ~= 1) ==1) then			--ÅĞ¶ÏÊôÓÚÄÄ¸öµÈ¼¶ÈÎÎñ
			AddOwnExp(20000);
			zhengpai_lel2()
	elseif((nt_getTask(1051) == 30 and GetBit(GetTask(192), 4) ~= 1) == 1 or (nt_getTask(1051) == 90 and GetBit(GetTask(192), 5) ~= 1) == 1 or (nt_getTask(1051) == 180 and GetBit(GetTask(192), 6) ~= 1) == 1) then		
			AddOwnExp(20000);
			zhengpai_lel3()
	elseif((nt_getTask(1052) == 30 and GetBit(GetTask(192), 7) ~= 1) == 1 or (nt_getTask(1052) == 70 and GetBit(GetTask(192), 8) ~= 1) == 1 or (nt_getTask(1052) == 120 and GetBit(GetTask(192), 9) ~= 1) == 1) then	
			AddOwnExp(20000);
			zhengpai_lel4()
	elseif((nt_getTask(1053) == 25 and GetBit(GetTask(192), 10) ~= 1) == 1 or (nt_getTask(1053) == 50 and GetBit(GetTask(192), 11) ~= 1) == 1 or (nt_getTask(1053) == 80 and GetBit(GetTask(192), 12) ~= 1) == 1) then
			AddOwnExp(20000);
			zhengpai_lel5()
	else
		print("error:transfors parameter was wrong!!")
		Talk(1,"","Xin lçi! Kh«ng thÓ nhËn ®­îc phÇn th­ëng! Xin h·y ph¶n ¶nh víi GM!!")
		return
	end
end


-- ¾­Ñé
function get_oreitem2(lel)	
	if((nt_getTask(1054) == 30 and GetBit(GetTask(193), 1) ~= 1) == 1 or (nt_getTask(1054) == 100 and GetBit(GetTask(193), 2) ~= 1) == 1 or (nt_getTask(1054) == 150 and GetBit(GetTask(193), 3) ~= 1) == 1) then			--ÅĞ¶ÏÊôÓÚÄÄ¸öµÈ¼¶ÈÎÎñ
			AddOwnExp(20000);
			zhongli_lel2()
	elseif((nt_getTask(1055) == 50 and GetBit(GetTask(193), 4) ~= 1) == 1 or (nt_getTask(1055) == 90 and GetBit(GetTask(193), 5) ~= 1) == 1 or (nt_getTask(1055) == 140 and GetBit(GetTask(193), 6) ~= 1 ) == 1 ) then	
			AddOwnExp(20000);
			zhongli_lel3()
	elseif((nt_getTask(1056) == 25 and GetBit(GetTask(193), 7) ~= 1) == 1 or (nt_getTask(1056) == 50 and GetBit(GetTask(193), 8) ~= 1) == 1 or (nt_getTask(1056) == 80 and GetBit(GetTask(193), 9) ~= 1) == 1 ) then	
			AddOwnExp(20000);
			zhongli_lel4()
	elseif((nt_getTask(1057) == 30 and GetBit(GetTask(193), 10) ~= 1) == 1 or (nt_getTask(1057) == 70 and GetBit(GetTask(193), 11) ~= 1) == 1 or (nt_getTask(1057) == 100 and GetBit(GetTask(193), 12) ~= 1) == 1 ) then
			AddOwnExp(20000);
			zhongli_lel5()
	else
		print("error:transfors parameter was wrong!!")
		Talk(1,"","Xin lçi! Kh«ng thÓ nhËn ®­îc phÇn th­ëng! Xin h·y ph¶n ¶nh víi GM!!")
		return
	end
end


-- ¾­Ñé
function get_oreitem3(lel)	
	if((nt_getTask(1058) == 30 and GetBit(GetTask(194), 1) ~= 1) == 1 or (nt_getTask(1058) == 50 and GetBit(GetTask(194), 2) ~= 1) == 1 or (nt_getTask(1058) == 100 and GetBit(GetTask(194), 3) ~= 1) == 1) then			--ÅĞ¶ÏÊôÓÚÄÄ¸öµÈ¼¶ÈÎÎñ
			AddOwnExp(20000);
			xiepai_lel2()
	elseif((nt_getTask(1059) == 30 and GetBit(GetTask(194), 4) ~= 1) == 1 or (nt_getTask(1059) == 50 and GetBit(GetTask(194), 5) ~= 1) == 1 or (nt_getTask(1059) == 120 and GetBit(GetTask(194), 6) ~= 1) == 1) then		
			AddOwnExp(20000);
			xiepai_lel3()
	elseif((nt_getTask(1060) == 50 and GetBit(GetTask(194), 7) ~= 1) == 1 or (nt_getTask(1060) == 90 and GetBit(GetTask(194), 8) ~= 1) == 1 or (nt_getTask(1060) == 120 and GetBit(GetTask(194), 9) ~= 1) == 1) then		
			AddOwnExp(20000);
			xiepai_lel4()
	elseif((nt_getTask(1061) == 30 and GetBit(GetTask(194), 10) ~= 1) == 1 or (nt_getTask(1061) == 70 and GetBit(GetTask(194), 11) ~= 1) == 1 or (nt_getTask(1061) == 120 and GetBit(GetTask(194), 12) ~= 1) == 1) then
			AddOwnExp(20000);
			xiepai_lel5()
	else
		print("error:transfors parameter was wrong!!")
		Talk(1,"","Xin lçi! Kh«ng thÓ nhËn ®­îc phÇn th­ëng! Xin h·y ph¶n ¶nh víi GM!!")
		return
	end
end


function get_propitem1(lel)	
	if((nt_getTask(1051) == 30 and GetBit(GetTask(192), 4) ~= 1) == 1 or (nt_getTask(1051) == 90 and GetBit(GetTask(192), 5) ~= 1) == 1 or (nt_getTask(1051) == 180 and GetBit(GetTask(192), 6) ~= 1) == 1) then				--ÅĞ¶ÏÊôÓÚÄÄ¸öµÈ¼¶ÈÎÎñ
			AddItem(6, 1, 72, 1, 0, 0, 0)
			Msg2Player("B¹n nhËn ®­îc 1 vËt phÈm")
			zhengpai_lel3()
	elseif((nt_getTask(1052) == 30 and GetBit(GetTask(192), 7) ~= 1) == 1 or (nt_getTask(1052) == 70 and GetBit(GetTask(192), 8) ~= 1) == 1 or (nt_getTask(1052) == 120 and GetBit(GetTask(192), 9) ~= 1) == 1) then
			AddItem(6, 1, 73, 1, 0, 0, 0)
			Msg2Player("B¹n nhËn ®­îc 1 vËt phÈm")
			zhengpai_lel4()
	else
		print("error:transfors parameter was wrong!!")
		Talk(1,"","Xin lçi! Kh«ng thÓ nhËn ®­îc phÇn th­ëng! Xin h·y ph¶n ¶nh víi GM!!")
		return
	end
end


function get_propitem2(lel)	
	if((nt_getTask(1055) == 50 and GetBit(GetTask(193), 4) ~= 1) == 1 or (nt_getTask(1055) == 90 and GetBit(GetTask(193), 5) ~= 1) == 1 or (nt_getTask(1055) == 140 and GetBit(GetTask(193), 6) ~= 1 ) == 1 ) then			--ÅĞ¶ÏÊôÓÚÄÄ¸öµÈ¼¶ÈÎÎñ
			AddItem(6, 1, 72, 1, 0, 0, 0)
			Msg2Player("B¹n nhËn ®­îc 1 vËt phÈm")
			zhongli_lel3()
	elseif((nt_getTask(1056) == 25 and GetBit(GetTask(193), 7) ~= 1) == 1 or (nt_getTask(1056) == 50 and GetBit(GetTask(193), 8) ~= 1) == 1 or (nt_getTask(1056) == 80 and GetBit(GetTask(193), 9) ~= 1) == 1 ) then
			AddItem(6, 1, 73, 1, 0, 0, 0)
			Msg2Player("B¹n nhËn ®­îc 1 vËt phÈm")
			zhongli_lel4()
	else
		print("error:transfors parameter was wrong!!")
		Talk(1,"","Xin lçi! Kh«ng thÓ nhËn ®­îc phÇn th­ëng! Xin h·y ph¶n ¶nh víi GM!!")
		return
	end
end


function get_propitem3(lel)	
	if((nt_getTask(1059) == 30 and GetBit(GetTask(194), 4) ~= 1) == 1 or (nt_getTask(1059) == 50 and GetBit(GetTask(194), 5) ~= 1) == 1 or (nt_getTask(1059) == 120 and GetBit(GetTask(194), 6) ~= 1) == 1) then				--ÅĞ¶ÏÊôÓÚÄÄ¸öµÈ¼¶ÈÎÎñ
			AddItem(6, 1, 72, 1, 0, 0, 0)
			Msg2Player("B¹n nhËn ®­îc 1 vËt phÈm")
			xiepai_lel3()
	elseif((nt_getTask(1060) == 50 and GetBit(GetTask(194), 7) ~= 1) == 1 or (nt_getTask(1060) == 90 and GetBit(GetTask(194), 8) ~= 1) == 1 or (nt_getTask(1060) == 120 and GetBit(GetTask(194), 9) ~= 1) == 1) then	
			AddItem(6, 1, 73, 1, 0, 0, 0)
			Msg2Player("B¹n nhËn ®­îc 1 vËt phÈm")
			xiepai_lel4()
	else
		print("error:transfors parameter was wrong!!")
		Talk(1,"","Xin lçi! Kh«ng thÓ nhËn ®­îc phÇn th­ëng! Xin h·y ph¶n ¶nh víi GM!!")
		return
	end
end

function zhengpai_lel2()
	if (nt_getTask(1050) == 50) then
		Uworld192 = nt_getTask(192)
		nt_setTask(192, SetBit(Uworld192, 1, 1))
		nt_setTask(1050, 60)
		Msg2Player("NhiÖm vô kÕt thóc! Th× ra  ng­êi nµy lµ Si T¨ng gi¶ d¹ng! B¹n h·y trë vÒ t×m Ng¹o V©n T«ng.")
		Msg2Player("B¹n nhËn ®­îc 20.000 ®iÓm kinh nghiÖm")
		for i=1,5 do
			DelItem(504)
		end
		AddOwnExp(20000)
	elseif (nt_getTask(1050) == 110) then
		Uworld192 = nt_getTask(192)
		nt_setTask(192, SetBit(Uworld192, 2, 1))
		nt_setTask(1050, 120)
		Msg2Player("T×m ®­îc SÇm Hïng, nhiÖm vô kÕt thóc! SÇm Hïng cho biÕt s¸t thñ n¨m x­a thİch s¸t Nh¹c T­íng Qu©n ®ang ë ngoµi thµnh.")				
		Msg2Player("B¹n nhËn ®­îc 20.000 ®iÓm kinh nghiÖm")
		AddOwnExp(20000)
	elseif (nt_getTask(1050) == 140) then
		Uworld192 = nt_getTask(192)
		nt_setTask(192, SetBit(Uworld192, 3, 1))
		nt_setTask(1050, 1000)
		Msg2Player("NhiÖm vô hoµn thµnh! B¹n cã thÓ quay vÒ t×m Ng¹o V©n T«ng ®Ó nhËn phÇn th­ëng cña giai ®o¹n nµy!")
	end
end

function zhengpai_lel3()
	if (nt_getTask(1051) == 30) then
		Uworld192 = nt_getTask(192)
		nt_setTask(192, SetBit(Uworld192, 4, 1))
		nt_setTask(1051, 40)
		Msg2Player("NhiÖm vô kÕt thóc, H¹ Lan Chi cho biÕt B¶o Th¹ch ®· bŞ  bá ë quª nhµ. B¹n cã thÓ ®i  t×m Ng« L·o Th¸i ®Ó nhËn mét bé ¸o gi¸p thÇn kú!")
		Msg2Player("B¹n nhËn ®­îc 1 bé trang bŞ mµ bao nhiªu ng­êi h»ng mong ­íc!")
		Msg2Player("B¹n nhËn ®­îc 50.000 ®iÓm kinh nghiÖm")
		if ( GetSex() == 0 ) then
			AddGoldItem(0, 178); -- Ôö¼ÓÒ»¼ş½ğ·ãÒÂ·ş
		else
			AddGoldItem(0, 178);
		end
		AddOwnExp(50000)
	elseif (nt_getTask(1051) == 90) then
		Uworld192 = nt_getTask(192)
		nt_setTask(192, SetBit(Uworld192, 5, 1))
		nt_setTask(1051, 100)
		Uworld1011 = nt_getTask(1011)
		nt_setTask(1011,0)
--		Msg2Player("Äã³É¹¦»ñµÃÁË×ã¹»µÄÀÇ¹Ç£¬ÈÎÎñÍê³É£¡°ÁÔÆ×Ú¸øÁËÄãÆæ¹ÖµÄÒ»¿Å¸ÅÂÊ±¦Ê¯£¬ÁôÏÂËüÒ²ĞíÓĞ´óÓÃ¡£Äã¿ÉÒÔÈ¥ÏåÑôÕÒ¹¨°¢Å£ÖÆ×÷Ò©²ÄÁË¡£")
--		AddItem(6,1,147,1,1,1)
	elseif (nt_getTask(1051) == 180) then
		Uworld192 = nt_getTask(192)
		nt_setTask(192, SetBit(Uworld192, 6, 1))
		nt_setTask(1051, 1000)
--		Msg2Player("ÄãÍê³ÉÁËÈÎÎñ£¬°ÁÔÆ×Ú½«ÎâÀÏÌ«Ì«ÔùËÍµÄ£¬¶àÓàµÄÒ»¿Å¿óÊ¯ËÍ¸øÁËÄã¡£²¢¸æËßÄã£¬´ø×ÅÄãµÃµ½µÄ´ø¿×îø¼×£¬¸ÅÂÊ±¦Ê¯£¬ºÍÕâ¿ÅÊôĞÔ¿óÊ¯£¬È¥ÕÒÉñÃØÌú½³£¬ÓĞ¿ÉÄÜºÏ³öÒ»¼şºÃµÄ×°±¸¡£Äã¿ÉÒÔÔÙ´ÎÓëËû¶Ô»°£¬ÁìÈ¡¸Ã½×¶ÎÈÎÎñÈ«Íê³ÉµÄ´ó½±ÁË¡£")
--		Msg2Player("ÄãµÃµ½Ò»¿Å¿óÊ¯")
		Msg2Player("B¹n nhËn ®­îc 120.000 ®iÓm kinh nghiÖm")
--		AddItem(6,1,149,1,0,0,0) --¼ÓÃ÷Ò»¿óÊ¯
		AddOwnExp(120000)
	end
end

function zhengpai_lel4()
	if (nt_getTask(1052) == 30) then
		Uworld192 = nt_getTask(192)
		nt_setTask(192, SetBit(Uworld192, 7, 1))
		nt_setTask(1052, 40)
		Uworld1011 = nt_getTask(1011) --ÕıÅÉÖ§ÏßÉ±¹Ö±äÁ¿£¬ÉèÖÃÎª0£¬Çå¿Õ
		nt_setTask(1011,0)
		Msg2Player("NhiÖm vô hoµn thµnh! Ng¹o V©n T«ng b¶o b¹n ®Õn D­¬ng Ch©u t×m Hçn Hçn. Th«ng qua y ®Ó x©m nhËp vµo tæ chøc s¸t thñ L©m Uyªn Nhai t×m ra kÎ ®· thİch s¸t Nh¹c Nguyªn So¸i n¨m x­a.")
		Msg2Player("B¹n nhËn ®­îc 100.000 ®iÓm kinh nghiÖm")
		AddOwnExp(100000)
	elseif (nt_getTask(1052) == 70) then
		Uworld192 = nt_getTask(192)
		nt_setTask(192, SetBit(Uworld192, 8, 1))
		nt_setTask(1052, 80)
		Uworld1011 = nt_getTask(1011)
		nt_setTask(1011, 0) --É±¹Ö±äÁ¿ÖÃÎª0
		Msg2Player("NhiÖm vô hoµn thµnh! Hçn Hçn sai b¹n ®i giÕt Du T­¬ng T©n nh­ng b¹n quyÕt ®Şnh quay vÒ hái Ng¹o V©n T«ng tr­íc.")
		Msg2Player("B¹n nhËn ®­îc 100.000 ®iÓm kinh nghiÖm")
		AddOwnExp(100000)
	elseif (nt_getTask(1052) == 120) then
		Uworld192 = nt_getTask(192)
		nt_setTask(192, SetBit(Uworld192, 9, 1))
		nt_setTask(1052, 1000)
		Msg2Player("NhiÖm vô hoµn thµnh! B¹n cã thÓ quay vÒ t×m Ng¹o V©n T«ng ®Ó nhËn phÇn th­ëng cña giai ®o¹n nµy!")
	end
end

function zhengpai_lel5()
	if (nt_getTask(1053) == 25) then
		Uworld192 = nt_getTask(192)
		nt_setTask(192, SetBit(Uworld192, 10, 1))
		nt_setTask(1053, 27)
		Uworld1011 = nt_getTask(1011)
		nt_setTask(1011, 0)
		Msg2Player("NhiÖm vô hoµn thµnh! Hçn Hçn khen ngîi b¹n! Nh­ng d­êng vÉn cßn cã ®iÒu g× ®ã Èn chøa phİa sau!")
		Msg2Player("B¹n nhËn ®­îc 200.000 ®iÓm kinh nghiÖm")
		AddOwnExp(200000)
	elseif (nt_getTask(1053) == 50) then
		Uworld192 = nt_getTask(192)
		nt_setTask(192, SetBit(Uworld192, 11, 1))
		nt_setTask(1053, 60)
		Msg2Player("NhiÖm vô hoµn thµnh! Hçn Hçn cuèi cïng ®· tiÕt lé, cÇm ®Çu thİch s¸t Nh¹c Nguyªn So¸i n¨m x­a chİnh lµ TÒ Tøc Phong. H¾n ®ang ë bªn ngoµi thµnh L©m An.")
		Msg2Player("B¹n nhËn ®­îc 200.000 ®iÓm kinh nghiÖm")
		AddOwnExp(200000)
	elseif (nt_getTask(1053) == 80) then
		Uworld192 = nt_getTask(192)
		nt_setTask(192, SetBit(Uworld192, 12, 1))
		nt_setTask(1053, 1000)
		Msg2Player("Ng¹o V©n T«ng e ng¹i phİa sau nhÊt ®Şnh cã mét tæ chøc ngÇm thao tóng. Xem ra h¾n muèn ®İch th©n ®i thÈm tra. B¹n h¹y tiÕp tôc ®èi tho¹i víi Ng¹o V©n T«ng ®Ó nhËn phÇn th­ëng.")

	end
end

function zhongli_lel2()
	if (nt_getTask(1054) == 30) then
		Uworld193 = nt_getTask(193)
		nt_setTask(193, SetBit(Uworld193, 1, 1))
		nt_setTask(1054, 40)
		Uworld1012 = nt_getTask(1012)
		nt_setTask(1012, 0)
		Msg2Player("NhiÖm vô hoµn thµnh! Giang NhÊt Tiªu b¶o b¹n ®i vµo thµnh t×m Th­ Sinh L¹c Thanh Thu, anh ta lµ mét ng­êi rÊt am hiÓu vÒ binh khİ ")
		Msg2Player("B¹n nhËn ®­îc 20.000 ®iÓm kinh nghiÖm")
		AddOwnExp(20000)
	elseif(nt_getTask(1054) == 100) then
		Uworld193 = nt_getTask(193)
		nt_setTask(193, SetBit(Uworld193, 2, 1))
		nt_setTask(1054, 110) 
		Msg2Player("NhiÖm vô hoµn thµnh! §ç C«n bŞ b¹n ®¸nh b¹i, h¾n nãi sÏ xãa hÕt mãn nî cho L¹c Thanh Thu.")
		Msg2Player("B¹n nhËn ®­îc 20.000 ®iÓm kinh nghiÖm")
		AddOwnExp(20000)
	elseif(nt_getTask(1054) == 150) then
		Uworld193 = nt_getTask(193)
		nt_setTask(193, SetBit(Uworld193, 3, 1))
		nt_setTask(1054, 1000)
		Msg2Player("L¹c Thanh Thu nãi, tù tin míi lµ vò khİ lîi h¹i nhÊt. NhiÖm vô hoµn thµnh. B¹n quay vÒ gÆp LiÔu V©n Nam ®Ó nhËn phÇn th­ëng.")
		Msg2Player("B¹n nhËn ®­îc 50.000 ®iÓm kinh nghiÖm")
		AddOwnExp(50000)
	end
end

function zhongli_lel3()
	if (nt_getTask(1055) == 50) then
		Uworld193 = nt_getTask(193)
		nt_setTask(193, SetBit(Uworld193, 4, 1))
		nt_setTask(1055, 60)
		Msg2Player("NhiÖm vô hoµn thµnh! Trªn bé gi¸p nµy cã kh¾c mét c©y Tr­êng th­¬ng, ®©y lµ dÊu Ên cña Thµnh §« L·nh Th­¬ng Tiªu côc, b¹n quyÕt ®Şnh ®i ®Õn ®ã mét chuyÕn.")
		Msg2Player("B¹n nhËn ®­îc 1 bé trang bŞ!")
		Msg2Player("B¹n nhËn ®­îc 50.000 ®iÓm kinh nghiÖm")
		if ( GetSex() == 0 ) then
			AddGoldItem(0, 178); -- Ôö¼ÓÒ»¼ş½ğ·ãÒÂ·ş
		else
			AddGoldItem(0, 178); -- Ôö¼ÓÒ»¼ş½ğ·ãÒÂ·ş
		end
		AddOwnExp(50000)
	elseif (nt_getTask(1055) == 90) then
		Uworld193 = nt_getTask(193)
		nt_setTask(193, SetBit(Uworld193, 5, 1))
		nt_setTask(1055, 100)
		Uworld1012 = nt_getTask(1012)
		nt_setTask(1012, 0)
--		Msg2Player("ÀäÇ¹ïÚ¾ÖÖ÷ÈËÈÃÄã²»Òª¶ÔºÉ»¨µÁ¸Ï¾¡É±¾ø£¬ËûËÍ¸øÁËÄãÒ»¿Å¸ÅÂÊ±¦Ê¯¡£")
--		Msg2Player("ÄãµÃµ½Ò»¿Å¸ÅÂÊ±¦Ê¯")
		Msg2Player("B¹n nhËn ®­îc 50.000 ®iÓm kinh nghiÖm")
--		AddItem(6, 1, 147, 1, 1, 1)
		AddOwnExp(50000)
	elseif (nt_getTask(1055) == 140) then
		Uworld193 = nt_getTask(193)
		nt_setTask(193, SetBit(Uworld193, 6, 1))
		nt_setTask(1055, 1000)
--		Msg2Player("ÈÎÎñÍê³É£¡ÁøÄÏÔÆ¸øÁËÄãÒ»¿ÅÊôĞÔ¿óÊ¯£¬ÖÁÓÚÕâ¿ÅÊôĞÔ¿óÊ¯ÓĞÊ²Ã´ÓÃ´¦£¬ÄÇ¾ÍµÃÒÔºóÄãÓö¼û¸ßÈËÊ±²ÅÄÜµÃÒÔ½â´ğµÄÁË¡£")
--		Msg2Player("ÄãµÃµ½Ò»¿ÅÊôĞÔ¿óÊ¯")
		Msg2Player("B¹n nhËn ®­îc 120.000 ®iÓm kinh nghiÖm")
--		AddItem(6,1,149,1,0,0,0)
		AddOwnExp(120000)
	end
end

function zhongli_lel4()
	if (nt_getTask(1056) == 25) then
		Uworld193 = nt_getTask(193)
		nt_setTask(193, SetBit(Uworld193, 7, 1))
		nt_setTask(1056, 27)
		Msg2Player("NhiÖm vô hoµn thµnh! Nh­ng LiÔu V©n Nam tùa hå cßn cã chót do dù, d­êng nh­ cßn cã ®iÒu g× ch­a nãi.")--ÁøÄÏÔÆÈÃÄãÈ¥ÑİÎä³¡´òÊ¤Ò»³¡±ÈÈü£¬¿´À´ÓĞÖØÒªµÄÊÂ¼´½«·¢ÉúÁË")
		Msg2Player("B¹n nhËn ®­îc 100.000 ®iÓm kinh nghiÖm")
		AddOwnExp(100000)
	elseif (nt_getTask(1056) == 50) then
		Uworld193 = nt_getTask(193)
		nt_setTask(193, SetBit(Uworld193, 8, 1))
		nt_setTask(1056, 60)
		Uworld1012 = nt_getTask(1012)
		nt_setTask(1012, 0)
		Msg2Player("NhiÖm vô hoµn thµnh! LiÔu Nam V©n b¶o b¹n ®i  t×m diÖt Du T­¬ng T©n - kÎ ®· tõng nhiÒu n¨m v« ®Şch vâ tr­êng")
		Msg2Player("B¹n nhËn ®­îc 100.000 ®iÓm kinh nghiÖm")
		AddOwnExp(100000)
	elseif (nt_getTask(1056) == 80) then
		Uworld193 = nt_getTask(193)
		nt_setTask(193, SetBit(Uworld193, 9, 1))
		nt_setTask(1056, 1000)
		Msg2Player("NhiÖm vô hoµn thµnh! Tæ chøc rÊt hµi lßng víi b¹n. B¹n h·y quay l¹i ®èi tho¹i víi LiÔu V©n Nam ®Ó ®Ó nhËn phÇn th­ëng") 
		Msg2Player("B¹n nhËn ®­îc 260.000 ®iÓm kinh nghiÖm")
		AddOwnExp(260000)
	end
end

function zhongli_lel5()
	if (nt_getTask(1057) == 30) then
		Uworld193 = nt_getTask(193)
		nt_setTask(193, SetBit(Uworld193, 10, 1))
		nt_setTask(1057, 40)
		Uworld1012 = nt_getTask(1012)
		nt_setTask(1012, 0)
		Msg2Player("NhiÖm vô hoµn thµnh! B¹n cã thÓ tr¶ lêi c¸c vÊn ®Ò vÒ Tèng Kim")
		Msg2Player("B¹n nhËn ®­îc 200.000 ®iÓm kinh nghiÖm")
		AddOwnExp(200000)
	elseif (nt_getTask(1057) == 70) then
		Uworld193 = nt_getTask(193)
		nt_setTask(193, SetBit(Uworld193, 11, 1))
		nt_setTask(1057, 80)
		Msg2Player("NhiÖm vô hoµn thµnh! LiÔu Nam V©n b¸o víi b¹n mét hung tin.")
		Msg2Player("B¹n nhËn ®­îc 200.000 ®iÓm kinh nghiÖm")
		AddOwnExp(200000)
	elseif (nt_getTask(1057) == 100) then
		Uworld193 = nt_getTask(193)
		nt_setTask(193, SetBit(Uworld193, 12, 1))
		nt_setTask(1057, 1000)
		Msg2Player("NhiÖm vô hoµn thµnh! LiÔu Nam V©n vui mõng r¬i lÖ. B¹n quay l¹i ®èi tho¹i víi LiÔu V©n Nam ®Ó ®Ó nhËn phÇn th­ëng")

	end
end

function xiepai_lel2()
	if (nt_getTask(1058) == 30) then
		Uworld194 = nt_getTask(194)
		nt_setTask(194, SetBit(Uworld194, 1, 1))
		nt_setTask(1058, 40)
		Uworld1013 = nt_getTask(1013)
		nt_setTask(1013, 0)
		Msg2Player("NhiÖm vô hoµn thµnh! Th¸c B¹t Hoµi Xuyªn b¶o b¹n ®i Thµnh §« t×m tªn gian tÕ Tr©u Tr­êng Cöu.")
		Msg2Player("B¹n nhËn ®­îc 20.000 ®iÓm kinh nghiÖm")
		AddOwnExp(20000)
	elseif (nt_getTask(1058) == 50) then
		Uworld194 = nt_getTask(194)
		nt_setTask(194, SetBit(Uworld194, 2, 1))
		nt_setTask(1058, 60)
		Msg2Player("NhiÖm vô hoµn thµnh! Tr©u Tr­êng Cöu b¶o b¹n cÇm vµi quyÓn mËt tŞch ®i D­¬ng Ch©u t×m ThÈm Phong.")
		Msg2Player("B¹n nhËn ®­îc 20.000 ®iÓm kinh nghiÖm")
		AddOwnExp(20000)
	elseif (nt_getTask(1058) == 100) then
		Uworld194 = nt_getTask(194)
		nt_setTask(194, SetBit(Uworld194, 3, 1))
		nt_setTask(1058, 1000)
		Msg2Player("NhiÖm vô hoµn thµnh! B¹n quay gÆp Th¸c B¹t ®Ó nhËn phÇn th­ëng.")
		Msg2Player("B¹n nhËn ®­îc 50.000 ®iÓm kinh nghiÖm")
		AddOwnExp(50000)
	end
end
function xiepai_lel3()
	if (nt_getTask(1059) == 30) then
		Uworld194 = nt_getTask(194)
		nt_setTask(194, SetBit(Uworld194, 4, 1))
		nt_setTask(1059, 40) 
		Uworld1013 = nt_getTask(1013)
		nt_setTask(1013, 0)
		Msg2Player("NhiÖm vô hoµn thµnh! Th¸c B¹t  b¶o b¹n ®i T­¬ng D­¬ng t×m L­u UÈn Cæ, tªn gian tÕ cña §¹i Kim ®ang lÈn trèn")
		Msg2Player("B¹n nhËn ®­îc 50.000 ®iÓm kinh nghiÖm")
		AddOwnExp(50000)
	elseif (nt_getTask(1059) == 50) then
		Uworld194 = nt_getTask(194)
		nt_setTask(194, SetBit(Uworld194, 5, 1))
		nt_setTask(1059, 60)
		Msg2Player("L­u UÈn Cæ cho biÕt Thi Nghi Sinh thËt sù cã biÓu hiÖn ph¶n quèc, b¹n lËp tøc quay l¹i b¸o cho Th¸c B¹t Hoµi Xuyªn.")
		Msg2Player("B¹n nhËn ®­îc 50.000 ®iÓm kinh nghiÖm")
		AddOwnExp(50000)
	elseif (nt_getTask(1059) == 120) then
		Uworld194 = nt_getTask(194)
		nt_setTask(194, SetBit(Uworld194, 6, 1))
		nt_setTask(1059, 1000)
		Msg2Player("NhiÖm vô hoµn thµnh! B¹n quay gÆp Th¸c B¹t ®Ó nhËn phÇn th­ëng.")
		Msg2Player("B¹n nhËn ®­îc 120.000 ®iÓm kinh nghiÖm")
		AddOwnExp(120000)
	end
end

function xiepai_lel4()
if (nt_getTask(1060) == 50) then
		Uworld194 = nt_getTask(194)
		nt_setTask(194, SetBit(Uworld194, 7, 1))
		nt_setTask(1060, 60)
		Uworld1013 = nt_getTask(1013)
		nt_setTask(1013, 0)
		Msg2Player("NhiÖm vô hoµn thµnh! L­u UÈn Cæ  b¶o b¹n trë vÒ b¸o t­êng tËn víi Th¸c B¹t  vÒ t×nh h×nh thi ®Êu.")
		Msg2Player("B¹n nhËn ®­îc 100.000 ®iÓm kinh nghiÖm")
		AddOwnExp(100000)
	elseif (nt_getTask(1060) == 90) then
		Uworld194 = nt_getTask(194)
		nt_setTask(194, SetBit(Uworld194, 8, 1))
		nt_setTask(1060, 100)
		Uworld1013 = nt_getTask(1013)
		nt_setTask(1013, 0)
		Msg2Player("NhiÖm vô hoµn thµnh! Th¸c B¹t  b¶o b¹n ®i T­¬ng D­¬ng ¸m s¸t ®¹i phó hé NguyÔn Minh ViÔn.")
		Msg2Player("B¹n nhËn ®­îc 100.000 ®iÓm kinh nghiÖm")
		AddOwnExp(100000)
	elseif (nt_getTask(1060) == 120) then
		Uworld194 = nt_getTask(194)
		nt_setTask(194, SetBit(Uworld194, 9, 1))
		nt_setTask(1060, 1000)
		Msg2Player("NhiÖm vô hoµn thµnh! B¹n quay gÆp Th¸c B¹t ®Ó nhËn phÇn th­ëng.")
		Msg2Player("B¹n nhËn ®­îc 260.000 ®iÓm kinh nghiÖm")
		AddOwnExp(260000)
	end
end

function xiepai_lel5()
	if (nt_getTask(1061) == 30) then
		Uworld194 = nt_getTask(194)
		nt_setTask(194, SetBit(Uworld194, 10, 1))
		nt_setTask(1061, 40)
		Uworld1013 = nt_getTask(1013)
		nt_setTask(1013, 0)
		Msg2Player("NhiÖm vô hoµn thµnh! Th¸c B¹t  hÕt mùc t¸n th­ëng b¹n vµ cho biÕt Hoµng th­îng chuÈn bŞ triÖu kiÕn b¹n. B¹n cÇn chuÈn bŞ vµi kiÕn thøc vÒ qu©n sù!")
		Msg2Player("B¹n nhËn ®­îc 200.000 ®iÓm kinh nghiÖm")
		AddOwnExp(200000)
	elseif (nt_getTask(1061) == 70) then
		Uworld194 = nt_getTask(194)
		nt_setTask(194, SetBit(Uworld194, 11, 1))
		nt_setTask(1061, 80)
		Msg2Player("NhiÖm vô hoµn thµnh! Th¸c B¹t  rÊt vui nh­ng h×nh nh­ y ®ang cã vÊn ®Ò g× khã nãi.")
		Msg2Player("B¹n nhËn ®­îc 200.000 ®iÓm kinh nghiÖm")
		AddOwnExp(200000)
	elseif (nt_getTask(1061) == 120) then
		Uworld194 = nt_getTask(194)
		nt_setTask(194, SetBit(Uworld194, 12, 1))
		nt_setTask(1061, 1000)
		Msg2Player("NhiÖm vô hoµn thµnh! B¹n quay gÆp Th¸c B¹t ®Ó nhËn phÇn th­ëng.")

	end
end