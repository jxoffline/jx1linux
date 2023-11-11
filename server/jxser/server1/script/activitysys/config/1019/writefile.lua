Include("\\script\\vng_lib\\files_lib.lua")
tbWriteFile = {}
tbWriteFile.tbFileHeader = {"Name","Account", "Date", "Hour"}
tbWriteFile.tbSubcribersPattern = {"*w","*w", "*w", "*w"}
tbWriteFile.strFilePath = "vng_data/truytimbaovat/"
tbWriteFile.strFileName = "subcribers.txt"
tbWriteFile.nIDX_Account = 1
tbWriteFile.nIDX_Date = 2
tbWriteFile.nIDX_Hour = 3
tbWriteFile.tbGlobalHeader = {"Event","NopVoLam","NopTruyenKy", "NopVoLamTruyenKy", "NopHungBinh","NopLuuDanh","NopHungBinhLuuDanh"}
tbWriteFile.tbGlobalPattern = {"*w","*n","*n", "*n", "*n","*n", "*n"}
tbWriteFile.strGlobalFileName = "globals.txt"

--Khoi tao viec luu lai thoi gian nhan vat nop VLTK hoac hïng binh l­u danh
function tbWriteFile:Init()
	self.tbSubcribers = self.tbSubcribers or {} 
end

function tbWriteFile:Subcribers2File()
	local tbTemp = {}
	tinsert(tbTemp, self.tbFileHeader)
	for key, val in self.tbSubcribers do
		tinsert(tbTemp, {key, val[self.nIDX_Account], val[self.nIDX_Date], val[self.nIDX_Hour]})
	end
	tbVngLib_File:Table2File(self.strFilePath, self.strFileName, "w", tbTemp)	
	return 1
end

--function tbWriteFile:LoadFile_1()
--	if not self.tbSubcribers then
--		self.tbSubcribers = {}
--	end
--	local tb = tbVngLib_File:TableFromFile(self.strFilePath, self.strFileName, self.tbSubcribersPattern)
--	if not tb then
--		self.tbSubcribers = nil
--		return
--	end
--	for i = 1, getn(tb) do		
--		if tb[i][1] then
--			self.tbSubcribers[tb[i][1]] = {tb[i][2], tb[i][3], tb[i][4]}			
--		end
--	end
--end

function tbWriteFile:LoadFile()
	self.tbSubcribers = self.tbSubcribers or {}
	local szPosPath = "\\vng_data\\truytimbaovat\\subcribers.txt"
	if (TabFile_Load(szPosPath, szPosPath) == 0) then
		print(format("can not open file víi ®­êng dÉn %s", szPosPath))
		return
	end
	local nLineCount = TabFile_GetRowCount(szPosPath)
	if not nLineCount or nLineCount < 2 then
		self.tbSubcribers = nil
		return
	end
	for nRow = 2, nLineCount do
		if TabFile_GetCell(szPosPath, nRow, 1) then
			self.tbSubcribers[TabFile_GetCell(szPosPath, nRow, 1)] = {TabFile_GetCell(szPosPath, nRow, 2),TabFile_GetCell(szPosPath, nRow, 3),TabFile_GetCell(szPosPath, nRow, 4)}
		end
	end
	TabFile_UnLoad(szPosPath)
end

function tbWriteFile:Load_Xephang(nId)
	local nNumber = tonumber(GetLocalDate("%Y%W"))
	local nLineCount = 0
	local szPosPath = format("\\vng_data\\truytimbaovat\\tichluy%s.txt",nNumber - tonumber(nId))
	--TabFile_UnLoad(szPosPath)
	if (TabFile_Load(szPosPath, szPosPath) == 0) then
		print(format("can not open file víi ®­êng dÉn %s", szPosPath))
		return
	end
	nLineCount = TabFile_GetRowCount(szPosPath)
	if not nLineCount or nLineCount < 2 then
		return
	end
	local tb = {}
	for nRow = 2, nLineCount do
		tb[TabFile_GetCell(szPosPath, nRow, "Name")] = {TabFile_GetCell(szPosPath, nRow, "Account"), tonumber(TabFile_GetCell(szPosPath, nRow, "Count"))}
	end
	TabFile_UnLoad(szPosPath)
	return tb
end