-- ÌìÂ»¸£´ü
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\task\\system\\task_string.lua");
IncludeLib("ITEM")
local tbAwardItem = {tbProp={6,1,3269,1,0,0}, nExpiredTime=43200}
local nAwardCount = 5

function main(nItemIndex)
--	local nExPiredTime = ITEM_GetExpiredTime(nItemIndex)
--	local nLeftTime = nExPiredTime - GetCurServerTime()
--	if nExPiredTime ~= 0 and nLeftTime <= 60 then
--		Msg2Player("VËt phÈm ®· qu¸ h¹n sö dông")
--		return 0
--	end
	if CalcFreeItemCellCount() < 5 then
		CreateTaskSay({"§¹i hiÖp ng­¬i h·y s¾p xÕp l¹i hµnh trang! Ýt nhÊt cßn 5 « trèng!",  "§­îc råi./Cancel",})
		return 1
	end
	--nLeftTime = floor((nLeftTime)/60);
	tbAwardTemplet:Give(%tbAwardItem, %nAwardCount, {"PlantTrees", "TianlufudaiAward"})
	return 0
end
