Include("\\script\\lib\\awardtemplet.lua")
Include ("\\script\\lib\\pay.lua")
Include("\\script\\event\\pingzi\\200805\\head.lua")
ruyijixiangdangao_tbItemList= 

{
	[1761] = {szName="B¸nh Kem Nh­ ý", nExp = 1500000 },
	[1762] = {szName="B¸nh Kem C¸t T­êng", nExp = 3000000 },

}

function main(nItemIndex)
	pingzi0805:ResetTask()
	local nItemData	= 20080731;	
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	local nCurExp = GetTask(pingzi0805.TSK_ExpLimit)
	if nDate > nItemData then
		Msg2Player("VËt phÈm qu¸ h¹n sö dông, tù ®éng mÊt ®i.")
		return 0;
	end
	
	local _, _, nId	= GetItemProp(nItemIndex);

	if GetLevel() < 50 or IsCharged() == 0 then
		Say("Ng­êi ch¬i cÊp trªn 50 ®· n¹p thÎ míi cã thÓ sö dông.", 0)
		return 1;
	end
	
	if nCurExp >= pingzi0805.nMaxExpLimit then
		Say("§· ®¹t ®Õn giíi h¹n kinh nghiÖm cña lÇn ho¹t ®éng nµy, kh«ng thÓ tiÕp tôc sö dông.", 0)
		return 1
	end
	local tbItem = ruyijixiangdangao_tbItemList[nId]
	tbAwardTemplet:GiveAwardByList(tbItem, "B¸nh kem chóc mõng VLTK trßn 3 tuæi.")
	SetTask(pingzi0805.TSK_ExpLimit, nCurExp + tbItem.nExp)
	return 0
end

function GetDesc(nItemIndex)
	local nYear		= 2008
	local nMonth	= 07
	local nDay		= 31
	if nYear == 0 and nMonth == 0 and nDay == 0 then
		return "<color=red>VËt phÈm nµy ®· qu¸ h¹n sö dông<color>"
	end
	return format("<color=green>Thêi h¹n sö dông: %d-%d-%d<color>",nDay, nMonth, nYear)
end