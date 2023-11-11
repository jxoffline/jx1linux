-- Ñãµ´É½Ñò½Ç¶´ÃÔ¹¬ Õ½¶·NPC 1´úµÜ×Ó£¨Îå¶¾³öÊ¦ÈÎÎñ£©
-- by£ºDan_Deng(2003-08-05)

function OnDeath()
	UTask_wu = GetTask(10)
	if ((UTask_wu == 60*256+10) and (HaveItem(222) == 0)) then		-- ÔÚÈÎÎñÖÐ£¬ÉÐÎ´µÃµ½ÈÎÎñÎïÆ·
		i = GetTaskTemp(48) + random(0,2)			-- ¼ÆÊýÆ÷Ëæ»ú¼Ó0µ½2£¬¼Óµ½5¼´¿É´ò´óBOSS
		if (i >= 5) then
			SetTask(10,60*256+20)
			SetTaskTemp(48,0)
			AddNote("Ch­ëng m«n cña Nh¹n §·ng ph¸i ®· xuÊt hiÖn ")
			Msg2Player("Sau khi ng­¬i giÕt v« sè tªn, ch­ëng m«n Nh¹n §·ng ph¸i cuèi cïng ®· xuÊt hiÖn ")
		else
			SetTaskTemp(48,i)
			Msg2Player("B¹n giÕt ®­îc mét tªn ®Ö tö cña Nh¹n §·ng ph¸i ")
		end
	end
end;
