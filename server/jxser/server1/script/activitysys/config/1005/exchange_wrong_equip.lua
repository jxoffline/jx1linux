Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\activitysys\\config\\1005\\variables.lua")
tbExchangeWrongEquip = {}
tbExchangeWrongEquip.nStartIdx = 1425
tbExchangeWrongEquip.nEndIdx = 1514
tbExchangeWrongEquip.tbBitTask = tbBITTASK_EXCHANGE_WRONG_EQUIP
function tbExchangeWrongEquip:GetGoldEquipListInRoom()
	local tbRoomItems = GetRoomItems(0)
	local tb = {}
	if getn(tbRoomItems) <= 0 then
		Talk(1, "", "R­¬ng hµnh trang trèng, xin h·y kiÓm tra l¹i")
		return
	end
	local nItemIdx
	for i=1, getn(tbRoomItems) do
		nItemIdx = tbRoomItems[i]
		if nItemIdx > 0 and GetItemQuality(nItemIdx) == 1 then
			nItemEqIdx = GetGlodEqIndex(nItemIdx)
			if GetItemBindState(nItemIdx) == -2 and nItemEqIdx >= self.nStartIdx and nItemEqIdx <= self.nEndIdx then
				if not tb[nItemEqIdx] then
					tb[nItemEqIdx] = nItemIdx
				end
			end
		end
	end
	
	self:CheckItems(tb)
end

function tbExchangeWrongEquip:CheckItems(tb)
	local nFoundIDX = 0
	for i = 0, 8 do
		local nTempIDX = self.nStartIdx + i * 10
		if tb[nTempIDX] then
			nFoundIDX = nTempIDX
			break;
		end
	end
	if nFoundIDX == 0 then
		Talk(1, "", "Kh«ng cã trang bÞ thÝch hîp ®Ó ®æi")
		return
	end
	local tbEq2Consume = {}
	for i = 0, 9 do
		if tb[nFoundIDX+i] then
			tinsert(tbEq2Consume, tb[nFoundIDX+i])
		else
			Talk(1, "", "Xin h·y ®Æt c¶ bé trang bÞ cÇn ®æi vµo r­¬ng hµnh trang råi thö l¹i")
			return
		end
	end
	if getn(tbEq2Consume) < 10 then
		return
	end
	local tbOpt = {}
	local strTittle = "C¸c trang bÞ sau sÏ bÞ thu håi, xin h·y kiÓm tra kü l¹i:\n"
	for i = 1, getn(tbEq2Consume) do
		strTittle = strTittle.."<color=red>"..GetItemName(tbEq2Consume[i]).."<color>\n"
	end
	tinsert(tbOpt, {"ChËp nhËn ®æi", tbExchangeWrongEquip.Exchange, {tbExchangeWrongEquip, tbEq2Consume}})
	tinsert(tbOpt, {"Hñy bá "})
	CreateNewSayEx(strTittle, tbOpt)
end

function tbExchangeWrongEquip:Exchange(tbItem)
	for i = 1, getn(tbItem) do
		local strItemName = GetItemName(tbItem[i])
		if IsMyItem(tbItem[i]) ~= 1 or RemoveItemByIndex(tbItem[i]) ~= 1 then
			Talk(1, "", "Trang bÞ cña b¹n ®· bÞ di dêi, ®æi thÊt b¹i mÊt 1 sè trang bÞ")
			return
		else
			tbLog:PlayerActionLog("PhongVanLenhBai", "DoiTrangBiThuongLangNhanSai", "XoaItem: "..strItemName)
		end
	end
	tbVNG_BitTask_Lib:setBitTask(self.tbBitTask, 1)
	local tbItem = {szName = "Th­¬ng Lang Chi B¶o", tbProp={6,1,30146,1,0,0}, nCount = 1, nBindState = -2,nExpiredTime=10080}
	tbAwardTemplet:Give(tbItem, 1, {"PhongVanLenhBai", "DoiTrangBiThuongLangNhanSai" })
end