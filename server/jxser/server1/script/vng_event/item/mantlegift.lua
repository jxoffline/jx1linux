Include("\\script\\lib\\log.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
IncludeLib("SETTING");

tbList ={
		{szName="Phi phong Ngù Phong (DÞch chuyÓn tøc thêi )",tbProp={0,3473},nCount=1,nQuality = 1,nExpiredTime=1*30*24*60},
		{szName="Phi phong Ngù Phong (X¸c suÊt hãa gi¶i s¸t th­¬ng)",tbProp={0,3474},nCount=1,nQuality = 1,nExpiredTime=1*30*24*60},
		{szName="Phi phong Ngù Phong (Träng kÝch)",tbProp={0,3475},nCount=1,nQuality = 1,nExpiredTime=1*30*24*60},
}
	
function main(nItemIndex)
	if PlayerFunLib:VnCheckInCity("default") ~= 1 then
		return 1
	end
	local szTitle = "Xin h·y lùa chän lo¹i phi phong !"
	local tbOpt = {}
	tinsert(tbOpt,format("Phi phong Ngù Phong (DÞch chuyÓn tøc thêi )/#VnGiveAward(%d,1)",nItemIndex))
	tinsert(tbOpt,format("Phi phong Ngù Phong (X¸c suÊt hãa gi¶i s¸t th­¬ng)/#VnGiveAward(%d,2)",nItemIndex))
	tinsert(tbOpt,format("Phi phong Ngù Phong (Träng kÝch) )/#VnGiveAward(%d,3)",nItemIndex))
	if getn(tbOpt) > 0 then
		tinsert(tbOpt, "Rêi khái/no")
		Say(szTitle, getn(tbOpt), tbOpt)
	end
	return 1	
end


function VnGiveAward(nItemIdx,nNumber)
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