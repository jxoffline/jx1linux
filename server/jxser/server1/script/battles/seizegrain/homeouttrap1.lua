--ËÎ·½ºóÓªÍâTrapµã´¥·¢µÄ½Å±¾
IncludeLib("BATTLE");
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\seizegrain\\head.lua")

function main()
	--Èç¹û´¦ÓÚ±¨Ãû½×¶ÎÊ±,Íæ¼Ò²»ÄÜ×ßµ½¶Ô·½µÄÁìµØÖÐÈ¥£¬ËùÒÔ»á½«Íæ¼ÒÈÓµ½´óÓªÄÚ
	if(GetCurCamp() == 1) then
		if (BT_GetData(PL_PARAM3) > 0) then
			Msg2Player("B¹n ®ang vËn chuyÓn Bao l­¬ng, kh«ng thÓ quay vÒ HËu doanh?")
			file = GetMissionS(1)
			x,y = bt_getadata(file)
			SetPos(floor(x/32), floor(y/32))
		else
			SetPos(GetMissionV(MS_HOMEIN_X1), GetMissionV(MS_HOMEIN_Y1))
			SetFightState(0)
			BT_SetData( PL_LASTDEATHTIME, GetGameTime() )
		end
	elseif (GetCurCamp() == 2) then
		Msg2Player("PhÝa tr­íc s¬n cèc chËp trïng, ch¾c ch¾n cã phôc binh! B¹n kh«ng nªn tù tiÖn x«ng lªn!")
		SetFightState(1)
	end;
end;


