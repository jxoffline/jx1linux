Include("\\script\\activitysys\\config\\11\\head.lua")
Include("\\script\\activitysys\\config\\11\\variables.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\config\\11\\award.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\droptemplet.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\lib\\log.lua")


function pActivity:DropMaterialBagInRandom(nNpcIndex)
	tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex, %tbKillMonstorAward, "Drop Material Bag", 1)
end

function pActivity:CheckTowTask(nIdxTask1, nIdxTask2, szFailMsg, szOption)
	local nValue1 = self:GetTask(nIdxTask1)
	local nValue2 = self:GetTask(nIdxTask2)
	
	if lib:OptionFunction(nValue1, nValue2, szOption) then
		return 1
	else
		szFailMsg = format(szFailMsg, nValue)
		lib:ShowMessage(szFailMsg)
	end
	
end

function pActivity:UseMaterialBag()
	
	tbAwardTemplet:Give(%tbMaterialBagAward, 1, {%EVENT_LOG_TITLE, "Use Material Bag"})
	
end

function pActivity:UseNewUniform()
	
	self:AddTask(%nIdx_USED_NEW_UNIFORM_COUNT,1)
	
	tbAwardTemplet:Give(%tbNewUniformAward, 1, {%EVENT_LOG_TITLE, "SuDungChiecAoLinhMoi"})

	
end

function pActivity:NewUniformExtraAward()
	
	local nUsedCount = self:GetTask(%nIdx_USED_NEW_UNIFORM_COUNT)

	if %tbNewUniformExtraAward[nUsedCount] then
		local szAction = format("SuDungChiecAoLinhMoi%dLan", nUsedCount)
		local szMsg = format("Ng­¬i ®· sö dông %s%d lÇn, nhËn ®­îc phÇn th­ëng v­ît møc.",%tbITEM_NEW_UNIFORM.szName, nUsedCount)
		Msg2Player(szMsg)
		tbAwardTemplet:Give(%tbNewUniformExtraAward[nUsedCount], 1, {%EVENT_LOG_TITLE, szAction})
	end
	
	
end

function pActivity:UsePatchedUniform()
	
	tbAwardTemplet:Give(%tbPatchedUniformAward, 1)
	self:AddTask(%nIdx_USED_PATCHED_UNIFORM_COUNT, 1)
	
	local nUsedCount = self:GetTask(%nIdx_USED_PATCHED_UNIFORM_COUNT)
	if %tbPatchedUniformLog[nUsedCount] then
		local szAction = format("SuDung%dLanAoLinhDaSua", nUsedCount)
		%tbLog:PlayerAwardLog(%EVENT_LOG_TITLE, szAction)
	end
	
end

function pActivity:UseJade()
	self:AddTask(%nIdx_MAX_NEW_UNIFORM_CAN_USE, %nJADE_INCREASE_MAX_COUNT)
	self:AddTask(%nIdx_USED_JADE_COUNT,1)
	
	local szMsg = format("Ng­¬i sö dông %s t¨ng thªm giíi h¹n %d lÇn.", %tbITEM_NEW_UNIFORM.szName, %nJADE_INCREASE_MAX_COUNT)
	Msg2Player(szMsg)
	
end

pActivity.tbCompose = {}

function pActivity:InitFormula()
	
	self.tbCompose = {}
	
	local tbMaterial = 
	{
		[1] = {szName=%tbITEM_CLOTH.szName, tbProp=%tbITEM_CLOTH.tbProp, nExpiredTime=%tbITEM_CLOTH.nExpiredTime, nCount=10},
		[2] = {szName=%tbITEM_BUTTONHOLE.szName, tbProp=%tbITEM_BUTTONHOLE.tbProp, nExpiredTime=%tbITEM_BUTTONHOLE.nExpiredTime, nCount=10},
		[3] = {szName=%tbITEM_TATTERED_UNIFORM.szName, tbProp=%tbITEM_TATTERED_UNIFORM.tbProp, nExpiredTime=%tbITEM_TATTERED_UNIFORM.nExpiredTime, nCount=10},
	}
	local tbGold = 
	{
		[1] = {szName="Ng©n l­îng", nJxb=30000, nCount=1},
		[2] = {szName="Ng©n l­îng", nJxb=60000, nCount=1},
		[3] = {szName="Ng©n l­îng", nJxb=100000, nCount=1},
	}
	local nFactor = getn(tbGold)
	
	for i=1, getn(tbGold) do
		for j=1, getn(tbMaterial) do
			local tbFormula = 
			{
				nWidth = 1,
				nHeight = 1,
				nFreeItemCellLimit = 0.02,
				tbProduct = %tbITEM_GREEN_CLOTH,
			}
			
			tbFormula.tbMaterial = {}
			tinsert(tbFormula.tbMaterial, tbMaterial[j])
			tinsert(tbFormula.tbMaterial, tbGold[i])
			tbFormula.nTaskIdx = %nIdx_DAILY_EXCHANGE_COUNT[i]
			tbFormula.pProductFun = function(pCompose, nCount)
				%self:AddTaskDaily(pCompose.nTaskIdx, nCount)
			end
			
			local pCompose = tbActivityCompose:new(tbFormula, "DoiManhVaiMauXanhLa", INVENTORY_ROOM.room_equipment)
			
			tinsert(self.tbCompose, (i - 1)*nFactor + j, pCompose)
		end
	end

end

function pActivity:SelectMaterialDlg(nGoldSelect)
	local szTitle = format("Xin h·y lùa chän ®æi<color=green>%s<color> nguyªn liÖu", %tbITEM_GREEN_CLOTH.szName)
	local tbOpt = 
	{
		[1] = {%tbITEM_CLOTH.szName, self.Exchange, {self, nGoldSelect, 1}},
		[2] = {%tbITEM_BUTTONHOLE.szName, self.Exchange, {self, nGoldSelect, 2}},
		[3] = {%tbITEM_TATTERED_UNIFORM.szName, self.Exchange, {self, nGoldSelect, 3}},
		[4] = {"Trë l¹i", self.SelectGoldDlg, {self}},
		
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function pActivity:SelectGoldDlg()
	local szTitle = format("Xin h·y lùa chän c¸ch <color=green>%s<color> ®æi:\n", %tbITEM_GREEN_CLOTH.szName)
	local tbText = {}
	local szGold = "%d v¹n l­îng"
	local szOptText = "C¸ch thøc%d\t"
	for i=1,3 do
		if i < 3 then
			tbText[i] = format("Mçi ngµy nhiÒu nhÊt ®æi%d lÇn", %nMAX_COMPOSE_COUNT[i])
		else
			tbText[i] = "Kh«ng giíi h¹n sè lÇn ®æi"
		end
		tbText[i] = format(szGold.."(%s)",%tbGOLD_COUNT[i]/10000, tbText[i])
		
		szTitle = format("%s c¸ch thøc%d\t nguyªn liÖu +%s;\n", szTitle, i, tbText[i])

	end

	local tbOpt =
	{
		[1] = {format(szOptText..szGold, 1, %tbGOLD_COUNT[1]/10000), self.SelectMaterialDlg, {self, 1}},
		[2] = {format(szOptText..szGold, 2, %tbGOLD_COUNT[2]/10000), self.SelectMaterialDlg, {self, 2}},
		[3] = {format(szOptText..szGold, 3, %tbGOLD_COUNT[3]/10000), self.SelectMaterialDlg, {self, 3}},
		[4] = {"Rêi khái", cancel},
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function pActivity:Exchange(nGoldSelect, nMaterialSelect)
	
	local nKey = (nGoldSelect - 1) * 3 + nMaterialSelect
	
	local nTaskIdx = %nIdx_DAILY_EXCHANGE_COUNT[nGoldSelect]
	local nMaxCount = %nMAX_COMPOSE_COUNT[nGoldSelect]
	
	if nGoldSelect == 3 then
		nMaxCount = %nMAX_INPUT
	else
		nMaxCount = nMaxCount - self:GetTaskDaily(nTaskIdx)
	end

	if nMaxCount <= 0 then
		local szText = format("Ng­¬i th«ng qua h×nh thøc ®æi<color=green>%s<color> sè l­îng ®· ®¹t ®Õn giíi h¹n, xin h·y thö c¸ch kh¸c.", %tbITEM_GREEN_CLOTH.szName)
		Say(szText)
		return
	end
	self.tbCompose[nKey]:ComposeDailog(1, nMaxCount)
	
end

function pActivity:UseNewUniformExp()	
	self:AddTask(%nIdx_USED_NEW_UNIFORM_COUNT,1)	
	tbAwardTemplet:Give(%tbNewUniformAwardExp, 1, {%EVENT_LOG_TITLE, "SuDungChiecAoLinhMoi(Exp)"})	
end

function pActivity:NewUniformExpExtraAward()	
	local nUsedCount = self:GetTask(%nIdx_USED_NEW_UNIFORM_COUNT)
	if %tbNewUniformExtraAward[nUsedCount] then
		local szAction = format("SuDungChiecAoLinhMoi(Exp)%dLan", nUsedCount)
		local szMsg = format("Ng­¬i ®· sö dông %s%d lÇn, nhËn ®­îc phÇn th­ëng v­ît møc.",%tbITEM_NEW_UNIFORM_EXP.szName, nUsedCount)
		Msg2Player(szMsg)
		tbAwardTemplet:Give(%tbNewUniformExtraAward[nUsedCount], 1, {%EVENT_LOG_TITLE, szAction})
	end	
end