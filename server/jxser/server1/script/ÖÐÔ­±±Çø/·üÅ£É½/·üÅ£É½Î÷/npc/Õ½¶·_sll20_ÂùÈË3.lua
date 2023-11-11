-- ½£¸óÊñµÀ Õ½¶·NPC ÂùÈË3 ÉÙÁÖ20¼¶ÈÎÎñ
-- by£ºDan_Deng(2003-08-01)
--´òÂùÈËµÄ¹ı³ÌÖĞ²»¿ÉÍË³ö£¬·ñÔòÒªÖØĞÂ´ò¹ı¡£

function OnDeath()
	UTask_sl = GetTask(7);
	if (UTask_sl >= 20*256+64) and (UTask_sl < 20*256+128) and (GetBit(UTask_sl,3) == 0) then			-- ÈÎÎñÖĞÇÒÕâÒ»Ö»Î´´ò¹ı
		UTask_sl = SetBit(UTask_sl,3,1)
		if (UTask_sl == 20*256+64+31) then		--Èç¹û¹»(bin(10000 + 01000 + 00100 + 00010 + 00001))
			SetTask(7,20*256+128)
			AddNote("N¨m g· ngç ng­îc bŞ b¹n gi¸o huÊn ®· t©m phôc khÈu phôc, høa tõ nay tu t©m söa tİnh, kh«ng d¸m léng hµnh n÷a. ")
			Msg2Player("N¨m g· ngç ng­îc bŞ b¹n gi¸o huÊn ®· t©m phôc khÈu phôc, høa tõ nay tu t©m söa tİnh, kh«ng d¸m léng hµnh n÷a. ")
		else
			Msg2Player("B¹n ®¸nh b¹i mét g· ngç ng­îc. ")
			SetTask(7,UTask_sl)
		end
	end
end;
