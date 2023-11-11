-- 幸运彩票开奖
-- Fanghao Wu
-- 2004.11.13

Include( "\\script\\global\\lottery_gold.lua" )

function main()
	if( SubWorldID2Idx( 80 ) >= 0 ) then	-- 有扬州地图的服务器才可进行
		onLotteryGold_UpdateIssue();
--		local nWeekDay = tonumber( date( "%w" ) );
--		if( nWeekDay == 1 ) then
--			Lottery_StartNewIssue( LOTTERY_GOLD_TYPENAME );
--		end
	end
end