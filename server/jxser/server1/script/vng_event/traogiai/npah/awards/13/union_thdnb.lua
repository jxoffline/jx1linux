IncludeLib("FILESYS")
Include("\\script\\vng_event\\traogiai\\npah\\vng_awardclass.lua")
Include("\\script\\vng_event\\traogiai\\npah\\vng_toolaward.lua")
Include("\\script\\vng_event\\traogiai\\npah\\awards\\13\\awardlist.lua")
tbCurSeason = tbAwardClass:New()
tbCurSeason.nStartDate = 201012010000
tbCurSeason.nEndDate = 201212062400
tbCurSeason.strName = "Trao gi¶i UNION vµ bèc th¨m THDNB"
tbCurSeason.strNPC = "ChiÕn T©m T«n Gi¶"
tbCurSeason.nID = 13
tbCurSeason.nFreeCellRequire  = 60
tbCurSeason.tbAccList = tbAwardList
tbCurSeason.tbPrizeList = {	
	[1] = {szName="MÆt n¹ - Anh hïng chiÕn tr­êng",tbProp={0,11,482,1,0,0},nCount=1,nExpiredTime=10080,nUsageTime=60},
	[2] = {szName="MÆt n¹ - Anh hïng chiÕn tr­êng",tbProp={0,11,482,1,0,0},nCount=1,nExpiredTime=259200},
	[3] = {szName="XÝch Long C©u",tbProp={0,10,9,1,0,0},nCount=1},
	[4] = {szName="HuyÕt Long §»ng CÊp 6",tbProp={6,1,30289,6,0,0},nCount=1},
	[5] = {szName="Tói Thiªn Léc Phóc",tbProp={6,1,3268,1,0,0},nCount=1,nExpiredTime=20160},
	[6] = {szName = "§iÓm Kinh NghiÖm", nExp=100000000},
	[7] = {szName = "§iÓm Kinh NghiÖm", nExp=150000000},
	[8] = {szName="Ch©n Nguyªn §¬n (®¹i)",tbProp={6,1,30229,1,0,0},nCount=1,nBindState=-2},
	[9] = {szName="Hé M¹ch §¬n",tbProp={6,1,3203,1,0,0},nCount=1},
	[10] = {szName="B¹ch Hæ KhÝ Giíi - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=3,tbParam={7,0,0,0,0,0}},
	[11] = {szName="Tø H¶i Tiªu Diªu §¬n LÔ Hép",tbProp={6,1,2398,1,0,0},nCount=1,nExpiredTime=20160},
	[12] = {szName="Viªm §Õ LÖnh",tbProp={6,1,1617,1,0,0},nCount=1,nExpiredTime=20160},
	[13] = {szName="Long HuyÕt Hoµn",tbProp={6,1,2117,1,0,0},nCount=1,nExpiredTime=20160},
	[14] = {szName="Ngäc Trïng LuyÖn LÔ Hép",tbProp={6,1,30323,1,0,0},nCount=1,nExpiredTime=10080,nBindState=-2},
	[15] = {szName="Tói Quµ Sù KiÖn",tbProp={6,1,30324,1,0,0},nCount=1,nExpiredTime=10080,nBindState=-2},
}
tbCurSeason.tbExtPointBit = {
	[1] = {nExtPoint = 5, nBit = 13},	
}
tbCurSeason.tbLog = {"UNION_THDNB", "NhanThuongTaiChienTamTonGia"}
if tbCurSeason:IsOver() == 1 then
	tbCurSeason = nil
else
	tbVngToolAward:AddSeason(tbCurSeason)
end
