-- ÁúÃÅÕò-¹ÅÑô¶´-¡°Ñýµ¶¡±ÕÔ·½(ÊÀ½çÈÎÎñ¡°¾ÈÐ¡¾ê¡±)
-- by£ºDan_Deng(2004-03-03)

function OnDeath()
	Uworld41 = GetByte(GetTask(41),1)
	if (Uworld41 >= 10) and (Uworld41 < 100) and (HaveItem(352) == 0) and (random(0,99) < 50) then		-- ÈÎÎñÖÐ²¢ÇÒÃ»ÓÐÔ¿³×£¬50%»úÂÊ
		if (Uworld41 == 10) then		-- µÚÒ»´Î´òÊ±¼Ó¾çÇé¶Ô»°,¼°±äÁ¿¸³Öµ
			if (GetSex() == 0) then		-- ¶Ô»°ÄÐÅ®²»Í¬
				Talk(1,"","Anh hïng xin tha m¹ng! H«m qua b¾t TiÓu Quyªn giam trong H¾c lao nh­ng c« ta kh«ng bÞ tæn h¹i g×! §©y lµ ch×a khãa. Xin anh hïng tha cho m¹ng sèng!")
			else
				Talk(1,"","N÷ hiÖp xin tha m¹ng! H«m qua b¾t TiÓu Quyªn giam trong H¾c lao nh­ng c« ta kh«ng bÞ tæn h¹i g×! §©y lµ ch×a khãa. Xin n÷ hiÖp tha cho m¹ng sèng!")
			end
			Uworld41 = SetByte(GetTask(41),1,30)
			SetTask(41,Uworld41)
			AddNote("§¸nh b¹i ®­îc ®Çu lÜnh Yªu ®ao TriÖu ph­¬ng. LÊy ®­îc ch×a khãa ®Ó më H¾c lao cøu TiÓu Quyªn ")
		end
		AddEventItem(352)			-- »ú¹ØÔ¿³×
		Msg2Player("LÊy ®­îc ch×a khãa C¬ quan ")
	end
end;
