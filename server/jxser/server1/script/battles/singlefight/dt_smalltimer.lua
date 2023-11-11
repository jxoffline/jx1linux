Include("\\script\\battles\\singlefight\\dt_head.lua")
Include("\\script\\battles\\battlehead.lua")

function OnTimer()
	t = GetMissionV(MS_TIME1_ACC) + 1
	SetMissionV(MS_TIME1_ACC , t)

	if (t == EXPRETIME) then  --Èç¹ûµ½ÁË½áÊøÇ°10ÃëÖÓÔòÌáÊ¾½«ÒªÍË³ö
		Msg2MSAll(GetMissionV(MS_DTMISSION), "<#> Khu vùc §¬n ®Êu sau 10 gi©y n÷a sÏ kÕt thóc!")
	else
		RestTime = (TIMER_2 - t * TIMER_1)/FRAME2TIME
		RestMin, RestSec = GetMinAndSec(RestTime)
		if (RestSec == 0) then
			str = "<#> Thêi gian ®¬n ®Êu cßn l¹i:"..RestMin.."phót"
		else
			str = "<#> Thêi gian ®¬n ®Êu cßn l¹i:"..RestMin.."phót"..RestSec.." gi©y"
		end
		Msg2MSAll(GetMissionV(MS_DTMISSION),str)
	end
end  