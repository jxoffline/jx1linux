Include("\\script\\lib\\awardtemplet.lua")
local tbItem = 
{
	{szName="[Hoµn Mü] Hång ¶nh TrÇm Viªn V·n Tóy", nQuality=1, tbProp={0, 536}, nExpiredTime = 86400, nBindState = -2},
	{szName="[Hoµn Mü] Hång ¶nh KiÕm Qua T©y Ph­¬ng", nQuality=1, tbProp={0, 537}, nExpiredTime = 86400, nBindState = -2},
	{szName="[Hoµn Mü] Hång ¶nh Môc Tóc T­¬ng Vong", nQuality=1, tbProp={0, 538}, nExpiredTime = 86400, nBindState = -2},
	{szName="[Hoµn Mü] Hång ¶nh Hång Tô Chiªu", nQuality=1, tbProp={0, 539}, nExpiredTime = 86400, nBindState = -2},
}
function main()
	
	if  CountFreeRoomByWH(2, 5, 1) < 1 then
		Talk(1, "", format("§Ó b¶o ®¶m tµi s¶n cña ®¹i hiÖp, xin h·y ®Ó trèng %d %dx%d hµnh trang", 1, 2, 5))
		return 1
	end
	
	
	tbAwardTemplet:GiveAwardByList(%tbItem, "hongying baoxiang")
	
end