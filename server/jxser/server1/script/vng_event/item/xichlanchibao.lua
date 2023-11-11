Include("\\script\\vng_feature\\getgoldequip.lua")
tbParam2EquipType = {
	[1] = 0,
	[2] = 1,	
	[3] = 2,
	[4] = 3,
	[5] = 4,
	[6] = 5,
	[7] = 6,
	[8] = 7,
	[9] = 8,
	[10] = 9,
	[11] = 10,
	[12] = 0,
	[13] = 1,
	[14] = 2,
	[15] = 3,
	[16] = 4,
	[17] = 5,
	[18] = 6,
	[19] = 7,
	[20] = 8,
	[21] = 9,
	[22] = 10,
}

tbExclusion_List = {
	[1] = {{7}, "Trı vÚ kh›"}, --exclude weapon
	[2] = {{6}, "Trı ∏o"}, --exclude Armour
	[3] = {{6, 7}, "Trı ∏o vµ vÚ kh›"}, --exclude weapon and armour
}

tbFactionList = {
	[1] = "M´n ph∏i Thi’u L©m",
	[2] = "M´n ph∏i Thi™n V≠¨ng",
	[3] = "M´n ph∏i ß≠Íng M´n",
	[4] = "M´n ph∏i NgÚ ßÈc",
	[5] = "M´n ph∏i Nga My",
	[6] = "M´n ph∏i ThÛy Y™n",
	[7] = "M´n ph∏i C∏i Bang",
	[8] = "M´n ph∏i Thi™n Nh…n",
	[9] = "M´n ph∏i V‚ ßang",
	[10] = "M´n ph∏i C´n L´n",
}

PARAM_EQUIP_TYPE = 1
PARAM_BIND_STATE = 2
PARAM_EXPIRED_TIME = 3
PARAM_EQUIP_EXCLUSION_IDX = 4
PARAM_FACTION = 5 --start from shaolin, value = 1

function main(nItemIdx)
	--get item type (armour, boots,....)
	local n_param = tonumber(GetItemParam(nItemIdx, PARAM_EQUIP_TYPE ))
	local tb = {nSpecificItem = tbParam2EquipType[n_param], nItem2Consume = nItemIdx}
	tb.tbLog={"XichLanChiBao","SuDungXichLanChiBao"}
	--get item bind state
	local n_bindstate = tonumber(GetItemParam(nItemIdx, PARAM_BIND_STATE))
	if n_bindstate == 1 then
		tb.nBindState = -2
	end
	--get item expiration
	local n_expiredtime = tonumber(GetItemParam(nItemIdx, PARAM_EXPIRED_TIME))
	if n_expiredtime > 0 then
		tb.nExpiredTime = n_expiredtime
	end
	--get faction
	local n_faction = tonumber(GetItemParam(nItemIdx, PARAM_FACTION))
	if n_faction > 0 then
		tb.nFaction = n_faction - 1
	end
	--get exclusion equips
	local n_exclude = tonumber(GetItemParam(nItemIdx, PARAM_EQUIP_EXCLUSION_IDX))
	if tbExclusion_List[n_exclude] then
		tb.tbExclude = tbExclusion_List[n_exclude][1]
	end
	if n_param <= 0 then
		return
	elseif n_param >= 1 and n_param <= 11 then
		tbVNGetGoldEquip:ShowEquipBranchDialog(10,tb)
	elseif n_param >= 12 and n_param <= 22 then
		tbVNGetGoldEquip:ShowEquipBranchDialog(11,tb)
	end	
	return 1
end

function GetDesc(nItem)	
	local szDesc = ""
	local n_param = tonumber(GetItemParam( nItem, 1 ))
	local tbItemName = 
	{
		[0]= "",
		[1] = "X›ch L©n Hπng Li™n - %s",
		[2] = "X›ch L©n Ph∏t Qu∏n - %s",		
		[3] = "X›ch L©n Th≠Óng GiÌi Chÿ - %s",
		[4] = "X›ch L©n HÈ Uy”n - %s",
		[5] = "X›ch L©n Y™u ß∏i - %s",
		[6] = "X›ch L©n Kim Kh∂i - %s",
		[7] = "X›ch L©n Kh› GiÌi - %s",
		[8] = "X›ch L©n Hµi - %s",
		[9] = "X›ch L©n Ng‰c BÈi - %s",
		[10] = "X›ch L©n Hπ GiÌi Chÿ - %s",
		[11] = "BÈ trang bﬁ X›ch L©n - %s",
		[12] = "X›ch L©n Hπng Li™n (Max Option) - %s",
		[13] = "X›ch L©n Ph∏t Qu∏n (Max Option) - %s",
		[14] = "X›ch L©n Th≠Óng GiÌi Chÿ (Max Option) - %s",
		[15] = "X›ch L©n HÈ Uy”n (Max Option) - %s",
		[16] = "X›ch L©n Y™u ß∏i (Max Option) - %s",
		[17] = "X›ch L©n Kim Kh∂i (Max Option) - %s",
		[18] = "X›ch L©n Kh› GiÌi (Max Option) - %s",
		[19] = "X›ch L©n Hµi (Max Option) - %s",
		[20] = "X›ch L©n Ng‰c BÈi (Max Option) - %s",
		[21] = "X›ch L©n Hπ GiÌi Chÿ (Max Option) - %s",
		[22] = "BÈ trang bﬁ X›ch L©n (Max Option) - %s",
	}
	local strItemName = ""
	local n_faction = tonumber(GetItemParam(nItem, 5))
	if n_faction > 0 then
		strItemName = format(tbItemName[n_param], tbFactionList[n_faction])
	else
		strItemName = format(tbItemName[n_param], "T˘ ch‰n h÷ ph∏i")
	end
	local n_bindstate = tonumber(GetItemParam(nItem, 2))	
	strBind = ""
	if n_bindstate == 1 then
		strBind = "(kh„a v‹nh vi‘n)"	
	end
	local n_exclude = tonumber(GetItemParam(nItem, 4))	
	local strExclude = ""
	if tbExclusion_List[n_exclude] then
		strExclude = tbExclusion_List[n_exclude][2]
	end	
	szDesc = szDesc..format("<color=yellow>%s %s<enter>%s<color>", strItemName, strBind, strExclude);
	return szDesc;
end