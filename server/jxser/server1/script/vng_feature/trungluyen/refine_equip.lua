--TÝnh n¨ng trïng luyÖn trang bÞ Tö M·ng - Created by DinhHQ - 20110517

Include("\\script\\vng_feature\\trungluyen\\globalvar.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

tbVNG_RefineEquip = {}


function tbVNG_RefineEquip:ShowDialog()
	local strDesc = "§Ó trïng luyÖn cÇn 1 <color=yellow>trang bÞ Tö M·ng<color> bÊt kú vµ sè l­îng <color=yellow>Ngäc Trïng LuyÖn<color> tïy theo lo¹i trang bÞ nh­ sau:"
	strDesc = strDesc..format("\n\t\t\t\t\t%-29s%s", "Trang bÞ", "Ngäc cÇn")
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "Tö M·ng Kh«i", 1)
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "Tö M·ng Y", 2)
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "Tö M·ng Hµi", 2)
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "Tö M·ng Yªu §¸i", 1)
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "Tö M·ng Hé UyÓn", 1)
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "Tö M·ng H¹ng Liªn", 2)
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "Tö M·ng Béi", 2)
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "Tö M·ng Giíi ChØ", 2)
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "Tö M·ng KhÝ Giíi", 3)
	Describe(strDesc, 2, "Ta muèn trïng luyÖn/#tbVNG_RefineEquip:main()", "§ãng/OnCancel")
end

function tbVNG_RefineEquip:main()
	local nTaskVal = PlayerFunLib:GetTaskDailyCount(nTSK_DAILY_REFINE_LIMIT)
	if nTaskVal >= nDAILY_REFINE_MAX_COUNT then
		Talk(1, "", format("Mçi ngµy chØ cã thÓ trïng luyÖn trang bÞ <color=red>%d<color> lÇn, mai råi h·y quay l¹i!", nDAILY_REFINE_MAX_COUNT))
		return
	end
	
	local strDesc = format("%-22s%s\n", "Trang bÞ", "Ngäc cÇn")
	strDesc = strDesc..format("\n%-29s%d", "Tö M·ng Kh«i", 1)
	strDesc = strDesc..format("\n%-29s%d", "Tö M·ng Y", 2)
	strDesc = strDesc..format("\n%-29s%d", "Tö M·ng Hµi", 2)
	strDesc = strDesc..format("\n%-29s%d", "Tö M·ng Yªu §¸i", 1)
	strDesc = strDesc..format("\n%-29s%d", "Tö M·ng Hé UyÓn", 1)
	strDesc = strDesc..format("\n%-29s%d", "Tö M·ng H¹ng Liªn", 2)
	strDesc = strDesc..format("\n%-29s%d", "Tö M·ng Béi", 2)
	strDesc = strDesc..format("\n%-29s%d", "Tö M·ng Giíi ChØ", 2)
	strDesc = strDesc..format("\n%-29s%d", "Tö M·ng KhÝ Giíi", 3)
	GiveItemUI("Trïng luyÖn Tö M·ng", strDesc, "RefineUIConfirm", "OnCancel")
end

function RefineUIConfirm(nCount)	
	local tbGoldEquip = {}
	local tbStoneList = {}
	local nTempIdx = 0
	local nItemQuality = -1
	for i = 1, nCount do
		nTempIdx = GetGiveItemUnit(i)
		if nTempIdx < 0 then
			Talk(1, "", "VËt phÈm kh«ng hîp lÖ")
			return
		end
		nItemQuality = GetItemQuality(nTempIdx)
		--item hoµng kim
		if nItemQuality == 1 then
			tinsert(tbGoldEquip, getn(tbGoldEquip) + 1 ,nTempIdx)
		else --item th­êng
			tinsert(tbStoneList, getn(tbStoneList) + 1, nTempIdx)		
		end	
	end
	
	--KiÓm tra item cã hîp lÖ kh«ng
	local nResult, strFailMessage = tbVNG_RefineEquip:CheckItems(tbGoldEquip, tbStoneList)
	if nResult ~= 1 and strFailMessage then
		Talk(1, "", strFailMessage)
		return
	end
	
	local nGoldEquipID = GetGlodEqIndex(tbGoldEquip[1]) 
	
	--Xãa nguyªn liÖu
	local nConsumeResult, strConsumeFailMessage = tbVNG_RefineEquip:ConsumeItems(tbGoldEquip, tbStoneList)
	if nConsumeResult ~= 1 and strConsumeFailMessage then
		Talk(1, "", strConsumeFailMessage)
		return
	end
	PlayerFunLib:AddTaskDaily(nTSK_DAILY_REFINE_LIMIT, 1)
	local nNextEquipIdx = AddGoldItem(0, nGoldEquipID)
	if nNextEquipIdx <= 0 then
		Msg2Player("Trïng luyÖn trang bÞ thÊt b¹i, mÊt mét sè nguyªn liÖu!")
		tbLog:PlayerActionLog("TrungLuyenTuMang","AddTrangBiThatBai", "", "", "", SubWorld)
		return
	end
	Msg2Player("<color=green>Trïng luyÖn trang bÞ thµnh c«ng, xin kiÓm tra l¹i hµnh trang")
	tbLog:PlayerActionLog("TrungLuyenTuMang","AddTrangBiThanhCong", GetItemName(nNextEquipIdx), GetGlodEqIndex(nNextEquipIdx), 1, SubWorld)
end

function tbVNG_RefineEquip:CheckItems(tbGold, tbStone)
	--KiÓm tra  trang bÞ hoµng kim bá vµo
	if getn(tbGold) > 1 or getn(tbGold) <= 0 then
		return 0, "Mçi lÇn chØ trïng luyÖn 1 trang bÞ Tö M·ng"
	end
	
	local nGoldEquipID = GetGlodEqIndex(tbGold[1])
	
	--Trang bÞ bá vµo kh«ng ph¶i Tö M·ng
	if not tbRE_Formula[nGoldEquipID] then
		return 0, "Trang bÞ bá vµo kh«ng hîp lÖ, xin ®¹i hiÖp kiÓm tra l¹i."
	end
	
	--KiÓm tra tr¹ng th¸i khãa
	local nBindState = GetItemBindState(tbGold[1])
	if nBindState ~= 0 then
		return 0, "Trang bÞ ®ang trong tr¹ng th¸i khãa vÜnh viÔn, kh«ng thÓ trïng luyÖn!."
	end
	
	--KiÓm tra ®é bÒn trang bÞ
	local nG, _, _ = GetItemProp(tbGold[1])
	if nG == 7 then
		return 0, "Trang bÞ ®· bÞ háng, kh«ng thÓ trïng luyÖn!."
	end
	
	--KiÓm tra sè l­îng ngäc
	local nStoneRequire = tbRE_Formula[nGoldEquipID].nStoneRequire
	if getn(tbStone) ~= nStoneRequire then
		return 0, "Kh«ng ®ñ nguyªn liÖu, kh«ng thÓ trïng luyÖn!"
	end	
	
	--KiÓm tra tÝnh hîp lÖ cña sè  ngäc bá vµo
	for i = 1, getn(tbStone) do
		if self:CheckStone(tbStone[i]) ~= 1 then
			return 0, "VËt phÈm bá vµo kh«ng hîp lÖ, xin h·y kiÓm tra l¹i!"
		end
	end	
	
	return 1
end

function tbVNG_RefineEquip:CheckStone(nStoneIdx)
	local nG, nD, nP = GetItemProp(nStoneIdx)
	if nG ~= tbSTONE_GDP.nG or nD ~= tbSTONE_GDP.nD or nP ~= tbSTONE_GDP.nP then
		return 0
	end
	return 1
end

function tbVNG_RefineEquip:ConsumeItems(tbGold, tbStone)
	--consume stones
	local nStoneIdx = 0
	local nStoneRemoved = 0
	for i = 1, getn(tbStone) do
		nStoneIdx = tbStone[i]
		local nG, nD, nP = GetItemProp(nStoneIdx)
		local strItemCode = nG..", "..nD..", "..nP
		local strStoneName = GetItemName(nStoneIdx)
		if IsMyItem(nStoneIdx) ~= 1 then
			tbLog:PlayerActionLog("TrungLuyenTuMang","NgocTrungLuyenKhongConTrenNguoi", strStoneName, strItemCode, 1, SubWorld)
			return 0, "VËt phÈm kh«ng cßn trªn ng­êi, trïng luyÖn thÊt b¹i, mÊt mét sè nguyªn liÖu!!"
		end
		if RemoveItemByIndex(nStoneIdx) ~= 1 then
			tbLog:PlayerActionLog("TrungLuyenTuMang","XoaNguyenLieuThatBai", strStoneName, strItemCode, 1, SubWorld)
			return 0, "Trïng luyÖn trang bÞ thÊt b¹i, mÊt mét sè nguyªn liÖu!"
		else			
			tbLog:PlayerActionLog("TrungLuyenTuMang","XoaNguyenLieuThanhCong", strStoneName, strItemCode, 1, SubWorld)
			nStoneRemoved = nStoneRemoved + 1
		end
	end
	if nStoneRemoved ~= getn(tbStone) then
		tbLog:PlayerActionLog("TrungLuyenTuMang","TrungLuyenThatBai", "SoLuongNgocKhongDongBo")
		return 0, "Trïng luyÖn trang bÞ thÊt b¹i, mÊt mét sè nguyªn liÖu!"
	end
	--consume gold equip
	local nGoldEquipIdx = tbGold[1]
	local strEquipName = GetItemName(nGoldEquipIdx)
	local nEquipID = GetGlodEqIndex(nGoldEquipIdx)
	if IsMyItem(nGoldEquipIdx) ~= 1 then
		tbLog:PlayerActionLog("TrungLuyenTuMang","TrangBiKhongConTrenNguoi", strEquipName, nEquipID, 1, SubWorld)
		return 0, "VËt phÈm kh«ng cßn trªn ng­êi, trïng luyÖn thÊt b¹i, mÊt mét sè nguyªn liÖu!!"
	end
	
	if RemoveItemByIndex(nGoldEquipIdx) ~= 1 then
		tbLog:PlayerActionLog("TrungLuyenTuMang","XoaTrangBiThatBai", strEquipName, nEquipID, 1, SubWorld)
		return 0, "Trïng luyÖn thÊt b¹i, mÊt mét sè nguyªn liÖu!!"
	else	
		tbLog:PlayerActionLog("TrungLuyenTuMang","XoaTrangBiThanhCong", strEquipName, nEquipID, 1, SubWorld)
		return 1
	end	
end

function OnCancel()
end