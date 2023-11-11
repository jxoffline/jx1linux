-- ÉÙÁÖÄ¾ÈËÏï Õ½¶·NPC £¿£¿ £¨ÉÙÁÖ10¼¶ÈÎÎñ¡¢È­ÇãÌìÏÂÈÎÎñ£©
-- by£ºDan_Deng(2003-08-01)

function OnDeath()
	UTask_sl = GetTask(7);
	if (UTask_sl == 10*256+10) and (HaveItem(26) == 0) and (random(0,99) < 80) then
		AddEventItem(26) 
		Msg2Player("LÊy ®­¬c Kim Liªn Hoa. ")
		AddNote("T×m thÊy Kim Liªn Hoa. ")
	elseif (GetTask(75) == 10) and (GetTask(54) == 10) and (HaveItem(26) == 0) and (random(0,99) < 40) then		-- È­ÇãÌìÏÂÈÎÎñ£¬°´»úÂÊµÃµ½
		AddEventItem(26)
		Msg2Player("LÊy ®­¬c Kim Liªn Hoa, cã thÓ quay l¹i gÆp Th¸i ®¹i thóc. ")
	end
end;
