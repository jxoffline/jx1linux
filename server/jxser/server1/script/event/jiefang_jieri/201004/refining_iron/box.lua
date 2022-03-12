-- Á¶½ð»î¶¯ º¬½ðºÐ
Include("\\script\\event\\jiefang_jieri\\201004\\refining_iron\\head.lua")
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\lib\\awardtemplet.lua")

function main(nItemIndex)
	
	if tbRefiningIron:IsCarryOn() ~= 1 then
		Msg2Player("Hµm Kim H¹p bÞ h­ bëi v× l­u gi÷ qu¸ l©u");
		return 0;
	end
	
	if CalcFreeItemCellCount() < 1 then
		CreateTaskSay({"H·y s¾p xÕp hµnh trang! §Ó trèng 1 «!",  "§­îc råi./Cancel",});
		return 1;
	end
	
	local tbAwardItem = 
	{
		szName="ThÐp Tinh LuyÖn", 
		tbProp={6,1, 2293, 1,0,0},
		nCount = 8,
		nExpiredTime=tbRefiningIron.nCloseDate,
	};
	tbAwardTemplet:GiveAwardByList(tbAwardItem, "Sö dông hµm kim h¹p");
	return 0;
end
