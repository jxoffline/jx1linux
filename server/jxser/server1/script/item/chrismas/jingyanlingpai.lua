Include([[\script\item\chrismas\chrismasitem.lua]]);

function main()
	local tabidx = itemmapcheck(TAB_ACTION);
	if (0 == tabidx) then
		return 1;
	end;
	if (TAB_ACTION[tabidx][7][1] ~= 0 and TAB_ACTION[tabidx][7][2] ~= 0) then
		SetTask(TAB_ACTION[tabidx][7][1], 2)
		SetTask(TAB_ACTION[tabidx][7][2], GetCurServerTime() + 30)
	end;
	Msg2Player("<#> B¹n sö dông 1<color=0xB5FDD7> LÖnh bµi ®iÓm kinh nghiÖm<color>, trong 30 gi©y ®iÓm kinh nghiÖm t¨ng lªn 2 lÇn.")
end;
