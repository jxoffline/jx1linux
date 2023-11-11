IncludeLib("FILESYS")
Include("\\script\\vng_event\\traogiai\\npah\\vng_awardclass.lua")
Include("\\script\\vng_event\\traogiai\\npah\\vng_toolaward.lua")
Include("\\script\\vng_event\\traogiai\\npah\\awards\\15\\awardlist.lua")
tbCurSeason = tbAwardClass:New()
tbCurSeason.nStartDate = 201004180000
tbCurSeason.nEndDate = 201304212400
tbCurSeason.strName = "NhËn th­ëng Vâ L©m Ngò B¸ 2"
tbCurSeason.strNPC = "ChiÕn T©m T«n Gi¶"
tbCurSeason.nID = 15
tbCurSeason.nFreeCellRequire  = 30
tbCurSeason.tbAccList = tbAwardList
tbCurSeason.tbPrizeList = {	
	[1] = {szName="Bé trang bÞ B¹ch Hæ(Max Option) - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={33,0,0,0,0,0}},
	[2] = {szName="Bé trang bÞ B¹ch Hæ - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={11,0,0,0,0,0}},
	[3] = {szName="Phi phong cÊp 6 lÔ hép",tbProp={6,1,30302,1,0,0},nCount=1,nExpiredTime=10080},
	[4] = {szName="Hång bao An khang",tbProp={6,1,2105,1,0,0},nCount=1},
	[5] = {szName="Tö Kim Ch©n §¬n",tbProp={6,1,2263,1,0,0},nCount=1,tbParam={2000000000}},
	[6] = {szName="MÆt n¹ - Anh hïng chiÕn tr­êng",tbProp={0,11,482,1,0,0},nCount=1,nExpiredTime=43200},
	[7] = {szName="Bé trang bÞ XÝch L©n - Tù chän hÖ ph¸i",tbProp={6,1,30386,1,0,0},nCount=1,nBindState=-2,tbParam={11,1,43200,0,0,0},nExpiredTime=10080},
}

tbCurSeason.tbExtPointBit = {
	[1] = {nExtPoint = 3, nBit = 9},	
}
tbCurSeason.tbLog = {"AWARD_VLNB2", "NhanThuongTaiChienTamTonGia"}
if tbCurSeason:IsOver() == 1 then
	tbCurSeason = nil
else
	tbVngToolAward:AddSeason(tbCurSeason)
end
