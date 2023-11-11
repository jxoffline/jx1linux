IncludeLib("FILESYS")
Include("\\script\\vng_event\\traogiai\\npah\\vng_awardclass.lua")
Include("\\script\\vng_event\\traogiai\\npah\\vng_toolaward.lua")
Include("\\script\\vng_event\\traogiai\\npah\\awards\\11\\awardlist.lua")
tbCurSeason = tbAwardClass:New()
tbCurSeason.nStartDate = 201210180000
tbCurSeason.nEndDate = 201210312400
tbCurSeason.strName = "NhËn th­ëng TiÒm Long NhÊt Héi"
tbCurSeason.strNPC = "ChiÕn T©m T«n Gi¶"
tbCurSeason.nID = 11
tbCurSeason.nFreeCellRequire  = 60
tbCurSeason.tbAccList = tbAwardList
tbCurSeason.tbPrizeList = {	
	[1] = {szName="Vßng Hµo Quang TiÒm Long NhÊt Héi",nTittleID=3004,nExpiredTime=259200},
	[2] = {szName="Phi phong cÊp 6 lÔ hép",tbProp={6,1,30302,1,0,0},nCount=1,nExpiredTime=7*60*24},
	[3] = {szName="Phong V©n B¹ch M·",tbProp={0,10,19,1,0,0},nCount=1},
	[4] = {szName="§å Phæ B¹ch Hæ Y",tbProp={6,1,3174,1,0,0},nCount=1},
	[5] = {szName="Hçn Nguyªn Ch©n §¬n",tbProp={6,1,30301,1,0,0},nCount=1},
	[6] = {szName="Hé M¹ch §¬n",tbProp={6,1,3203,1,0,0},nCount=1},
	[7] = {szName="Phiªn Vò ",tbProp={0,10,7,1,0,0},nCount=1},
	[8] = {szName="Hoµng kim Ên cÊp 8 lÔ hép",tbProp={6,1,30303,1,0,0},nCount=1,nExpiredTime=7*60*24},
	[9] =  {szName="Cµn Kh«n Song TuyÖt Béi",tbProp={6,1,2219,1,0,0},nCount=1,nExpiredTime=129600},
	[10] = {szName="§å Phæ B¹ch Hæ KhÝ Giíi",tbProp={6,1,3182,1,0,0},nCount=1},
	[11] = {szName="B¹ch Hæ LÖnh",tbProp={6,1,2357,1,0,0},nCount=1},
	[12] = {szName="MÆt n¹ V­¬ng Gi¶",tbProp={0,11,561,1,0,0},nCount=1,nExpiredTime=129600},
}
tbCurSeason.tbExtPointBit = {
	[1] = {nExtPoint = 5, nBit = 12},	
}
tbCurSeason.tbLog = {"TraoGiaiTiemLongNhatHoi", "NhanThuongTaiChienTamTonGia"}
if tbCurSeason:IsOver() == 1 then
	tbCurSeason = nil
else
	tbVngToolAward:AddSeason(tbCurSeason)
end
