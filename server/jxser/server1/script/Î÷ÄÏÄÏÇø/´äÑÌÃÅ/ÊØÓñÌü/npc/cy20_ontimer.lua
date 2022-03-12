--´äÑÌÃÅ20¼¶ÈÎÎñ ´óÂüÍÓÂŞ»¨¼ÆÊ±½Å±¾
-- Update: Dan_Deng(2003-09-09)
-- Timer: 8

Include("\\Script\\Global\\TimerHead.lua")

function OnTimer()
	UTask_cy = GetTask(6)
	StopTimer()
	if (UTask_cy == 20*256+20) then		-- ÖĞ¶¾µÚÒ»½×¶Îµ½Ê±
		PutMessage("B¹n c¶m thÊy ®Çu ãc quay cuång, nh­ vËy xem ra ®éc tİnh ®· béc ph¸t råi ®ã. ")
		Msg2Player("B¹n c¶m thÊy ®Çu ãc quay cuång, nh­ vËy xem ra ®éc tİnh ®· béc ph¸t råi ®ã. ")
		SetTask(6, 20*256+30)
		SetTimer(3 * CTime * FramePerSec, 8)						--¼ÆÊ±Æ÷¶¨Îª°ëĞ¡Ê±£¨3¸öÊ±³½£©
	elseif (UTask_cy == 20*256+30) then		-- ÖĞ¶¾µÚ¶ş½×¶Îµ½Ê±
		PutMessage("B¹n c¶m thÊy tø chi r· rêi, cã lÏ ®éc tİnh ®· ngÊm s©u vµo. ")
		Msg2Player("B¹n c¶m thÊy tø chi r· rêi, cã lÏ ®éc tİnh ®· ngÊm s©u vµo. ")
		SetTask(6, 20*256+40)
		SetTimer(3 * CTime * FramePerSec, 8)						--¼ÆÊ±Æ÷¶¨Îª°ëĞ¡Ê±£¨3¸öÊ±³½£©
	elseif (UTask_cy == 20*256+40) then		-- ÖĞ¶¾µÚÈı½×¶Îµ½Ê±
		PutMessage("Toµn th©n b¾t ®Çu bÊt ®éng, tay ch©n kh«ng cßn ph¶n øng. ")
		Msg2Player("Toµn th©n b¾t ®Çu bÊt ®éng, tay ch©n kh«ng cßn ph¶n øng. ")
		SetTask(6, 20*256+50)
		SetTimer(3 * CTime * FramePerSec, 8)						--¼ÆÊ±Æ÷¶¨Îª°ëĞ¡Ê±£¨3¸öÊ±³½£©
	else							-- µÚËÄ½×¶Î³¬Ê±£¡¶¾·¢ÉíÍö£¡£¡
		SetTask(6, 20*256+10)
		for i=1,GetItemCount(1) do DelItem(1) end
		PutMessage("ChÊt ®éc Hoa §¹i Man §µ La ®· ph¸t t¸n, b¹n ®· chÕt v× ®éc ph¸t ")
		Msg2Player("ChÊt ®éc Hoa §¹i Man §µ La ®· ph¸t t¸n, b¹n ®· chÕt v× ®éc ph¸t ")
		SetFightState(1)
		KillPlayer()
	end
end;
