Include( "\\script\\missions\\statinfo\\head.lua" )

function InitMission()
	StartGlbMSTimer(MSID_STAT_GOODS_SALE, TMID_STAT_GOODS_SALE, INTERVAL_STAT_GOODS_SALE);
end

function RunMission()
end

function EndMission()
end
