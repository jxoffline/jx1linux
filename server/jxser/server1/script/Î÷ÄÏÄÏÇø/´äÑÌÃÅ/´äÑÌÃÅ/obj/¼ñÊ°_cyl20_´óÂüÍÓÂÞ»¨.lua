-- ÈÎÎñÎïÆ· ´óÂüÍÓÂŞ»¨ ´äÑÌ20¼¶ÈÎÎñ
-- by£ºDan_Deng(2003-07-26)

Include("\\Script\\Global\\TimerHead.lua")

function main()
	UTask_cy = GetTask(6)
	if (GetSeries() == 2) and (GetFaction() == "cuiyan") and (UTask_cy >= 20*256+10) and (UTask_cy < 30*256) then		--´äÑÌ20¼¶ÈÎÎñÖĞ²ÅÄÜ¼ñ´ËµÀ¾ß
		i = GetTimerId()
		if (i ~= 0) and (i ~= 8) then		-- ÁíÓĞ¼ÆÊ±Æ÷ÔÚÔËĞĞÖĞ
			Talk(1,"","Ng­¬i ®ang mang nhiÖm vô cÊp b¸ch nh­ thÕ, mµ cßn ch¹y lung tung µ?")
			return
		end
		SetPropState()
		AddEventItem(1)
		Msg2Player("H¸i mét b«ng hoa §¹i Man §µ La. ")
		if (i == 0) then									-- ÉĞÎ´ÖĞ¶¾ÔòÈÃËûÖĞ¶¾
			SetTimer(3 * CTime * FramePerSec, 8)									--¼ÆÊ±Æ÷¶¨Îª°ëĞ¡Ê±£¨3¸öÊ±³½£©
			SetTask(6,20*256+20)				-- ±äÁ¿ÖÃÎªÖĞ¶¾µÚÒ»½×¶Î
--			PutMessage("Äã¸Ğµ½ÊÖÖĞÒ»ÕóÂéâÔ£¬ÒÑ¾­ÖĞ¶¾ÁË¡£")
			Msg2Player("B¹n c¶m thÊy tay bŞ tª liÖt, ®· tróng ®éc råI. ")
		end
	else
		Msg2Player("B¹n ®­a tay h¸i mét ®ãa hoa §¹i Man §µ La ")
		Msg2Player("Võa sê vµo hoa, b¹n c¶m thÊy tay m×nh bŞ tª liÖt, h×nh nh­ hoa nµy cã ®éc, b¹n liÒn rót tay l¹i. ")
	end
end;
