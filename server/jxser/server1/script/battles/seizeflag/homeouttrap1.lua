--ËÎ·½ºóÓªÍâTrapµã´¥·¢µÄ½Å±¾
IncludeLib("BATTLE");
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\seizeflag\\head.lua")

function main()
	--Èç¹û´¦ÓÚ±¨Ãû½×¶ÎÊ±,Íæ¼Ò²»ÄÜ×ßµ½¶Ô·½µÄÁìµØÖĞÈ¥£¬ËùÒÔ»á½«Íæ¼ÒÈÓµ½´óÓªÄÚ
		if(GetCurCamp() == 1) then
				if (BT_GetData(PL_PARAM1) > 0 and BT_GetData(PL_PARAM2) > 0) then
					Msg2Player("B¹n hiÖn ®ang gi÷ cê, kh«ng thÓ ®i vµo hËu doanh!")--??Ã»ÓĞÕâÏîĞÅÏ¢
				else
					SetPos(GetMissionV(MS_HOMEIN_X1), GetMissionV(MS_HOMEIN_Y1))
					SetFightState(0)
					BT_SetData( PL_LASTDEATHTIME, GetGameTime() )
				end
		elseif (GetCurCamp() == 2) then
			Msg2Player("Phİa tr­íc s¬n cèc chËp trïng, ch¾c ch¾n cã phôc binh! B¹n kh«ng nªn tù tiÖn x«ng lªn!")
			SetFightState(1)
		end;
end;


