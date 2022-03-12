-- ³µ·ò¶Ô»°
CurStation = 1;
Include("\\script\\global\\station.lua")

function main(sel)
	
	local mapid = SubWorldIdx2ID(SubWorld);
	local tbOpp = {"Nh÷ng n¬i ®· ®i qua/WayPointFun", "Nh÷ng thµnh thÞ ®· ®i qua/StationFun", };

	tinsert(tbOpp, "Kh«ng cÇn ®©u/OnCancel");
	Say("Xa phu: Muèn ®i ®Õn n¬i nµo?", getn(tbOpp), tbOpp);
end;

function OnCancel()
end;

