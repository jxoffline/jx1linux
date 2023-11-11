-- ¿­Ðý¹Ä
Include("\\script\\event\\jiefang_jieri\\201004\\triumph_drum\\head.lua")
Include("\\script\\event\\jiefang_jieri\\201004\\triumph_drum\\drum_npc.lua")
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\tong\\tong_header.lua");
Include("\\script\\global\\judgeoffline_limit.lua");
IncludeLib("TONG");

function main(nItemIndex)
	return tbTriumphDrum:OnUse(nItemIndex);
end

-- Ê¹ÓÃ
function tbTriumphDrum:OnUse(nItemIndex)
	
	-- »î¶¯½áÊø
	if tbTriumphDrum:IsCarryOn() ~= 1 then
		Msg2Player("Trèng kh¶i hoµn bÞ h­ bëi v× l­u gi÷ qu¸ l©u");
		return 0;
	end
	
	-- µÈ¼¶²»¹»
	if GetLevel() < self.nLimit_Level then
		CreateTaskSay({"§¼ng cÊp cña c¸c h¹ kh«ng ®ñ!",  "§­îc råi./Cancel",});
		return 1;
	end 
	
	-- Ã»ÓÐ°ï»á
	local szTongName, nTongId = GetTongName();
	if nTongId == 0 then
		CreateTaskSay({"C¸c h¹ vÉn ch­a gia nhËp bang héi!",  "§­îc råi./Cancel",});
		return 1;
	end
	
	-- Ã»ÓÐÖ°Î»
	local nFigure = GetTongFigure();
	if nFigure ~= 0 and nFigure ~= 1 then
		CreateTaskSay({"§¹i hiÖp kh«ng ph¶i lµ bang chñ hoÆc lµ tr­ëng l·o!",  "§­îc råi./Cancel",});
		return 1;
	end
	
	-- Õ½¶·×´Ì¬
	if GetFightState() == 1 then
		CreateTaskSay({"Xin h·y sö dông t¹i khu vùc phi chiÕn ®Êu!",  "§­îc råi./Cancel",});
		return 1;
	end
	
	-- ÏÞÖÆÇøÓò
	if offlineCheckPermitRegion() ~= 1 then
		CreateTaskSay({"Xin h·y sö dông t¹i khu vùc Ýt ng­êi!",  "§­îc råi./Cancel",});
		return 1;
	end	
	
	-- ·ÇÊ¹ÓÃÊ±¼ä
	local nTime = tonumber(GetLocalDate("%H%M"));
	if nTime < self.nStartTime or nTime > self.nCloseTime then
		CreateTaskSay({"Xinh h·y sö dông trong thêi gian ho¹t ®éng!",  "§­îc råi./Cancel",});
		return 1;
	end
	
	-- ±¾°ï½ñÌìÊ¹ÓÃ¹ý
	local nTask_LastUseDay = TONG_GetTaskValue(nTongId, TONGTSK_TriumphDrum_LastUseDay);
	local nTask_BeUsed = TONG_GetTaskValue(nTongId, TONGTSK_TriumphDrum_BeUsed);
	local nCurDay = tonumber(GetLocalDate("%Y%m%d"));
	
	if nCurDay ~= nTask_LastUseDay then 
		nTask_LastUseDay = nCurDay;
		nTask_BeUsed = 0;
	end
	
	if nTask_BeUsed >= self.nLimit_DayUse then
		CreateTaskSay({"V­ît qu¸ giíi h¹n sö dông cho phÐp",  "§­îc råi./Cancel",});
		return 1;		
	end
	
	nTask_BeUsed = nTask_BeUsed + 1;
	TONG_ApplySetTaskValue(nTongId, TONGTSK_TriumphDrum_LastUseDay, nTask_LastUseDay);
	TONG_ApplySetTaskValue(nTongId, TONGTSK_TriumphDrum_BeUsed, nTask_BeUsed);
	
	-- ³öÏÖ¹Ä
	tbDrumNpc:New(szTongName, nTongId);
	return 0;
end
