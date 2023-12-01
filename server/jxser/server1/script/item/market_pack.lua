Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\task\\system\\task_string.lua");
IncludeLib("ITEM")
-------------------------------------------------------
function main(nItemIndex)
	local G,D,P,nLevel = GetItemProp(nItemIndex);
	local nExPiredTime = ITEM_GetExpiredTime(nItemIndex);
	local nLeftTime = nExPiredTime - GetCurServerTime();
	if nExPiredTime ~= 0 and nLeftTime <= 60 then
		Msg2Player("VËt phÈm ®· qu¸ h¹n sö dông")
		return 0;
	end
	nLeftTime = floor((nLeftTime)/60);
	
	if (G ~= 6) then
		return 1;
	end
	
	if CalcFreeItemCellCount() < 6 then
		CreateTaskSay({"Xin h·y s¾p xÕp l¹i hµnh trang! Nhí ®Ó trèng 6 « trë lªn nhÐ!",  "§­îc råi./Cancel",});
		return 1;
	end
	
	if P == 2340 then
		local tbAwardItem = {tbProp={4,195,1,1,0,0}}
		tbAwardTemplet:GiveAwardByList(tbAwardItem, "Më ra vËt phÈm mua ë Kú Tr©n C¸c");
		return 0;
	end	
	
	if P == 2401 then
		local tbAwardItem = {tbProp={6,1,2212,1,0,0},nExpiredTime=nLeftTime,}
		tbAwardTemplet:GiveAwardByList(tbAwardItem, "Më ra vËt phÈm mua ë Kú Tr©n C¸c");
		return 0;
	end	
	
	if P == 2335 or P == 2336 or P == 2337 or P == 2338 or P == 2339 then
		SelectSeries(P)
		return 1;
	end
	
	if P == 2328 then -- M· bµi - XÝch thè
		local tbAwardItem = {tbProp={0,10,5,2,5,0}}
		tbAwardTemplet:GiveAwardByList(tbAwardItem, "NhËn ®­îc vËt phÈm!");
		return 0;
	end
	if P == 2329 then -- M· bµi - §Ých L«
		local tbAwardItem = {tbProp={0,10,5,4,5,0}}
		tbAwardTemplet:GiveAwardByList(tbAwardItem, "NhËn ®­îc vËt phÈm!");
		return 0;
	end
	if P == 2330 then -- M· bµi - TuyÖt ¶nh
		local tbAwardItem = {tbProp={0,10,5,8,5,0}}
		tbAwardTemplet:GiveAwardByList(tbAwardItem, "NhËn ®­îc vËt phÈm!");
		return 0;
	end
	if P == 2331 then -- M· bµi - ¤ V©n §¹p TuyÕt
		local tbAwardItem = {tbProp={0,10,5,6,5,0}}
		tbAwardTemplet:GiveAwardByList(tbAwardItem, "NhËn ®­îc vËt phÈm!");
		return 0;
	end
	if P == 2332 then -- M· bµi - ChiÕu D¹ Ngäc S­ Tö
		local tbAwardItem = {tbProp={0,10,5,10,5,0}}
		tbAwardTemplet:GiveAwardByList(tbAwardItem, "NhËn ®­îc vËt phÈm!");
		return 0;
	end

	if P == 2333 then
		local tbAwardItem = {tbProp={0,10,6,1,5,0}}
		tbAwardTemplet:GiveAwardByList(tbAwardItem, "Më ra vËt phÈm mua ë Kú Tr©n C¸c");
		return 0;
	end

	if P == 2334 then -- M· bµi - Phiªn Vò
		local tbAwardItem = {tbProp={0,10,7,10,5,0}}
		tbAwardTemplet:GiveAwardByList(tbAwardItem, "NhËn ®­îc vËt phÈm!");
		return 0;
	end

	if P == 2396 then
		local tbAwardItem = {tbProp={0,10,8,1,5,0}}
		tbAwardTemplet:GiveAwardByList(tbAwardItem, "Më ra vËt phÈm mua ë Kú Tr©n C¸c");
		return 0;
	end
	
	if P == 3416 then -- M· Bµi - Háa Tinh Kim Hæ V­¬ng
		local tbAwardItem = {tbProp={0,10,15,10,5,0}}
		tbAwardTemplet:GiveAwardByList(tbAwardItem, "NhËn ®­îc vËt phÈm!");
		return 0;
	end
		
	if P == 3483 or P == 4064 then -- M· Bµi - Siªu Quang
		local tbAwardItem = {tbProp={0,10,13,10,5,0}}
		tbAwardTemplet:GiveAwardByList(tbAwardItem, "NhËn ®­îc vËt phÈm!");
		return 0;
	end

	return 1
end

function SelectSeries(nP)
local tbTaskSay = {"<dec>Xin h·y chän ngò hµnh",
		format("Kim/#GetSeries(%d, %d)", nP, 0),
		format("Méc/#GetSeries(%d, %d)", nP, 1),
		format("Thñy /#GetSeries(%d, %d)", nP, 2),
		format("Háa/#GetSeries(%d, %d)", nP, 3),
		format("Thæ /#GetSeries(%d, %d)", nP, 4),
	};			  
	CreateTaskSay(tbTaskSay);
end

function GetSeries(nP, nSeries)
	
	if ConsumeItem(3, 1, 6, 1, nP, 1) ~= 1 then
		Msg2Player("KhÊu trõ ®¹o cô thÊt b¹i")
		return
	end
	
	if nP == 2335 then
		local tbAwardItem = {tbProp={0,2,28,3,nSeries,0}}
		tbAwardTemplet:GiveAwardByList(tbAwardItem, "Më ra vËt phÈm mua ë Kú Tr©n C¸c");
		return
	end	
	
	if nP == 2336 then
		local tbAwardItem = {tbProp={0,2,28,6,nSeries,0}}
		tbAwardTemplet:GiveAwardByList(tbAwardItem, "Më ra vËt phÈm mua ë Kú Tr©n C¸c");
		return
	end	
		
	if nP == 2337 then
		local tbAwardItem = {tbProp={0,2,28,2,nSeries,0}}
		tbAwardTemplet:GiveAwardByList(tbAwardItem, "Më ra vËt phÈm mua ë Kú Tr©n C¸c");
		return
	end	
		
	if nP == 2338 then
		local tbAwardItem = {tbProp={0,2,28,5,nSeries,0}}
		tbAwardTemplet:GiveAwardByList(tbAwardItem, "Më ra vËt phÈm mua ë Kú Tr©n C¸c");
		return
	end	
		
	if nP == 2339 then
		local tbAwardItem = {tbProp={6,1,400,90,nSeries,0}, nCount = 2}
		tbAwardTemplet:GiveAwardByList(tbAwardItem, "Më ra vËt phÈm mua ë Kú Tr©n C¸c");
		return
	end	
end
