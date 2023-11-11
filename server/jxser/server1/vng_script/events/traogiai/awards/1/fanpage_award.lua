Include("\\vng_script\\events\\traogiai\\vng_awardclass.lua")
Include("\\vng_script\\events\\traogiai\\vng_toolaward.lua")

tbCurSeason = VngAwardClass:New()
tbCurSeason.nStartDate = 201504060000 --ngay bat dau la ngay up patch
tbCurSeason.nEndDate = 201504092400
tbCurSeason.strName = "Trao Th­ëng Fanpage"
tbCurSeason.strNPC = "Sø Gi¶ Trao Th­ëng"
tbCurSeason.nID = 1
tbCurSeason.tbAccList = {
	["2020nguyenxuanquy"]={[1]={{nAwardID=2,nCount=1},{nAwardID=4,nCount=1},},},
	["49wind"]={[1]={{nAwardID=1,nCount=1},{nAwardID=2,nCount=1},{nAwardID=3,nCount=1},{nAwardID=4,nCount=1},},},
	["acctvdn8"]={[1]={{nAwardID=1,nCount=1},{nAwardID=4,nCount=1},{nAwardID=6,nCount=3},},},
	["an200919901"]={[1]={{nAwardID=2,nCount=1},{nAwardID=4,nCount=1},},},
	["bank9666"]={[1]={{nAwardID=1,nCount=1},{nAwardID=4,nCount=1},{nAwardID=6,nCount=3},},},
	["ben634"]={[1]={{nAwardID=1,nCount=2},{nAwardID=2,nCount=2},{nAwardID=3,nCount=1},{nAwardID=4,nCount=2},{nAwardID=5,nCount=3},},},
	["betunto"]={[1]={{nAwardID=1,nCount=3},{nAwardID=2,nCount=3},{nAwardID=3,nCount=1},{nAwardID=4,nCount=4},{nAwardID=5,nCount=3},{nAwardID=6,nCount=3},},},
	["binhhoa9094"]={[1]={{nAwardID=1,nCount=1},{nAwardID=4,nCount=1},{nAwardID=6,nCount=3},},},
	["boysaigon6008"]={[1]={{nAwardID=1,nCount=1},{nAwardID=4,nCount=1},{nAwardID=6,nCount=3},},},
	["bvlhmkc2"]={[1]={{nAwardID=2,nCount=1},{nAwardID=4,nCount=1},},},
	["caytiendnno62"]={[1]={{nAwardID=1,nCount=1},{nAwardID=2,nCount=1},{nAwardID=3,nCount=1},{nAwardID=4,nCount=1},},},
	["chiboss2000"]={[1]={{nAwardID=1,nCount=2},{nAwardID=2,nCount=1},{nAwardID=3,nCount=1},{nAwardID=4,nCount=2},{nAwardID=6,nCount=3},},},
	["chienbinhthan92"]={[1]={{nAwardID=1,nCount=1},{nAwardID=2,nCount=1},{nAwardID=3,nCount=1},{nAwardID=4,nCount=1},},},
	["choosbeck"]={[1]={{nAwardID=2,nCount=1},{nAwardID=4,nCount=1},},},
	["country0000"]={[1]={{nAwardID=2,nCount=1},{nAwardID=4,nCount=1},},},
	["ctcvolam004"]={[1]={{nAwardID=2,nCount=1},{nAwardID=4,nCount=1},},},
	["damquangthanhvt0"]={[1]={{nAwardID=1,nCount=1},{nAwardID=2,nCount=1},{nAwardID=3,nCount=1},{nAwardID=4,nCount=1},},},
	["daoprohcmconlondao"]={[1]={{nAwardID=2,nCount=1},{nAwardID=4,nCount=1},},},
	["delaitinhanh00"]={[1]={{nAwardID=1,nCount=1},{nAwardID=2,nCount=1},{nAwardID=4,nCount=1},{nAwardID=5,nCount=3},},},
	["dmabucroiday"]={[1]={{nAwardID=1,nCount=2},{nAwardID=2,nCount=2},{nAwardID=3,nCount=1},{nAwardID=4,nCount=2},{nAwardID=5,nCount=3},},},
	["dmas00091098"]={[1]={{nAwardID=1,nCount=1},{nAwardID=2,nCount=1},{nAwardID=4,nCount=1},{nAwardID=5,nCount=3},},},
	["doankhanhksc"]={[1]={{nAwardID=1,nCount=1},{nAwardID=4,nCount=1},{nAwardID=6,nCount=3},},},
	["dominhanh2209"]={[1]={{nAwardID=1,nCount=2},{nAwardID=2,nCount=1},{nAwardID=3,nCount=1},{nAwardID=4,nCount=2},{nAwardID=6,nCount=3},},},
	["dragon555ok"]={[1]={{nAwardID=1,nCount=1},{nAwardID=2,nCount=1},{nAwardID=3,nCount=1},{nAwardID=4,nCount=1},},},
	["dungsaochoi123"]={[1]={{nAwardID=2,nCount=1},{nAwardID=4,nCount=1},},},
	["fangfangfang31"]={[1]={{nAwardID=1,nCount=1},{nAwardID=2,nCount=1},{nAwardID=4,nCount=2},{nAwardID=6,nCount=3},},},
	["hhluyenkill31"]={[1]={{nAwardID=1,nCount=1},{nAwardID=2,nCount=1},{nAwardID=4,nCount=1},{nAwardID=5,nCount=3},},},
	["hhluyenkill32"]={[1]={{nAwardID=1,nCount=1},{nAwardID=2,nCount=1},{nAwardID=4,nCount=1},{nAwardID=5,nCount=3},},},
	["hhvutqa2"]={[1]={{nAwardID=1,nCount=1},{nAwardID=2,nCount=1},{nAwardID=4,nCount=1},{nAwardID=5,nCount=3},},},
	["hhvutqa3"]={[1]={{nAwardID=1,nCount=1},{nAwardID=2,nCount=1},{nAwardID=3,nCount=1},{nAwardID=4,nCount=1},},},
	["hoangduy0703"]={[1]={{nAwardID=1,nCount=2},{nAwardID=2,nCount=2},{nAwardID=3,nCount=1},{nAwardID=4,nCount=2},{nAwardID=5,nCount=3},},},
	["hoangpham77003"]={[1]={{nAwardID=1,nCount=1},{nAwardID=2,nCount=1},{nAwardID=3,nCount=1},{nAwardID=4,nCount=1},},},
	["hoituanhhungvt"]={[1]={{nAwardID=1,nCount=1},{nAwardID=2,nCount=1},{nAwardID=3,nCount=1},{nAwardID=4,nCount=1},},},
	["huyuotlss"]={[1]={{nAwardID=2,nCount=1},{nAwardID=4,nCount=1},},},
	["katamqs40"]={[1]={{nAwardID=1,nCount=1},{nAwardID=4,nCount=1},{nAwardID=6,nCount=3},},},
	["kentarotran"]={[1]={{nAwardID=1,nCount=3},{nAwardID=2,nCount=3},{nAwardID=3,nCount=1},{nAwardID=4,nCount=4},{nAwardID=5,nCount=3},{nAwardID=6,nCount=3},},},
	["khoatoday5"]={[1]={{nAwardID=2,nCount=1},{nAwardID=4,nCount=1},},},
	["kuthanhkaite4"]={[1]={{nAwardID=2,nCount=1},{nAwardID=4,nCount=1},},},
	["mekiepthanhthan"]={[1]={{nAwardID=2,nCount=1},{nAwardID=4,nCount=1},},},
	["minhhieu22192nm"]={[1]={{nAwardID=2,nCount=1},{nAwardID=4,nCount=1},},},
	["mrtinhvhbt"]={[1]={{nAwardID=1,nCount=1},{nAwardID=4,nCount=1},{nAwardID=6,nCount=3},},},
	["nethaianh001"]={[1]={{nAwardID=1,nCount=1},{nAwardID=2,nCount=1},{nAwardID=4,nCount=1},{nAwardID=5,nCount=3},},},
	["ngudocstpro1994"]={[1]={{nAwardID=1,nCount=1},{nAwardID=2,nCount=1},{nAwardID=4,nCount=1},{nAwardID=5,nCount=3},},},
	["nguyenthanhlcc1"]={[1]={{nAwardID=1,nCount=1},{nAwardID=4,nCount=1},{nAwardID=6,nCount=3},},},
	["nguyenthiepbk"]={[1]={{nAwardID=1,nCount=1},{nAwardID=2,nCount=1},{nAwardID=4,nCount=1},{nAwardID=5,nCount=3},},},
	["nh0cviplata"]={[1]={{nAwardID=1,nCount=1},{nAwardID=2,nCount=1},{nAwardID=4,nCount=1},{nAwardID=5,nCount=3},},},
	["nh8bvantuong6"]={[1]={{nAwardID=2,nCount=1},{nAwardID=4,nCount=1},},},
	["nhungxinh16081987"]={[1]={{nAwardID=2,nCount=1},{nAwardID=4,nCount=1},},},
	["nuocnhadam"]={[1]={{nAwardID=2,nCount=1},{nAwardID=4,nCount=1},},},
	["onehercl1984"]={[1]={{nAwardID=1,nCount=1},{nAwardID=2,nCount=1},{nAwardID=3,nCount=1},{nAwardID=4,nCount=1},},},
	["ongxavoicuabaxagau122"]={[1]={{nAwardID=1,nCount=1},{nAwardID=2,nCount=1},{nAwardID=4,nCount=1},{nAwardID=5,nCount=3},},},
	["pnakdieplientu"]={[1]={{nAwardID=1,nCount=1},{nAwardID=4,nCount=1},{nAwardID=6,nCount=3},},},
	["pttmkc1"]={[1]={{nAwardID=1,nCount=1},{nAwardID=2,nCount=1},{nAwardID=4,nCount=1},{nAwardID=5,nCount=3},},},
	["pttmkc2"]={[1]={{nAwardID=1,nCount=1},{nAwardID=2,nCount=1},{nAwardID=4,nCount=1},{nAwardID=5,nCount=3},},},
	["pttmkc3"]={[1]={{nAwardID=1,nCount=1},{nAwardID=2,nCount=1},{nAwardID=4,nCount=1},{nAwardID=5,nCount=3},},},
	["sonvl7000"]={[1]={{nAwardID=1,nCount=1},{nAwardID=4,nCount=1},{nAwardID=6,nCount=3},},},
	["taiyeuchi91"]={[1]={{nAwardID=2,nCount=1},{nAwardID=4,nCount=1},},},
	["thienvuongboss93"]={[1]={{nAwardID=1,nCount=1},{nAwardID=2,nCount=1},{nAwardID=4,nCount=1},{nAwardID=5,nCount=3},},},
	["thuyyenboss93"]={[1]={{nAwardID=1,nCount=1},{nAwardID=2,nCount=1},{nAwardID=3,nCount=1},{nAwardID=4,nCount=1},},},
	["tonyteo140493"]={[1]={{nAwardID=1,nCount=1},{nAwardID=2,nCount=1},{nAwardID=4,nCount=1},{nAwardID=5,nCount=3},},},
	["tungoclove6"]={[1]={{nAwardID=1,nCount=1},{nAwardID=2,nCount=1},{nAwardID=4,nCount=2},{nAwardID=6,nCount=3},},},
	["vnbest25"]={[1]={{nAwardID=2,nCount=1},{nAwardID=4,nCount=1},},},
	["volammoi1414"]={[1]={{nAwardID=2,nCount=1},{nAwardID=4,nCount=1},},},
	["volamnewbd"]={[1]={{nAwardID=1,nCount=1},{nAwardID=2,nCount=1},{nAwardID=4,nCount=1},{nAwardID=5,nCount=3},},},
	["volamtruyenkythuoclac"]={[1]={{nAwardID=1,nCount=1},{nAwardID=4,nCount=1},{nAwardID=6,nCount=3},},},
	["vothienk404"]={[1]={{nAwardID=1,nCount=1},{nAwardID=2,nCount=1},{nAwardID=4,nCount=1},{nAwardID=5,nCount=3},},},
	["votinhkhack01"]={[1]={{nAwardID=2,nCount=1},{nAwardID=4,nCount=1},},},
	["xipokuku"]={[1]={{nAwardID=1,nCount=1},{nAwardID=2,nCount=2},{nAwardID=4,nCount=2},{nAwardID=5,nCount=3},},},
	["xjkehy20394"]={[1]={{nAwardID=1,nCount=2},{nAwardID=2,nCount=2},{nAwardID=3,nCount=1},{nAwardID=4,nCount=2},{nAwardID=5,nCount=3},},},
	["zcuumap2"]={[1]={{nAwardID=1,nCount=1},{nAwardID=4,nCount=1},{nAwardID=6,nCount=3},},},
	["zenfone16"]={[1]={{nAwardID=1,nCount=1},{nAwardID=2,nCount=1},{nAwardID=3,nCount=1},{nAwardID=4,nCount=1},},},
	["zid_hoan123"]={[1]={{nAwardID=2,nCount=1},{nAwardID=4,nCount=1},},},
}

tbCurSeason.tbPrizeList = {
	[1] = {szName = "Tiªn Th¶o Lé", tbProp={6,1,71,1,0,0},nCount=1,nBindState=-2},
	[2] = {szName = "ThiÕt La H¸n", tbProp = {6,1,23,-1,-1,0}, nCount = 1, nBindState=-2},
	[3] = {szName = "B¸t Nh· T©m Kinh", tbProp={6,1,12,1,0,0},nCount=1, nBindState=-2},
	[4] = {szName = "Vâ L©m MËt TÞch", tbProp={6,1,26,1,0,0},nCount=1, nBindState=-2},
	[5] = {szName = "Tinh Hång B¶o Th¹ch", tbProp = {4, 353, 1, 1, 0, 0},nCount=1, nBindState=-2},
	[6] = {szName = "Lôc thñy tinh", tbProp = {4,240,1,1,0,0}, nCount = 1, nBindState=-2},
}
tbCurSeason.nFreeCellRequire = 10
tbCurSeason.tbExtPointBit = {
	[1] = {nID = 3, nBit = 1, nVer = 1},
}
tbCurSeason.tbLog = {LOG_TITLE, "NhanTaiSuGiaTraoThuong"}
if tbCurSeason:IsOver() == 1 then
	tbCurSeason = nil
else
	VngToolAward:AddSeason(tbCurSeason)
end
