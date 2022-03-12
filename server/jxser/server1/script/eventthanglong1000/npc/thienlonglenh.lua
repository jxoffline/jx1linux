Include("\\script\\lib\\awardtemplet.lua")
--Include("\\script\\EventThangLong1000\\head.lua")
tbTTLDai= 
{
	{szName = "Th¨ng Thiªn LÖnh(®¹i)", tbProp = {6,1, 30051,1,0,0}, nExpiredTime = 20101025, nCount = 2},
}

function main(nItemIndex)
	local nItemData	= tonumber(FormatTime2String("%Y%m%d%H%M",ITEM_GetExpiredTime(nItemIndex)));
	local nDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	if nDate > nItemData then
		Msg2Player("VËt phÈm qu¸ h¹n sö dông, tù ®éng mÊt ®i.")
		return 0;
	end

	if CalcFreeItemCellCount() < 5 then
			Talk(1, "", "Hµnh trang kh«ng ®ñ 5 « trèng.");
			return 1
	end
	tbAwardTemplet:GiveAwardByList(tbTTLDai, "Event 1000 N¨m Th¨ng Long, Use Th¨ng Long LÖnh");
	Msg2Player("§¹i hiÖp nhËn 2 Th¨ng Thiªn LÖnh (®¹i)")
	WriteLog(date("%Y%m%d %H%M%S").."\t".."Event 1000 N¨m Th¨ng Long"..GetAccount().."\t"..GetName().."\t".."Sö dông thµnh c«ng Thiªn Long LÖnh ")
end
