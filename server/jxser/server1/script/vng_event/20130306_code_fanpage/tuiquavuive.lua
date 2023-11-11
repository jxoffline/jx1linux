Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\lib\\awardtemplet.lua")

local tbItemList = {
	[1] = 
	{
		{szName="Ch©n Nguyªn §¬n (®¹i)",tbProp={6,1,30229,1,0,0},nCount=200,nBindState=-2},
		{szName = "1200000000 ®iÓm kinh nghiÖm kh«ng céng dån", nExp=1200000000},
		{szName="Long §¶m",tbProp={0,3499},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080,},
		{szName="Cuång Lan",tbProp={0,3501},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080,},
		{szName="MÆt n¹ - Anh hïng chiÕn tr­êng",tbProp={0,11,482,1,0,0},nCount=1, nBindState=-2, nExpiredTime=20160},
	},	
}

tbBIT_USE_COUNT_LIMIT = {nTaskID = 2982,nStartBit = 26,nBitCount = 1,nMaxValue = 1}

function main(nIdx)
	local nItemLevel = tonumber(GetItemParam(nIdx, 1))	
	if not %tbItemList[nItemLevel] then
		return 1
	end
	
	local tbTmp = %tbItemList[nItemLevel]
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then	szNpcName = NpcName2Replace(szNpcName)end
	local tbMainDialog = DailogClass:new(szNpcName)
	for i = 1, getn(tbTmp) do
		tbMainDialog:AddOptEntry(format("%s", tbTmp[i].szName), PickItem, {nIdx, tbTmp[i]})
	end
	tbMainDialog.szTitleMsg = "Xin h·y chän phÇn th­ëng:"
	tbMainDialog:Show()
	return 1
end

function PickItem(nBoxIdx, tbSelectedItem)
	local nCheckMap = DynamicExecuteByPlayer(PlayerIndex, "\\script\\vng_feature\\checkinmap.lua", "PlayerFunLib:VnCheckInCity", "default")
	if nCheckMap ~= 1 then
		return
	end
	
	if DynamicExecuteByPlayer(PlayerIndex, "\\script\\vng_lib\\bittask_lib.lua", "tbVNG_BitTask_Lib:getBitTask", tbBIT_USE_COUNT_LIMIT) == 1 then
		Talk(1, "", "Mçi tµi kho¶n chØ cã thÓ sö dông vËt phÈm nµy 1 lÇn.")
		return
	end
	
	if CalcFreeItemCellCount() < 1 then
		Talk(1, "", "§Ó b¶o ®¶m tµi s¶n, xin vui lßng chõa Ýt nhÊt 1 « trèng trong hµnh trang råi míi nhËn th­ëng.")
		return
	end
	if IsMyItem(nBoxIdx) ~= 1 then
		return
	end
	if RemoveItemByIndex(nBoxIdx) ~= 1 then
		return
	end
	DynamicExecuteByPlayer(PlayerIndex, "\\script\\vng_lib\\bittask_lib.lua", "tbVNG_BitTask_Lib:setBitTask", tbBIT_USE_COUNT_LIMIT, 1)
	tbAwardTemplet:Give(tbSelectedItem, 1, {"CodeFaceBook", "SuDungTuiQuaVuiVe"})
end