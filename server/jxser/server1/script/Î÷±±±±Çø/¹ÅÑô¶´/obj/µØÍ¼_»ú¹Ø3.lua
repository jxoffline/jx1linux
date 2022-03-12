-- ÁúÃÅÕò-¹ÅÑô¶´-»ú¹Ø3(ÊÀ½çÈÎÎñ¡°¾ÈĞ¡¾ê¡±)
-- by£ºDan_Deng(2004-03-03)

function main(sel)
	Uworld41 = GetTask(41)
	if (GetByte(Uworld41,1) == 30) and (HaveItem(352) == 1) then		-- ÈÎÎñÖĞ£¬ÓĞ¡°»ú¹ØÔ¿³×¡±£¬ÈËÎ´¾È³ö
		if (GetBit(Uworld41,11) == 0) then				-- »ú¹Øµ±Ç°Îª¹Ø±Õ
			Say("HiÖn giê c¬ quan ®· bŞ khãa, b¹n cã muèn më nã ra kh«ng?",2,"Më ra /Turn_On","Cø tiÕp tôc ®ãng cöa /Turn_Off")
		else
			Say("HiÖn giê c¬ quan ®· më, b¹n cã muèn ®ãng nã l¹i kh«ng?",2,"TiÕp tôc më cöa /Turn_On","§ãng/Turn_Off")
		end
	end
end

function Turn_On()
--	Talk(1,"","»ú¹Ø´ò¿ªÁË¡£")
	Msg2Player("C¬ quan ®· më ra")
	Cur_Switchs = SetBit(GetTask(41),11,1)
	SetTask(41,Cur_Switchs)
	Check_Switch()
end

function Turn_Off()
--	Talk(1,"","»ú¹Ø¹Ø±ÕÁË¡£")
	Msg2Player("C¬ quan ®· khãa l¹i")
	Cur_Switchs = SetBit(GetTask(41),11,0)
	SetTask(41,Cur_Switchs)
	Check_Switch()
end

function Check_Switch()
	Cur_Switchs = GetByte(GetTask(41),2)
	Set_Switchs = GetByte(GetTask(41),3)
	if (Cur_Switchs == Set_Switchs) then			-- ÄÜ¹»Ò»ÖÂ£¬¾È³öĞ¡¾ê
		Uworld41 = SetByte(GetTask(41),1,100)
		SetTask(41,Uworld41)
		DelItem(352)						-- ³É¹¦ºóÔòÉ¾³ıÔ¿³×
		Talk(1,"","Më ®­îc c¬ quan! Cøu thµnh c«ng TiÓu Quyªn")
		Msg2Player("B¹n më ®­îc c¬ quan, cøu thµnh c«ng TiÓu Quyªn ")
	else
		Msg2Player("Nh­ng khi b¹n trë l¹i H¾c lao ®Èy c¸nh cöa th× nã vÉn kh«ng hÒ ®éng ®Ëy ")
	end
end
