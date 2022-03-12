--³ÇÊĞÌú½³¹«¹²Èë¿Ú
--by ÁÎÖ¾É½

if (not __H_CHAT_CITY_SMITH__) then
	__H_CHAT_CITY_SMITH__ = 1;


function main(sel)
	local tab_Content = {
		"Ta muèn mua vµi mãn binh khİ/tj_default_chat",		--Ô­Ìú½³¹¦ÄÜÈë¿Ú
		"Nh©n tiÖn ghĞ qua th«i/oncancel",
	};
	
	-- Èç¹û»î¶¯Ê±¼ä,²åÈë»î¶¯¶Ô»°,ÒÔÏÂ¾ÙÀı
--	if (isEventDay() ==1) then
--		tinsert(tab_Content,1, "²Î¼Ó»î¶¯/onEventMain");
--	end;
	
	if (getn(tab_Content) > 2) then		--Èç¹ûÓĞ»î¶¯²åÈë¶Ô»°

		Say("Thî rÌn: Kh¸ch quan t×m ta cã viÖc g×?", getn(tab_Content), tab_Content);

	else					--Ã»ÓĞ»î¶¯Ö±½Ó½øÈëÔ­¶Ô»°

		tj_default_chat();

	end;
end;

function oncancel()
end;

end; --// end of __H_CHAT_CITY_SMITH__;