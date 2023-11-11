-- Ñ°»¨´ò»¢ »Æ½ðÁ«
Include("\\script\\event\\jiefang_jieri\\201004\\beat_tiger\\head.lua")
Include("\\script\\task\\system\\task_string.lua");

function main(nItemIndex)
	return tbBeatTiger:OnUse(nItemIndex);
end

-- Ê¹ÓÃ
function tbBeatTiger:OnUse(nItemIndex)
	
	-- »î¶¯½áÊø
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if  nDate >= self.nFlowerDisappearDate then
		Msg2Player("Hoa sen c¹n bÞ h­ v× thêi gian tån t¹i qu¸ l©u");
		return 0;
	end
	
	-- µÈ¼¶²»¹»
	if GetLevel() < self.nLimit_Level then
		CreateTaskSay({"§¼ng cÊp cña c¸c h¹ kh«ng ®ñ!",  "§­îc!/Cancel",});
		return 1;
	end 
	
	-- Ã»ÓÐ³äÖµ
	if GetExtPoint(0) <= 0  then
		CreateTaskSay({"ChØ cã ng­êi ch¬i nép thÎ míi cã thÓ sö dông!",  "§­îc!/Cancel",});
		return 1;	
	end
	
	-- ³¬¹ýÊ¹ÓÃÏÞÖÆ
	local nUseCount = self.tbTaskGroup:GetTask(self.nTaskID_UseCount);
	if nUseCount >= self.nLimit_UseCount then
		CreateTaskSay({"V­ît qu¸ giíi h¹n nhËn ®­îc kinh nghiÖm cho phÐp cña ho¹t ®éng",  "§­îc!/Cancel",});
		return 1;		
	end
	
	nUseCount = nUseCount + 1;
	self.tbTaskGroup:SetTask(self.nTaskID_UseCount, nUseCount);
	
	-- ·¢·Å¾­Ñé
	local tbAwardItem = {nExp = self.nLimit_ExpAward};
	tbAwardTemplet:GiveAwardByList(tbAwardItem, "Sö dông hoa sen c¹n");
	return 0;
end
