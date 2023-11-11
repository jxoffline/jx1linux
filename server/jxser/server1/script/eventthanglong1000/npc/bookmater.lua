Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\EventThangLong1000\\npc\\exchangitem\\exchangeitem.lua")
Include("\\script\\vng_event\\event_thang_long\\Event_1000_ThangLong.lua") --1000 nam Thang Long
Include("\\script\\EventThangLong1000\\head.lua")
function main()
	if (Event1000_ActiveDate() ~= 1) then
 		Talk(1,"","Ho¹t ®éng 1000 n¨m Th¨ng Long ®· kÕt thóc råi !")
 		return
 	end
	local tbOpp = {}
	local str = "<#> Xin hái, Ta cã thÓ gióp g× cho ®¹i hiÖp ?";
	--tinsert(tbOpp,"Ta muèn giao nép cæ vËt/DeliverPro");
	tinsert(tbOpp,"Ta ®Õn ghÐp vËt phÈm/Event1000_ExChangeItem_main");
	tinsert(tbOpp,"Ta ®Õn mua Th¨ng Thiªn LÖnh (trung)/ShopTrungLong");
	
	local nHour = tonumber(GetLocalDate("%H%M"))
	if (nHour >= 1200 and nHour <= 1400) then
		tinsert(tbOpp, "Ta muèn nhËn phÇn th­ëng 1000 n¨m Th¨ng Long/#EventThangLong:GetAward(1)")
	end
	
	if (nHour >= 2000 and nHour <= 2200) then
		tinsert(tbOpp, "Ta muèn nhËn phÇn th­ëng 1000 n¨m Th¨ng Long/#EventThangLong:GetAward(2)")
	end
	tinsert(tbOpp, "Ta muèn giao nép 10 C«ng Tr¹ng LÖnh/#EventThangLong:GiveItem()")
	tinsert(tbOpp, "Ta muèn xem sè l­îng C«ng Tr¹ng LÖnh ®· giao nép/#EventThangLong:ViewTotalDragonItem()")	
	
	
	
	tinsert(tbOpp, "<#>Tho¸t/OnCancel")
	if ( getn( tbOpp ) == 0 ) then
		Say(str, 0);
		return
	end;
	Say( str, getn( tbOpp ), tbOpp )
end


function ShopTrungLong()
	AskClientForNumber("GetTrungLong",1,50,"<#>NhËp sè l­îng cÇn mua")
end
function GetTrungLong(nCount)
	local nSum = nCount * 50000
	if (GetCash() < nSum) then
		Talk(1,"","§¹i hiÖp kh«ng ®ñ ng©n l­îng, xin kiÓm tra l¹i !")
		return
	end
	Pay(nSum)
	local nItemIndex = AddStackItem(nCount, 6, 1, 30050, 1, 0, 0)
	ITEM_SetExpiredTime(nItemIndex, 20101025);
	SyncItem(nItemIndex)
	Msg2Player(format("§¹i hiÖp nhËn ®­îc %d Th¨ng Thiªn LÖnh (trung)", nCount))
	WriteLog(format(date("%Y%m%d %H%M%S").."\t".."Event 1000 N¨m Th¨ng Long"..GetAccount().."\t"..GetName().."\t".."Mua thµnh c«ng %d Trung Long ",nCount))
end

function OnCancel()
end 