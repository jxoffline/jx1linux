IncludeLib("FILESYS")
Include("\\script\\vng_event\\traogiai\\npah\\vng_awardclass.lua")
Include("\\script\\vng_event\\traogiai\\npah\\vng_toolaward.lua")
tbCurSeason = tbAwardClass:New()
tbCurSeason.nStartDate = 201002150000
tbCurSeason.nEndDate = 201206302400
tbCurSeason.strName = "NhËn th­ëng VLMC 4"
tbCurSeason.strNPC = "ChiÕn T©m T«n Gi¶"
tbCurSeason.nID = 9
tbCurSeason.nFreeCellRequire  = 6
tbCurSeason.tbAccList ={}
tbCurSeason.szFile_VLMC = "\\settings\\event\\2012_vlmc4\\vlmc_award.txt"

tbCurSeason.tbPrizeList = {	
	[1] = {szName="B¹ch Hæ LÖnh",tbProp={6,1,2357,1,0,0},nCount=1},
	[2] = {szName="Qu¶ Hoµng Kim (100 LÇn)",tbProp={6,1,30095,1,0,0},nCount=1},	
	[3] = {szName="Hoµng ch©n §¬n",tbProp={6,1,2264,1,0,0},nCount=1},	
	[4] = {szName="200000000 §iÓm kinh nghiÖm",nExp=200000000},
}
tbCurSeason.tbExtPointBit = {
	[1] = {nExtPoint = 3, nBit = 14},	
}
tbCurSeason.tbLog = {"TraoThuongForum", "NhanThuongTaiChienTamTonGia"}
if tbCurSeason:IsOver() == 1 then
	tbCurSeason = nil
else
	tbVngToolAward:AddSeason(tbCurSeason)
end

function tbCurSeason:LoadFile()
	self.tbAccList = {}
	self:LoadOneFile( self.tbAccList, self.szFile_VLMC)
end

function tbCurSeason:LoadOneFile(tbData,szFile)
	if TabFile_Load(szFile, szFile) == 0 then
		WriteLog(format("Load %s is fail", szFile))
		return 0
	end
	local nRowCount = TabFile_GetRowCount(szFile)
	for i=2, nRowCount do
		local szName	= tostring(TabFile_GetCell(szFile, i, "Account"))
		local nBHL	= tonumber(TabFile_GetCell(szFile, i, "BachHoLenh")) or 0
		local nQHK	= tonumber(TabFile_GetCell(szFile, i, "QuaHoangKim")) or 0
		local nHCD	= tonumber(TabFile_GetCell(szFile, i, "HoangChanDon")) or 0
		local nExp200	= tonumber(TabFile_GetCell(szFile, i, "200TrieuExp")) or 0
		local tb = {}
		if (nBHL > 0)	 then
			tinsert(tb,{nAwardID=1,nCount=nBHL})
		end
		if (nQHK > 0)	 then
			tinsert(tb,{nAwardID=2,nCount=nQHK})
		end
		if (nHCD > 0)	 then
			tinsert(tb,{nAwardID=3,nCount=nHCD})
		end
		if (nExp200 > 0)	 then
			tinsert(tb,{nAwardID=4,nCount=1})
		end
		tbData[szName] = {}	
		tinsert(tbData[szName], tb)
	end
end

tbCurSeason:LoadFile()
