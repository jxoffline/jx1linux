--description: ÌÆÃÅ50¼¶ÈÎÎñ Çà³ÇÉ½ÏìË®¶´¹ÖÎï
--author: yuanlan	
--date: 2003/3/12
-- Update: Dan_Deng(2003-08-13)
-- Õâ¸öÈÎÎñÒÑ¾­¹»¸´ÔÓÁË£¬Ïë°ÑËüÈ¡Ïû£¬·Åµ½ÆäËüÈÎÎñÖĞÈ¥ÓÃ¡£

function OnDeath()
	UTask_tm = GetTask(2);
	if ((UTask_tm == 50*256+80) and (HaveItem(48) == 0)) then
		Msg2Player("LÊy ®­îc ¸m khİ phæ gi¶ m¹o, hãa ra chØ lµ mét quyÓn s¸ch kh«ng cã ch÷ ")
	end
end;
