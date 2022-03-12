-- ÆæÕä¸ó´ò°üÎïÆ·
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\task\\system\\task_string.lua");
IncludeLib("ITEM")
function main(nItemIndex)

	local G,D,P,nLevel = GetItemProp(nItemIndex);
	local nExPiredTime = ITEM_GetExpiredTime(nItemIndex);
	local nLeftTime = nExPiredTime - GetCurServerTime();
	local nBindState = GetItemBindState(nItemIndex)
	
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
	
	-- ÔÀÍõ½£
	if P == 2340 then
		local tbAwardItem = {tbProp={4,195,1,1,0,0}, nBindState = nBindState}
		tbAwardTemplet:GiveAwardByList(tbAwardItem, "Më ra vËt phÈm mua ë Kú Tr©n C¸c");
		return 0;
	end	
	
	-- ÑªÕ½ÁîÆì
	if P == 2401 then
		local tbAwardItem = {tbProp={6,1,2212,1,0,0},nExpiredTime=nLeftTime, nBindState = nBindState}
		tbAwardTemplet:GiveAwardByList(tbAwardItem, "Më ra vËt phÈm mua ë Kú Tr©n C¸c");
		return 0;
	end	
	
	
	-- É±ÊÖïµ ½ÚÈÕÀñ·þ
	if P == 2335 or P == 2336 or P == 2337 or P == 2338 or P == 2339 then
		SelectSeries(P, nBindState)
		return 1;
	end
	
	-- ±¼Ïü
	if P == 2333 then
		local tbAwardItem = {tbProp={0,10,6,1,5,0}, nBindState = nBindState}
		tbAwardTemplet:GiveAwardByList(tbAwardItem, "Më ra vËt phÈm mua ë Kú Tr©n C¸c");
		return 0;
	end

	-- ·ÉÔÆ
	if P == 2396 then
		local tbAwardItem = {tbProp={0,10,8,1,5,0}, nBindState = nBindState}
		tbAwardTemplet:GiveAwardByList(tbAwardItem, "Më ra vËt phÈm mua ë Kú Tr©n C¸c");
		return 0;
	end

	return 1
end

-- Ñ¡ÔñÎåÐÐ
function SelectSeries(nP, nBindState)
	
	local tbTaskSay = {"<dec>Xin h·y chän ngò hµnh",
						format("Kim/#GetSeries(%d, %d, %d)", nP, 0, nBindState),
						format("Méc/#GetSeries(%d, %d, %d)", nP, 1, nBindState),
						format("Thñy /#GetSeries(%d, %d, %d)", nP, 2, nBindState),
						format("Háa/#GetSeries(%d, %d, %d)", nP, 3, nBindState),
						format("Thæ /#GetSeries(%d, %d, %d)", nP, 4, nBindState),
					  };
					  
	CreateTaskSay(tbTaskSay);
end

function GetSeries(nP, nSeries, nBindState)
	
	if ConsumeItem(3, 1, 6, 1, nP, 1) ~= 1 then
		Msg2Player("KhÊu trõ ®¹o cô thÊt b¹i")
		return
	end
	
	-- Çå¾øÒÂ
	if nP == 2335 then
		local tbAwardItem = {tbProp={0,2,28,3,nSeries,0}, nBindState = nBindState}
		tbAwardTemplet:GiveAwardByList(tbAwardItem, "Më ra vËt phÈm mua ë Kú Tr©n C¸c");
		return
	end	
	
	-- ±ù¾§È¹
	if nP == 2336 then
		local tbAwardItem = {tbProp={0,2,28,6,nSeries,0}, nBindState = nBindState}
		tbAwardTemplet:GiveAwardByList(tbAwardItem, "Më ra vËt phÈm mua ë Kú Tr©n C¸c");
		return
	end	
		
	-- ¾ªÌì¼×
	if nP == 2337 then
		local tbAwardItem = {tbProp={0,2,28,2,nSeries,0}, nBindState = nBindState}
		tbAwardTemplet:GiveAwardByList(tbAwardItem, "Më ra vËt phÈm mua ë Kú Tr©n C¸c");
		return
	end	
		
	-- ÆüµØÈ¹
	if nP == 2338 then
		local tbAwardItem = {tbProp={0,2,28,5,nSeries,0}, nBindState = nBindState}
		tbAwardTemplet:GiveAwardByList(tbAwardItem, "Më ra vËt phÈm mua ë Kú Tr©n C¸c");
		return
	end	
		
	-- É±ÊÖïµ
	if nP == 2339 then
		local tbAwardItem = {tbProp={6,1,400,90,nSeries,0}, nCount = 2, nBindState = nBindState}
		tbAwardTemplet:GiveAwardByList(tbAwardItem, "Më ra vËt phÈm mua ë Kú Tr©n C¸c");
		return
	end	
end
