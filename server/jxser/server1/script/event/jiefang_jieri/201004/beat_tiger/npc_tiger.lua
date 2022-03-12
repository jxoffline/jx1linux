-- Ñ°»¨´ò»¢ ÀÏ»¢
Include("\\script\\event\\jiefang_jieri\\201004\\beat_tiger\\head.lua")

function OnDeath(nNpcIndex)
	
	if tbBeatTiger:IsCarryOn() ~= 1 then
		Msg2Player("Ho¹t ®éng ®· kÕt thóc");
		return
	end
	
	local nFieldId = tbBeatTiger:GetFieldId();
	if  nFieldId <= 0 then
		Msg2Player("Ho¹t ®éng vÉn ch­a b¾t ®Çu, xin h·y chó ý thêi gian cña ®ît ho¹t ®éng ®ã.");
		return
	end		
	
	-- ¼ÇÂ¼¹ÖÎïËÀÍöÊ±¼ä
	local nDeathTime = GetCurServerTime();
	local tbPlayerInfo = tbBeatTiger.nValue_tbPlayerInfo[nFieldId].tbPlayer[GetName()];
	
	if tbPlayerInfo == nil then
		tbBeatTiger.nValue_tbPlayerInfo[nFieldId].tbPlayer[GetName()] = {nkillTime = nDeathTime, nAwardDate = 0,};
	else
		tbPlayerInfo.nkillTime = nDeathTime;
	end
	
	Msg2Player("§¹i hiÖp ®· ®¶ b¹i S¸t HuyÕt L·o Hæ råi, xin h·y ®Õn L­u H­¬ng nhËn th­ëng!");
	
end

