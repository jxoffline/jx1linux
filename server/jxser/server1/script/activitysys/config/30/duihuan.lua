Include("\\script\\activitysys\\config\\30\\head.lua")
Include("\\script\\activitysys\\config\\30\\config.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\lib\\awardtemplet.lua")

local szEventName = "Event_NhaGiaoVN"
local nMaxAskNumber = 2000 -- ´ò°üÉÏ½»Ê±×î´ó¿ÉÖ§³ÖÊý


local tbBookPartAward = {
	[20]={szName="Hoa Tri ¢n",tbProp={6,1,3043,1,0,0},nExpiredTime=20111201},
	[40]={szName="Hoa Tri ¢n",tbProp={6,1,3043,1,0,0},nCount = 3,nExpiredTime=20111201},
	[60]={szName="Hoa Tri ¢n",tbProp={6,1,3043,1,0,0},nCount = 4,nExpiredTime=20111201},
	[80]={szName="Hoa Tri ¢n",tbProp={6,1,3043,1,0,0},nCount = 5,nExpiredTime=20111201},
	[100]={szName="Hoa Tri ¢n",tbProp={6,1,3043,1,0,0},nCount = 7,nExpiredTime=20111201},
	[200]={nExp_tl=1,nCount = 20000000,},
	[300]={nExp_tl=1,nCount = 20000000,},
	[400]={szName="Thiªn Vò Hån",tbProp={6,1,3044,1,0,0},nExpiredTime=20111201},
	[500]={szName="Thiªn Vò Hån",tbProp={6,1,3044,1,0,0},nExpiredTime=20111201},
	[600]={szName="Thiªn Vò Hån",tbProp={6,1,3044,1,0,0},nExpiredTime=20111201},
	[700]={szName="Thiªn Vò Hån",tbProp={6,1,3044,1,0,0},nCount = 2,nExpiredTime=20111201},
	[800]={szName="Thiªn Vò Hån",tbProp={6,1,3044,1,0,0},nCount = 2,nExpiredTime=20111201},
	[900]={szName="Thiªn Vò Hån",tbProp={6,1,3044,1,0,0},nCount = 2,nExpiredTime=20111201},
	[1000]={nExp_tl=1,nCount = 20000000,},
	[1100]={szName="Thiªn Vò Hån",tbProp={6,1,3044,1,0,0},nCount = 2,nExpiredTime=20111201},
	[1200]={szName="Thiªn Vò Hån",tbProp={6,1,3044,1,0,0},nCount = 3,nExpiredTime=20111201},
	[1300]={szName="Thiªn Vò Hån",tbProp={6,1,3044,1,0,0},nCount = 3,nExpiredTime=20111201},
	[1400]={szName="Thiªn Vò Hån",tbProp={6,1,3044,1,0,0},nCount = 3,nExpiredTime=20111201},
	[1500]={nExp_tl=1,nCount = 50000000,},
	[1600]={nExp_tl=1,nCount = 60000000,},
	[1700]={nExp_tl=1,nCount = 70000000,},
	[1800]={nExp_tl=1,nCount = 80000000,},
	[1900]={nExp_tl=1,nCount = 90000000,},
	[2000]={nExp_tl=1,nCount = 100000000,},
}
local tbBookPartAwardLog ={
	[20] = "SuDung20LanCuonSach",
	[40] = "SuDung40LanCuonSach",
	[60] = "SuDung60LanCuonSach",
	[80] = "SuDung80LanCuonSach",
	[100] = "SuDung100LanCuonSach", 
	[200] = "SuDung200LanCuonSach",
	[300] = "SuDung300LanCuonSach",
	[400] = "SuDung400LanCuonSach",
	[500] = "SuDung500LanCuonSach",
	[600] = "SuDung600LanCuonSach", 
	[700] = "SuDung700LanCuonSach",
	[800] = "SuDung800LanCuonSach",
	[900] = "SuDung900LanCuonSach",
	[1000] = "SuDung1000LanCuonSach",
	[1100] = "SuDung1100LanCuonSach", 
	[1200] = "SuDung1200LanCuonSach",
	[1300] = "SuDung1300LanCuonSach",
	[1400] = "SuDung1400LanCuonSach",
	[1500] = "SuDung1500LanCuonSach",
	[1600] = "SuDung1600LanCuonSach", 
	[1700] = "SuDung1700LanCuonSach",
	[1800] = "SuDung1800LanCuonSach",
	[1900] = "SuDung1900LanCuonSach",
	[2000] = "SuDung2000LanCuonSach",
}

function pContributionAward(nCount)
	local _ , nTongID = GetTongName()
	if (nTongID > 0) then
		AddContribution(nCount)
		Msg2Player("B¹n nhËn ®­îc "..nCount.." ®iÓm cèng hiÕn bang héi")
		%tbLog:PlayerActionLog(%szEventName, "SuDungCuonSachNhanVatPham", nCount.." ®iÓm cèng hiÕn bang héi")
	end
end

local tbBookAward = {
	{szName="Kim ¤ LÖnh",tbProp={6,1,2349,1,0,0},nCount=1,nRate=0.02},
	{szName="Kim ¤ Kim Bµi",tbProp={6,1,3001,1,0,0},nCount=1,nRate=0.05},
	{szName="§å Phæ Kim ¤ Kh«i",tbProp={6,1,2982,1,0,0},nCount=1,nRate=0.1},
	{szName="§å Phæ Kim ¤ Y",tbProp={6,1,2983,1,0,0},nCount=1,nRate=0.1},
	{szName="§å Phæ Kim ¤ Hµi",tbProp={6,1,2984,1,0,0},nCount=1,nRate=0.05},
	{szName="§å Phæ Kim ¤ Yªu §¸i",tbProp={6,1,2985,1,0,0},nCount=1,nRate=0.05},
	{szName="§å Phæ Kim ¤ Hé UyÓn",tbProp={6,1,2986,1,0,0},nCount=1,nRate=0.1},
	{szName="§å Phæ Kim ¤ H¹ng Liªn",tbProp={6,1,2987,1,0,0},nCount=1,nRate=0.1},
	{szName="§å Phæ Kim ¤ Béi",tbProp={6,1,2988,1,0,0},nCount=1,nRate=0.1},
	{szName="§å Phæ Kim ¤ Th­îng Giíi",tbProp={6,1,2989,1,0,0},nCount=1,nRate=0.1},
	{szName="§å Phæ Kim ¤ H¹ Giíi",tbProp={6,1,2990,1,0,0},nCount=1,nRate=0.1},
	{szName="§å Phæ Kim ¤ KhÝ Giíi",tbProp={6,1,2991,1,0,0},nCount=1,nRate=0.05},
	{szName="Kim Hoa Chi B¶o",tbProp={6,1,3002,1,0,0},nCount=1,nRate=0.05},
	{szName="PhØ Thóy Chi B¶o",tbProp={6,1,3003,1,0,0},nCount=1,nRate=0.03},
	{szName="Phong V©n Chi B¶o",tbProp={6,1,3004,1,0,0},nCount=1,nRate=0.001},
	{szName="Thanh C©u Th¹ch",tbProp={6,1,2710,1,0,0},nCount=1,nRate=0.4},
	{szName="V©n Léc Th¹ch",tbProp={6,1,2711,1,0,0},nCount=1,nRate=0.3},
	{szName="Th­¬ng Lang Th¹ch",tbProp={6,1,2712,1,0,0},nCount=1,nRate=0.2},
	{szName = "6000000 §iÓm Kinh NghiÖm", nExp=6000000,nRate=35},
	{szName = "8000000 §iÓm Kinh NghiÖm", nExp=8000000,nRate=22},
	{szName = "12000000 §iÓm Kinh NghiÖm", nExp=12000000,nRate=10},
	{szName = "20000000 §iÓm Kinh NghiÖm", nExp=20000000,nRate=3},
	{szName = "50000000 §iÓm Kinh NghiÖm", nExp=50000000,nRate=0.5},
	{szName = "100000000 §iÓm Kinh NghiÖm", nExp=100000000,nRate=0.1},
	{szName="§¹i lùc hoµn lÔ bao",tbProp={6,1,2517,1,0,0},nCount=1,nRate=3},
	{szName="Phi tèc hoµn lÔ bao",tbProp={6,1,2520,1,0,0},nCount=1,nRate=3},
	{szName="Håi thiªn t¸i t¹o lÔ bao",tbProp={6,1,2527,1,0,0},nCount=1,nRate=2,nExpiredTime=43200},
	{szName="Tèng Kim Chiªu Binh LÖnh",tbProp={6,1,30083,1,0,0},nCount=1,nRate=2,nExpiredTime=10080},
	{szName="Ngäc Qu¸n",tbProp={6,1,2311,1,0,0},nCount=1,nRate=0.5,nExpiredTime=43200},
	{szName="S¸t Thñ Gi¶n lÔ hép",tbProp={6,1,2339,1,0,0},nCount=1,nRate=2},
	{szName="Ngäc Trïng LuyÖn",tbProp={6,1,30104,1,0,0},nCount=1,nRate=0.2,nExpiredTime=43200},
	{szName="Cµn Kh«n Song TuyÖt Béi",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.04,nExpiredTime=43200},
	{szName="KÝch C«ng Trî Lùc Hoµn",tbProp={6,1,2952,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName="¢m D­¬ng Ho¹t HuyÕt §¬n",tbProp={6,1,2953,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName="Méc Nh©n LÖnh",tbProp={6,1,30105,1,0,0},nCount=5,nRate=9.664},
	{szName="50000 §iÓm Cèng HiÕn Bang Héi",nCount=1,nRate=2, pFun = function() %pContributionAward(50000) end},
	{szName="100000 §iÓm Cèng HiÕn Bang Héi",nCount=1,nRate=1, pFun = function() %pContributionAward(100000) end},
	{szName="Tö M·ng Chi B¶o (Nãn)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.01,tbParam={1,0,0,0,0,0}},
	{szName="Tö M·ng Chi B¶o (§ai L­ng)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.02,tbParam={4,0,0,0,0,0}},
	{szName="Tö M·ng Chi B¶o (Bao Tay)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.01,tbParam={3,0,0,0,0,0}},
	{szName="Tö M·ng Chi B¶o (Ngäc Béi)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.01,tbParam={8,0,0,0,0,0}},
	{szName="Tö M·ng Chi B¶o (¸o)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.01,tbParam={5,0,0,0,0,0}},
	{szName="Tö M·ng Chi B¶o (GiÇy)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.01,tbParam={7,0,0,0,0,0}},
	{szName="Tö M·ng Chi B¶o (H¹ng Liªn)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.01,tbParam={0,0,0,0,0,0}},
	{szName="Tö M·ng Chi B¶o (NhÉn Trªn)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.005,tbParam={2,0,0,0,0,0}},
	{szName="Tö M·ng Chi B¶o (NhÉn D­íi)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.005,tbParam={9,0,0,0,0,0}},
	{szName="Tö M·ng Chi B¶o (Vò KhÝ)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.005,tbParam={6,0,0,0,0,0}},
}

local tbBaizhiPartLog = {
	[500] = "NopVatPhamGiayTrang500Lan",
	[1000] = "NopVatPhamGiayTrang1000Lan",
	[1500] = "NopVatPhamGiayTrang1500Lan",
	[2000] = "NopVatPhamGiayTrang2000Lan",
	[2500] = "NopVatPhamGiayTrang2500Lan",
	[3000] = "NopVatPhamGiayTrang3000Lan",
}	

function pActivity:AddInitNpc()
	local tbNpcPos = {
		[1] = {176,1431,3287,},
		[2] = {176,1428,3283,},
	}
	local tbNpc = {
		[1] = {
			szName = "§¹i L·o S­", 
			nLevel = 95,
			nNpcId = 1877,
			nIsboss = 0,
			szScriptPath = "\\script\\activitysys\\npcdailog.lua",
			},
		[2] = {
			szName = "Th­ §ång", 
			nLevel = 95,
			nNpcId = 1878,
			nIsboss = 0,
			szScriptPath = "\\script\\activitysys\\npcdailog.lua",
			},
	}
	for i=1,getn(tbNpcPos) do
		local nMapId, nPosX, nPosY = unpack(tbNpcPos[i])
		basemission_CallNpc(tbNpc[i], nMapId, nPosX * 32, nPosY * 32)	
	end
end

function pActivity:GetItemCount(tbMaterial)
	local nMaxCount = -1
	if type(tbMaterial[1]) == "table" then
		for i=1, getn(tbMaterial) do
			local tbProp = tbMaterial[i].tbProp
			tbMaterial[i].nCount = tbMaterial[i].nCount or 1
			local nCount = CalcItemCount(3, tbProp[1], tbProp[2], tbProp[3], -1)
			nCount = floor(nCount / tbMaterial[i].nCount)
			if nMaxCount < 0 then
				nMaxCount = nCount
			else
				nMaxCount = min(nMaxCount, nCount)
			end
		end
	else
		local tbProp = tbMaterial.tbProp
		local nCount = CalcItemCount(3, tbProp[1], tbProp[2], tbProp[3], -1)
		nMaxCount = min(nMaxCount, nCount)
	end
	nMaxCount = max(0, nMaxCount)
	return nMaxCount
end

function pActivity:ConsumeItem(tbMaterial, nCount)
	if type(tbMaterial[1]) == "table" then
		for i=1, getn(tbMaterial) do
			local tbProp = tbMaterial[i].tbProp
			tbMaterial[i].nCount = tbMaterial[i].nCount or 1
			local nTotalCount = nCount * tbMaterial[i].nCount
			if ConsumeItem(3, nTotalCount, tbProp[1], tbProp[2], tbProp[3], -1) ~= 1 then
				Msg2Player(format("Khi tiªu hao %s ®· thÊt b¹i, xin h·y ®îi mét l¸t råi quay l¹i",tbMaterial[i].szName))
				return 0
			end
		end
	else
		local tbProp = tbMaterial.tbProp
		if ConsumeItem(3, nCount, tbProp[1], tbProp[2], tbProp[3], -1) ~= 1 then
			Msg2Player(format("Khi tiªu hao %s ®· thÊt b¹i, xin h·y ®îi mét l¸t råi quay l¹i",tbMaterial[i].szName))
			return 0
		end
	end
	return 1
end

function pActivity:CheckItemCount(nValue, nTarget)
	if nValue < nTarget then
		Say("Ng­¬i kh«ng ®ñ nguyªn liÖu, xin h·y chuÈn bÞ l¹i")
		return 0
	end
	return 1
end

-- ÉÏ½»Êé±¾³É¹¦ºóÏà¹Ø²Ù×÷
--function pActivity:DoHandInBook(nCount, nTaskId)
--	local nPreCount = self:GetTask(nTaskId)
--	local nNowCount = nPreCount + nCount
--	
--	if self:CheckFreeCell(nTaskId, nCount) ~= 1 then
--		return 
--	end
--	tbAwardTemplet:Give(%tbBookAward, nCount, {%szEventName, "SuDungCuonSachNhanVatPham"})
--	for key,value in %tbBookPartAward do
--		if key > nPreCount and key <= nNowCount then
--			tbAwardTemplet:Give(value, 1, {%szEventName,%tbBookPartAwardLog[key]})
--		end
--	end
--	self:AddTask(nTaskId, nCount)
--end

-- ÉÏ½»°×Ö½³É¹¦ºóÏà¹Ø²Ù×÷
function pActivity:DoHandInPaper(nCount, nTaskId)
	local tbExp = {{nExp_tl=1,nCount = 1000000,},}
	local nPreCount = self:GetTask(nTaskId)
	local nNowCount = nPreCount + nCount
	tbAwardTemplet:Give(tbExp, nCount, {%szEventName, "HandInPaper"})
	for key,value in %tbBaizhiPartLog do
		if key > nPreCount and key <= nNowCount then
			%tbLog:PlayerActionLog(%szEventName, value)
			tbVngTransLog:Write("201111_20Thang11/", 16, value, "N/A", 1)
		end
	end
	self:AddTask(nTaskId, nCount)
end

-- ÉÏ½»µÀ¾ß½×¶ÎÐÔ½±Àø
function pActivity:GiveAward(nTaskId, nCount)
	if nTaskId == %TSK_HandInBook then
		self:DoHandInBook(nCount, nTaskId)
	elseif nTaskId == %TSK_HandInPaper then
		self:DoHandInPaper(nCount, nTaskId)
	end
	
end

function pActivity:CheckFreeCell(nTaskId, nCount)
	if nTaskId == %TSK_HandInBook then
		local nFreeCount = nCount * 3 -- Ä®±±´«ËÍÁîÓÐ3ÕÅÇÒ²»¿Éµþ¼Ó
		if CalcFreeItemCellCount() < nFreeCount then
			Say(format("§Ó b¶o ®¶m an toµn tµi s¶n, xin h·y ®¶m b¶o hµnh trang cßn thõa %d « trèng.",nFreeCount))
			return 0
		end
	end
	return 1
end

-- È·¶¨ÉÏ½»µÀ¾ß
function pActivity:SureHandIn(tbMaterial, nTaskId, nCount)
	if nCount <= 0 then
		return 
	end	
	--KiÓm tra sè l­îng giao nép cã v­ît qu¸ giíi h¹n - Modified by DinhHQ - 20111101
	local nMaxCount = 0
	if nTaskId == %TSK_HandInBook then
		nMaxCount = %nMaxBookCount + self:GetTask(%TSK_UsedTianyuhun) * %nPerTianyuhun - self:GetTask(%TSK_HandInBook) - nCount
	elseif nTaskId == %TSK_HandInPaper then
		nMaxCount = %nMaxPaperCount + self:GetTask(%TSK_UsedZhienhua) * %nPerZhienhua - self:GetTask(%TSK_HandInPaper) - nCount
	end	
		
	if nMaxCount < 0 then
		Say("Sè l­îng v­ît qu¸ giíi h¹n, xin h·y nhËp sè kh¸c!")
		return 
	end
	
	local nItemCount = self:GetItemCount(tbMaterial)
	if self:CheckItemCount(nItemCount, nCount) ~= 1 then
		return
	end
	
	if self:CheckFreeCell(nTaskId, nCount) ~= 1 then
		return 
	end 
	
	if self:ConsumeItem(tbMaterial, nCount) ~= 1 then
		return 
	end
	
	self:GiveAward(nTaskId, nCount)
end

-- ÉÏ½»Êé±¾
--function pActivity:HandInBook()
--	print("Giao nép Cuèn S¸ch")
--	local tbBook = {
--		[1]={szName="Cuèn S¸ch",tbProp={6,1,3042,1,0,0},},	
--	}
--	local nMaxCount = %nMaxBookCount + self:GetTask(%TSK_UsedTianyuhun) * %nPerTianyuhun - self:GetTask(%TSK_HandInBook)
--	if nMaxCount < 1 then
--		Say("HiÖn t¹i sè lÇn giao nép cña ng­¬i ®· ®¹t ®Õn giíi h¹n cao nhÊt, kh«ng thÓ giao nép ®­îc n÷a")
--		return 
--	end
--	print("nMaxCount = " .. nMaxCount)
--	print("nMaxAskNumber" .. %nMaxAskNumber)
--	nMaxCount = min(%nMaxAskNumber, nMaxCount)
--	local nItemCount = self:GetItemCount(tbBook)
--	nMaxCount = min(nMaxCount, nItemCount)
--	if self:CheckItemCount(nMaxCount, 1) ~= 1 then
--		return
--	end
--	g_AskClientNumberEx(0,nMaxCount, format("NhËp sè (0-%d)", nMaxCount), {self.SureHandIn, {self,tbBook,%TSK_HandInBook}})
--end


-- ÉÏ½»°×Ö½
function pActivity:HandInPaper()
	local tbPape = {
		[1]={szName="GiÊy Tr¾ng",tbProp={6,1,3039,1,0,0},},	
	}
	local nMaxCount = %nMaxPaperCount + self:GetTask(%TSK_UsedZhienhua) * %nPerZhienhua - self:GetTask(%TSK_HandInPaper)
	if nMaxCount < 1 then
		Say("HiÖn t¹i sè lÇn giao nép cña ng­¬i ®· ®¹t ®Õn giíi h¹n cao nhÊt, kh«ng thÓ giao nép ®­îc n÷a")
		return 
	end
	nMaxCount = min(%nMaxAskNumber, nMaxCount)
	local nItemCount = self:GetItemCount(tbPape)	
	nMaxCount = min(nMaxCount, nItemCount)
	if self:CheckItemCount(nMaxCount, 1) ~= 1 then
		return
	end
	g_AskClientNumberEx(0,nMaxCount, format("NhËp sè (0-%d)", nMaxCount), {self.SureHandIn, {self,tbPape,%TSK_HandInPaper}})
end

-- ÁìÈ¡½ÌÊ¦½Ú¾­Ñé½±Àø
function pActivity:TeacherAward()
	local nStartTime = 20111120
	if tonumber(GetLocalDate("%Y%m%d")) ~= nStartTime then
		Say("ChØ cã thÓ vµo ngµy <color=yellow>  20/11/2011 <color> míi nhËn ®­îc phÇn th­ëng nµy, hiÖn t¹i kh«ng thÓ nhËn ®­îc")
		return 
	end
	local tbTeacherEXP = { {nExp_tl=1,nCount = 100000000,}, }
	local tbTranslog = {strFolder = "201111_20Thang11/", nPromID = 16, nResult = 1}
	tbAwardTemplet:Give(tbTeacherEXP,1,{%szEventName, "NhanPhanThuongTaiNPCDaiLaoSu", tbTranslog})
	self:AddTask(%TSK_TeacherAward, 1)
end

local tbJinwu = {
	[1]={szName="§å Phæ Kim ¤ Kh«i",tbProp={6,1,2982,1,0,0},},
	[2]={szName="§å Phæ Kim ¤ Y",tbProp={6,1,2983,1,0,0},},
	[3]={szName="§å Phæ Kim ¤ Hµi",tbProp={6,1,2984,1,0,0},},
	[4]={szName="§å Phæ Kim ¤ Yªu §¸i",tbProp={6,1,2985,1,0,0},},
	[5]={szName="§å Phæ Kim ¤ Hé UyÓn",tbProp={6,1,2986,1,0,0},},
	[6]={szName="§å Phæ Kim ¤ H¹ng Liªn",tbProp={6,1,2987,1,0,0},},
	[7]={szName="§å Phæ Kim ¤ Béi",tbProp={6,1,2988,1,0,0},},
}
-- ÁìÈ¡ÉÏ´ÎÊé±¾´ÎÊý³¬¹ý700Ê±µÄ½ðÎÚ½±Àø
function pActivity:JinwuAward()
	print("NhËn phÇn th­ëng ®å phæ Kim ¤")
	local szTitle = "Xin h·y lùa chän §å Phæ mµ ng­¬i muèn nhËn:"
	local tbOpt = {}
	for nIndex=1,getn(%tbJinwu) do
		tinsert(tbOpt, {%tbJinwu[nIndex].szName, self.SelectJinWu,{self, nIndex}})
	end
	tinsert(tbOpt, {"§Ó ta suy nghÜ l¹i ®·!", cancel})
	CreateNewSayEx(szTitle, tbOpt)
end

function pActivity:SelectJinWu(nIndex)
	local nFreeItemCellLimit = 1
	if CalcFreeItemCellCount() < nFreeItemCellLimit then
		Say(format("§Ó ®¶m b¶o an toµn cho tµi s¶n cña b¹n, xin h·y ®¶m b¶o r»ng Ýt nhÊt <color=yellow>%d <color> « trèng hµnh trang",nFreeItemCellLimit))
		return 
	end
	tbAwardTemplet:Give(%tbJinwu[nIndex], 1, {%szEventName, "SuDung700LanCuonSach_JinWu"})
	self:AddTask(%TSK_JinwuAward, 1)
end

function pActivity:UseZhienhua()
	local tbUseLog = {
		[10] = "SuDungHoaTriAn10Lan",
		[20] = "SuDungHoaTriAn20Lan",
		}
	self:AddTask(%TSK_UsedZhienhua,1)
	local nUseTime = self:GetTask(%TSK_UsedZhienhua)
	if tbUseLog[nUseTime] then
		%tbLog:PlayerActionLog(%szEventName, tbUseLog[nUseTime])
		tbVngTransLog:Write("201111_20Thang11/", 16, tbUseLog[nUseTime], "N/A", 1)
	end
	Msg2Player(format("Sö dông thµnh c«ng <color=yellow>%s<color>, nhËn ®­îc <color=yellow>%d<color> giao nép <color=yellow>%s<color> lÇn","Hoa Tri ¢n",%nPerZhienhua,"GiÊy Tr¾ng"))
end

function pActivity:UseTianyuhun()
	local tbUseLog = {
		[10] = "SuDungThienVuHon10Lan",
		[20] = "SuDungThienVuHon20Lan",
		}
	self:AddTask(%TSK_UsedTianyuhun,1)
	local nUseTime = self:GetTask(%TSK_UsedTianyuhun)
	if tbUseLog[nUseTime] then
		%tbLog:PlayerActionLog(%szEventName, tbUseLog[nUseTime])
		tbVngTransLog:Write("201111_20Thang11/", 16, tbUseLog[nUseTime], "N/A", 1)
	end
	Msg2Player(format("Sö dông thµnh c«ng <color=yellow>%s<color>, nhËn ®­îc <color=yellow>%d<color> giao nép <color=yellow>%s<color> lÇn","Thiªn Vò Hån",%nPerTianyuhun,"Cuèn S¸ch"))
end

function pActivity:CheckBookLimit()
	local nMaxCount = %nMaxBookCount + self:GetTask(%TSK_UsedTianyuhun) * %nPerTianyuhun - self:GetTask(%TSK_HandInBook)
	if nMaxCount < 1 then
		Say("§¹i hiÖp ®· sö dông tèi ®a vËt phÈm nµy, kh«ng thÓ sö dông thªm!")
		return nil
	end
	return 1
end

function pActivity:UseBook()
	self:AddTask(%TSK_HandInBook,1)	
	local tbTranslog = {strFolder = "201111_20Thang11/", nPromID = 16, nResult = 1}
	tbAwardTemplet:Give(%tbBookAward, nCount, {%szEventName, "SuDungCuonSachNhanVatPham", tbTranslog})
	local nUseTime = self:GetTask(%TSK_HandInBook)
	--print(nUseTime)
	if %tbBookPartAward[nUseTime] then
		tbAwardTemplet:Give(%tbBookPartAward[nUseTime], 1, {%szEventName,%tbBookPartAwardLog[nUseTime]})
		tbVngTransLog:Write("201111_20Thang11/", 16, %tbBookPartAwardLog[nUseTime], "N/A", 1)
	end	
end

pActivity.nPak = curpack()