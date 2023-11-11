Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\vng_lib\\extpoint.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\vng_event\\den_bu_event_thang6\\globalvar.lua")
function tbVngEventThang6Reward:isActive()
	local now = tonumber(GetLocalDate("%Y%m%d"));
	if (now >= self.nEndDay or now < self.nStartDay) then
		return 0;
	end
	return 1;
end

function tbVngEventThang6Reward:CreateDialog()
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	return DailogClass:new(szNpcName)
end

function tbVngEventThang6Reward:main()
do
	return
end
	local tbMainDialog = self:CreateDialog()
	tbMainDialog.szTitleMsg = "Xin chµo"
	if (tbExtPointLib:GetBitValue(self.nExtPointID, self.tbBit[1][1]) == 1 or tbExtPointLib:GetBitValue(self.nExtPointID, self.tbBit[1][2]) == 1 or tbExtPointLib:GetBitValue(self.nExtPointID, self.tbBit[1][3]) == 1) then
		tbMainDialog:AddOptEntry("NhËn phÇn th­ëng c©y thiªn tuÕ B¹ch Kim", tbVngEventThang6Reward.GetAward, {tbVngEventThang6Reward, 1, "DenBuCayThienTueBachKim"})
	end
	if (tbExtPointLib:GetBitValue(self.nExtPointID, self.tbBit[2][1]) == 1) then
		tbMainDialog:AddOptEntry("NhËn phÇn th­ëng c©y thiªn tuÕ BÊt Tö", tbVngEventThang6Reward.GetAward, {tbVngEventThang6Reward, 2, "DenBuCayThienTueBatTu"})
	end
	if (tbExtPointLib:GetBitValue(self.nExtPointID, self.tbBit[3][1]) == 1 or tbExtPointLib:GetBitValue(self.nExtPointID, self.tbBit[3][2]) == 1) then
		tbMainDialog:AddOptEntry("NhËn phÇn th­ëng c©y thiªn tuÕ NguyÖt ThÇn", tbVngEventThang6Reward.GetAward, {tbVngEventThang6Reward, 3, "DenBuCayThienTueNguyetThan"})
	end
	tbMainDialog:Show()
end

function tbVngEventThang6Reward:GetAward(nType, strLog)
do
	return
end
	if (CalcFreeItemCellCount() < 10) then
		Talk(1, "", "§Ó b¶o vÖ tµi s¶n, xin vui lßng chõa 10 « trèng trong hµnh trang råi míi sö dông vËt phÈm nµy!")
		return
	end
	local tbAward = {}
	local nCount = getn(self.tbBit[nType])
	local nAwardCount = 0
	for i = 1, nCount do
		nAwardCount = nAwardCount + (i * tbExtPointLib:GetBitValue(self.nExtPointID, self.tbBit[nType][i]))
		tbExtPointLib:SetBitValue(self.nExtPointID, self.tbBit[nType][i], 0)
	end
	local tbAward = self.tbAward[nType]
	if tbAward and nAwardCount > 0 then
		for i = 1, nAwardCount do
			tbAwardTemplet:Give(tbAward, 1, {"DenBuEventTrongCayThang6", self.tbLog[nType]})
		end
	end
end