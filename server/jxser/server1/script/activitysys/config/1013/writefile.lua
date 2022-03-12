Include("\\script\\vng_lib\\files_lib.lua")
tbWriteFile = {}
tbWriteFile.tbFileHeader = {"Name","Account", "Ngµy", "Giê"}
tbWriteFile.tbSubcribersPattern = {"*w","*w", "*w", "*w"}
tbWriteFile.strFilePath = "vng_data/event_ghepchu/"
tbWriteFile.strFileName = "subcribers.txt"
tbWriteFile.nIDX_Account = 1
tbWriteFile.nIDX_Date = 2
tbWriteFile.nIDX_Hour = 3
tbWriteFile.tbGlobalHeader = {"Event","NopTruyenKy","NopLamTruyenKy", "NopVoLamTruyenKy", "NopChanKinh","NopMachChanKinh","NopBatMachChanKinh"}
tbWriteFile.tbGlobalPattern = {"*w","*n","*n", "*n", "*n","*n", "*n"}
tbWriteFile.strGlobalFileName = "globals.txt"
--tbWriteFile.tbCharacter = { "DateTime", "Name","Account", "Text", "nCount"}
--tbWriteFile.tbCharacterPattern = {"*w","*w","*w", "*w", "*w","*w", "*w"}
--tbWriteFile.strCharacterFileName = "characters.txt"

function tbWriteFile:Init()
	self.tbSubcribers = {}
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

function tbWriteFile:LoadFile()
	if not self.tbSubcribers then
		self.tbSubcribers = {}
	end
	local tb = tbVngLib_File:TableFromFile(self.strFilePath, self.strFileName, self.tbSubcribersPattern)
	if not tb then
		self.tbSubcribers = nil
		return
	end
	for i = 1, getn(tb) do		
		if tb[i][1] then
			self.tbSubcribers[tb[i][1]] = {tb[i][2], tb[i][3], tb[i][4]}			
		end
	end
end