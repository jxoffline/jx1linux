IncludeLib("ITEM")
Include("\\vng_script\\features\\upgrade_equip\\main.lua")


function tbVngUpgradeABDQ:ReleaseEquip(nCount)
	if (nCount ~= 1) then 
		Talk(1, "", "Mçi lÇn chØ cã thÓ ph©n gi¶i mét trang bÞ!!!")
		return
	end
	local nItemIndex = GetGiveItemUnit(nCount)	
	if self:CheckAll_DK_ReleaseEquip(nItemIndex) ~= 1 then
		return
	end
	local nCheckIndex =  self:Check_Index_ReleaseEquip(nItemIndex)
	if nCheckIndex == 0 then
		return Talk(1,"",format("HiÖn t¹i chç ta chØ ph©n gi¶i trang bÞ <color=yellow>An bang vµ §Þnh Quèc <color>th«i"))
	end
	RemoveItemByIndex(nItemIndex)
	tbAwardTemplet:Give(tbAward_ReleaseEquip[nCheckIndex],1,{self.EVENT_LOG_TITLE,"[PhanGiai]: ThanhCong"})
end
--kiem tra dk cua vat pham phan gia
function tbVngUpgradeABDQ:CheckAll_DK_ReleaseEquip(nItemIndex)
	local nG, nD, nP = GetItemProp(nItemIndex)
	local nQuality = GetItemQuality(nItemIndex)
	local nGoldeEquipIdx = GetGlodEqIndex(nItemIndex)
	
	--trang bi ton hai
	if (nG == 7) then 
		Talk(1,"","Trang bÞ tæn h¹i kh«ng thÓ ph©n gi¶i hay n©ng cÊp")
		return 0	
	end
	if (nGoldeEquipIdx <= 0) or (nQuality ~= 1) then 
		Talk(1,"","Trang bÞ kh«ng ph¶i hoµng kim kh«ng thÓ ph©n gi¶i hay n©ng cÊp")
		return 0	
	end
	--kiem tra dk khoa, co thoi han su dung
	if  ITEM_GetExpiredTime(nItemIndex) > 0 or GetItemBindState(nItemIndex) ~= 0 then
		Talk(1,"","Trang bÞ cã thêi h¹n sö dông hoÆc khãa vÜnh viÔn kh«ng thÓ ph©n gi¶i hay n©ng cÊp")
		return 0	
	end
	--kiem tra trang bi xep chong
	if IsItemStackable(nItemIndex) == 1 then
		Talk(1,"","Trang bÞ xÕp chång kh«ng thÓ ph©n gi¶i hay n©ng cÊp")
		return 0
	end
	if IsMyItem(nItemIndex) ~= 1 then
		Talk(1,"","ThËt thµ míi lµ ®øc tÝnh tèt!!!")
		return 0
	end
	return 1
end
--kiem tra id cua trang bi phan giai de trao lai nguyen lieu; nIndex = 1: trang bi hk thuong; 2: trang bi an bang hoan my
function tbVngUpgradeABDQ:Check_Index_ReleaseEquip(nItemIndex)
	local nGoldeEquipIdx = GetGlodEqIndex(nItemIndex)
	local nIndex = 0
	for k,v in self.tbEquip_Release do
		for i=1,getn(v) do
			if nGoldeEquipIdx == v[i].tbProp[2] then
				nIndex = k
				break
			end			
		end
	end
	return nIndex
end