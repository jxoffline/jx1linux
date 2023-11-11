Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

local tbAward = 
{
	{szName="B¹ch Hæ Trïng LuyÖn Ngäc",tbProp={6,1,3187,1,0,0},nCount=10},
}


function main(nItemIndex)
	local nWidth = 1
	local nHeight = 1
	local nCount = 10
	if PlayerFunLib:VnCheckInCity("default") ~= 1 then
		return 1
	end
	if CountFreeRoomByWH(nWidth, nHeight, nCount) < nCount then
		Say(format("§Ó b¶o ®¶m tµi s¶n cña ®¹i hiÖp, xin h·y ®Ó trèng %d %dx%d hµnh trang", nCount, nWidth, nHeight))
		return 1
	end
	tbAwardTemplet:GiveAwardByList(%tbAward, "SuDungNgocTrungLuyenLeBao", 1)
	return 0
end