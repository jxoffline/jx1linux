Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\lib\\awardtemplet.lua")
local tbPhiPhongList = {
	[5] = 
	{
		{szName="Phi phong Kinh L«i (DÞch chuyÓn tøc thêi)",tbProp={0,3470},},
		{szName="Phi phong Kinh L«i (X¸c suÊt hãa gi¶i s¸t th­¬ng)",tbProp={0,3471}},
		{szName="Phi phong Kinh L«i ( Träng kÝch )",tbProp={0,3472},},
	},
	[6] = 
	{
		{szName="Phi phong Ngù Phong (DÞch chuyÓn tøc thêi )",tbProp={0,3473},},
		{szName="Phi phong Ngù Phong (X¸c suÊt hãa gi¶i s¸t th­¬ng)",tbProp={0,3474},},
		{szName="Phi phong Ngù Phong (Träng kÝch)",tbProp={0,3475}},
	},	
	[7] = 
	{
		{szName="Phi Phong PhÖ Quang ( dÞch chuyÓn tøc thêi)",tbProp={0,3476},},
		{szName="Phi Phong CÊp PhÖ Quang (hãa gi¶i s¸t th­¬ng)",tbProp={0,3477},},
		{szName="Phi Phong PhÖ Quang ( träng kÝch)",tbProp={0,3478},},
	},
}

function main(nIdx)
	local nItemLevel = tonumber(GetItemParam(nIdx, 1))	
	if not %tbPhiPhongList[nItemLevel] then
		return 1
	end
	
	local tbTmp = %tbPhiPhongList[nItemLevel]
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then	szNpcName = NpcName2Replace(szNpcName)end
	local tbMainDialog = DailogClass:new(szNpcName)
	for i = 1, getn(tbTmp) do
		tbMainDialog:AddOptEntry(format("%s", tbTmp[i].szName), PickItem, {nIdx, tbTmp[i]})
	end
	tbMainDialog.szTitleMsg = "Xin h·y chän lo¹i Phi Phong:"
	tbMainDialog:Show()
	return 1
end

function PickItem(nBoxIdx, tbSelectedItem)	
	local nItemBindState = tonumber(GetItemParam(nBoxIdx, 2))
	local nItemExpiredTime = tonumber(GetItemParam(nBoxIdx, 3))
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
	local tb = {}
	tb.szName = tbSelectedItem.szName
	tb.tbProp = tbSelectedItem.tbProp
	if nItemBindState == 1 then
		tb.nBindState = -2
	end
	if nItemExpiredTime >= 0 then
		tb.nExpiredTime = nItemExpiredTime
	end
	tb.nCount=1
	tb.nQuality = 1
	tbAwardTemplet:Give(tb, 1, {"DenBuChinhDo", "SuDungPhiPhongLeBao"})
end