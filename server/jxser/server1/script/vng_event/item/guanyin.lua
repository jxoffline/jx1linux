Include("\\script\\lib\\log.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
IncludeLib("SETTING");

tbList ={
		{szName="Hoµng Kim Ên (C­êng hãa) CÊp 8",tbProp={0,3212},nCount=1,nQuality = 1,nExpiredTime=129600},
		{szName="Hoµng Kim Ên (Nh­îc hãa) CÊp 8",tbProp={0,3222},nCount=1,nQuality = 1,nExpiredTime=129600},
}
	
function main(nItemIndex)
	if PlayerFunLib:VnCheckInCity("default") ~= 1 then
		return 1
	end
	local szTitle = "Xin h·y lùa chän lo¹i phi phong !"
	local tbOpt = {}
	tinsert(tbOpt,format("Hoµng Kim Ên (C­êng hãa) CÊp 8/#GiveAward(%d,%d)",nItemIndex,1))
	tinsert(tbOpt,format("Hoµng Kim Ên (Nh­îc hãa) CÊp 8/#GiveAward(%d,%d)",nItemIndex,2))
	if getn(tbOpt) > 0 then
		tinsert(tbOpt, "Rêi khái/no")
		Say(szTitle, getn(tbOpt), tbOpt)
	end
	return 1
end

function GiveAward(nItemIdx,nNumber)
	local nWidth = 1
	local nHeight = 1
	local nCount = 1
	if PlayerFunLib:VnCheckInCity("default") ~= 1 then
		return
	end
	if CountFreeRoomByWH(nWidth, nHeight, nCount) < nCount then
		Say(format("§Ó b¶o ®¶m tµi s¶n cña ®¹i hiÖp, xin h·y ®Ó trèng %d hµnh trang", nCount))
		return
	end
	if IsMyItem(nItemIdx) ~= 1 or RemoveItemByIndex(nItemIdx) ~= 1 then
		return
	end
	tbAwardTemplet:Give(tbList[nNumber], 1, {"phiphonglehop", "SudungPhiphonglehop"});
end