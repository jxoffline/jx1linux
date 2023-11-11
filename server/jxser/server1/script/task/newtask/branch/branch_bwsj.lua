Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\battles\\battlehead.lua")
IncludeLib("SETTING")
function branchTask_BW1()		--±ÈÎä³¡µÄ±¨Ãûµã£¬±¨Ãû³É¹¦Ê±µ÷ÓÃ
	if (nt_getTask(1011) == 10 and nt_getTask(1052) == 20) then		--°ÁÔÆ×ÚÈÃÄãÈ¥ÑİÎä³¡´òÒ»³¡±ÈÈü
		nt_setTask(1011, 20)		
		return
	end
	
	if (nt_getTask(1012) == 10 and nt_getTask(1056) == 20) then		--ÁøÄÏÔÆÈÃÄãÈ¥ÑİÎä³¡´òÒ»³¡±ÈÈü
		nt_setTask(1012, 20)
		return
	end
	
	if (nt_getTask(1013) == 10 and nt_getTask(1060) == 40) then		--ÓëÁõÔÌ¹Å¶Ô»°£¬Äã¾ö¶¨Ç××ÔÈ¥ÑİÎä³¡²Î¼ÓÒ»³¡pk±ÈÈü¡£
		nt_setTask(1013, 20)
		return
	end
end


function branchTask_GainBW1()		--±ÈÎä³¡£¬µ±Íæ¼ÒÓ®µÄ±ÈÈüÊ±µ÷ÓÃ
	if (nt_getTask(1011) == 10 and nt_getTask(1052) == 60) then	--»ì»ìÈÃÄã½øÈë±ÈÎä³¡´òÓ®Ò»³¡±ÈÈü
		nt_setTask(1011, 20)
		Msg2Player("B¹n th¾ng trËn tû vâ, cã thÓ quay vÒ t×m Hçn Hçn phôc mÖnh.")
		return
	end
	
	if (nt_getTask(1012) == 10 and nt_getTask(1056) == 40) then			--ÁøÄÏÔÆÈÃÄãÈ¥ÑİÎä³¡´òÊ¤Ò»³¡±ÈÈü
		nt_setTask(1012, 20)
		Msg2Player("B¹n th¾ng trËn tû vâ, cã thÓ quay vÒ t×m LiÔu Nam V©n phôc mÖnh.")
		return
	end
	
	if (nt_getTask(1013) == 10 and nt_getTask(1060) == 80) then	--ÍØ°Ï»³´¨ÈÃÄãÈ¥ÑİÎä³¡Õ½Ê¤Ò»³¡£¬Îª´ó½ğ¹úÕù¿ÚÆø¡£
		nt_setTask(1013, 20)
		Msg2Player("B¹n th¾ng trËn tû vâ, cã thÓ quay vÒ t×m Th¸c B¹t Hoµi Xuyªn phôc mÖnh.")
		return
	end
end

function branchTask_JoinSJend1()
	if (nt_getTask(1053) == 20 and nt_getTask(1011) == 10 and BT_GetData(PL_TOTALPOINT) >= 200 ) then--»ì»ìÈÃÄãÈ¥ËÎ½ğÕ½³¡²Î¼ÓÁ½¹ú¼äµÄ´óÕ½£¬²¢»ñµÃ¶ş°Ù¸ö»ı·Ö
		nt_setTask(1011, 20)
		Msg2Player("B¹n ®· ®¹t ®­îc 200 ®iÓm th­ëng, quay vÒ gÆp Hçn Hçn hoµn thµnh nhiÖm vô.")
		return
	end
	
	if (nt_getTask(1057) == 20 and nt_getTask(1012) == 10 and BT_GetData(PL_TOTALPOINT) >= 200) then--ÁøÄÏÔÆÈÃÄãÈ¥²Î¼ÓËÎ½ğ´óÕ½£¬ÄÃ200¸ö»ı·Ö»ØÀ´
		nt_setTask(1012, 20)
		Msg2Player("B¹n ®· ®¹t ®­îc 200 ®iÓm th­ëng, quay vÒ gÆp LiÔu Nam V©n hoµn thµnh nhiÖm vô ")
		return
	end
	
	if (nt_getTask(1061) == 20 and nt_getTask(1013) == 10 and BT_GetData(PL_TOTALPOINT) >= 200) then--ÍØ°Ï»³´¨ÈÃÄãÈ¥²ÎÓëËÎ½ğ´óÕ½£¬»ñÈ¡¶ş°Ù¸ö»ı·Ö¡£	
		nt_setTask(1013, 20)
		Msg2Player("B¹n ®· ®¹t ®­îc 200 ®iÓm tİch ph©n, cã thÓ quay vÒ t×m Th¸c B¹t Hoµi Xuyªn phôc mÖnh!")
		return
	end

end