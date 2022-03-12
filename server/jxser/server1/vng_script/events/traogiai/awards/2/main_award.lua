Include("\\vng_script\\events\\traogiai\\vng_awardclass.lua")
Include("\\vng_script\\events\\traogiai\\vng_toolaward.lua")

tbCurSeason = VngAwardClass:New()
tbCurSeason.nStartDate = 201505290000 --ngay bat dau la ngay up patch
tbCurSeason.nEndDate = 201506042400
tbCurSeason.strName = "Trao Th­ëng §¹i Héi CTC"
tbCurSeason.strNPC = "Sø Gi¶ Trao Th­ëng"
tbCurSeason.nID = 2
tbCurSeason.tbAccList = {	
--nhom nhan goi qua 1
	["klgt090"]={[1]={{nAwardID=1,nCount=1},},},
	["tuananhnbt0"]={[1]={{nAwardID=1,nCount=1},},},
	["linhgiangnd1"]={[1]={{nAwardID=1,nCount=1},},},
	["beodaigia1234567"]={[1]={{nAwardID=1,nCount=1},},},
	["tanokhp77"]={[1]={{nAwardID=1,nCount=1},},},
	["bptrumlop1"]={[1]={{nAwardID=1,nCount=1},},},
	["quakhu85sg"]={[1]={{nAwardID=1,nCount=1},},},
	["khavygiamy"]={[1]={{nAwardID=1,nCount=1},},},
	["saophajsoannhj5557"]={[1]={{nAwardID=1,nCount=1},},},
	["tamnh004"]={[1]={{nAwardID=1,nCount=1},},},
	--nhom nhan goi qua 2,3
	["kevinokok"]={[1]={{nAwardID=2,nCount=1},{nAwardID=3,nCount=1},},},
	["luckyboy998"]={[1]={{nAwardID=2,nCount=1},{nAwardID=3,nCount=1},},},
	["gacon951"]={[1]={{nAwardID=2,nCount=1},{nAwardID=3,nCount=1},},},
	["khovitaikhoan"]={[1]={{nAwardID=2,nCount=1},{nAwardID=3,nCount=1},},},
	["chuotyeungo"]={[1]={{nAwardID=2,nCount=1},{nAwardID=3,nCount=1},},},
	["namkhj91"]={[1]={{nAwardID=2,nCount=1},{nAwardID=3,nCount=1},},},
	["locthuytn"]={[1]={{nAwardID=2,nCount=1},{nAwardID=3,nCount=1},},},
	["batistuthpv1"]={[1]={{nAwardID=2,nCount=1},{nAwardID=3,nCount=1},},},
	["thaomy"]={[1]={{nAwardID=2,nCount=1},{nAwardID=3,nCount=1},},},
	["hjtzfjz3"]={[1]={{nAwardID=2,nCount=1},{nAwardID=3,nCount=1},},},	
	--nhom nhan goi qua 3
	["mediablue100"]={[1]={{nAwardID=2,nCount=1},},},
	["hhaylamnha04"]={[1]={{nAwardID=2,nCount=1},},},
	["gaumap090988"]={[1]={{nAwardID=2,nCount=1},},},
	["khongbiettheosau"]={[1]={{nAwardID=2,nCount=1},},},
	["dpnguyen060293"]={[1]={{nAwardID=2,nCount=1},},},
	["thuythuy2646"]={[1]={{nAwardID=2,nCount=1},},},
	["Kakate0000"]={[1]={{nAwardID=2,nCount=1},},},
	["tuannhox001"]={[1]={{nAwardID=2,nCount=1},},},
	["caihopgiay222"]={[1]={{nAwardID=2,nCount=1},},},
	["kundun"]={[1]={{nAwardID=2,nCount=1},},},
	["xungdanhhotrinh20141"]={[1]={{nAwardID=2,nCount=1},},},
	["quangngocsmile01"]={[1]={{nAwardID=2,nCount=1},},},
	["khachao11312"]={[1]={{nAwardID=2,nCount=1},},},
	["gianghn0988098702"]={[1]={{nAwardID=2,nCount=1},},},
	["votinhkhack01"]={[1]={{nAwardID=2,nCount=1},},},
	["titiakays6666"]={[1]={{nAwardID=2,nCount=1},},},
	["ngaothiennhatkiem07"]={[1]={{nAwardID=2,nCount=1},},},
	["trendaucotoc11"]={[1]={{nAwardID=2,nCount=1},},},
	["huykun83"]={[1]={{nAwardID=2,nCount=1},},},
	["hienanhnhi01"]={[1]={{nAwardID=2,nCount=1},},},
}

tbCurSeason.tbPrizeList = {
	[1] = {szName="[Hoµn Mü] An Bang B¨ng Tinh Th¹ch H¹ng Liªn",tbProp={0,210},nCount=1,nQuality = 1,},
	[2] = {szName="[Hoµn Mü] An Bang Kª HuyÕt Th¹ch Giíi ChØ",tbProp={0,213},nCount=1,nQuality = 1,},
	[3] =	{szName="[Hoµn Mü] An Bang Cóc Hoa Th¹ch ChØ Hoµn",tbProp={0,211},nCount=1,nQuality = 1,},
	
}
tbCurSeason.nFreeCellRequire = 20
tbCurSeason.tbExtPointBit = {
	[1] = {nID = 3, nBit = 3, nVer = 1},
}
tbCurSeason.tbLog = {LOG_TITLE, "NhanTaiSuGiaTraoThuong"}
if tbCurSeason:IsOver() == 1 then
	tbCurSeason = nil
else
	VngToolAward:AddSeason(tbCurSeason)
end
