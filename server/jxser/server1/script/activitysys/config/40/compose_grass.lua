-- ÎÄ¼þÃû¡¡£ºcompose_grass.lua
-- ´´½¨Õß¡¡£ºwangjingjun
-- ÄÚÈÝ¡¡¡¡£ºÓÃ¸÷ÖÖÃµ¹å»¨¶Ò»»ÂÌ²Ý
-- ´´½¨Ê±¼ä£º2012-02-15 15:00:45

Include("\\script\\lib\\composeex.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\activitysys\\config\\40\\head.lua")
Include("\\script\\activitysys\\config\\40\\variables.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

tbFormulaList = {
	nWidth = 1,
	nHeight = 1,
	nFreeItemCellLimit = 0.02,
	
	tbProduct = {szName="Cá Xanh",tbProp={6,1,3124,1,0,0},nExpiredTime=20120401,},
}

tbMaterial_Rose = {
	[1]={szName="Hoa Hång Tr¾ng",tbProp={6,1,3117,1,0,0}, nCount=50,},
	[2]={szName="Hoa Hång Vµng",tbProp={6,1,3119,1,0,0}, nCount=50,},
	[3]={szName="Hoa Hång Xanh",tbProp={6,1,3118,1,0,0}, nCount=50,},
	[4]={szName="Hoa hång ®á",tbProp={6,1,3120,1,0,0}, nCount=50,},
	}

tbMaterial_Jxb = {
	[1]={szName="Ng©n l­îng",nJxb=300000, nCount = 1,},
	[2]={szName="Ng©n l­îng",nJxb=600000, nCount = 1,},
	[3]={szName="Ng©n l­îng",nJxb=1000000, nCount = 1,},
	}	
	
tbSelectMoney = {
	[1] = "3 v¹n l­îng",
	[2] = "6 v¹n l­îng",
	[3] = "10 v¹n l­îng",
	}	

pActivity.tbCompose = {}
function pActivity:composegrassdialog()
	
	local nSelectCount = getn(%tbSelectMoney)
	local szTitle = format("§æi Cá Xanh cã %d lo¹i h×nh thøc", nSelectCount)
	for i=1, nSelectCount do
		szTitle = format("%s, lo¹i thø %d yªu cÇu %s", szTitle, i, %tbSelectMoney[i])
		if i ~= nSelectCount then
			szTitle = format("%s, mçi ngµy ®æi nhiÒu nhÊt %d lÇn", szTitle, %MAX_TB_DAILY_COMPOSE_GRASS[i])
		else
			szTitle = format("%s, ph­¬ng ph¸p nµy kh«ng h¹n chÕ sè lÇn ®æi", szTitle)	
		end
	end
	
	local tbOpt = {}
	for i=1, nSelectCount do
		tinsert(tbOpt, {%tbSelectMoney[i], self.selectrose, {self, i}})
	end
	tinsert(tbOpt, {"Rêi khái", cancel})
	
	CreateNewSayEx(szTitle, tbOpt)
end

function pActivity:selectrose(nMoneyIndex)
	
	local nSelectCount = getn(%tbMaterial_Rose)
	local szTitle = "Xin h·y lù chän lo¹i Hoa Hång muèn ®æi"

	local tbOpt = {}
	for i=1, nSelectCount do
		tinsert(tbOpt, {%tbMaterial_Rose[i].szName, self.tocompose, {self, nMoneyIndex,i}})
	end
	tinsert(tbOpt, {"Trë l¹i", self.composegrassdialog, {self}})
	
	CreateNewSayEx(szTitle, tbOpt)
end

function pActivity:InitCompose()
	self.tbCompose = {}
	
	for i=1,getn(%tbMaterial_Jxb) do
		tbCompose = {}
		for j=1,getn(%tbMaterial_Rose) do
		
			local tbFormulaList = {
				nWidth = 1,
				nHeight = 1,
				nFreeItemCellLimit = 0.02,
				tbProduct = {szName="Cá Xanh",tbProp={6,1,3124,1,0,0},nCount=10, nExpiredTime=20120401,},
			}
			
			tbFormulaList.tbMaterial = {}
			tinsert(tbFormulaList.tbMaterial, %tbMaterial_Rose[j])
			tinsert(tbFormulaList.tbMaterial, %tbMaterial_Jxb[i])
			
			local nTskIndex = %TSK_TB_DAILY_COMPOSE_GRASS[i]
			tbFormulaList.nTskIndex = nTskIndex
			tbFormulaList.pProductFun = function(pCompose, nComposeCount)
				--%self:AddTask(pCompose.nTskIndex, nComposeCount)
				%self:AddTaskDaily(pCompose.nTskIndex, nComposeCount)
			end
			
			p = tbActivityCompose:new(tbFormulaList, %ACTION_COMPOSE_GRASS, INVENTORY_ROOM.room_equipment)
			tinsert(tbCompose, j, p)
		end
		tinsert(self.tbCompose, i, tbCompose)
	end

end

function pActivity:tocompose(nMoneyIndex, nRoseIndex)

	local nTskIndex = %TSK_TB_DAILY_COMPOSE_GRASS[nMoneyIndex]
	local nMaxCount = %MAX_TB_DAILY_COMPOSE_GRASS[nMoneyIndex]
	-- µÚÒ»ºÍµÚ¶þÖÖ¶Ò»»·½Ê½ÓÐ×î´ó´ÎÊýÏÞÖÆ
	if nMoneyIndex < getn(%tbMaterial_Jxb) then
	 	--nMaxCount = nMaxCount - self:GetTask(nTskIndex)
	 	nMaxCount = nMaxCount - self:GetTaskDaily(nTskIndex)
	end
	
	if nMaxCount <= 0 then
		Say("Th«ng qua c¸ch nµy ng­¬i ®· ®æi Cá Xanh ®¹t ®Õn giíi h¹n, xin h·y thö c¸ch kh¸c xem sao!")
		return
	end
	local bAskNumber = 1
	--self.tbCompose[nMoneyIndex][nRoseIndex]:ComposeDailog(bAskNumber, nMaxCount)
	self.tbCompose[nMoneyIndex][nRoseIndex]:ComposeDailog(0)
end
