Include("\\script\\missions\\tongwar\\match\\head.lua")


function main()
	--Èç¹û´¦ÓÚ±¨Ãû½×¶ÎÊ±,Íæ¼Ò²»ÄÜ×ßµ½¶Ô·½µÄÁìµØÖÐÈ¥£¬ËùÒÔ»á½«Íæ¼ÒÈÓµ½´óÓªÄÚ
		if(GetCurCamp() == 2) then
			if (tongwar_check_outmatch()) then
				return
			end
			if( GetFightState() == 1) then
				SetPos(GetMissionV(MS_HOMEIN_X2), GetMissionV(MS_HOMEIN_Y2))
				tongwar_setdata(TONGWAR_RLTASK_LASTDTIME, GetGameTime())
				SetFightState(0)
			else

					file = GetMissionS(2)
					x,y = bt_getadata(file)
					SetPos(floor(x/32), floor(y/32))
					bt_RankEffect(tongwar_getdata(TONGWAR_RLTASK_CURRANK))
					SetFightState(1)
					SetPKFlag(1)
			end;
		elseif (GetCurCamp() == 1) then
				file = GetMissionS(2)
				x,y = bt_getadata(file)
				SetPos(floor(x/32), floor(y/32))
			Msg2Player("PhÝa tr­íc s¬n cèc chËp trïng, ch¾c ch¾n cã phôc binh! B¹n kh«ng nªn tù tiÖn x«ng lªn!")
		end;
end;


