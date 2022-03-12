--±ùÑ¨ÃÔ¹¬ ±ùÀÎ³ö¿Ú trap
-- by£ºDan_Deng(2003-07-31)

function main(sel)
	if (GetTask(9) == 50*256+128) and (HaveItem(10) == 1) then
		Msg2Player("B¹n ra khái nhµ lao vµ ®ãng cöa l¹i ")
--		SetPos()
	else
		Msg2Player("NÕu B¹n kh«ng lÊy ®­îc tãc cña tªn cuång nh©n ®ã th× kh«ng thÓ ®i ra! ")
	end
end;
