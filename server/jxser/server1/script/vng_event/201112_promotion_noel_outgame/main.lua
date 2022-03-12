Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\vng_lib\\extpoint.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
tbNoelOnWeb = {
	nStartDate = 201112210000,
	nEndDate = 201201312400,
	nExtPointID = 6,
	tbLog = {"PromotionNoelQuaySoTrenWeb", "NhanThuongTaiLeQuan", {strFolder = "201112_NoelQuaySo/", nPromID = 21, nResult = 1}},
	tbBitTask = {
		nTaskID = 2917,
		nStartBit = 1,
		nBitCount = 12,
		nMaxValue = 2000,
	},
	nMaxExp = 2e9,
	tbAward = {
		[1] = {szName="Ngùa Phiªn Vò",tbProp={0,10,7,1,0,0},nCount=1, 
		nBitExtPoint = 1},
		[2] = {szName="Kim ¤ LÖnh",tbProp={6,1,2349,1,0,0},nCount=1, 
		nBitExtPoint = 2},
		[3] = {szName="Cµn Kh«n Song TuyÖt Béi",tbProp={6,1,2219,1,0,0},nCount=1,nExpiredTime=43200, 
		nBitExtPoint = 3},
		[4] = {szName = "100 triÖu ®iÓm kinh nghiÖm", nExp=100e6, 
		nBitExtPoint = 4},
		[5] = {szName = "30 triÖu ®iÓm kinh nghiÖm", nExp=30e6, 
		nBitExtPoint = 5},
	},
}

function tbNoelOnWeb:IsActive()
	local nCurDate = tonumber(date("%Y%m%d%H%S"))
	if nCurDate < self.nStartDate or nCurDate >= self.nEndDate then
		return nil
	end
	return 1
end

function tbNoelOnWeb:AddDialog()
	if not self:IsActive() then
		return
	end
	local pEventType = EventSys:GetType("AddNpcOption")
	nId = pEventType:Reg("LÔ Quan", "NhËn th­ëng quay sè Vui tÕt cïng Vâ L©m TruyÒn Kú", tbNoelOnWeb.Main,{tbNoelOnWeb})
end

function tbNoelOnWeb:Main()
	if not self:IsActive() then
		Talk(1, "", "HiÖn t¹i kh«ng ph¶i thêi gian nhËn th­ëng.")
		return
	end
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbMainDialog = DailogClass:new(szNpcName)
	local nFlag = 0
	local strTittle = "Ta phô tr¸ch trao phÇn th­ëng ch­¬ng tr×nh quay sè <color=yellow>Vui tÕt cïng Vâ L©m TruyÒn Kú<color>. Danh s¸ch phÇn th­ëng cña c¸c h¹ nh­ sau:\n\n"
	for i = 1, getn(self.tbAward) do
		local tb = self.tbAward[i]
		local nBit = tb.nBitExtPoint
		if tbExtPointLib:GetBitValue(self.nExtPointID, nBit) == 1 then
			nFlag = 1
			strTittle = strTittle..format("<color=yellow>\t\t\t\t%s<color>\n", tb.szName)
			tbMainDialog:AddOptEntry(format("NhËn phÇn th­ëng %s", tb.szName), tbNoelOnWeb.getAward, {tbNoelOnWeb, i})
		end
	end
	if nFlag == 0 then
		strTittle = strTittle..format("<color=yellow>\t\t\t\t%s<color>", "Kh«ng cã phÇn th­ëng nµo")
	end
	tbMainDialog.szTitleMsg = strTittle	
	tbMainDialog:Show()
end

function tbNoelOnWeb:getAward(nAwardID)
	local tb = self.tbAward[nAwardID]
	if not tb then return end
	local nBit = tb.nBitExtPoint
	if tbExtPointLib:GetBitValue(self.nExtPointID, nBit) ~= 1 then
		Talk(1, "", "C¸c h¹ kh«ng tróng phÇn th­ëng nµy.")
		return
	end
	if nAwardID == 1 then
		if CountFreeRoomByWH(2, 3, 1) < 1 then
			Talk(1, "", "§Ó tr¸nh mÊt m¸t tµi s¶n, xin h·y chõa 1 2x3 «  trèng trong hµnh trang råi míi nhËn th­ëng.")
			return
		end
	elseif nAwardID == 2 or nAwardID == 3 then
		if CalcFreeItemCellCount() < 1 then
			Talk(1, "", "§Ó tr¸nh mÊt m¸t tµi s¶n, xin h·y chõa 1 «  trèng trong hµnh trang råi míi nhËn th­ëng.")
			return
		end
	end
	if tbExtPointLib:SetBitValue(self.nExtPointID, nBit, 0) ~= 1 then
		Talk(1, "", "NhËn th­ëng kh«ng thµnh c«ng, xin h·y liªn hÖ ban ®iÒu hµnh cña trß ch¬i ®Ó ®­îc gi¶i quyÕt.")
			return
	end
	if nAwardID == 4 or nAwardID == 5 then
		local nAddExp = tb.nExp
		local nTskExp = tbVNG_BitTask_Lib:getBitTask(self.tbBitTask)*1e6
		if nTskExp + nAddExp > self.nMaxExp then
			nAddExp = self.nMaxExp - nTskExp
			Msg2Player(format("Kinh nghiÖm v­ît qu¸ giíi h¹n ch­¬ng tr×nh, chØ nhËn ®­îc %d ®iÓm kinh nghiÖm.", nAddExp))			
		end
		tbVNG_BitTask_Lib:addTask(self.tbBitTask, floor(nAddExp/1e6))		
		tb = {nExp = nAddExp}
	end
	tbAwardTemplet:Give(tb, 1, self.tbLog)
end

if tbNoelOnWeb:IsActive() then
	tbNoelOnWeb:AddDialog()
end