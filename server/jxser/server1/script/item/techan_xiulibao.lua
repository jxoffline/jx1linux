IncludeLib("SETTING"); --ÔØÈëSETTING½Å±¾Ö¸Áî¿â
IncludeLib("FILESYS")
IncludeLib("TONG")
IncludeLib("ITEM")

ITEMPARAM_LIMITDATE = 2
ITEMPARAM_TONGID = 1
function main(nItemIndex)
local szTongName , nTongID = GetTongName()

	if (xiulibao_checkdate(nItemIndex) == -1) then
		Say("<#>Tói ®å nghÒ ®· qu¸ h¹n sö dông!", 0)
		Msg2Player("Tói ®å nghÒ ®· qu¸ h¹n sö dông!")
		return
	end
	--µ÷ÐÞÀíÖ¸Áî
	--ÓÃ%dÌæ´úRepairCallBackÇ°Èý¸ö²ÎÊý£¬µ±»Øµ÷Ê±ÌîÈë: nItemIdx, nPrice, nItemPrice£¬ºóÃæµÄ²ÎÊýÀàËÆSay(...)
	TRepair("RepairCallBack(%d,%d,%d,"..nTongID..")")
	return 1
end

function xiulibao_checkdate(nItemIndex)
	local nItemdate = GetItemParam(nItemIndex, 1);
	if (GetCurServerTime() <= nItemdate) then
		return 1;
	else
		return -1;
	end;
end

function GetDesc(nItem)
	local nEndYear = GetItemParam(nItem, 2) + 2000;
	local nEndMMDD = GetItemParam(nItem, 3);
	local nEndMon = floor(nEndMMDD / 100);
	local nEndDay = mod(nEndMMDD, 100);
	local nEndHour = GetItemParam(nItem, 4);

	return format("\n Ngµy hÕt h¹n: <color=blue>%d-%d-%d-%d giê<color>", nEndYear, nEndMon,nEndDay,nEndHour);
end

--²Î¿´ws_tiangong.lua
function RepairCallBack(nItemIdx, nPrice, nItemPrice, nParam)
	local nMaxDur = GetMaxDurability(nItemIdx)
	local nFixDur = nMaxDur - GetCurDurability(nItemIdx)
	if (nFixDur <= 0)then
		return
	end	
	local quality = GetItemQuality(nItemIdx)
	-- »Æ½ð×°±¸ÐÞÀí¼Û¸ñ¹«Ê½µ÷ÕûÎª£º100*(×°±¸µÈ¼¶^2)/Ã¿µãÄÍ¾Ã¶È	
	if (quality == 1 or quality == 4)then
		if (quality == 4 and GetPlatinaLevel(nItemIdx) >= 6) then
			Say("Chñ tiÖm: T¹i tiÖm cña ta ®©y kh«ng thÓ söa trang bÞ b¹ch kim +6 trë lªn", 0);
			return 1
		end
		
		local nItemLevel = GetItemLevel(nItemIdx);
		--Ã¿ÄÍ¾Ã¶ÈµÄ¼Û¸ñ
		local nDurPrice = 100 * nItemLevel * nItemLevel
		local nCheapPrice = nDurPrice * nFixDur
		local nCostlyPrice = nCheapPrice * 3; -- ¼òÐÞµÄÈý±¶
		local nLostDur = floor(nFixDur / 10);
		if (nLostDur < 1) then
			nLostDur = 1;
		end
		Say("<#>", 3, 
		"Söa ®¬n gi¶n: "..nCheapPrice.." l­îng, ®é bÒn gi¶m "..nLostDur.."®iÓm/#Cheap_Repair("..nItemIdx..","..nCheapPrice..")",
		"Söa kü: "..nCostlyPrice.." l­îng/#Costly_Repair("..nItemIdx..","..nCostlyPrice..")",
		"Kh«ng cÇn ®©u/cancel")
		return	
	end	
	Say("<#>Söa trang bÞ cÇn tiªu tèn: "..nPrice.." l­îng, cã ®ång ý kh«ng?", 2, 
	"Söa ch÷a/#TG_Repair("..nItemIdx..","..nPrice..")",
	"Kh«ng cÇn ®©u/cancel")
end

--¾«ÐÞ
function Costly_Repair(nItemIdx, nCostPrice)
	local nCurMaxDur = GetMaxDurability(nItemIdx)
	if (GetCash() >= nCostPrice) then
		Pay(nCostPrice)
		-- Msg2Player("ÐÞ¸´×°±¸£¡")
		SetCurDurability(nItemIdx, nCurMaxDur)
		WriteLog(date("%H%M%S")..":"..GetAccount().."("..GetName()..") sö dông ("..nCostPrice..") l­îng b¹c, söa kü trang bÞ Hoµng Kim (ItemGenTime:"..GetItemGenTime(nItemIdx).." CurDur:"..nCurMaxDur..")");
	else
		Say("<#>Ng©n l­¬ng kh«ng ®ñ!", 0)
		return
	end
end
--¼òÐÞ
function Cheap_Repair(nItemIdx, nCostPrice)
	local nCurMaxDur = GetMaxDurability(nItemIdx)
	local nFixDur = nCurMaxDur - GetCurDurability(nItemIdx)
	local nLostDur = floor(nFixDur / 10);
	if (nLostDur < 1) then
		nLostDur = 1;
	end	
	if (GetCash() >= nCostPrice) then
		Pay(nCostPrice)
		local nFixMaxDur = nCurMaxDur - nLostDur;
		SetMaxDurability(nItemIdx, nFixMaxDur);
		SetCurDurability(nItemIdx, nFixMaxDur);
	else
		Say("<#>Ng©n l­îng kh«ng ®ñ, h·y mau t×m ®ñ ng©n l­îng!", 0)
		return
	end
end
--ÆÕÐÞ
function TG_Repair(nItemIdx, nCostPrice)
	if (GetCash() < nCostPrice) then
		Say("<#>Ng©n l­îng kh«ng ®ñ, h·y mau t×m ®ñ ng©n l­îng!", 0)
		return
	end
	Pay(nCostPrice)
	SetCurDurability(nItemIdx, GetMaxDurability(nItemIdx))
end