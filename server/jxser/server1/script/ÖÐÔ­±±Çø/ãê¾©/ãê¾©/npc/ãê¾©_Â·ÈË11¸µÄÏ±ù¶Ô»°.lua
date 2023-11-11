-------------------------------------------------------------------------
-- FileName		:	ãê¾©_Â·ÈË11¸µÄÏ±ù¶Ô»°.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-28 15:22:45
-- Desc			:	ÖÐÔ­±±Çø ãê¾©¸® Â·ÈË11¸µÄÏ±ù¶Ô»°
-------------------------------------------------------------------------

Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\master\\zhongli\\zhonglitasknpc.lua")

function main(sel)
	Uworld75 = nt_getTask(75)
	U75_sub4 = nt_getTask(55)
	Uworld1002 = nt_getTask(1002)
	if ( Uworld1002 ~= 0 ) then
		funanbing()
	elseif (Uworld75 == 10) and (U75_sub4 < 10) then		-- ÈÎÎñÖÐ£¬½ÓÈ¡×ÓÈÎÎñ
		if (HaveItem(384) == 1) then
			nt_setTask(55,10)
			AddNote("NhiÖm vô QuyÒn khuynh thiªn h¹: ®Õn D­¬ng Ch©u mua Kim L¨ng Xu©n cho Phã Nam B¨ng.")
			Msg2Player("NhiÖm vô QuyÒn khuynh thiªn h¹: ®Õn D­¬ng Ch©u mua Kim L¨ng Xu©n cho Phã Nam B¨ng.")
			Talk(1,""," Thêi buæi nµy cßn häc vâ c«ng ®Ó lµm g×? Çy! Muèn häc còng ®­îc!§i D­¬ng ch©u mua gióp ta Kim L¨ng Xu©n nhÐ.")
		else
		 	Talk(1,""," Ngay c¶ mét phong th­ còng kh«ng cã, chØ nãi miÖng kh«ng th× lµm sao ta cã thÓ tin ng­¬i ®­îc?")
		end
	elseif (Uworld75 == 10) and (U75_sub4 == 10) then		-- ×ÓÈÎÎñÍê³ÉÅÐ¶Ï
		if (HaveItem(77) == 1) then
			DelItem(77)
			nt_setTask(55,20)
			AddNote("NhiÖm vô QuyÒn khuynh thiªn h¹: hoµn thµnh viÖc mua r­îu")
			Msg2Player("NhiÖm vô QuyÒn khuynh thiªn h¹: hoµn thµnh viÖc mua r­îu")
			Talk(1,"","Hµ! R­îu 'Kim L¨ng Xu©n' nµy ngon tuyÖt! §­îc! Ta ®ång ý! ")
		else
			Talk(1,"","Kim L¨ng Xu©n vÉn cßn ch­a mua vÒ sao?")
		end
	else
		Talk(1,"","H«m nay cã r­îu ta uèng cho say, ch¼ng cÇn biÕt ai lµm thiªn tö ai lµm qu©n thÇn ")
	end
end;
