-- µØÍ¼ÎïÆ· ÉÙÁÖËÂºóËÉÁÖ Ê¯Í·1 ÉÙÁÖ50¼¶ÈÎÎñ
-- by£ºDan_Deng(2003-08-04)

function main()
	UTask_sl = GetTask(7)
	if (UTask_sl == 50*256+30) and (HaveItem(28) == 0) then		--ÉÙÁÖ50¼¶ÈÎÎñÖĞ
		i = GetTaskTemp(47)
		if (i == 2) then
			Talk(1,"","T¶ng ®¸ dÇn ®­îc xª dŞch, b¹n h×nh thÊy phİa d­íi h×nh nh­ cã 1 quyÓn s¸ch")
			AddEventItem(28)
			AddNote("LÊy ®­îc DŞch C©n Kinh. ")
			Msg2Player("LÊy ®­îc DŞch C©n Kinh. ")
			SetTaskTemp(47,0)			--¸´Î»ÁÙÊ±±äÁ¿£¬ÍòÒ»ÔÙÀ´´ò...
		elseif (i == 1) then
			Talk(1,"","B¹n thö dïng søc ®Èy t¶ng ®¸, h×h nh­ nã cã chót lay chuyÓn")
			SetTaskTemp(47,2)
		else
			Talk(1,"","B¹n thö dïng søc ®Èy t¶ng ®¸, nh­ng nã cø n»m tr¬ tr¬ ")
			SetTaskTemp(47,1)
		end
	else
		Talk(1,"","B¹n thö dïng søc ®Èy t¶ng ®¸, nh­ng nã cø n»m tr¬ tr¬ ")
	end
end;
