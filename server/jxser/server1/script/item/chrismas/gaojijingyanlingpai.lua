Include([[\script\item\chrismas\chrismasitem.lua]]);

function main()
	local tabidx = itemmapcheck(TAB_ACTION);
	if (0 == tabidx) then
		return 1;
	end;
	if (TAB_ACTION[tabidx][7][1] ~= 0 and TAB_ACTION[tabidx][7][2] ~= 0) then
		SetTask(TAB_ACTION[tabidx][7][1], 4)
		SetTask(TAB_ACTION[tabidx][7][2], GetCurServerTime() + 30)
	end;
	
	Msg2Player("<#> Bπn sˆ dÙng 1 <color=0xB5FDD7>L÷nh bµi Æi”m kinh nghi÷m cao c p<color>, trong 30 gi©y Æi”m kinh nghi÷m nhÀn Æ≠Óc g p 4 l«n.")
end;