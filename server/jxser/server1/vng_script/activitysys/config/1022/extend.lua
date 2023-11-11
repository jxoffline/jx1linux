Include("\\vng_script\\activitysys\\config\\1022\\head.lua")
Include("\\vng_script\\activitysys\\config\\1022\\variables.lua")
Include("\\vng_script\\activitysys\\config\\1022\\give_item_toplist.lua")
Include("\\vng_script\\activitysys\\config\\1022\\awardlist.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\vng_script\\vng_lib\\bittask_lib.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\log.lua")

function pActivity:GiveItem(nCount)	
	local nLastCount = GetTask(%TSK_GIVE_ITEM_COUNT)
	local nCurCount = nLastCount + nCount	
	local nPhase = %tbTop10:GetPhase()
	if nPhase ~= 1 then
		Talk(1, "", "HiÖn t¹i ®· hÕt thêi gian nép M¶nh Thiªn Th¹ch .")
		return
	else
		SetTask(%TSK_GIVE_ITEM_COUNT, nCurCount)	
		%tbTop10:GiveItem(GetName(), GetAccount(), nLastCount, nCount)
	end
--	--Nép qu¸ 2000 c¸i chØ tÝnh 1 ®iÓm tÝch lòy
--	if nCurCount > %LIMIT_POINT then
--		nCount = %LIMIT_POINT - nLastCount
--		if nCount > 0 then
--			Talk(1,"","Qu¸ giíi h¹n 2000 lÇn nép, B¹n chØ cã thÓ nhËn ®­îc thªm exp tõ : "..nCount.."lÇn nép")					
--		else			
--			Talk(1,"","Qu¸ giíi h¹n 2000 lÇn nép, B¹n kh«ng thÓ nhËn thªm exp tõ lÇn nép nµy")
--			return
--		end
--	end	
--	tbAwardTemplet:Give(%tbAwardExp, nCount , {%EVENT_LOG_TITLE, "NopTDLBThuongExp"})	
end

function pActivity:GiveItemCheckTime()
	local nPhase = %tbTop10:GetPhase()
	if nPhase ~= 1 then
		Msg2Player("HiÖn t¹i kh«ng ph¶i thêi gian nép vËt phÈm ®ua top.")
		return nil
	end
	
	return 1
end

function pActivity:ShowTopList()	
	local nTime = tonumber(date("%Y%m%d%H%M"))
	--15 phut cuoi khong the cho xem bxh
	if nTime >= %FORBIT_TIME_START  and nTime <= %FORBIT_TIME_END then
		return Talk(1,"","B¶ng xÕp h¹ng ®ang cËp nhËp lÇn cuèi. T¹m thêi kh«ng thÓ coi. 12h00 sÏ hoµn tÊt b¶ng xÕp h¹ng cuèi cïng.")
	end	
	%tbTop10:ShowTopList()
end

function pActivity:TopListAwardCheckTime()
	local nPhase = %tbTop10:GetPhase()
	if nPhase ~= 2 then
		Talk(1, "", "HiÖn t¹i kh«ng ph¶i thêi gian nhËn th­ëng, xin ®¹i hiÖp ®õng n«n nãng.")
		return nil
	end
	return 1
end
function pActivity:GetTopListAward4_10(tbRank)
	%tbTop10:UpdateTopList()
	local ncurrank = %tbTop10:GetCurRank(GetName(), GetAccount())
	for i=1, getn(tbRank) do
		nRank = tbRank[i]
		if ncurrank == nRank then			
			self:GetTopListAward(nRank)
			return
		end
	end
	 Talk(1, "", "C¸c h¹ kh«ng n»m trong danh s¸ch nhËn th­ëng top 4 -10.")
	return
end
function pActivity:GetTopListAward(nRank)
	%tbTop10:UpdateTopList()
	local nPhase = %tbTop10:GetPhase()
	if nPhase ~= 2 then
		Talk(1, "", "HiÖn t¹i kh«ng ph¶i thêi gian nhËn th­ëng, xin ®¹i hiÖp ®õng n«n nãng.")
		return nil
	end
	local ncurrank = %tbTop10:GetCurRank(GetName(), GetAccount())
	if ncurrank ~= nRank then
		Talk(1, "", "C¸c h¹ kh«ng cã phÇn th­ëng nµy, xin h·y kiÓm tra l¹i.")
		return nil
	end
	if tbVNG_BitTask_Lib:getBitTask(%tbBITTSK_ITEM_ACTIVITY_AWARD) ~= 0 then
		Talk(1, "", "C¸c h¹ ®· nhËn phÇn th­ëng nµy råi.")
		return nil
	end
	if %tbTop10:CheckCanGetAward(nRank) == 1 then
		Talk(1, "", "PhÇn th­ëng ®· cã chñ.")
		return nil
	end
	
	tbVNG_BitTask_Lib:setBitTask(%tbBITTSK_ITEM_ACTIVITY_AWARD, 1)
	if tbVNG_BitTask_Lib:getBitTask(%tbBITTSK_ITEM_ACTIVITY_AWARD) ~= 1 then
		Talk(1, "", "Kh«ng thÓ cËp nhËt d÷ liÖu, xin liªn hÖ ban qu¶n trÞ ®Ó ®­îc gi¶i quyÕt.")
		return nil
	end
	%tbTop10:GiveAward(nRank)
--	--Gi¶i th­ëng top 4 - 10 gièng nhau
--	if ncurrank > 3 and ncurrank < 11 then
--		nRank = 4
--	end
	print("=====Gia tri Rank hien tai"..nRank)
	tbAwardTemplet:Give(%tbAward_Rank[nRank], 1, {%EVENT_LOG_TITLE, "PhanThuongXepHang: "..nRank})	
end

