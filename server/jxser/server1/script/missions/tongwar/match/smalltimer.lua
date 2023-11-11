Include("\\script\\missions\\tongwar\\match\\head.lua")

function OnTimer()
	t = GetMissionV(MS_TIMER1) + 1;--¼ÆÊıÆ÷£¬Í³¼Æµ±Ç°¶¨Ê±Æ÷´¥·¢ÁË¶àÉÙ´ÎÁË
	SetMissionV(MS_TIMER1, t)
	

	if (t == RUNGAME_TIME) then --Èç¹ûµ½ÁËÕıÊ½¿ªÕ½Ê±¿Ì£¬ÔòÍ£Ö¹±¨Ãû£¬ÕıÊ½½øÈëÕ½¶·½×¶Î
		RunMission(MISSIONID)
		AddGlobalNews("'Vâ L©m §Ö NhÊt Bang'"..GetMissionS(MS_S_CITYNAME_S).." vµ"..GetMissionS(MS_S_CITYNAME_J).." - trËn chiÕn b¾t ®Çu.");
		WriteLog("tongwar is entering fight state.")
	end

	if (t < RUNGAME_TIME and mod(t, 18) == 0) then
		RestTime = (RUNGAME_TIME - t) * TIMER_1 / FRAME2TIME
		RestMin, RestSec = GetMinAndSec(RestTime);
		if (RestSec == 0) then
			str2 = "C¸ch thêi gian khai chiÕn chØ cßn:"..RestMin.."phót"
		else
			str2 = "C¸ch thêi gian khai chiÕn chØ cßn:"..RestMin.."phót"..RestSec.." gi©y"
		end
		Msg2MSAll(MISSIONID,str2);		--Í¨Öª³¡ÄÚÍæ¼Ò¿ªÕ½Ê£ÓàÊ±¼ä
	end
	
	if (t > RUNGAME_TIME) then
		if (t >= RUNGAME_TIME + 15) then
			--Èç¹û³¡ÉÏÄ³Ò»ÕóÓªÈËÊıµÍÓÚ×îĞ¡ÊıÁ¿£¬Ôò±ÈÈü½áÊø£¬ÈË¶àµÄÕóÓªÖ±½Ó»ñÊ¤
			local group1count = GetMSPlayerCount(MISSIONID, 1)
			local group2count = GetMSPlayerCount(MISSIONID, 2)
			if (group1count < MIN_MEMBERCOUNT or group2count < MIN_MEMBERCOUNT) then
				if ( group1count < MIN_MEMBERCOUNT and group2count < MIN_MEMBERCOUNT) then
					SetMissionV(MS_MOSTDEATH, 0)
				elseif(group1count < MIN_MEMBERCOUNT) then
					SetMissionV(MS_MOSTDEATH, 2)
				elseif(group2count < MIN_MEMBERCOUNT) then
					SetMissionV(MS_MOSTDEATH, 1)
				end
				CloseMission(MISSIONID)
				return
			end
		end

		--Ã¿Ò»·ÖÖÓÍ¨¸æµ±Ç°Ë«·½»ı·Ö£¬ºÍnpc
		if (mod(t, 3) == 0 ) then
			msstr = "C«ng bè: HiÖn t¹i, tæng ®iÓm liªn minh"..GetMissionS(MS_S_CITYNAME_S).." vµ liªn minh"..GetMissionS(MS_S_CITYNAME_J).." lµ <color=yellow>"..GetMissionV(MS_TOTALPOINT_S)..":"..GetMissionV(MS_TOTALPOINT_J);
			Msg2MSAll(MISSIONID, msstr)
		end
		if (mod(t, 30) == 0) then
			RestTime = floor(GetMSRestTime(MISSIONID, 62) / 18)
			RestMin, RestSec = GetMinAndSec(RestTime);
			if (RestSec == 0) then
				str2 = "Thêi gian thi ®Êu cßn l¹i:"..RestMin.."phót"
			else
				str2 = "Thêi gian thi ®Êu cßn l¹i:"..RestMin.."phót"..RestSec.." gi©y"
			end
			Msg2MSAll(MISSIONID,"<color=blue>"..str2.."<color>");		--Í¨Öª³¡ÄÚÍæ¼Ò¿ªÕ½Ê£ÓàÊ±¼ä
		end
		but_pop2home( 1 )
		but_pop2home( 2 )
	end

end



