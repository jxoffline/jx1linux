IncludeLib("FILESYS")
Include("\\script\\vng_event\\traogiai\\npah\\vng_awardclass.lua")
Include("\\script\\vng_event\\traogiai\\npah\\vng_toolaward.lua")
tbCurSeason = tbAwardClass:New()
tbCurSeason.nStartDate = 201210180000
tbCurSeason.nEndDate = 201210252400
tbCurSeason.strName = "NhËn th­ëng Hoa hång vu lan"
tbCurSeason.strNPC = "ChiÕn T©m T«n Gi¶"
tbCurSeason.nID = 9
tbCurSeason.nFreeCellRequire  = 10
tbCurSeason.tbAccList ={
	["nicelehoan4"]={[1]={{nAwardID=1,nCount=400},{nAwardID=2,nCount=2000},},},
	["ngakut31102"]={[1]={{nAwardID=1,nCount=200},{nAwardID=2,nCount=1000},{nAwardID=3,nCount=1},},},
	["kanyeshuy19"]={[1]={{nAwardID=1,nCount=200},{nAwardID=2,nCount=1000},},},
	["muabandocui2"]={[1]={{nAwardID=1,nCount=200},{nAwardID=2,nCount=1000},},},
	["bladeqb"]={[1]={{nAwardID=1,nCount=200},{nAwardID=2,nCount=1000},},},
	["betunto"]={[1]={{nAwardID=1,nCount=200},{nAwardID=2,nCount=1000},},},
	["gamekhu68"]={[1]={{nAwardID=1,nCount=200},{nAwardID=2,nCount=1000},},},
	["tuduc2005"]={[1]={{nAwardID=1,nCount=200},{nAwardID=2,nCount=1000},},},
}
tbCurSeason.tbPrizeList = {	
	[1] = {szName="Ch©n Nguyªn §¬n (®¹i)",tbProp={6,1,30229,1,0,0},nCount=1,nBindState=-2},
	[2] = {szName="Hé m¹ch ®¬n",tbProp={6,1,3203,1,0,0},nCount=1},	
	[3] = {szName="Hoµng Kim Ên (C­êng hãa) +8",tbProp={0,3212},nCount=1,nQuality = 1,nExpiredTime=43200},	
}
tbCurSeason.tbExtPointBit = {
	[1] = {nExtPoint = 5, nBit = 7},	
}
tbCurSeason.tbLog = {"TraoThuongHoaHongVuLan", "NhanThuongTaiChienTamTonGia"}
if tbCurSeason:IsOver() == 1 then
	tbCurSeason = nil
else
	tbVngToolAward:AddSeason(tbCurSeason)
end
