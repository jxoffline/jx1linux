Include("\\script\\activitysys\\config\\1018\\head.lua")
Include("\\script\\activitysys\\config\\1018\\variables.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\activitysys\\config\\1018\\give_lbtc.lua")

pActivity.nPak = curpack()

function pActivity:CheckTong()
	local strTongName, nTongID = GetTongName();		
	if strTongName == nil or strTongName == "" then
		Talk(1, "", "C¸c h¹ ch­a gia nhËp bang héi kh«ng thÓ tham gia ho¹t ®éng nµy!")
		return nil
	end
	return 1
end

function pActivity:GiveItem(nCount)
	local strTongName, nTongID = GetTongName();	
	if strTongName == nil or strTongName == "" then
		Talk(1, "", "C¸c h¹ ch­a gia nhËp bang héi kh«ng thÓ tham gia ho¹t ®éng nµy!")
		return 0
	end
	local nLastCount = DynamicExecuteByPlayer(PlayerIndex, "\\script\\vng_lib\\tong_task.lua", "tbTongTSK:GetTongTask", nTongID, %tbTONG_TSK_GIVE_ITEM)
	local nCurCount = nLastCount + nCount
	DynamicExecuteByPlayer(PlayerIndex, "\\script\\vng_lib\\tong_task.lua", "tbTongTSK:SetTongTask", nTongID, %tbTONG_TSK_GIVE_ITEM, nCurCount)	
	if %tbTop3:GiveItem(nTongID, strTongName, nCurCount) == 1 then
		%tbLog:PlayerActionLog("NopLenhBaiTienCuThanhCong", "Nép "..nCount, "Tæng "..nCurCount)
	end
end

function pActivity:GiveItemCheckTime()
	if %tbTop3:IsActive() ~= 1 then
		Talk(1, "", "HiÖn t¹i kh«ng ph¶i thêi gian diÔn ra ch­¬ng tr×nh.")
		return nil
	end
	if %tbTop3:CheckTime() == 1 then
		Talk(1, "", "HÖ thèng ®ang tiÕn hµnh xÕp h¹ng, xin h·y quay l¹i sau.")
		return nil
	end	
	return 1
end

function pActivity:ShowTopList()
	%tbTop3:ShowTopList()
end