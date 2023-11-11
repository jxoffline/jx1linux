Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\vng_lib\\VngTransLog.lua")

function main(nItemIdx)
	local tbSay = {
		format("§å Phæ Tö M·ng KhÝ Giíi/#BronzeChest_GetAward(%d, %d)", nItemIdx, 1),
		format("Tö M·ng LÖnh/#BronzeChest_GetAward(%d, %d)", nItemIdx, 2),
		"§ãng/OnCancel",
	}
	Say("Xin h·y chän phÇn th­ëng:", getn(tbSay), tbSay)
	return 1
end

function BronzeChest_GetAward(nIdx, nSelectedOption)
	local tbBronzeChest = {
		{szName="§å Phæ Tö M·ng KhÝ Giíi",tbProp={6,1,2723,1,0,0},nCount=1,
			CallBack = function(nItemIdx) %tbVngTransLog:Write("201107_EventNgoiSaoTuyet/", %nPromotionID, "SuDungDongBaoRuong", GetItemName(nItemIdx), 1) end},
		{szName="Tö M·ng LÖnh",tbProp={6,1,2350,1,0,0},nCount=1,
			CallBack = function(nItemIdx) %tbVngTransLog:Write("201107_EventNgoiSaoTuyet/", %nPromotionID, "SuDungDongBaoRuong", GetItemName(nItemIdx), 1) end},
	}
	local tbAward = tbBronzeChest[nSelectedOption]
	if not tbAward then 
		return
	end
	if IsMyItem(nIdx) ~= 1 or RemoveItemByIndex(nIdx) ~= 1 then
		return
	end
	tbAwardTemplet:Give(tbAward, 1, {"Event_NgoiSaoTuyet", "SuDungDongBaoRuong"})
end