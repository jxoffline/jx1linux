Include("\\vng_script\\activitysys\\config\\1027\\variables.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\vng_lib\\files_lib.lua")
Include("\\script\\global\\autoexec_head.lua")

tbTop5GetAward = {}
tbTop5GetAward.nMaxNumAward = 5
tbTop5GetAward.tbAwardCheck = {0}
tbTop5GetAward.nStartDate = 201512160000
tbTop5GetAward.nEndDate = 201512312400
tbTop5GetAward.strFilePath = "vng_data/event_noel_2015/"
tbTop5GetAward.strNumTop5FileName = "top5server.txt"

function tbTop5GetAward:IsActive()
	local nTime = tonumber(date("%Y%m%d%H%M"))
	if nTime < self.nStartDate or nTime > self.nEndDate then
		return 0
	end
	return 1
end
function tbTop5GetAward:CheckCanGetAward()
	local nLastNum = self.tbAwardCheck[1]
	--print("=====tbTop5GetAward:CheckCanGetAward(): "..nLastNum)
	if not nLastNum or  nLastNum >= self.nMaxNumAward or nLastNum < 0 then
		return nil
	end
	return nLastNum
end
--Load sè l­îng ®· b¸n trong ngµy
function LoadFromFile()		
	--load file ban item hang ngay
	local strFilePatch = tbTop5GetAward.strFilePath..tbTop5GetAward.strNumTop5FileName	
	local tb = tbVngLib_File:TableFromFile2(strFilePatch,   {"*n"})
	if not tb then	
		tbTop5GetAward.tbAwardCheck = {0}		
	else
		tbTop5GetAward.tbAwardCheck = tb[1]
	end
	--print("=====LoadFromFile:tbAwardCheck: "..tbTop5GetAward.tbAwardCheck[1])
end

--ban item quy theo ngay
function tbTop5GetAward:SaveToFile()	
	if not self.tbAwardCheck  then
		tbTop5GetAward.tbAwardCheck = {0}	
	end		
	local nLastNum = self.tbAwardCheck[1]
	self.tbAwardCheck[1] =  nLastNum + 1
	local tbTemp = {}
	--insert header cña file
	tinsert(tbTemp, {"SoLuongDaNhan"})
	tinsert(tbTemp, self.tbAwardCheck)	
		--print("=====SaveToFile:tbAwardCheck: "..nLastNum+1)	
	tbVngLib_File:Table2File(self.strFilePath,self.strNumTop5FileName, "w", tbTemp)	
end


if tbTop5GetAward:IsActive() == 1 then
	local a = AutoFunctions:Add(LoadFromFile)
end