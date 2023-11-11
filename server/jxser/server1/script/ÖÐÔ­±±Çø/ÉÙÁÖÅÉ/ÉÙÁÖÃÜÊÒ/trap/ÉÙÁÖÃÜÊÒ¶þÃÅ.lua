--ÉÙÁÖºóÉ½ÃÜÊÒ ¶şÃÅ trap
-- by£ºDan_Deng(2003-08-04)

function main(sel)
	UTask_sl = GetTask(7)
	UTask_sl40tmp = GetTaskTemp(43)
	if (UTask_sl >= 40*256+20) and (UTask_sl < 50*256) then		-- ±ØĞëÔÚÈÎÎñÖĞ²ÅÄÜ½øÈë£¬²¢ÇÒÃ¿´Î½øÈë¶¼Òª»Ø´ğÎÊÌâ
		Say("KhÈu quyÕt më th¹ch m«n lµ: ",4,"¸n Ma Ni B¸t Mª Hång /L40_S2_wrong","Hång Bèi Mª Ma Ni ¸n /L40_S2_wrong","B¸t Mª Ni Hång ¸n Ma /L40_S2_wrong","¸n B¸t Ni Ma Mª Hång. /L40_S2_correct")
	else
		Talk(1,"","B¹n lªn ®Èy mÊy lÇn th¹ch m«n, nh­ng th¹ch m«n tr¬n tr­ît kh«ng cã mét ®iÓm tùa nµo.")
--		SetPos()		--°ÑÍæ¼ÒÒÆ³ötrapµã
	end
--	AddTermini(47)		--ÕâÊÇÊ²Ã´¶«Î÷£¿
end;

function L40_S2_correct()
	Talk(1,"","KhÈu quyÕt võa niÖm xong, th¹ch m«n tõ tõ më ra.")
--	NewWorld(74, 2040 ,3259)		-- µÈ´ıÌá¹©µØÍ¼×ø±ê
end;

function L40_S2_wrong()
	Talk(1,"","Sau khi ®äc khÈu quyÕt xong, th¹ch m«n vÉn kh«ng cã ph¶n øng g× hÕt, kh«ng biÕt cã nhí nhÇm khÈu quyÕt kh«ng?")
--	SetPos()		--°ÑÍæ¼ÒÒÆ³ötrapµã
end;
