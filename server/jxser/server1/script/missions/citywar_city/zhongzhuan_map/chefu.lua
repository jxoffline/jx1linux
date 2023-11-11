--¹¥³ÇÕ½ ³µ·ò¶Ô»°
CurStation = 1;
Include("\\script\\global\\station.lua")

function main(sel)
	SetCurCamp(GetCamp())
	SetFightState(0)
	BT_LeaveBattle()
	Say("Nh÷ng ng­êi xa phu chiÕn tr­êng chóng t«i vµo sinh ra tö, kiÕm tiÒn b»ng sinh m¹ng m×nh! Xin gióp cho vµi l­îng b¹c!", 5, "Nh÷ng n¬i ®· ®i qua/WayPointFun", "Nh÷ng thµnh thÞ ®· ®i qua/StationFun", "Quay l¹i ®Þa ®iÓm cò /TownPortalFun","Rêi khái ®Êu tr­êng /LeaveChefu","Kh«ng cÇn ®©u/OnCancel");
end;

function OnCancel()
end;

function LeaveChefu()
	w,x,y = RevID2WXY(GetPlayerRev());
	NewWorld(w,x/32, y/32);
end;