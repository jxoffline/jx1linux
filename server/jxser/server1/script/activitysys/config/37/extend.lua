Include("\\script\\activitysys\\config\\37\\head.lua")
Include("\\script\\activitysys\\config\\37\\variables.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\log.lua")


function pActivity:AddInitNpc()
	local tbNpcPos = {
		[1] = {176,1566,2944,},
		[2] = {78,1572,3232,},
		[3] = {162,1588,3145,},
	}
	local tbNpc = {	
			szName = "¤ng Giµ Noel", 
			nLevel = 95,
			nNpcId = 1880,
			nIsboss = 0,
			szScriptPath = "\\script\\activitysys\\npcdailog.lua",
	}
	for i=1,getn(tbNpcPos) do
		local nMapId, nPosX, nPosY = unpack(tbNpcPos[i])
		basemission_CallNpc(tbNpc, nMapId, nPosX * 32, nPosY * 32)	
	end
end

function pActivity:YDBZ_GiveStar(YDBZ_mission_match, nTeam)
	local pidx,nj
	local tbPlayer = {}
	local nPlayerCount = 0
	local nOldPlayer = PlayerIndex
	
	for nj = 1, 10 do
		idx , pidx = GetNextPlayer(YDBZ_mission_match, idx, nTeam )
		if pidx > 0 then
			PlayerIndex = pidx
			if PlayerFunLib:CheckTotalLevel(150, "", ">=") == 1 then
				nPlayerCount = nPlayerCount + 1
				tbPlayer[nPlayerCount] = {pidx, 1}
			end
		end
		
		if idx == 0 then
			break;
		end
	end 
	
	for nj = 1, nPlayerCount do
		CallPlayerFunction(tbPlayer[nj][1], PlayerFunLib.GetItem, PlayerFunLib, ITEM_XMAS_STAR, 1, EVENT_LOG_TITLE, "YDBZ_GiveStar")
	end	
end

-- ÉÏÏßÁìÈ¡¿ã×Ó
function pActivity:GiveXmasTrousers()
	local nDate = self:GetTask(TSK_LAST_ONLINEDATA)
	local nNowDate = tonumber(GetLocalDate("%Y%m%d"))
	local nHour = 0
	local nCurrentOnLineTime = 0
	local nLastOnLineTime = 0
	local nCount = 0
	if nDate == nNowDate then	-- ×î½üÒ»´Î¼ÇÂ¼µÄÊ±¼äºÍÁìÈ¡Ê±¼äÊÇÍ¬Ò»Ìì
		nLastOnLineTime = self:GetTask(TSK_LAST_ONLINETIME)
		nCurrentOnLineTime = GetGameTime()
		-- ¸ù¾ÝÊ±¼ä²î¿É»ñµÃµÄÊ¥µ®¿ã×ÓµÄ¸öÊý
		nHour = floor((nCurrentOnLineTime - nLastOnLineTime) / 60 / 60)
		nCurrentOnLineTime = nLastOnLineTime + nHour * 60 * 60
	else -- ×î½üÒ»´Î¼ÇÂ¼Ê±¼äºÍÁìÈ¡µÄÊ±ºò²»ÊÇÍ¬Ò»Ìì
		local nCurrentH = tonumber(GetLocalDate("%H"))
		local nCurrentM = tonumber(GetLocalDate("%M"))
		local nCurrentS = tonumber(GetLocalDate("%S"))
		nHour = nCurrentH 
		nCurrentOnLineTime = GetGameTime() - nCurrentM * 60 - nCurrentS
	end
	
	nCount = nHour * 10
	if nCount <= 0 then
		Msg2Player("Kho¶ng c¸ch nhËn lÇn tr­íc, thêi gian trªn m¹ng cña ng­¬i ch­a ®ñ 1 giê, kh«ng thÓ nhËn")
		return 
	end
	local nMaxCount = 50 -  self:GetTaskDaily(TSK_XMAS_TROUSERS_DAILY)
	nMaxCount = min(nMaxCount, nCount)
	if nMaxCount <= 0 then
		Msg2Player("H«m nay ng­¬i kh«ng thÓ nhËn n÷a, ngµy mai h·y quay l¹i.")
		return 
	end
	
	if PlayerFunLib:CheckFreeBagCell(1,"default") ~= 1 then
		return
	end
	
	-- ¸üÐÂÁìÈ¡µÄÊ±¼ä
	self:SetTask(TSK_LAST_ONLINETIME,nCurrentOnLineTime)
	self:SetTask(TSK_LAST_ONLINEDATA,nNowDate)

	PlayerFunLib:GetItem(ITEM_XMAS_TROUSERS,nMaxCount, EVENT_LOG_TITLE, "GiveXmasTrousers")
	--Ho¹t ®éng 3 - modified by DinhHQ - 20111215
	local tbPumpkinPie = {szName="B¸nh bÝ ®á",tbProp={6,1,30166,1,0,0},nExpiredTime=20120101,}
	PlayerFunLib:GetItem(tbPumpkinPie,floor(nMaxCount/10)*40, EVENT_LOG_TITLE, "GivePumpkinPie")
	self:AddTaskDaily(TSK_XMAS_TROUSERS_DAILY, nMaxCount)
end


function pActivity:CheckRandom(nSuccess, szFailLog)
	local rcur=random(1,100)
	if rcur <= nSuccess then
		return 1
	else
		Msg2Player("ThËt ®¸ng tiÕc, lÇn hîp thµnh nµy ®· thÊt b¹i, xin h·y thö l¹i!")
		szFailLog = szFailLog or ""
		%tbLog:PlayerActionLog(szFailLog, EVENT_LOG_TITLE)
		return 0
	end
end

-- ºÏ³ÉÊ¥µ®ÀñºÐ
function pActivity:ComposeXmasGift(nCount)
	for i=1,nCount do
		local nSuccess = 70
		if self:CheckRandom(nSuccess,"GhepHopQuaNoelThatBai") == 1 then
			PlayerFunLib:GetItem({szName = "Hép quµ gi¸ng sinh", tbProp={6,1,3080,1,0,0},nExpiredTime=20120101,},1, EVENT_LOG_TITLE, "GhepHopQuaNoelThanhCong")
		end
	end
end

-- ºÏ³ÉÊ¥µ®ÀÏÈË£¨Ð¡£©
function pActivity:ComposeXmasPerson_S(nCount)
	for i=1,nCount do
	--Change request Event Noel - Modified by DinhHQ - 20111129
		local nSuccess = 70
		if self:CheckRandom(nSuccess, "GhepNguoiTuyet(nho)ThatBai") == 1 then
			PlayerFunLib:GetItem({szName = "¤ng Giµ Noel (nhá)", tbProp={6,1,3077,1,0,0},nExpiredTime=20120101,},1, EVENT_LOG_TITLE, "GhepNguoiTuyet(nho)ThanhCong")
		end
	end
end

function pActivity:GiveItemAward(tbAward, tbComposeLog, szLogAction, nTaskId)
	tbAwardTemplet:Give(tbAward, 1 , {EVENT_LOG_TITLE, szLogAction})
	local nCount = self:GetTask(nTaskId) + 1
	self:SetTask(nTaskId, nCount)
	if tbComposeLog[nCount] then
		tbLog:PlayerActionLog(tbComposeLog[nCount], EVENT_LOG_TITLE)
	end
end

function pActivity:UseXmasPerson_S()
	local tbAward = 
	{
		[1]={nExp=2000000,},
	}
	local tbUseLog = {
		[500] = "SuDung500LanNguoiTuyet(nho)",
		[1000] = "SuDung1000LanNguoiTuyet(nho)",
		}

	self:GiveItemAward(tbAward, tbUseLog, "UseXmasPerson_S", TSK_XMAS_PERSON_S_LIMIT)
end

function pActivity:UseXmasPerson_M()
	local tbAward = 
	{
		[1]={szName="HuyÒn Tinh Kho¸ng Th¹ch ",tbProp={6,1,147,1,0,0},},
		[2]={nExp_tl=1,},
	}
	local tbUseLog = {
		[50] = "SuDung50LanNguoiTuyet(trung)",
		[100] = "SuDung100LanNguoiTuyet(trung)",
		[150] = "SuDung150LanNguoiTuyet(trung)",
		[200] = "SuDung200LanNguoiTuyet(trung)",
		}
	
	self:GiveItemAward(tbAward, tbUseLog, "SuDungNguoiTuyet(trung)NhanVatPham", TSK_XMAS_PERSON_M_LIMIT)
end

function pActivity:UseXmasPerson_L()
	local tbAward = 
	{
		[1]={nExp=10e6,},
		[2]={
			{szName="Kim ¤ LÖnh",tbProp={6,1,2349,1,0,0},nCount=1,nRate=0.04},
			{szName="Kim ¤ Kim Bµi",tbProp={6,1,3001,1,0,0},nCount=1,nRate=0.3},
			{szName="§å Phæ Kim ¤ Kh«i",tbProp={6,1,2982,1,0,0},nCount=1,nRate=0.2},
			{szName="§å Phæ Kim ¤ Y",tbProp={6,1,2983,1,0,0},nCount=1,nRate=0.2},
			{szName="§å Phæ Kim ¤ Hµi",tbProp={6,1,2984,1,0,0},nCount=1,nRate=0.2},
			{szName="§å Phæ Kim ¤ Yªu §¸i",tbProp={6,1,2985,1,0,0},nCount=1,nRate=0.2},
			{szName="§å Phæ Kim ¤ Hé UyÓn",tbProp={6,1,2986,1,0,0},nCount=1,nRate=0.1},
			{szName="§å Phæ Kim ¤ H¹ng Liªn",tbProp={6,1,2987,1,0,0},nCount=1,nRate=0.2},
			{szName="§å Phæ Kim ¤ Béi",tbProp={6,1,2988,1,0,0},nCount=1,nRate=0.2},
			{szName="§å Phæ Kim ¤ Th­îng Giíi",tbProp={6,1,2989,1,0,0},nCount=1,nRate=0.1},
			{szName="§å Phæ Kim ¤ H¹ Giíi",tbProp={6,1,2990,1,0,0},nCount=1,nRate=0.1},
			{szName="§å Phæ Kim ¤ KhÝ Giíi",tbProp={6,1,2991,1,0,0},nCount=1,nRate=0.05},
			{szName="Kim Hoa Chi B¶o",tbProp={6,1,3002,1,0,0},nCount=1,nRate=0.2},
			{szName="PhØ Thóy Chi B¶o",tbProp={6,1,3003,1,0,0},nCount=1,nRate=0.1},
			{szName="Phong V©n Chi B¶o",tbProp={6,1,3004,1,0,0},nCount=1,nRate=0.02},
			{szName="Hång bao An khang",tbProp={6,1,2105,1,0,0},nCount=1,nRate=0.1},
			{szName="Hång bao Sum vÇy",tbProp={6,1,2104,1,0,0},nCount=1,nRate=0.1},
			{szName="Tèng Kim Chiªu Binh LÖnh",tbProp={6,1,30083,1,0,0},nCount=2,nRate=2},
			{szName="Hçn Nguyªn Linh Lé",tbProp={6,1,2312,1,0,0},nCount=1,nRate=2},
			{szName="H¶i long ch©u",tbProp={6,1,2115,1,0,0},nCount=1,nRate=2},
			{szName="Håi thiªn t¸i t¹o lÔ bao",tbProp={6,1,2527,1,0,0},nCount=1,nRate=2},
			{szName="Hoµng Kim Ên (C­êng hãa)",tbProp={0,3211},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=10080,},
			{szName="Hoµng Kim Ên (Nh­îc hãa)",tbProp={0,3221},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=10080,},
			{szName="Cµn Kh«n Song TuyÖt Béi",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.1,nExpiredTime=43200},
			{szName="§¹i lùc hoµn lÔ bao",tbProp={6,1,2517,1,0,0},nCount=1,nRate=2,nExpiredTime=43200},
			{szName="Phi tèc hoµn lÔ bao",tbProp={6,1,2520,1,0,0},nCount=1,nRate=2,nExpiredTime=43200},
			{szName="Ngò Hµnh Kú Th¹ch",tbProp={6,1,2125,1,0,0},nCount=1,nRate=20},
			{szName="S¸t Thñ Gi¶n lÔ hép",tbProp={6,1,2339,1,0,0},nCount=1,nRate=2},
			{szName="Cµn Kh«n T¹o Hãa §an (®¹i) ",tbProp={6,1,215,1,0,0},nCount=5,nRate=3},
			{szName="Tö M·ng Chi B¶o (Nãn)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.1,tbParam={1,0,0,0,0,0}},
			{szName="Tö M·ng Chi B¶o (¸o)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.1,tbParam={5,0,0,0,0,0}},
			{szName="Tö M·ng Chi B¶o (H¹ng Liªn)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.1,tbParam={0,0,0,0,0,0}},
			{szName="Tö M·ng Chi B¶o (Ngäc Béi)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.1,tbParam={8,0,0,0,0,0}},
			{szName="Tö M·ng Chi B¶o (GiÇy)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.1,tbParam={7,0,0,0,0,0}},
			{szName="Tö M·ng Chi B¶o (Bao Tay)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.1,tbParam={3,0,0,0,0,0}},
			{szName="Tö M·ng Chi B¶o (NhÉn Trªn)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.07,tbParam={2,0,0,0,0,0}},
			{szName="Tö M·ng Chi B¶o (NhÉn D­íi)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.07,tbParam={9,0,0,0,0,0}},
			{szName="Tö M·ng Chi B¶o (§ai L­ng)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.1,tbParam={4,0,0,0,0,0}},
			{szName="Tö M·ng Chi B¶o (Vò KhÝ)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.07,tbParam={6,0,0,0,0,0}},
			{szName = "§iÓm Kinh NghiÖm", nExp=8000000,nRate=35},
			{szName = "§iÓm Kinh NghiÖm", nExp=10000000,nRate=16},
			{szName = "§iÓm Kinh NghiÖm", nExp=15000000,nRate=6},
			{szName = "§iÓm Kinh NghiÖm", nExp=20000000,nRate=1.37},
			{szName = "§iÓm Kinh NghiÖm", nExp=50000000,nRate=0.5},
			{szName = "§iÓm Kinh NghiÖm", nExp=100000000,nRate=0.5},
			{szName = "§iÓm Kinh NghiÖm", nExp=200000000,nRate=0.01},
		},		
	}
	local tbUseLog = {
		[50] = "SuDung50LanNguoiTuyet(lon)",
		[100] = "SuDung100LanNguoiTuyet(lon)",
		[200] = "SuDung200LanNguoiTuyet(lon)",
		[300] = "SuDung300LanNguoiTuyet(lon)",
		[400] = "SuDung400LanNguoiTuyet(lon)",
		[500] = "SuDung500LanNguoiTuyet(lon)",
		[600] = "SuDung600LanNguoiTuyet(lon)",
		[700] = "SuDung700LanNguoiTuyet(lon)",
		[800] = "SuDung800LanNguoiTuyet(lon)",	
		}
	local tbExtAward = {
		[50] = {nExp=20000000,},
		[100] = {nExp=20000000,},
		[200] = {nExp=20000000,},
		[300] = {nExp=20000000,},
		[400] = {nExp=30000000,},
		[500] = {nExp=40000000,},
		[600] = {nExp=50000000,},
		[700] = {nExp=60000000,},
		[800] = {nExp=100000000,},
	}
	--Bæ sung phÇn th­ëng ®¹t mèc sö dông ng­êi tuyÕt lín - Modified By DinhHQ - 20111129
	local nCount = self:GetTask(TSK_XMAS_PERSON_L_LIMIT) + 1
	if tbExtAward[nCount] then
		tbAwardTemplet:Give(tbExtAward[nCount], 1 , {EVENT_LOG_TITLE, tbUseLog[nCount]})
	end
	self:GiveItemAward(tbAward, {}, "SuDungNguoiTuyet(lon)NhanVatPham", TSK_XMAS_PERSON_L_LIMIT)	
end

function pActivity:UseXmasGift()
	local tbAward = 
	{
		[1]={nExp=1e6,},		
	}
	local tbUseLog = {
		[1000] = "SuDung1000HopQuaNoel",
		}
		
	self:GiveItemAward(tbAward, tbUseLog, "UseXmasGift", TSK_XMAS_GIFT_LIMIT)	
end

function pActivity:UseXmasCake()
	local tbAward = 
	{
		nExp=500000,
	}
	local tbUseLog = {
		[1000] = "SuDung1000BanhGiangSinh",
		}
		
	self:GiveItemAward(tbAward, tbUseLog, "UseXmasCake", TSK_XMAS_CAKE_LIMIT)	
end

function pActivity:PlayerOnLogin()
	local nDate = self:GetTask(TSK_LAST_ONLINEDATA)
	local nNowDate = tonumber(GetLocalDate("%Y%m%d"))
	local nCount = 0
	if nDate ~= nNowDate then	-- Óë×î½ü¼ÇÂ¼²»ÊÇÍ¬Ò»Ìì
		nCurrentOnLineTime = GetGameTime()
		self:SetTask(TSK_LAST_ONLINETIME,nCurrentOnLineTime)
		self:SetTask(TSK_LAST_ONLINEDATA,nNowDate)
	end
end

function pActivity:CheckTimeGetCompensation()
	local nNowDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	if nNowDate < 201112020900 or nNowDate >= 201112040000 then
		Talk(1, "", "Xin thø lçi, hiÖn t¹i ®· qua thêi gian nhËn th­ëng")
		return nil
	end
	return 1
end
--Ho¹t ®éng thø 3 - Modified By DinhHQ - 20111215
function pActivity:CheckTimeGetFreeExp()
	local nNowDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	if nNowDate < 201112240000 or nNowDate >= 201112252400 then
		Talk(1, "", "Xin thø lçi, hiÖn t¹i kh«ng ph¶i lµ thêi gian nhËn th­ëng")
		return nil
	end
	return 1
end

function pActivity:UseXmasPerson_Pink()
	local nUsedCount = GetTask(2916)
	local nCurCount = nUsedCount + 1
	if nCurCount > 1500 then
		Talk(1, "", "Sö dông vËt phÈm ®¹t giíi h¹n, kh«ng thÓ sö dông thªm.")
		return nil
	end
	SetTask(2916, nCurCount)	
	if GetTask(2916) ~= nCurCount then
		return nil
	end
	local tbExpAward = {
		[1] = {szName = "§iÓm kinh nghiÖm", nExp = 6e6},
		[2] = {{szName="Ng«i Sao",tbProp={6,1,3081,1,0,0},nCount=1,nRate=40, nExpiredTime = 20120101},},
	}
	tbAwardTemplet:Give(tbExpAward, 1 , {EVENT_LOG_TITLE, "SuDungOngGiaNoelHong"})
	local tbBonusAward = {
		[100] = {{szName = "§iÓm kinh nghiÖm kh«ng céng dån", nExp = 5e6}, "PhanThuongSuDung100OngGiaNoelHong"},
		[200] = {{szName = "§iÓm kinh nghiÖm kh«ng céng dån", nExp = 10e6}, "PhanThuongSuDung200OngGiaNoelHong"},
		[300] = {{szName = "§iÓm kinh nghiÖm kh«ng céng dån", nExp = 10e6}, "PhanThuongSuDung300OngGiaNoelHong"},
		[400] = {{szName = "§iÓm kinh nghiÖm kh«ng céng dån", nExp = 20e6}, "PhanThuongSuDung400OngGiaNoelHong"},
		[500] = {{szName = "§iÓm kinh nghiÖm kh«ng céng dån", nExp = 20e6}, "PhanThuongSuDung500OngGiaNoelHong"},
		[600] = {{szName = "§iÓm kinh nghiÖm kh«ng céng dån", nExp = 20e6}, "PhanThuongSuDung600OngGiaNoelHong"},
		[700] = {{szName = "§iÓm kinh nghiÖm kh«ng céng dån", nExp = 20e6}, "PhanThuongSuDung700OngGiaNoelHong"},
		[800] = {{szName = "§iÓm kinh nghiÖm kh«ng céng dån", nExp = 30e6}, "PhanThuongSuDung800OngGiaNoelHong"},
		[900] = {{szName = "§iÓm kinh nghiÖm kh«ng céng dån", nExp = 30e6}, "PhanThuongSuDung900OngGiaNoelHong"},
		[1000] = {{szName = "MÆt n¹ V­¬ng Gi¶", tbProp = {0,11,561,1,0,0}, nExpiredTime = 20160, nCount=1}, "PhanThuongSuDung1000OngGiaNoelHong"},
		[1100] = {{szName = "§iÓm kinh nghiÖm kh«ng céng dån", nExp = 40e6}, "PhanThuongSuDung1100OngGiaNoelHong"},
		[1200] = {{szName = "§iÓm kinh nghiÖm kh«ng céng dån", nExp = 40e6}, "PhanThuongSuDung1200OngGiaNoelHong"},
		[1300] = {{szName = "§iÓm kinh nghiÖm kh«ng céng dån", nExp = 40e6}, "PhanThuongSuDung1300OngGiaNoelHong"},
		[1400] = {{szName = "§iÓm kinh nghiÖm kh«ng céng dån", nExp = 50e6}, "PhanThuongSuDung1400OngGiaNoelHong"},
		[1500] = {{szName="Kim ¤ LÖnh",tbProp={6,1,2349,1,0,0},nCount=1}, "PhanThuongSuDung1500OngGiaNoelHong"},
	}
	if tbBonusAward[nCurCount] then
		tbAwardTemplet:Give(tbBonusAward[nCurCount][1], 1 , {EVENT_LOG_TITLE, tbBonusAward[nCurCount][2]})
		Msg2Player(format("Chóc mõng c¸c h¹ sö dông ®Õn %d vËt phÈm ¤ng giµ Noel hång, nhËn ®­îc phÇn th­ëng %s", nCurCount, tbBonusAward[nCurCount][1].szName))
	end
	local tbItemAward = {
		{szName="Kim ¤ LÖnh",tbProp={6,1,2349,1,0,0},nCount=1,nRate=0.1},
		{szName="Kim ¤ Kim Bµi",tbProp={6,1,3001,1,0,0},nCount=1,nRate=0.3},
		{szName="§å Phæ Kim ¤ Kh«i",tbProp={6,1,2982,1,0,0},nCount=1,nRate=0.2},
		{szName="§å Phæ Kim ¤ Y",tbProp={6,1,2983,1,0,0},nCount=1,nRate=0.2},
		{szName="§å Phæ Kim ¤ Hµi",tbProp={6,1,2984,1,0,0},nCount=1,nRate=0.2},
		{szName="§å Phæ Kim ¤ Yªu §¸i",tbProp={6,1,2985,1,0,0},nCount=1,nRate=0.2},
		{szName="§å Phæ Kim ¤ Hé UyÓn",tbProp={6,1,2986,1,0,0},nCount=1,nRate=0.1},
		{szName="§å Phæ Kim ¤ H¹ng Liªn",tbProp={6,1,2987,1,0,0},nCount=1,nRate=0.2},
		{szName="§å Phæ Kim ¤ Béi",tbProp={6,1,2988,1,0,0},nCount=1,nRate=0.2},
		{szName="§å Phæ Kim ¤ Th­îng Giíi",tbProp={6,1,2989,1,0,0},nCount=1,nRate=0.1},
		{szName="§å Phæ Kim ¤ H¹ Giíi",tbProp={6,1,2990,1,0,0},nCount=1,nRate=0.1},
		{szName="§å Phæ Kim ¤ KhÝ Giíi",tbProp={6,1,2991,1,0,0},nCount=1,nRate=0.05},
		{szName="Kim Hoa Chi B¶o",tbProp={6,1,3002,1,0,0},nCount=1,nRate=0.3},
		{szName="PhØ Thóy Chi B¶o",tbProp={6,1,3003,1,0,0},nCount=1,nRate=0.2},
		{szName="Phong V©n Chi B¶o",tbProp={6,1,3004,1,0,0},nCount=1,nRate=0.03},
		{szName="Anh Hïng ThiÕp",tbProp={6,1,1604,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
		{szName="B¹ch C©u Hoµn ®Æc biÖt",tbProp={6,1,1157,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
		{szName="KÝch C«ng Trî Lùc Hoµn",tbProp={6,1,2952,1,0,0},nCount=1,nRate=1.2},
		{szName="Ngäc Qu¸n",tbProp={6,1,2311,1,0,0},nCount=1,nRate=1.5},
		{szName="Phiªn Vò ",tbProp={0,10,7,1,0,0},nCount=1,nRate=0.1,nExpiredTime=259200},
		{szName="Phiªn Vò ",tbProp={0,10,7,1,0,0},nCount=1,nRate=0.1,nExpiredTime=129600},
		{szName="¢m D­¬ng Ho¹t HuyÕt §¬n",tbProp={6,1,2953,1,0,0},nCount=1,nRate=1.2},
		{szName="Håi thiªn t¸i t¹o lÔ bao",tbProp={6,1,2527,1,0,0},nCount=1,nRate=1.6},
		{szName="Hoµng Kim Ên (C­êng hãa)",tbProp={0,3211},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=10080,},
		{szName="Hoµng Kim Ên (Nh­îc hãa)",tbProp={0,3221},nCount=1,nRate=0.11,nQuality = 1,nExpiredTime=10080,},
		{szName="Cµn Kh«n Song TuyÖt Béi",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.1,nExpiredTime=43200},
		{szName="Ngò Hµnh Kú Th¹ch",tbProp={6,1,2125,1,0,0},nCount=1,nRate=20},
		{szName = "§iÓm Kinh NghiÖm", nExp=5000000,nRate=40},
		{szName = "§iÓm Kinh NghiÖm", nExp=8000000,nRate=13},
		{szName = "§iÓm Kinh NghiÖm", nExp=10000000,nRate=10},
		{szName = "§iÓm Kinh NghiÖm", nExp=15000000,nRate=5},
		{szName = "§iÓm Kinh NghiÖm", nExp=20000000,nRate=1},
		{szName = "§iÓm Kinh NghiÖm", nExp=50000000,nRate=0.5},
		{szName = "§iÓm Kinh NghiÖm", nExp=100000000,nRate=0.01},
	}
	tbAwardTemplet:Give(tbItemAward, 1 , {EVENT_LOG_TITLE, "SuDungOngGiaNoelHong"})
	
end

pActivity.nPak = curpack()