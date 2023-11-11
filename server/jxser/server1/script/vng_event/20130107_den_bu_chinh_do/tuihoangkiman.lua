Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\lib\\awardtemplet.lua")
local tbHKAList = {
	[1] = 
	{
		{szName="Hoµng Kim  n (C≠Íng h„a) c p 1",tbProp={0,3205},},
		{szName="Hoµng Kim  n (Nh≠Óc h„a) c p 1",tbProp={0,3215}},		
	},
	[2] = 
	{
		{szName="Hoµng Kim  n (C≠Íng h„a)  c p 2",tbProp={0,3206},},
		{szName="Hoµng Kim  n (Nh≠Óc h„a)  c p 2",tbProp={0,3216}},		
	},
	[3] = 
	{
		{szName="Hoµng Kim  n (C≠Íng h„a)  c p 3",tbProp={0,3207},},
		{szName="Hoµng Kim  n (Nh≠Óc h„a)  c p 3",tbProp={0,3217}},		
	},
	[4] = 
	{
		{szName="Hoµng Kim  n (C≠Íng h„a)  c p 4",tbProp={0,3208},},
		{szName="Hoµng Kim  n (Nh≠Óc h„a)  c p 4",tbProp={0,3218}},		
	},
	[5] = 
	{
		{szName="Hoµng Kim  n (C≠Íng h„a)  c p 5",tbProp={0,3209},},
		{szName="Hoµng Kim  n (Nh≠Óc h„a)  c p 5",tbProp={0,3219}},		
	},
	[6] = 
	{
		{szName="Hoµng Kim  n (C≠Íng h„a)  c p 6",tbProp={0,3210},},
		{szName="Hoµng Kim  n (Nh≠Óc h„a)  c p 6",tbProp={0,3220}},		
	},
	[7] = 
	{
		{szName="Hoµng Kim  n (C≠Íng h„a)  c p 7",tbProp={0,3211},},
		{szName="Hoµng Kim  n (Nh≠Óc h„a)  c p 7",tbProp={0,3221}},		
	},
	[8] = 
	{
		{szName="Hoµng Kim  n (C≠Íng h„a)  c p 8",tbProp={0,3212},},
		{szName="Hoµng Kim  n (Nh≠Óc h„a)  c p 8",tbProp={0,3222}},		
	},
	[9] = 
	{
		{szName="Hoµng Kim  n (C≠Íng h„a)  c p 9",tbProp={0,3213},},
		{szName="Hoµng Kim  n (Nh≠Óc h„a)  c p 9",tbProp={0,3223}},		
	},
	[10] = 
	{
		{szName="Hoµng Kim  n (C≠Íng h„a)  c p 10",tbProp={0,3214},},
		{szName="Hoµng Kim  n (Nh≠Óc h„a)  c p 10",tbProp={0,3224}},		
	},
}

function main(nIdx)
	local nItemLevel = tonumber(GetItemParam(nIdx, 1))	
	if not %tbHKAList[nItemLevel] then
		return 1
	end
	
	local tbTmp = %tbHKAList[nItemLevel]
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then	szNpcName = NpcName2Replace(szNpcName)end
	local tbMainDialog = DailogClass:new(szNpcName)
	for i = 1, getn(tbTmp) do
		tbMainDialog:AddOptEntry(format("%s", tbTmp[i].szName), PickItem, {nIdx, tbTmp[i]})
	end
	tbMainDialog.szTitleMsg = "Xin h∑y ch‰n loπi Hoµng Kim  n:"
	tbMainDialog:Show()
	return 1
end

function PickItem(nBoxIdx, tbSelectedItem)	
	local nItemBindState = tonumber(GetItemParam(nBoxIdx, 2))
	local nItemExpiredTime = tonumber(GetItemParam(nBoxIdx, 3))
	if CalcFreeItemCellCount() < 1 then
		Talk(1, "", "ß” b∂o Æ∂m tµi s∂n, xin vui lﬂng chıa ›t nh t 1 ´ trËng trong hµnh trang rÂi mÌi nhÀn th≠Îng.")
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
	tbAwardTemplet:Give(tb, 1, {"DenBuChinhDo", "SuDungHoangKimAnLeBao"})
end