--Hæ trî trao gi¶i th­ëng cho ng­êi chiÕn th¾ng - Created by DinhHQ - 20110607
Include("\\script\\vng_event\\traogiai\\npah\\vng_awardclass.lua")
Include("\\script\\vng_event\\traogiai\\npah\\vng_toolaward.lua")
tbCurSeason = tbAwardClass:New()
tbCurSeason.nStartDate = 201202150000
tbCurSeason.nEndDate = 201202192400
tbCurSeason.strName = "NhËn th­ëng dù ®o¸n THDNB"
tbCurSeason.strNPC = "ChiÕn T©m T«n Gi¶"
tbCurSeason.nID = 8
tbCurSeason.tbAccList = {		
	["0toiditimtoi0"]={[1]={{nAwardID=6,nCount=1},{nAwardID=7,nCount=1},},},
	["2009superdear"]={[1]={{nAwardID=4,nCount=1},},},
	["amenconvotoi"]={[1]={{nAwardID=6,nCount=1},{nAwardID=7,nCount=1},},},
	["assassinpro9x"]={[1]={{nAwardID=6,nCount=1},{nAwardID=7,nCount=1},},},
	["besickxxx"]={[1]={{nAwardID=6,nCount=1},{nAwardID=7,nCount=1},},},
	["boom288"]={[1]={{nAwardID=6,nCount=1},{nAwardID=7,nCount=1},},},
	["btk2906"]={[1]={{nAwardID=4,nCount=1},},},
	["chandat02"]={[1]={{nAwardID=6,nCount=1},{nAwardID=7,nCount=1},},},
	["diembich1988py"]={[1]={{nAwardID=5,nCount=1},{nAwardID=12,nCount=1},},},
	["heomoi2110"]={[1]={{nAwardID=6,nCount=1},{nAwardID=7,nCount=1},},},
	["lenhbaianbang03"]={[1]={{nAwardID=4,nCount=1},},},
	["mylosumy"]={[1]={{nAwardID=6,nCount=1},{nAwardID=7,nCount=1},},},
	["pippicute2"]={[1]={{nAwardID=6,nCount=1},{nAwardID=7,nCount=1},},},
	["pippicute6"]={[1]={{nAwardID=5,nCount=1},},},
	["pippicute8"]={[1]={{nAwardID=4,nCount=1},{nAwardID=6,nCount=3},{nAwardID=7,nCount=3},},},
	["sieutoc12002"]={[1]={{nAwardID=4,nCount=1},},},
	["sonvl9999"]={[1]={{nAwardID=6,nCount=2},{nAwardID=7,nCount=2},},},
	["taplamphuho00"]={[1]={{nAwardID=4,nCount=1},},},
	["thanhsang24101993"]={[1]={{nAwardID=3,nCount=1},{nAwardID=8,nCount=1},{nAwardID=9,nCount=1},},},
	["thapbattu"]={[1]={{nAwardID=6,nCount=1},{nAwardID=7,nCount=1},},},
	["thuyvltk35"]={[1]={{nAwardID=6,nCount=1},{nAwardID=7,nCount=1},},},
	["tieuphongpt"]={[1]={{nAwardID=1,nCount=8},{nAwardID=6,nCount=1},{nAwardID=7,nCount=1},},},
	["truyphongii"]={[1]={{nAwardID=6,nCount=1},{nAwardID=7,nCount=1},{nAwardID=8,nCount=1},{nAwardID=9,nCount=1},},},
	["vaobangkaka06"]={[1]={{nAwardID=2,nCount=8},{nAwardID=3,nCount=1},{nAwardID=5,nCount=1},},},
	["vaobangtt8"]={[1]={{nAwardID=5,nCount=1},},},
	["vihongphuong02"]={[1]={{nAwardID=5,nCount=3},},},
	["volamtuyan2"]={[1]={{nAwardID=6,nCount=1},{nAwardID=7,nCount=1},},},
	["xitrumcuchicc"]={[1]={{nAwardID=6,nCount=1},{nAwardID=7,nCount=1},},},
	["codonminhanh2911"]={[1]={{nAwardID=11,nCount=1},},},
	["tieudieuthancai"]={[1]={{nAwardID=3,nCount=1},},},
	["vothiennhi"]={[1]={{nAwardID=1,nCount=8},},},
	["benhi22011"]={[1]={{nAwardID=4,nCount=1},},},
	["phamtan"]={[1]={{nAwardID=1,nCount=1},{nAwardID=2,nCount=1},{nAwardID=4,nCount=1},{nAwardID=5,nCount=1},{nAwardID=10,nCount=1},{nAwardID=11,nCount=1},{nAwardID=12,nCount=1},},},	
}
tbCurSeason.tbPrizeList = {	
	[1] = {szName="§å Phæ Kim ¤ KhÝ Giíi",tbProp={6,1,2991,1,0,0},nCount=1},
	[2] = {szName="§å Phæ Kim ¤ Th­îng Giíi",tbProp={6,1,2989,1,0,0},nCount=1},	
	[3] = {szName="Phiªn Vò (HSD 6 th¸ng)",tbProp={0,10,7,1,0,0},nCount=1,nExpiredTime = 259200},	
	[4] = {szName="Cµn Kh«n Song TuyÖt Béi",tbProp={6,1,2219,1,0,0},nCount=1,nExpiredTime=43200},
	[5] = {szName="MÆt n¹ V­¬ng Gi¶",tbProp={0,11,561,1,0,0},nCount=1,nExpiredTime=43200},	
	[6] = 	{szName="Hång bao An khang",tbProp={6,1,2105,1,0,0},nCount=1},
	[7] = {szName="Hång bao Sum vÇy",tbProp={6,1,2104,1,0,0},nCount=1},	
	[8] = {szName="Hoµng Ch©n §¬n",tbProp={6,1,2264,1,0,0},nCount=1},
	[9] = {szName="Tö Kim Ch©n §¬n",tbProp={6,1,2263,1,0,0},nCount=1,tbParam={2000000000}},
	[10] = {szName="Phiªn Vò (HSD vÜnh viÔn)",tbProp={0,10,7,1,0,0},nCount=1,},	
	[11] = {szName="Kim ¤ LÖnh",tbProp={6,1,2349,1,0,0},nCount=1},
	[12]={szName="Qu¶ Hoµng Kim (100)",tbProp={6,1,30095,1,0,0},nCount=1},
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
	[1] = {nExtPoint = 5, nBit = 7},	
}
tbCurSeason.tbLog = {"TraoThuongForum", "NhanThuongTaiChienTamTonGia"}
if tbCurSeason:IsOver() == 1 then
	tbCurSeason = nil
else
	tbVngToolAward:AddSeason(tbCurSeason)
end