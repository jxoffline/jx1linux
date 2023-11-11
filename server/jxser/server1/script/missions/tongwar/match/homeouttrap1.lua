Include("\\script\\missions\\tongwar\\match\\head.lua")

function main()
	--Èç¹û´¦ÓÚ±¨Ãû½×¶ÎÊ±,Íæ¼Ò²»ÄÜ×ßµ½¶Ô·½µÄÁìµØÖĞÈ¥£¬ËùÒÔ»á½«Íæ¼ÒÈÓµ½´óÓªÄÚ
		if(GetCurCamp() == 1) then
			SetPos(GetMissionV(MS_HOMEIN_X1), GetMissionV(MS_HOMEIN_Y1))
			SetFightState(0)
			tongwar_setdata( TONGWAR_RLTASK_LASTDTIME, GetGameTime() )
		elseif (GetCurCamp() == 2) then
			Msg2Player("Phİa tr­íc s¬n cèc chËp trïng, ch¾c ch¾n cã phôc binh! B¹n kh«ng nªn tù tiÖn x«ng lªn!")
			SetFightState(1)
		end;
end;


