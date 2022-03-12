--ÎäÉñ´Í¸£
--wushenbless.lua
--Ê¹ÓÃºó¿É»ñµÃ2Ğ¡Ê±(ÏµÍ³Ê±¼ä)ÔÚËÎ½ğ¡¢ĞÅÊ¹¡¢´³¹Ø¡¢ÁªÈü¡¢Ò°ÛÅ¡¢»Ô»ÍÖ®Ò¹ÖĞ¹±Ï×¶ÈË«±¶×´Ì¬
--Task2509

function main(nItemIdx)
	local nItemTime = GetItemParam(nItemIdx,1);
	local nCurTime = GetCurServerTime();	--Ãë
	if (nItemTime < nCurTime) then
		Msg2Player("VËt phÈm nµy ®· qu¸ h¹n sö dông.");
		return 0;
	end;
	local nEndTime = nCurTime + 2*60*60;
	SetTask(2509, nEndTime);
	Msg2Player("Trong vßng 2 giê b¹n sÏ ®­îc nh©n ®«i phÇn th­ëng khi tham gia Tèng Kim, nhiÖm vô tİn sø, th¸ch thøc thêi gian, vâ l©m liªn ®Êu, nhiÖm vô D· TÈu, §ªm huy hoµng")
end;

function GetDesc(nItemIdx)

	local nYear = GetItemParam(nItemIdx, 2) + 2000;
	local nMonth = GetItemParam(nItemIdx, 3);
	local nDate = GetItemParam(nItemIdx, 4);

	return "Thêi h¹n sö dông: <color=blue>"..nYear.."n¨m"..nMonth.."nguyÖt "..nDate.."nhËt "
end

