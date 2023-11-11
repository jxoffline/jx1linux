
if not tbVngThamMayMan then
	tbVngThamMayMan ={}		
end

tbVngThamMayMan.nStartDate = 201601290000
tbVngThamMayMan.nEndDate = 201601312400
tbVngThamMayMan.EVENT_LOG_TITLE = "LOGEVENT_FEATURE_CTC_ThamMayMan"

MAX_EXP = 100000 --*10000 : giÌi hπn ®n max 1ty exp 1 ngµy
FACTOR = 10000
MOC_1000 = 1000

 --15*MOC_1000 : nhan moc cao nhat 15000 TMM
MOC_5000 = 5
MOC_10000 = 10
MOC_15000 = 15
MAX_15 = 15 --15*MOC_1000 : nhan moc cao nhat 15000 TMM
DATE_END = 20160201
--Task 2774
tbVngThamMayMan.BITTASK_WIN = {nTaskID = 2774,nStartBit = 0,nBitCount = 2,nMaxValue = 3} -- l≠u trÛng gi∂i 1, 2,3
tbVngThamMayMan.BITTASK_LIMIT_EXP_DAILY = {nTaskID = 2774,nStartBit = 2,nBitCount = 20,nMaxValue = MAX_EXP} -- luu max so nv lam dc 1 ngay
--nhan thuong moc
tbVngThamMayMan.BITTASK_LIMIT_MOC = {
	[5] =  {nTaskID = 2774,nStartBit = 28,nBitCount = 1,nMaxValue = 1},
	[10] = {nTaskID = 2774,nStartBit = 29,nBitCount = 1,nMaxValue = 1},
	[15] =   {nTaskID = 2774,nStartBit = 30,nBitCount = 1,nMaxValue = 1},
}

--Task 2773
tbVngThamMayMan.BITTASK_USE_TMN_1000 = {nTaskID = 2773,nStartBit = 0,nBitCount = 10,nMaxValue = MOC_1000} -- luu so tham su du, den 1000 thi trao thuong va reset ve 0
tbVngThamMayMan.BITTASK_USE_TOTAL = {nTaskID = 2773,nStartBit = 10,nBitCount = 4,nMaxValue = 15}--15*MOC_1000 : nhan moc cao nhat 15000 TMM

tbVngThamMayMan.tbSpecialNum = {
	[1] = {88,},
	[2] = {78,68,},
	[3] = {8,18,28,38,48,},
}

tbVngThamMayMan.szPathFile = "\\vng_settings\\features\\thammayman\\thammayman.txt"

tbVngThamMayMan.AwardExp = {
	[10] = {szName = "ßi”m Kinh Nghi÷m", nExp=100000,nRate=20},
	[15] = {szName = "ßi”m Kinh Nghi÷m", nExp=150000,nRate=40},
	[20] = {szName = "ßi”m Kinh Nghi÷m", nExp=200000,nRate=40},
}
local pAnnounce = function(nItemIndex)
	AddGlobalNews(format("ChÛc mıng Æπi hi÷p <color=pink>%s<color> sˆ dÙng Th®m may mæn nhÀn Æ≠Óc ph«n th≠Îng gi∂i %d <color=pink>%s<color>", GetName(), GetItemName(nItemIndex)))
end
tbVngThamMayMan.AwardItem = {
	[1] = {
		{szName="Kim Quang Bæc Kinh Chi MÈng",tbProp={0,197},nCount=1,nRate=70,nQuality = 1,},
		{szName="Kim Quang Nh∑ ßi”n Chi HÂn",tbProp={0,202},nCount=1,nRate=30,nQuality = 1,},
	},
	[2] = {
		{szName="Hoµng Kim Thπch",tbProp={6,1,30362,1,0,0},nCount=3,nExpiredTime=DATE_END},
	},
	[3] = {		
		{szName="Kim Quang thπch",tbProp={6,1,30386,1,0,0},nCount=2,nExpiredTime=DATE_END},
	},
}

tbVngThamMayMan.Award_1000_TMM = {
	{szName = "ßi”m Kinh Nghi÷m", nExp=30000000,},
	{szName="Huy“n Kim Thπch",tbProp={6,1,30361,1,0,0},nCount=10,nExpiredTime=DATE_END},
}
local pAnnounce = function(nItemIndex)
	AddGlobalNews(format("ChÛc mıng Æπi hi÷p <color=pink>%s<color> nhÀn th≠Îng mËc Th®m may mæn nhÀn Æ≠Óc <color=pink>%s<color>", GetName(), GetItemName(nItemIndex)))
end
--phan thuong moc
tbVngThamMayMan.AwardLimitTMM = {
	{szName="Kim Quang Bæc Kinh Chi MÈng",tbProp={0,197},nCount=1,nRate=8,nQuality = 1,CallBack=pAnnounce},
	{szName="Kim Quang Nh∑ ßi”n Chi HÂn",tbProp={0,202},nCount=1,nRate=2,nQuality = 1,CallBack=pAnnounce},
	{szName="HÂng ∂nh Th»m Vi™n Uy”n",tbProp={0,204},nCount=1,nQuality = 1,nRate=15,CallBack=pAnnounce},
	{szName="HÂng ∂nh Ki’m Bµi",tbProp={0,205},nCount=1,nQuality = 1,nRate=15,CallBack=pAnnounce},
	{szName="HÂng ∂nh MÙc TÛc	",tbProp={0,206},nCount=1,nQuality = 1,nRate=15,CallBack=pAnnounce},
	{szName="HÂng ∂nh TÙ Chi™u",tbProp={0,207},nCount=1,nQuality = 1,nRate=15,CallBack=pAnnounce},	
	{szName = "ßi”m Kinh Nghi÷m", nExp=200000000,nRate=30,},
}
