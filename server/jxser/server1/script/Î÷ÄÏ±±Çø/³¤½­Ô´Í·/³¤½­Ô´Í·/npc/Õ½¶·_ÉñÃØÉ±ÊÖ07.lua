function OnDeath ()
	Uworld128 = GetTask(128)
	Uworld134 = GetTask(134)
	if (Uworld128 == 30) then
		Uworld134 = SetBit(Uworld134,7,1)
		if (Uworld134 == 1023) then
			SetTask(128,40)
			Msg2Player("B¹n tho¸t ra khái ®¸m S¸t Thñ ThÇn bİ vµ cã thÓ ®i gi¶i cøu Giíi V« Tµ ")
			AddNote("B¹n tho¸t ra khái ®¸m S¸t Thñ ThÇn bİ vµ cã thÓ ®i gi¶i cøu Giíi V« Tµ ")
		elseif (Uworld134 ~= GetTask(134)) then
			SetTask(134,Uworld134)
			Msg2Player("B¹n giÕt ®­îc 1 tªn ThÇn Bİ S¸t thñ ")
		else
			-- ÖØ¸´É±ËÀÍ¬Ò»Ö»NPC£¬²»¸øÌáÊ¾
		end
	end
end