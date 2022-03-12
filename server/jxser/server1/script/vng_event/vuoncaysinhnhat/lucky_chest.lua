Include("\\script\\vng_event\\VuonCaySinhNhat\\vng_award.lua")

function main(nItemIdx)
	local nItemParam = GetItemParam(nItemIdx, 1)

	if nItemParam == 1 then
		tbSpecialAward:NguyetThan2(nItemIdx)		
	elseif nItemParam == 2 then
		tbSpecialAward:BatTu2(nItemIdx)
	elseif nItemParam == 3 then
		tbSpecialAward:BachKim2(nItemIdx, 3)	
	elseif nItemParam == 4 then
		tbSpecialAward:BachKim2(nItemIdx, 4)
	elseif nItemParam == 5 then
		tbSpecialAward:BachKim2(nItemIdx, 5)	
	elseif nItemParam == 6 then
		tbSpecialAward:BachKim2(nItemIdx, 6)
	else 
		return
	end
	return 1
end

function GetDesc(nItem)	
	local szDesc = ""
	local n_param = tonumber(GetItemParam( nItem, 1 ))
	local tbItemName = 
	{
		[1] = "§å phæ Tö M·ng",
		[2] = "§å phæ Tö M·ng Giíi ChØ",
		[3] = "Tö M·ng H¹ng Liªn",
		[4] = "Tö M·ng Th­îng Giíi ChØ",
		[5] = "Tö M·ng H¹ Giíi ChØ",
		[6] = "Tö M·ng KhÝ Giíi",
	}
	szDesc = szDesc..format("\nB¶o r­¬ng thÇn bÝ chøa vËt phÈm: <color=yellow>%s<color>", tbItemName[n_param]);
	return szDesc;
end