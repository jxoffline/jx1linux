-- ÁÙ°²¡¡Ö°ÄÜ¡¡»Ê¹¬ÎÀ±ø£¨Á½Ãû£©£¨Ø¤°ï50¼¶ÈÎÎñ£©
-- by£ºDan_Deng(2003-09-16)

function main()
		UTask_gb = GetTask(8)
	if ((UTask_gb >= 50*256+30) and (UTask_gb <60)) then		-- £¨µÚÈı´Î£©
		Talk(3,"","Tµo c«ng c«ng cã lÖnh! Kh«ng cã phËn sù kh«ng ®­îc nhËp cung! §i ®i!",":Ta cã LÖnh bµi th«ng hµnh","Cã lÖnh bµi th«ng hµnh còng kh«ng ®­îc vµo! ")
--		SetTask(8,50*256+40)
	elseif (UTask_gb == 50*256+20) and (HaveItem(139) == 1) then	-- £¨µÚ¶ş´Î£©
		Msg2Player("KiÓm tra lÖnh bµi kh«ng sai, tiÕn vµo Hoµng cung. ")
		NewWorld(177, 1569, 3169)
	elseif (UTask_gb == 50*256+10) then		--´ø×Å50¼¶ÈÎÎñ£¨µÚÒ»²½£©
		Talk(3,"","§øng l¹i! §øng l¹i! Ng­¬i ch¸n sèng hay sau mµ ch¹y lung tung n¬i ®©y?","T¹i h¹ lµ ®Ö tö C¸i Bang, cã mét thø cùc kú quan träng ph¶i d©ng cho Hoµng th­îng","Cã ph¶i ai còng ®­îc gÆp Hoµng th­îng ®©u? Kh«ng cã lÖnh bµi th«ng hµnh cña Khu mËt sø Tr­¬ng ®¹i nh©n, ai còng kh«ng ®­îc vµo! ")
		SetTask(8,50*256+20)
	else
		i = random(0,2)
		if (i == 0) then
			Talk(1,"","§øng l¹i! §øng l¹i! Ng­¬i ch¸n sèng hay sau mµ ch¹y lung tung n¬i ®©y?")
		elseif (i == 1) then
			Talk(1,"","Hoµng cung cÊm ®Şa! Mau ®i ®i! ")
		else
			Talk(1,"","§øng l¹i! §øng l¹i! Ng­¬i ch¸n sèng hay sau mµ ch¹y lung tung n¬i ®©y?")
		end
	end
end;
