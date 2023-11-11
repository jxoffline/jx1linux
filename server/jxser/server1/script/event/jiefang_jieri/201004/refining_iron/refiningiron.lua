-- Á¶½ð»î¶¯ ¾«Á¶Ìú
Include("\\script\\event\\jiefang_jieri\\201004\\refining_iron\\head.lua")
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\lib\\awardtemplet.lua")

function main(nItemIndex)
	
	if tbRefiningIron:IsCarryOn() ~= 1 then
		Msg2Player("Hµm Kim H¹p bÞ h­ bëi v× l­u gi÷ qu¸ l©u");
		return 0;
	end
	
	local G,D,P,nLevel = GetItemProp(nItemIndex);
	
	if nLevel <= 1 or nLevel > 10 then
		return 1;
	end	
	
	if CalcFreeItemCellCount() < 2 then
		CreateTaskSay({"Xin h·y s¾p xÕp l¹i hµnh trang!",  "§­îc råi./Cancel",});
		return 1;
	end
	
	-- ÅÐ¶ÏÈÎÎñ±äÁ¿
	if tbRefiningIron.tbTaskGroup:GetTask(tbRefiningIron.tbTaskLimit[nLevel][1]) >= tbRefiningIron.tbTaskLimit[nLevel][2] then
		CreateTaskSay({"§· v­ît qu¸ sè lÇn sö dông cho phÐp!",  "§­îc råi./Cancel",});
		return 1;
	end
	tbRefiningIron.tbTaskGroup:AddTask(tbRefiningIron.tbTaskLimit[nLevel][1], 1);

	-- ·¢½±Æ·
	tbAwardTemplet:GiveAwardByList(tbRefiningIron.tbAward[nLevel], "Ho¹t ®éng mõng gi¶i phãng viÖt nam, sö dông thÐp tinh luyÖn");
	return 0;
end
