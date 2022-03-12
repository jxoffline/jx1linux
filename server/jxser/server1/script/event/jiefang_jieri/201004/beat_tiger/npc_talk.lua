-- Ñ°»¨´ò»¢ ÁôÏã
Include("\\script\\event\\jiefang_jieri\\201004\\beat_tiger\\head.lua")
Include("\\script\\task\\system\\task_string.lua");

function main()
	return tbBeatTiger:NpcTalk();
end

-- Npc¶Ô»°
function tbBeatTiger:NpcTalk()
	
	if tbBeatTiger:IsCarryOn() ~= 1 then
		return
	end

	local tbTaskSay = {format("<dec><npc>Trong thêi gian ho¹t ®éng, ch­ vÞ ®¹i hiÖp chØ cÇn ®¸nh ng· HuyÕt S¸t L·o Hæ xung quanh ta vµ t¹i %d gi©y ®Õn t×m ta th× cã thÓ nhËn ®­îc 1 hoa sen c¹n, ho¹t ®éng nµy mçi ngµy diÔn ra hai trËn, mçi ng­êi ch¬i 1 trËn chØ cã thÓ tham dù 1 lÇn.", self.nLimit_AwardTime),};
	tinsert(tbTaskSay, "NhËn hoa sen c¹n/#tbBeatTiger:Award()");
	tinsert(tbTaskSay, "§­îc!/Cancel");
	CreateTaskSay(tbTaskSay);
end

-- ÁìÈ¡»Æ½ðÁ«
function tbBeatTiger:Award()
	
	if tbBeatTiger:IsCarryOn() ~= 1 then
		return
	end
	
	local nUseCount = self.tbTaskGroup:GetTask(self.nTaskID_UseCount);
	if nUseCount >= self.nLimit_UseCount then
		CreateTaskSay({"<dec><npc>C¸c h¹ ®· nhËn kinh nghiÖm ®Õn møc cao nhÊt, kh«ng thÓ nhËn th­ëng ®­îc n÷a",  "§­îc råi./Cancel",});
		return 	
	end
	
	local nFieldId = tbBeatTiger:GetFieldId();
	if  nFieldId <= 0 then
		CreateTaskSay({"<dec><npc>Xin h·y nhËn th­ëng t¹i ®ît ho¹t ®éng ®ã",  "§­îc råi./Cancel",});
		return
	end	

	local tbPlayerInfo = self.nValue_tbPlayerInfo[nFieldId].tbPlayer[GetName()];
	if tbPlayerInfo == nil then
		CreateTaskSay({"<dec><npc>C¸c h¹ vÉn ch­a ®¸nh b¹i S¸t HuyÕt L·o Hæ",  "§­îc råi./Cancel",});
		return	
	end
	
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if nDate == tbPlayerInfo.nAwardDate then
		CreateTaskSay({"<dec><npc>C¸c h¹ ®· nhËn phÇn th­ëng cña ®ît nµy råi",  "§­îc råi./Cancel",});
		return 			
	end
	
	local nCurTime = GetCurServerTime();
	local nFieldStartTime = self.nValue_tbPlayerInfo[nFieldId].nStartTime;
	local nFieldCloseTime = self.nValue_tbPlayerInfo[nFieldId].nCloseTime;
	local nFieldMaxTime = ((floor(nFieldCloseTime/100) - floor(nFieldStartTime/100) - 1)*60 + mod(nFieldCloseTime, 100) + (60 - mod(nFieldStartTime, 100)) ) * 60;
	
	if nCurTime - tbPlayerInfo.nkillTime > nFieldMaxTime then
		CreateTaskSay({"<dec><npc>C¸c h¹ kh«ng ph¶i lµ ng­êi ®¸nh b¹i S¸t HuyÕt L·o Hæ ®ît nµy",  "§­îc råi./Cancel",});
		return			
	end	
	
	if nCurTime - tbPlayerInfo.nkillTime > self.nLimit_AwardTime then
		CreateTaskSay({"<dec><npc>§· qu¸ thêi gian nhËn th­ëng råi, xin mêi tiÕp tôc ®¸nh b¹i l·o hæ",  "§­îc råi./Cancel",});
		return			
	end
	
	if CalcFreeItemCellCount() < 1 then
		CreateTaskSay({"Xin h·y s¾p xÕp l¹i hµnh trang!",  "§­îc råi./Cancel",});
		return 
	end	
	
	-- ·¢·Å½±Àø
	tbPlayerInfo.nAwardDate = nDate;
	
	local tbAwardItem = 
	{
		szName="Hoa Sen C¹n", 
		tbProp={6,1, 2310, 1,0,0},
		nCount = 1,
		nExpiredTime=self.nFlowerDisappearDate,
	};
	tbAwardTemplet:GiveAwardByList(tbAwardItem, "Ph¸t hoa sen c¹n");
end
