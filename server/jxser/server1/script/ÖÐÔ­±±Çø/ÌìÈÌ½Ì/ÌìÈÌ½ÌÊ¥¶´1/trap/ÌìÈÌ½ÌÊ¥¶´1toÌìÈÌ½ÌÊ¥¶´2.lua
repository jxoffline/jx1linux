--description: ÖĞÔ­±±Çø ÌìÈÌ½ÌÊ¥¶´1toÌìÈÌ½ÌÊ¥¶´2 ÌìÈÌ½Ì³öÊ¦ÈÎÎñ
--author: yuanlan	
--date: 2003/5/20
--Trap ID£ºÖĞÔ­±±Çø 7
-- Update: Dan_Deng(2003-08-14)

function main(sel)
	UTask_tr = GetTask(4)
	UTask_tr60tmp = GetTask(28)
	if (UTask_tr60tmp == 15) then		-- bin: 1000 + 0100 + 0010 + 0001
		SetFightState(1)
		NewWorld(52, 1729, 3225)
		SetTask(4, 60*256+70)
		SetTask(28,0)	-- ½«×Ó±äÁ¿¸´Î»ÊÍ·Å
--		AddNote("µÃµ½ËÄ¾ä¿Ú¾÷£¬½øÈëÊ¥¶´µÚ¶ş²ã¡£")
	elseif (UTask_tr >= 60*256+70) and (GetFaction() == "tianren") then
		SetFightState(1)
		NewWorld(52, 1729, 3225)
	else
		Talk(1,"","Ch­a lÊy ®­îc <color=Red>bèn c©u khÈu quyÕt<color>, kh«ng thÓ vµo tÇng hai cña Th¸nh §éng.")
		SetPos(1767, 3186)						--ÉèÖÃ×ß³öTrapµã
		AddNote("Muèn vµo tÇng hai, ph¶i lÊy ®­îc bèn c©u khÈu quyÕt. ")
	end	
end;
