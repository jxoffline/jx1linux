-- 文件名　：longxuelihe.lua
-- 创建者　：wangjingjun
-- 内容　　：龙血礼盒 使用可获得
-- 创建时间：2011-07-11 11:54:21

Include("\\script\\lib\\awardtemplet.lua")

local tbAward = 
{
	{szName = "Long Huy誸 Ho祅", tbProp = {6,1,2117,1,0,0}, nCount = 3},	
	{szName = "T鑞g Kim Phi T鑓 ho祅", tbProp = {6,1,190,1,0,0}, nCount = 5},
	{szName = "T鑞g Kim Ngo筰 Ph� ho祅", tbProp = {6,1,178,1,0,0}, nCount = 5},	-- 物品ID不确定
}


function main(nItemIndex)
	local nWidth = 1
	local nHeight = 1
	local nCount = 5
	if CountFreeRoomByWH(nWidth, nHeight, nCount) < nCount then
		Say(format("в b秓 m t礽 s秐 c馻 i hi謕, xin h穣  tr鑞g %d %dx%d h祅h trang", nCount, nWidth, nHeight))
		return 1
	end
	-- 判断背包空间
	tbAwardTemplet:GiveAwardByList(%tbAward, "S� D鬾g Long Huy誸 L� H閜", 1)
	return 0
end