IncludeLib("ITEM")
Include("\\script\\lib\\log.lua")
tbVnGiaHanPhu = {}
tbVnGiaHanPhu.tbItem = {
	["3491"]=30,
	["3492"]=30,
	["3493"]=30,
	["3494"]=30,
	["3495"]=30,
	["3496"]=30,
	["3497"]=30,
	["3498"]=30,
	["3499"]=30,
	["3500"]=30,
	["3501"]=30,
	["3502"]=30,
	["3503"]=30,
	["3504"]=30,
	["3505"]=30,
	["3506"]=30,
	["3880"]=30,
	["3881"]=30,
	["3882"]=30,
	["3883"]=30,
	["3884"]=30,
	["3885"]=30,
	["3886"]=30,
	["3887"]=30,
	["3888"]=30,
	["4856"]=21,
	["4857"]=14,
	["4860"]=23,
	["4861"]=17,
	["4862"]=13,
}


function tbVnGiaHanPhuGiveUIConfirm(nCount)
	local nCheckMap = DynamicExecuteByPlayer(PlayerIndex, "\\script\\vng_feature\\checkinmap.lua", "PlayerFunLib:VnCheckInCity")	
	if not nCheckMap then
		return
	end
	if nCount ~= 1 then
		Talk(1, "", "VËt phÈm bá vµo kh«ng ®óng, xin h·y kiÓm tra l¹i!")
		return
	end
	local nIDX = GetGiveItemUnit(1)
	local nQuality = GetItemQuality(nIDX)
	local nItemBindState = GetItemBindState(nIDX)
	if nQuality ~= 1 then
		Talk(1, "", "Trang bÞ ng­¬i ®Æt vµo kh«ng ph¶i lµ trang bÞ hoµng kim")
		return
	end
	if nItemBindState == -2 then
		Talk(1, "", "Trang søc ®Æt vµo ®· bÞ khãa b¶o hiÓm vÜnh viÔn, kh«ng thÓ gia h¹n.")
		return
	end
	local nGoldEquipIdx = GetGlodEqIndex(nIDX)
	if not tbVnGiaHanPhu.tbItem[tostring(nGoldEquipIdx)] then
		Talk(1, "", "Trang bÞ ng­¬i ®Æt vµo kh«ng ph¶i lµ trang søc, xin h·y kiÓm tra l¹i!")
		return
	end
	local nNextExpiredTime = tbVnGiaHanPhu.tbItem[tostring(nGoldEquipIdx)] * 24 * 60 -- in minute
	local nCurItemExpiredTime = ITEM_GetExpiredTime(nIDX)
	local nCurTime = GetCurServerTime()
	if (nCurItemExpiredTime - nCurTime < 0) then
		Talk(1, "", "Trang søc ®· hÕt h¹n sö dông, kh«ng thÓ gia h¹n.")
		return
	end
	if (nCurItemExpiredTime <= 0) or (nCurItemExpiredTime - nCurTime >nNextExpiredTime * 60) then
		Talk(1, "", format("ChØ cã thÓ gia h¹n trang søc cã h¹n sö dông d­íi %d ngµy.", tbVnGiaHanPhu.tbItem[tostring(nGoldEquipIdx)]))
		return
	end
	if ConsumeEquiproomItem(1, 6,1,30408,-1) ~= 1 then
		Talk(1, "", "Kh«ng t×m thÊy vËt phÈm §¹i Gia H¹n Phï, gia h¹n thÊt b¹i.")
		return
	end
	local strItemName = GetItemName(nIDX)
	ITEM_SetExpiredTime(nIDX, nNextExpiredTime)	
	SyncItem(nIDX)
	Msg2Player(format("Gia h¹n vËt phÈm <color=yellow>%s<color> thµnh c«ng, vËt phÈm cã h¹n sö dông <color=yellow>%d<color> ngµy tÝnh tõ thêi ®iÓm hiÖn t¹i.", strItemName, tbVnGiaHanPhu.tbItem[tostring(nGoldEquipIdx)]))
	tbLog:PlayerActionLog("SuDungVatPhamDaiGiaHanPhu", "Gia h¹n vËt phÈm "..strItemName, "H¹n sö dông cò cßn "..(nCurItemExpiredTime - nCurTime).." gi©y")
end

function main(nItemIDX)
	local nCheckMap = DynamicExecuteByPlayer(PlayerIndex, "\\script\\vng_feature\\checkinmap.lua", "PlayerFunLib:VnCheckInCity")
	if not nCheckMap then
		return 1
	end
	GiveItemUI("§¹i Gia H¹n Phï", "Xin h·y bá 1 mãn trang søc cã h¹n sö dông vµo « bªn d­íi", "tbVnGiaHanPhuGiveUIConfirm", "onCancel", 1)
	return 1
end