-- ³µ·ò¶Ô»°
CurStation = 1;
Include("\\script\\global\\station.lua")
IncludeLib("BATTLE");

function main(sel)
	BT_LeaveBattle()
	SetCurCamp(GetCamp())
	SetFightState(0)
	local mapid = SubWorldIdx2ID(SubWorld);
	local tbOpp = {"Nh÷ng n¬i ®· ®i qua/WayPointFun", 
					"Nh÷ng thµnh thŞ ®· ®i qua/StationFun", 
					"Trë l¹i chç lóc n·y/TownPortalFun"};
--	if (mapid == 325) then
		tinsert(tbOpp, format("§Õn ®iÓm b¸o danh phe Vµng (T)/#battle_transprot(1,%d)", mapid));
--	end;
	tinsert(tbOpp, "Kh«ng cÇn ®©u/OnCancel");
	Say("Nh÷ng ng­êi xa phu chiÕn tr­êng chóng t«i vµo sinh ra tö, kiÕm tiÒn b»ng sinh m¹ng m×nh! Xin gióp cho vµi l­îng b¹c!", getn(tbOpp), tbOpp);
end;

function OnCancel()
end;
function battle_transprot(nSel, mapid)
	local tbsongjin_pos = {1541, 3178};	--ËÎ·½×ø±êµã
	local szstr = "phe Vµng (T)";
	if (nSel == 2) then
		tbsongjin_pos = {1570, 3085};
		szstr = "phe Tİm (K)";
	end;
	if (mapid >= 323 and mapid <= 325) then
		NewWorld( mapid, tbsongjin_pos[1], tbsongjin_pos[2]);
		Msg2Player( "§· vµo ®iÓm b¸o danh" );
	end
end;
