--Hæ trî trao gi¶i th­ëng cho ng­êi chiÕn th¾ng - Created by DinhHQ - 20110607
Include("\\script\\vng_event\\traogiai\\NPAH\\vng_AwardClass.lua")
Include("\\script\\vng_event\\traogiai\\NPAH\\vng_ToolAward.lua")

tbCurSeason = tbAwardClass:New()
tbCurSeason.nStartDate = 201306060000
tbCurSeason.nEndDate = 201306092400
tbCurSeason.strName = "Trao th­ëng fanpage vµ ®Òn bï B¸t ThuËt Ch©n Kinh"
tbCurSeason.strNPC = "ChiÕn T©m T«n Gi¶"
tbCurSeason.nID = 1
tbCurSeason.tbAccList = {
	["ngocxinh9x02091989"]= {[1]={{ nAwardID = 1, nCount = 1}},},
	["ndminh1984"]= {[1]={{ nAwardID = 1, nCount = 1}},},
	["princeket11"]= {[1]={{ nAwardID = 1, nCount = 1}},},
	["amata12"]= {[1]={{ nAwardID = 1, nCount = 1}},},
	["tieuthutphcm"]= {[1]={{ nAwardID = 1, nCount = 1}},},
	["anhkhoa120592"]= {[1]={{ nAwardID = 1, nCount = 1}},},
	["ngodinhvu9739841"]= {[1]={{ nAwardID = 1, nCount = 1}},},
	["thuydung2702"]= {[1]={{ nAwardID = 1, nCount = 1}},},
	["lljimae1988"]= {[1]={{ nAwardID = 1, nCount = 1}},},
	["thanhvu0082000"]= {[1]={{ nAwardID = 1, nCount = 1}},},
	["quyenluccuaquy89"]= {[1]={{ nAwardID = 1, nCount = 1}},},
	["loveyouforever20892"]= {[1]={{ nAwardID = 1, nCount = 1}},},
	["ngamisangdaigia"]= {[1]={{ nAwardID = 1, nCount = 1}},},
	["daoto072"]= {[1]={{ nAwardID = 1, nCount = 1}},},
	["kphone743"]= {[1]={{ nAwardID = 2, nCount = 200}, { nAwardID = 3, nCount = 500}},},
	["chanhong"]= {[1]={{ nAwardID = 2, nCount = 200}, { nAwardID = 3, nCount = 500}},},
	["anhvn2208"]= {[1]={{ nAwardID = 2, nCount = 200}, { nAwardID = 3, nCount = 500}},},
	["anh_quang_no1"]= {[1]={{ nAwardID = 2, nCount = 200}, { nAwardID = 3, nCount = 500}},},
	["binhvuong"]= {[1]={{ nAwardID = 2, nCount = 200}, { nAwardID = 3, nCount = 500}},},
	["vulynk0703"]= {[1]={{ nAwardID = 2, nCount = 200}, { nAwardID = 3, nCount = 500}},},
	["lyhuonglan001"]= {[1]={{ nAwardID = 2, nCount = 200}, { nAwardID = 3, nCount = 500}},},
	["hieuctbz720"]= {[1]={{ nAwardID = 2, nCount = 200}, { nAwardID = 3, nCount = 500}},},
	["nguyendinhdinh"]= {[1]={{ nAwardID = 2, nCount = 200}, { nAwardID = 3, nCount = 500}},},
	["bittercoffee12044"]= {[1]={{ nAwardID = 2, nCount = 200}, { nAwardID = 3, nCount = 500}},},
	["tuananhdkv2"]= {[1]={{ nAwardID = 2, nCount = 200}, { nAwardID = 3, nCount = 500}},},
	["lovevy012345"]= {[1]={{ nAwardID = 2, nCount = 200}, { nAwardID = 3, nCount = 500}},},
	["romeopth"]= {[1]={{ nAwardID = 2, nCount = 200}, { nAwardID = 3, nCount = 500}},},
	["anhthanh307"]= {[1]={{ nAwardID = 2, nCount = 200}, { nAwardID = 3, nCount = 500}, { nAwardID = 4, nCount = 1}},},
	["trungdungtrancdmp1"]= {[1]={{ nAwardID = 4, nCount = 1}},},
	["hieuctbz589"]= {[1]={{ nAwardID = 5, nCount = 1}},},
	["galaxyonfire10"]= {[1]={{ nAwardID = 5, nCount = 1}},},
	["thoconoianhyeuem"]= {[1]={{ nAwardID = 5, nCount = 1}},},
	["ngheo2071983"]= {[1]={{ nAwardID = 5, nCount = 1}},},
	["eddytung1610"]= {[1]={{ nAwardID = 5, nCount = 1}},},
	["longho1628"]= {[1]={{ nAwardID = 5, nCount = 1}},},
	["nhatchungyenbai"]= {[1]={{ nAwardID = 5, nCount = 1}},},
	["thapquoctranhhung"]= {[1]={{ nAwardID = 5, nCount = 1}},},
	["o0ovohoanglong"]= {[1]={{ nAwardID = 5, nCount = 1}},},
	["bigtoe128"]= {[1]={{ nAwardID = 5, nCount = 1}},},
	["vinh6821"]= {[1]={{ nAwardID = 5, nCount = 1}},},
	["duongsang909"]= {[1]={{ nAwardID = 5, nCount = 1}},},
	["hoangpro0909490949"]= {[1]={{ nAwardID = 5, nCount = 1}},},
}
tbCurSeason.tbPrizeList = {
	[1] = 	{szName="LÔ Bao Phi Phong (cÊp 6)",tbProp={6,1,30360,1,0,0},nCount=1,tbParam={6,1,10080,0,0,0},  nExpiredTime = 10080,nBindState=-2},
	[2] ={szName="Ch©n Nguyªn §¬n (trung)",tbProp={6,1,30228,1,0,0},nCount=1,nBindState=-2,},
	[3] = {szName="Hé M¹ch §¬n",tbProp={6,1,3203,1,0,0},nCount=1,},
	[4] = {szName="Bé trang bÞ XÝch L©n - Tù chän hÖ ph¸i",tbProp={6,1,30386,1,0,0},nCount=1,nBindState=-2,tbParam={11,1,43200,0,0,0},nExpiredTime=10080},
	[5] = {szName="B¸t ThuËt Ch©n Kinh",tbProp={6,1,30126,1,0,0},nCount=1, nExpiredTime=10080},	
}
tbCurSeason.nFreeCellRequire = 10
tbCurSeason.tbExtPointBit = {
	[1] = {nID = 3, nBit = 1, nVer = 2},
}
tbCurSeason.tbLog = {"TraoThuongFanpageDenBuBatThuat", "NhanThuongTaiChienTam"}
if tbCurSeason:IsOver() == 1 then
	tbCurSeason = nil
else
	tbVngToolAward:AddSeason(tbCurSeason)
end