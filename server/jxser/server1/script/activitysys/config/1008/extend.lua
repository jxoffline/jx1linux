Include("\\script\\activitysys\\config\\1008\\head.lua")
Include("\\script\\activitysys\\config\\1008\\variables.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\activitysys\\config\\1008\\give_rose_toplist.lua")
Include("\\script\\activitysys\\config\\1008\\award_ext.lua")

function pActivity:AddInitNpc()
	local tbNpcPos = {
		[1] = {176,1446,3255,},		
	}
	local tbNpc = {	
			szName = "NguyÖt Nhi", 
			nLevel = 95,
			nNpcId = 1849,
			nIsboss = 0,
			szScriptPath = "\\script\\activitysys\\npcdailog.lua",
	}
	for i=1,getn(tbNpcPos) do
		local nMapId, nPosX, nPosY = unpack(tbNpcPos[i])
		basemission_CallNpc(tbNpc, nMapId, nPosX * 32, nPosY * 32)	
	end
end

function pActivity:PlayerOnLogin()
	local nDate = GetTask(%TSK_LAST_ONLINEDATA)	
	local nNowDate = tonumber(GetLocalDate("%Y%m%d"))
	local nCount = 0	
	if nDate ~= nNowDate then
		nCurrentOnLineTime = GetGameTime()		
		SetTask(%TSK_LAST_ONLINETIME,nCurrentOnLineTime)
		SetTask(%TSK_LAST_ONLINEDATA,nNowDate)		
	end
end

function pActivity:GiveRedCandle()
	local nDate = GetTask(%TSK_LAST_ONLINEDATA)
	local nNowDate = tonumber(GetLocalDate("%Y%m%d"))
	local nHour = 0
	local nCurrentOnLineTime = 0
	local nLastOnLineTime = 0
	local nCount = 0
	if nDate == nNowDate then
		nLastOnLineTime = GetTask(%TSK_LAST_ONLINETIME)
		nCurrentOnLineTime = GetGameTime()	
		nHour = floor((nCurrentOnLineTime - nLastOnLineTime) / 60 / 60)
		nCurrentOnLineTime = nLastOnLineTime + nHour * 60 * 60
	else
		local nCurrentH = tonumber(GetLocalDate("%H"))
		local nCurrentM = tonumber(GetLocalDate("%M"))
		local nCurrentS = tonumber(GetLocalDate("%S"))
		nHour = nCurrentH 
		nCurrentOnLineTime = GetGameTime() - nCurrentM * 60 - nCurrentS		
	end
	nCount = nHour	
	if nCount <= 0 then
		Msg2Player("Kho¶ng c¸ch nhËn lÇn tr­íc, thêi gian trªn m¹ng cña ng­¬i ch­a ®ñ 1 giê, kh«ng thÓ nhËn")
		return 
	end
	local nMaxCount = 3 -  PlayerFunLib:GetTaskDailyCount(%TSK_ONLINE_AWARD_DAILY_LIMIT)
	nMaxCount = min(nMaxCount, nCount)
	if nMaxCount <= 0 then
		Msg2Player("H«m nay ng­¬i kh«ng thÓ nhËn n÷a, ngµy mai h·y quay l¹i.")
		return 
	end
	
	if PlayerFunLib:CheckFreeBagCell(1,"default") ~= 1 then
		return
	end
		
	SetTask(%TSK_LAST_ONLINETIME,nCurrentOnLineTime)
	SetTask(%TSK_LAST_ONLINEDATA,nNowDate)

	PlayerFunLib:GetItem(%ITEM_RED_CANDLE,nMaxCount, EVENT_LOG_TITLE, "OnlineNhanNenDo")
	PlayerFunLib:AddTaskDaily(%TSK_ONLINE_AWARD_DAILY_LIMIT, nMaxCount)
end

function pActivity:UseCoolTea()
	local tbAward = {
		[1] = {nExp=6000000,},
		[2] = {
			{szName = "Hoa hång", tbProp = {6,1,30172,1,0,0}, nCount = 1, nRate = 50, nExpiredTime = 20120301},
		}
	}
	local tbExtAward = {
		[100] = {nExp = 10e6},
		[200] = {nExp = 10e6},
		[300] = {nExp = 10e6},
		[400] = {nExp = 10e6},
		[500] = {nExp = 20e6},
		[600] = {nExp = 20e6},
		[700] = {nExp = 20e6},
		[800] = {nExp = 20e6},
		[900] = {nExp = 20e6},
		[1000] = {nExp = 30e6},
		[1100] = {nExp = 30e6},
		[1200] = {nExp = 30e6},
		[1300] = {nExp = 40e6},
		[1400] = {nExp = 50e6},
		[1500] = {szName="Kim ¤ LÖnh",tbProp = {6,1,2349,1,0,0}, nCount=1},
	}
	local tbExtLog = {
		[100] = {"SuDungTraGiaiNhiet100Lan"},
		[200] = {"SuDungTraGiaiNhiet200Lan"},
		[300] = {"SuDungTraGiaiNhiet300Lan"},
		[400] = {"SuDungTraGiaiNhiet400Lan"},
		[500] = {"SuDungTraGiaiNhiet500Lan"},
		[600] = {"SuDungTraGiaiNhiet600Lan"},
		[700] = {"SuDungTraGiaiNhiet700Lan"},
		[800] = {"SuDungTraGiaiNhiet800Lan"},
		[900] = {"SuDungTraGiaiNhiet900Lan"},
		[1000] = {"SuDungTraGiaiNhiet1000Lan"},
		[1100] = {"SuDungTraGiaiNhiet1100Lan"},
		[1200] = {"SuDungTraGiaiNhiet1200Lan"},
		[1300] = {"SuDungTraGiaiNhiet1300Lan"},
		[1400] = {"SuDungTraGiaiNhiet1400Lan"},
		[1500] = {"SuDungTraGiaiNhiet1500Lan"},
	}
	
	tbVNG_BitTask_Lib:addTask(%tbBITTSK_LIMIT_TEA_USING,1)
	local nUsedCount = tbVNG_BitTask_Lib:getBitTask(%tbBITTSK_LIMIT_TEA_USING)
	if tbExtAward[nUsedCount] then
		tbAwardTemplet:Give(tbExtAward[nUsedCount], 1 , {%EVENT_LOG_TITLE, tbExtLog[nUsedCount]})
	end
	tbAwardTemplet:Give(tbAward, 1 , {%EVENT_LOG_TITLE, "SuDungTraGiaiNhiet"})
	local tbItemAward = %tbAward_Ext["CoolTea"]
	if tbItemAward then
		tbAwardTemplet:Give(tbItemAward, 1 , {%EVENT_LOG_TITLE, "SuDungTraGiaiNhiet"})
	end
end

function pActivity:CastSkillOnUsingBlueGift()
	local nSkillId = 688
	local _,nX32,nY32 = GetWorldPos()
	CastSkill(nSkillId, 1, nX32*32, nY32*32)
end

function pActivity:GiveRose(nCount)	
	local nLastCount = GetTask(%TSK_GIVE_ROSE_COUNT)
	local nCurCount = nLastCount + nCount
	SetTask(%TSK_GIVE_ROSE_COUNT, nCurCount)
	local nWhiteGiftCount = floor(nCurCount/10) - floor(nLastCount/10)
	local nPhase = %tbTop10:GetPhase()
	if nPhase ~= 1 then
		Talk(1, "", "HiÖn t¹i ®· hÕt thêi gian tæng kÕt xÕp h¹ng sù kiÖn Hoa Hång, nép Hoa Hång kh«ng ®­îc tÝnh vµo ®iÓm xÕp h¹ng.")
	else
		%tbTop10:GiveRose(GetName(), GetAccount(), nCurCount)
	end
	if nWhiteGiftCount > 0 then
		local tbAward = {szName = "Hép quµ tr¾ng", tbProp = {6,1,30175,1,0,0}, nCount = nWhiteGiftCount, nExpiredTime = 20120301}
		tbAwardTemplet:Give(tbAward, 1 , {%EVENT_LOG_TITLE, "PhanThuongNop10HoaHong"})
	end	
end

function pActivity:GiveRoseCheckTime()
	if %tbTop10:CheckTime() == 1 then
		Talk(1, "", "HÖ thèng ®ang tiÕn hµnh xÕp h¹ng, xin h·y quay l¹i sau.")		
		return nil
	end
	
	return 1
end

function pActivity:ShowTopList()
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

function pActivity:GetTopListAward(nRank)
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
	if tbVNG_BitTask_Lib:getBitTask(%tbBITTSK_ROSE_ACTIVITY_AWARD) ~= 0 then
		Talk(1, "", "C¸c h¹ ®· nhËn phÇn th­ëng nµy råi.")
		return nil
	end
	if %tbTop10:CheckCanGetAward(nRank) == 1 then
		Talk(1, "", "PhÇn th­ëng ®· cã chñ.")
		return nil
	end
	
	tbVNG_BitTask_Lib:setBitTask(%tbBITTSK_ROSE_ACTIVITY_AWARD, 1)
	if tbVNG_BitTask_Lib:getBitTask(%tbBITTSK_ROSE_ACTIVITY_AWARD) ~= 1 then
		Talk(1, "", "Kh«ng thÓ cËp nhËt d÷ liÖu, xin liªn hÖ ban qu¶n trÞ ®Ó ®­îc gi¶i quyÕt.")
		return nil
	end
	%tbTop10:GiveAward(nRank)
	local tbAward = {
		[1] = {tbProp={6,1,30180,1,0,0},nCount=1,tbParam={18,0,0,0,0,0}},
		[2] = {szName="MÆt n¹ - Anh hïng chiÕn tr­êng",tbProp={0,11,482,1,0,0},nCount=1,nExpiredTime=86400,nUsageTime=-1},
		[3] = {nExp_tl = 2e9},
	}
	tbAwardTemplet:Give(tbAward[nRank], 1, {%EVENT_LOG_TITLE, "PhanThuongXepHang"..nRank})
end

function pActivity:BlueGiftAddTask()
	tbLog = {
		[500] = "SuDung500LanQuaMauXanh",
		[1000] = "SuDung1000LanQuaMauXanh",
	}
	tbVNG_BitTask_Lib:addTask(%tbBITTSK_LIMIT_BLUE_GIFT_USING,1)
	local val = tbVNG_BitTask_Lib:getBitTask(%tbBITTSK_LIMIT_BLUE_GIFT_USING)
	if tbLog[val] then
		tbLog:PlayerActionLog(%EVENT_LOG_TITLE,tbLog[val])
	end
end

function pActivity:WhiteGiftAddTask()
	PlayerFunLib:AddTaskDaily(%TSK_USE_WHITE_GIFT_DAILY_LIMIT, 1)	
	local val = PlayerFunLib:GetTaskDailyCount(%TSK_USE_WHITE_GIFT_DAILY_LIMIT)
	if val == 3 then
		tbLog:PlayerActionLog(%EVENT_LOG_TITLE,"SuDung3LanHopQuaTrang")
	end
end

function pActivity:UpdateRoseNumber()
	if tbVNG_BitTask_Lib:IsMaxValue(%tbBITTSK_ROSE_ACTIVITY_UPDATE_ROSE_COUNT) then
		Talk(1, "", "C¸c h¹ ®· cËp nhËt råi.")
		return
	end
	local nLastCount = GetTask(%TSK_GIVE_ROSE_COUNT)
	if nLastCount <= 0 then
		Talk(1, "", "C¸c h¹ ch­a nép cho ta Hoa Hång nµo.")
		return
	end	
	local nPhase = %tbTop10:GetPhase()
	if nPhase ~= 1 then
		Talk(1, "", "HiÖn t¹i ®· hÕt thêi gian tæng kÕt xÕp h¹ng sù kiÖn Hoa Hång, nép Hoa Hång kh«ng ®­îc tÝnh vµo ®iÓm xÕp h¹ng.")
	else
		%tbTop10:GiveRose(GetName(), GetAccount(), nLastCount)
		Msg2Player(format("CËp nhËt thµnh c«ng. TÝnh tíi thêi ®iÓm hiÖn t¹i, sè l­îng Hoa Hång ®· nép lµ <color=green>%d<color>", nLastCount))
		tbVNG_BitTask_Lib:setBitTask(%tbBITTSK_ROSE_ACTIVITY_UPDATE_ROSE_COUNT, 1)
	end	
end
