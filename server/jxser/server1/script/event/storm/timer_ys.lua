Include("\\script\\event\\storm\\head.lua")

function OnTimer()
	if (storm_valid_game(4)) then
		local restcount = TM_GetRestCount(44)
		if (restcount == 0) then
			storm_end(4)
		else
			Msg2Player(storm_gamename(4).."Khiªu chiÕn Phong Ba cßn d­ thêi gian:"..storm_point2str(STORM_TIMER_YS*restcount).."phót")
		end
	else
		TM_StopTimer(STORM_TIMERID_YS)
	end
end
