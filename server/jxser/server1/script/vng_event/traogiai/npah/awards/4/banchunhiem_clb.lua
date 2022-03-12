--Hæ trî trao gi¶i th­ëng cho ng­êi chiÕn th¾ng - Created by DinhHQ - 20110607
Include("\\script\\vng_event\\traogiai\\NPAH\\vng_AwardClass.lua")
Include("\\script\\vng_event\\traogiai\\NPAH\\vng_ToolAward.lua")

tbCurSeason = tbAwardClass:New()
tbCurSeason.nStartDate = 201108250000
tbCurSeason.nEndDate = 201109042400
tbCurSeason.strName = "NhËn th­ëng Ban Chñ NhiÖm CLB"
tbCurSeason.strNPC = "ChiÕn T©m T«n Gi¶"
tbCurSeason.nID = 4
tbCurSeason.tbAccList = {	
	["batigolvnam010"]={[1]={{nAwardID=1,nCount=10},},},
	["giakhonglao"]={[1]={{nAwardID=1,nCount=5},},},
	["dolanguyenhoathan"]={[1]={{nAwardID=1,nCount=10},},},
	["anhkiet11a13"]={[1]={{nAwardID=1,nCount=5},},},
	["phantunglam1985"]={[1]={{nAwardID=1,nCount=5},},},
	["chetvibuon078"]={[1]={{nAwardID=1,nCount=5},},},
	["volam24042004"]={[1]={{nAwardID=1,nCount=5},},},
	["daogiathieucongtu101"]={[1]={{nAwardID=1,nCount=10},},},
	["tuyettinhcongchua"]={[1]={{nAwardID=1,nCount=5},},},
	["hello36"]={[1]={{nAwardID=1,nCount=5},},},
	["haccongtu0905"]={[1]={{nAwardID=1,nCount=10},},},
	["manhhapvd"]={[1]={{nAwardID=1,nCount=5},},},
	["hongphi1909"]={[1]={{nAwardID=1,nCount=5},},},
	["satangirl"]={[1]={{nAwardID=1,nCount=5},},},
	["hoangmu3"]={[1]={{nAwardID=1,nCount=10},},},
	["thienloidangdongomay"]={[1]={{nAwardID=1,nCount=5},},},
	["meocon149"]={[1]={{nAwardID=1,nCount=5},},},
	["nguyennhuquynh"]={[1]={{nAwardID=1,nCount=5},},},
	["binhblk5"]={[1]={{nAwardID=1,nCount=5},},},
	["o938877886"]={[1]={{nAwardID=1,nCount=10},},},
	["whatisloveah3"]={[1]={{nAwardID=1,nCount=5},},},
	["vodangdaklak"]={[1]={{nAwardID=1,nCount=5},},},
	["daibangbmt"]={[1]={{nAwardID=1,nCount=5},},},
	["daikalalinh"]={[1]={{nAwardID=1,nCount=5},},},
	["nguyenminhhuydh"]={[1]={{nAwardID=1,nCount=10},},},
	["trangramebm1"]={[1]={{nAwardID=1,nCount=5},},},
	["sonfang266"]={[1]={{nAwardID=1,nCount=5},},},
	["romeo8x"]={[1]={{nAwardID=1,nCount=10},},},
	["vuonghaiyen2004"]={[1]={{nAwardID=1,nCount=5},},},
	["luctieuphung1612"]={[1]={{nAwardID=1,nCount=5},},},
	["anhhoangcp"]={[1]={{nAwardID=1,nCount=10},},},
	["myanh1"]={[1]={{nAwardID=1,nCount=5},},},
}
tbCurSeason.tbPrizeList = {	
	[1] = {szName="Hång Bao C©u L¹c Bé",tbProp={6,1,30032,1,0,0},nCount=1, nExpiredTime=10080},
}
--tbCurSeason.tbFreeBagRequire = {
--	[1] = 0,
--	[2] = 	0,
--	[3] = 0,
--	[4] = 0,
--	[5] = 0,
--	[6] = 1,
--	[7] = 1,
--	[8] = 1,
--	[9] = 1, --fsda
--	[10] = 1,
--	[11] = 1,
--}
tbCurSeason.tbExtPointBit = {
	[1] = {nExtPoint = 4, nBit = 11},	
}
tbCurSeason.tbLog = {"BanChuNhiemCLB", "NhanThuongTaiChienTamTonGia"}
if tbCurSeason:IsOver() == 1 then
	tbCurSeason = nil
else
	tbVngToolAward:AddSeason(tbCurSeason)
end