--ÔÆÓÎ ÏÉÓÎ



Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\event\\zhongqiu_jieri\\200808\\taskctrl.lua")

function main(nItemIndex)
	-- Hép V©n Du
	local tbItem = 
	{
	{szName="Lång ®Ìn b­¬m b­ím", tbProp={6, 1, 1796, 1, 0, 0}, nRate = 1},
	{szName="Lång ®Ìn ng«i sao", tbProp={6, 1, 1797, 1, 0, 0}, nRate = 33},
	{szName="Lång ®Ìn èng", tbProp={6, 1, 1798, 1, 0, 0}, nRate = 33},
	{szName="Lång ®Ìn trßn", tbProp={6, 1, 1799, 1, 0, 0}, nRate = 33},
	}
	-- Hép Tiªn Vò
	local tbItem2 = 
	{
	{szName="Lång ®Ìn b­¬m b­ím", tbProp={6, 1, 1796, 1, 0, 0}, nRate = 97},
	{szName="Lång ®Ìn ng«i sao", tbProp={6, 1, 1797, 1, 0, 0}, nRate = 1},
	{szName="Lång ®Ìn èng", tbProp={6, 1, 1798, 1, 0, 0}, nRate = 1},
	{szName="Lång ®Ìn trßn", tbProp={6, 1, 1799, 1, 0, 0}, nRate = 1},
	}
	
	zhongqiu0808_ResetTask()
	local nDate = tonumber(GetLocalDate("%y%m%d"))
	if nDate > zhongqiu0808_liheEndTime then
		Say("VËt phÈm nµy ®· qu¸ h¹n.",0)
		return 0;
	end
	if zhongqiu0808_PlayerLimit() ~= 1 then		
		Say("Yªu cÇu ®¨ng cÊp ph¶i trªn 50 vµ ®· qua n¹p thÎ.", 0)
		return 1
	end
	local nG, nD, nP = GetItemProp(nItemIndex)
	--local nCount = getn(tbItem)
	--if nP == 1795 then
		--for i=1, nCount do
			--tbItem[i].nRate =  (nCount - i + 1)*10
		--end
	--end
	
	if nP == 1794 then
		tbAwardTemplet:GiveAwardByList(tbItem, format("%s", GetItemName(nItemIndex)))
	elseif nP == 1795 then
		tbAwardTemplet:GiveAwardByList(tbItem2, format("%s", GetItemName(nItemIndex)))
	else
		return 1
	end		
end

