IncludeLib("FILESYS")
Include("\\script\\vng_event\\traogiai\\npah\\vng_awardclass.lua")
Include("\\script\\vng_event\\traogiai\\npah\\vng_toolaward.lua")
tbCurSeason = tbAwardClass:New()
tbCurSeason.nStartDate = 201002150000
tbCurSeason.nEndDate = 201206262400
tbCurSeason.strName = "NhËn th­ëng ®Òn bï"
tbCurSeason.strNPC = "ChiÕn T©m T«n Gi¶"
tbCurSeason.nID = 10
tbCurSeason.nFreeCellRequire = 0
--tbtbCurSeason.tbAccList ={}
tbCurSeason.szFile_VLMC = "\\settings\\event\\2012_denbutaikhoan\\denbu_award.txt"

tbCurSeason.tbPrizeList = {	
	[1] = {szName="500.000.000 §iÓm kinh nghiÖm",nExp=500000000},
	[2] = {szName="4.000.000.000 §iÓm kinh nghiÖm",nExp=4000000000},
}
tbCurSeason.tbExtPointBit = {
	[1] = {nExtPoint = 4, nBit = 2},	
}
tbCurSeason.tbLog = {"TraoThuongForum", "NhanDenBuTaiChienTamTonGia"}
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
		return 0;
	end
	local nRowCount = TabFile_GetRowCount(szFile)
	for i=2, nRowCount do
		local szName	= tostring(TabFile_GetCell(szFile, i, "AccList"))
		local nExp1	= tonumber(TabFile_GetCell(szFile, i, "500Exp")) or 0
		local nExp2	= tonumber(TabFile_GetCell(szFile, i, "400Exp")) or 0
		local tb = {}
		if (nExp1 > 0)	 then
			tinsert(tb,{nAwardID=1,nCount=nExp1})
		end
		if (nExp2 > 0)	 then
			tinsert(tb,{nAwardID=2,nCount=nExp2})
		end
		tbCurSeason.nFreeCell = 1
		tbData[szName] = {}	
		tinsert(tbData[szName], tb)
	end
end

tbCurSeason:LoadFile()
