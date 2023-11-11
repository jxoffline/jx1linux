Include("\\script\\lib\\log.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
IncludeLib("SETTING")

tbTruyenKyLeBao = tbTruyenKyLeBao or {}
tbTruyenKyLeBao.TASK_TRUYENKY = {nTaskID = 2993,nStartBit = 6,nBitCount = 2,nMaxValue = 2}
tbTruyenKyLeBao.tbList ={
		[1] = {
			{szName="Ch©n Nguyªn §¬n (®¹i)",tbProp={6,1,30229,1,0,0},nCount=200,nBindState=-2},
			{szName="Hé M¹ch §¬n",tbProp={6,1,3203,1,0,0},nCount=1000},
		},
		[2] = {szName = "§iÓm Kinh NghiÖm", nExp=1300e6},
		[3] = {
			{szName="HuyÕt Long §»ng CÊp 5",tbProp={6,1,30289,5,0,0},nCount=20},
			{szName="HuyÕt Long §»ng CÊp 6",tbProp={6,1,30289,6,0,0},nCount=20},
			{szName="HuyÕt Long §»ng CÊp 8",tbProp={6,1,30289,8,0,0},nCount=20},
			{szName="HuyÕt Long §»ng CÊp 9",tbProp={6,1,30289,9,0,0},nCount=20},
			{szName="HuyÕt Long §»ng CÊp 12",tbProp={6,1,30289,12,0,0},nCount=20},
		},
}
	
function main(nItemIndex)
	if PlayerFunLib:VnCheckInCity("default") ~= 1 then
		return 1
	end
	local szTitle = "Xin h·y lùa chän lo¹i phÇn th­ëng !"
	local tbOpt = {}
	tinsert(tbOpt,format("Ch©n nguyªn §¬n(®¹i) vµ Hé m¹ch ®¬n/#tbTruyenKyLeBao:VnGiveAward(%d,1)",nItemIndex))
	tinsert(tbOpt,format("§iÓm kinh nghiÖm kh«ng thÓ céng dån/#tbTruyenKyLeBao:VnGiveAward(%d,2)",nItemIndex))
	tinsert(tbOpt,format("Bé huyÕt long ®»ng(5x20,6x20,8x20,9x20,12x20)/#tbTruyenKyLeBao:VnGiveAward(%d,3)",nItemIndex))
	if getn(tbOpt) > 0 then
		tinsert(tbOpt, "Rêi khái/no")
		Say(szTitle, getn(tbOpt), tbOpt)
	end
	return 1	
end


function tbTruyenKyLeBao:VnGiveAward(nItemIdx,nNumber)
	local nWidth = 1
	local nHeight = 1
	local nCount = 5
	if PlayerFunLib:VnCheckInCity("default") ~= 1 then
		return
	end
	if tbVNG_BitTask_Lib:CheckBitTaskValue(self.TASK_TRUYENKY, self.TASK_TRUYENKY.nMaxValue, "Sö dông vËt phÈm ®· ®¹t ®Õn giíi h¹n, kh«ng thÓ sö <enter>dông thªm", "<") ~= 1 then
		return
	end
	if CountFreeRoomByWH(nWidth, nHeight, nCount) < nCount then
		Say(format("§Ó b¶o ®¶m tµi s¶n cña ®¹i hiÖp, xin h·y ®Ó trèng %d hµnh trang", nCount))
		return
	end
	if IsMyItem(nItemIdx) ~= 1 or RemoveItemByIndex(nItemIdx) ~= 1 then
		return
	end
	tbVNG_BitTask_Lib:addTask(self.TASK_TRUYENKY, 1)
	tbAwardTemplet:Give(self.tbList[nNumber], 1, {"Truyenkylebao", "Sudungtruyenkylebao"});
end