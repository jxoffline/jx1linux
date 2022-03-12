--»ªÉ½¡¡Ö°ÄÜ¡¡³µ·ò
-- by£ºDan_Deng(2003-09-16)

CurStation = 7
Include("\\script\\global\\station.lua")

function main(sel)
	Say("Thi ®Êu xong råi ­? Cã cÇn ta ®­a vÒ kh«ng?", 4, "Nh÷ng n¬i ®· ®i qua/WayPointFun", "Nh÷ng thµnh thÞ ®· ®i qua/StationFun","Trë l¹i ®Þa ®iÓm cò /TownPortalFun", "Kh«ng cÇn ®©u/OnCancel")
end;

function  OnCancel()
   Talk(1,"","Cã tiÒn th× h·y quay l¹i nhÐ! ")
end;
