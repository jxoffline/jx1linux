Include("\\script\\lib\\awardtemplet.lua")

local tbAward = 
{
	{szName = "¢m D≠¨ng Hoπt Huy’t ß¨n", tbProp = {6,1,2953,1,0,0}, nCount = 3},	
}


function main(nItemIndex)
	local nWidth = 1
	local nHeight = 1
	local nCount = 3
	if CountFreeRoomByWH(nWidth, nHeight, nCount) < nCount then
		Say(format("ß” b∂o Æ∂m tµi s∂n cÒa Æπi hi÷p, xin h∑y Æ” trËng %d %dx%d hµnh trang", nCount, nWidth, nHeight))
		return 1
	end
	tbAwardTemplet:Give(%tbAward, 1, {"Giamgia_KTC", "SudungHoatHuyetDonLeBao"});
	
	return 0
end

