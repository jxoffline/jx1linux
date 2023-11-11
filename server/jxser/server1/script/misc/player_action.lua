--------------------------------------------------------------------
-- Íæ¼Ò²Ù×÷½Å±¾£¬Ö÷ÒªÏìÓ¦½çÃæ²Ù×÷
--------------------------------------------------------------------
TIME_2000_1_1 = 946656000;
function BIND_ITEM(itemIdx)
	local g = GetItemProp(itemIdx)
	--±ØĞëÊÇ×°±¸»òËğ»µµÄ×°±¸
	if g ~= 0 and g ~= 7 then
		Say("ChØ cã thÓ khãa b¶o hiÓm cho trang bŞ!", 0)
		return
	end
	--Éú³É»Øµ÷²ÎÊı
	local szFunStep2 = "/#BIND_ITEM_2("..itemIdx..","..GetItemGenTime(itemIdx)..")"
	local nBindState = GetItemBindState(itemIdx)
	if nBindState < 0 then
		Say("VËt phÈm nµy ®· ë tr¹ng th¸i khãa b¶o hiÓm, kh«ng cÇn ph¶i khãa n÷a!", 0)
	elseif nBindState > 0 then
		
		if (nBindState > (floor((GetCurServerTime() - TIME_2000_1_1) / 3600)) ) then
			Say("Thêi gian ®îi khãa cña vËt phÈm nµy <color=green> v­ît qua 168 tiÕng <color>, t¹m thêi kh«ng thÓ më khãa l¹i!", 0)
			return
		end
		
		Say("VËt phÈm nµy ®ang trong giai ®o¹n ®· më khãa b¶o hiÓm, cã muèn khãa tiÕp tôc kh«ng?", 2, "§ång ı"..szFunStep2, "Kh«ng muèn/cancel")
	else
		Say("Khi trang bŞ ®­îc khãa th× kh«ng thÓ giao dŞch, bµy b¸n, vøt bá hoÆc ®Æt vµo hép ®èi tho¹i. §ång thêi kh«ng cho phĞp chÕ t¹o, kh¶m n¹m, ®Æc biÖt lµ khi PK sÏ kh«ng bŞ r¬i ra. Trang bŞ ®­îc khãa b¶o hiÓm vÉn cã t¸c dông nh­ b×nh th­êng, viÖc mÆc vµo, cëi bá, söa ch÷a ph¶i th«ng qua viÖc <color=yellow>më khãa b¶o hiÓm<color> (nót 'Th¸o' trªn giao diÖn trang bŞ). Tuy nhiªn, sau <color=green>168 giê <color> míi cã thÓ hoµn toµn ®­îc më khãa.", 
			2, "Ta muèn khãa b¶o hiÓm trang bŞ nµy"..szFunStep2, "§Ó ta xem l¹i/cancel")
	end
end

function BIND_ITEM_2(itemIdx, nGenTime)
	--Ğ£ÑéÊÇ·ñÏÈÇ°µÄÎïÆ·
	if GetItemGenTime(itemIdx) ~= nGenTime then
		return
	end
	if IsMyItem(itemIdx) ~= 1 then
		
		return 
	end
	if BindItem(itemIdx) == 1 then
		WriteLog("ITEM_BIND\t"..date("%Y-%m-%d %X\t")..GetItemName(itemIdx).."\tBind\t"..GetAccount().."\t"..GetName())
		Msg2Player("B¹n ®· khãa b¶o hiÓm thµnh c«ng mét trang bŞ!")
	end
end

function UNBIND_ITEM(itemIdx)
	--Éú³É»Øµ÷²ÎÊı
	local szFunStep2 = "/#UNBIND_ITEM_2("..itemIdx..","..GetItemGenTime(itemIdx)..")"
	local nBindState = GetItemBindState(itemIdx)
	if nBindState == 0 then
		Say("VËt phÈm nµy ch­a ®­îc khãa b¶o hiÓm!", 0)
	elseif nBindState > 0 then
		Say("VËt phÈm nµy ®ang ë tr¹ng th¸i më khãa b¶o hiÓm, kh«ng cÇn ph¶i më khãa n÷a!", 0)
	elseif nBindState == -1 then
		Say("Sau khi nhÊp nót 'Th¸o' ®Ó më khãa b¶o hiÓm, cÇn ph¶i ®îi <color=green>168 giê<color> sau th× khãa míi cã thÓ hoµn toµn ®­îc më.", 
			2, "Ta ®ång ı më khãa b¶o hiÓm"..szFunStep2, "§Ó ta xem l¹i/cancel")
	else
		Say("VËt phÈm nµy ®­îc khãa b¶o hiÓm vÜnh viÔn, kh«ng thÓ më khãa!", 0)
	end
end

function UNBIND_ITEM_2(itemIdx, nGenTime)
	--Ğ£ÑéÊÇ·ñÏÈÇ°µÄÎïÆ·
	if GetItemGenTime(itemIdx) ~= nGenTime then
		return
	end
	if IsMyItem(itemIdx) ~= 1 then
		return 
	end
	if UnBindItem(itemIdx) == 1 then
		WriteLog("ITEM_BIND\t"..date("%Y-%m-%d %X\t")..GetItemName(itemIdx).."\tUnBind\t"..GetAccount().."\t"..GetName())
		Msg2Player("Yªu cÇu më khãa b¶o hiÓm ®· ®­îc gëi ®i. Sau 168 giê khãa sÏ tù ®éng ®­îc më hoµn toµn.")
	end
end

function cancel()
end