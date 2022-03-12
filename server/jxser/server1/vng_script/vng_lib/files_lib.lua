IncludeLib("FILESYS")

VngLib_File = {}

function loadsavevalue(szPath)
		handle = openfile(szPath, "r")
		if (handle == nil) then
			return 
		end
		
		nValue = read(handle, "*l")
		if (nValue == nil or nValue == "") then
				nValue = 0
		else
			nValue = tonumber(nValue)
		end
		closefile(handle)	
		return nValue		
end

function savevalue(szPath, nValue)
	handle = openfile(szPath, "w+")
	if (handle == nil) then
		return 0
	end
	write(handle, nValue.."\n")	
	closefile(handle)
end

function VngLib_File:Table2File(filePath, strFileName, strMode, tbData)	
	local file = openfile(filePath..strFileName, strMode)
	if file == nil then
		execute(format("mkdir -p %s", filePath))
		file = openfile(filePath..strFileName, strMode)
	end
	if type(tbData[1]) == "table" then
		for row = 1, getn(tbData) do
			for col = 1, getn(tbData[row]) do
				if col == getn(tbData[row]) then
					write(file, tbData[row][col],"\n")
				else
					write(file, tbData[row][col], "\t")
				end
			end
		end
	else
		for i = 1, getn(tbData) do
			if i == getn(tbData) then
				write(file, tbData[i], "\n")
			else
				write(file, tbData[i], "\t")
			end
		end
	end	
	closefile(file)
end

function VngLib_File:TableFromFile(filePath, strFileName, tbPattern)	
	local tbResult = {}
	local file = openfile(filePath..strFileName, "r")
	if file == nil then
		return nil
	end
	--®äc header cña file
	read(file, "*l")	
	local tbTemp = {}
	while tbTemp do
		tbTemp = pack(read(file, unpack(tbPattern)))
		if tbTemp and tbTemp[1] then
			tinsert(tbResult, tbTemp)
		else
			break			
		end
	end
	closefile(file)	
	return tbResult
end

function VngLib_File:TableFromFile2(strFilePatch, tbPattern)	
	if (TabFile_Load(strFilePatch, strFilePatch) == 0) then
		print("Load TabFile Error!"..strFilePatch)
		return nil
	else
		local tbResult = {}
		local nRowCount = TabFile_GetRowCount(strFilePatch)
		for i = 2, nRowCount do
			tbResult[i-1] = {}
			for j = 1, getn(tbPattern) do
				local tmp = nil
				if tbPattern[j] == "*n" then
					tmp = tonumber(TabFile_GetCell(strFilePatch, i, j))
				elseif tbPattern[j] == "*w" then
					tmp = tostring(TabFile_GetCell(strFilePatch, i, j))
				end
				tinsert(tbResult[i-1], tmp)
			end
		end
		return tbResult
	end
end