--Î÷ÄÏ±±Çø ³É¶¼¸® Â·ÈË23ÂäÆÇ×ÓµÜµÄ¶Ô»° ÊÀ½çÈÎÎñ
--author: yuanlan	
--date: 2003/3/19


function main(sel)

i = random(0,4)									--´¥·¢ÂòÂôµÄ»úÂÊÊÇ20%

if (i == 0) then  -- ÔİÊ±¹Ø±Õ
-- Say("ÂäÆÇ×ÓµÜ£ºàË£¬À´³ò³òÎÒµÄ±¦±´£¬ÎÒÒ»¿´¾ÍÖªµÀÄãÊÇ¸öÊ¶»õµÄÈË£¬ÇÆÇÆ£¬Õâ¿ÉÊÇÎÒµÄ´«¼ÒÖ®±¦°¡£¬Òª²»ÊÇÊÖÍ·ÊµÔÚ½ôµÃºÜ£¬ÎÒ»¹Éá²»µÃÂôÄØ£¡", 2, "Âò/accept", "²»Âò/refuse")
Say("Võa nh×n th× biÕt ngay lµ ng­êi tinh m¾t! Nµo! Nµo! Chän mét thø ®i!", 0)
return
end;

if (i == 1) or (i == 2) then  
Say("Xem c¸i g× mµ xem! §õng t­ëng ta kh«ng biÕt, ng­¬i cã ı ®Şnh lÊy b¶o bèi cña ta µ?", 0)
return
end;

if (i == 3) or (i == 4) then  
Say("§õng thÊy ta ¨n mÆc r¸ch r­íi nh­ thÕ nµy...nãi cho ng­¬i biÕt ta lµ danh m«n chi hËu, nhí n¨m ®ã… ", 0)
return
end;

end;


function accept()

if (GetCash() >= 5000) then					--²Î¿¼Öµ
	j = random(0, 9)					--¾ßÌåÀà±ğ
	k = random(2, 8)					--µÈ¼¶£¬¿ØÖÆËæ»úÉú³ÉµÀ¾ßÎïÆ·µÄ¼Û¸ñ·¶Î§Îª500ÖÁ50000
	m = random(0, 4)					--Ïµ±ğ
	if (j == 0) then 					--closeweapon
		n = random(0, 5)				--ÏêÏ¸Àà±ğ
		AddItem(0, 0, n, k, m, 1)						
		Pay(5000)
	end
	if (j == 1) then 					--rangeweapon
		n = random(0, 2)				--ÏêÏ¸Àà±ğ
		AddItem(0, 1, n, k, m, 1)						
		Pay(5000)
	end
	if (j == 2) then 					--armor
		n = random(0, 9)				--ÏêÏ¸Àà±ğ
		AddItem(0, 2, n, k, m, 1)						
		Pay(5000)
	end
	if (j == 3) then 					--ring
		AddItem(0, 3, 0, k, m, 1)						
		Pay(5000)
	end
	if (j == 4) then 					--amulet
		n = random(0, 1)				--ÏêÏ¸Àà±ğ
		AddItem(0, 4, n, k, m, 1)						
		Pay(5000)
	end
	if (j == 5) then 					--boots
		n = random(0, 3)				--ÏêÏ¸Àà±ğ
		AddItem(0, 5, n, k, m, 1)						
		Pay(5000)
	end
	if (j == 6) then 					--belt
		n = random(0, 1)				--ÏêÏ¸Àà±ğ
		AddItem(0, 6, n, k, m, 1)						
		Pay(5000)
	end
	if (j == 7) then 					--helm
		n = random(0, 8)				--ÏêÏ¸Àà±ğ
		AddItem(0, 7, n, k, m, 1)						
		Pay(5000)
	end
	if (j == 8) then 					--cuff
		n = random(0, 1)				--ÏêÏ¸Àà±ğ
		AddItem(0, 8, n, k, m, 1)						
		Pay(5000)
	end
	if (j == 9) then 					--pendant
		n = random(0, 1)				--ÏêÏ¸Àà±ğ
		AddItem(0, 9, n, k, m, 1)						
		Pay(5000)
	end
else
	Say("Th× ra chØ lµ mét kÎ nghÌo m¹c", 0)
end;

end;


function refuse()
Say("Hãa ra còng chØ lµ mét kÎ l­êng g¹t.", 0);
end;
