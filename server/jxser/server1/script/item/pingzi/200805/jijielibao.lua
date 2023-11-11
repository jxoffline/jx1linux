Include("\\script\\lib\\awardtemplet.lua")
jijielibao_tbItemList =
{
	{szName="Kh¸nh chóc", tbProp={6, 1, 1752,1,0,0}},
	{szName="VLTK", tbProp={6, 1, 1753,1,0,0}},
	{szName="3", tbProp={6, 1, 1754,1,0,0}},
	{szName="Tuæi", tbProp={6, 1, 1755,1,0,0}},
	{szName="Phong", tbProp={6, 1, 1756,1,0,0}},
	{szName="Háa", tbProp={6, 1, 1757,1,0,0}},
	{szName="Liªn", tbProp={6, 1, 1758,1,0,0}},
	{szName="thµnh ", tbProp={6, 1, 1759,1,0,0}},
}
jijielibao_tbItemRate = 

{
	[1748] = {50,15,10,5,10,6,2,2},
	[1749] = {15,50,5,10,6,10,2,2},
	[1750] = {10,5,15,50,2,2,10,6},
	[1751] = {5,10,50,15,2,2,6,10},
}

function main(nItemIndex)
	
	local nItemData	= 20080713;	
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	local nLevel = GetLevel();
	if nDate > nItemData then
		Msg2Player("VËt phÈm qu¸ h¹n sö dông, tù ®éng mÊt ®i.")
		return 0;
	end
	
	local _, _, nId	= GetItemProp(nItemIndex);
	
	local tbItemList = jijielibao_tbItemList
	local tbItemRate = jijielibao_tbItemRate[nId]
	
	for i = 1, getn(tbItemList) do
		tbItemList[i].nRate = tbItemRate[i]
	end
	tbAwardTemplet:GiveAwardByList(tbItemList, "Tø Quý Hû Bao"..nId)
	return 0
end

function GetDesc(nItemIndex)
	local nYear		= 2008
	local nMonth	= 07
	local nDay		= 13
	if nYear == 0 and nMonth == 0 and nDay == 0 then
		return "<color=red>VËt phÈm nµy ®· qu¸ h¹n sö dông<color>"
	end
	return format("<color=green>Thêi h¹n sö dông: %d-%d-%d<color>",nDay, nMonth, nYear)
end