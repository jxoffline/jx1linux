--  Î÷±±ÄÏÇø\½£¸óÎ÷±±\npc\Õ½¶·_uworld127_´óµñ
--  ÌìÈÌ90¼¶ÈÎÎñ´óµñ
--  by xiaoyang(2004\4\12)


function OnDeath()
	Uworld127 = GetTask(127)
	if ((Uworld127 == 20) or (Uworld127 ==30)) and (HaveItem(369) == 0) and (random(0,99) < 66) then
		AddEventItem(369)
		Msg2Player("B¹n ®· b¾t ®­îc tÊm phï ®iªu thÇn ngµn n¨m ")
		AddNote("B¾t ®­îc tÊm linh ®iªu cã thÓ quay vÒ phñ c«ng chóa phôc mÖnh. ")
		SetTask(127,30)
	end
end
