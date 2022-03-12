Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\vng_lib\\files_lib.lua")
Include("\\script\\global\\autoexec_head.lua")
tbTop3 = {}
tbTop3.tbSubcribers = {}
tbTop3.tbTopList = {}
tbTop3.nIDX_TONG_ID = 1
tbTop3.nIDX_TOTAL_COUNT = 2
tbTop3.nIDX_LAST_UPDATE = 3
tbTop3.tbFileHeader = {"ID Bang Héi", "Tªn Bang", "Sè l­îng", "LÇn nép cuèi"}
tbTop3.tbTopListFileHeader = {"ID Bang Héi", "Tªn Bang", "Sè l­îng", "LÇn nép cuèi"}
tbTop3.tbSubcribersPattern = {"*n", "*w", "*n", "*w"}
tbTop3.tbToplistPattern = {"*n", "*w", "*n", "*w"}
tbTop3.strFilePath = "vng_data/130408_lenhbaitiencu/"
tbTop3.strFileName = "subcribers.txt"
tbTop3.strTopListFileName = "toplist.txt"
tbTop3.nRegisterCount = 0
tbTop3.nSort_Time = 0005
tbTop3.tbPhase = {
	[1] = {201304080000, 201304142400}, --nép lÖnh bµi	
}
tbTop3.nStartDate = 201304080000
tbTop3.nEndDate = 201304152400

function tbTop3:Init()
	self.tbSubcribers = {}
	self.nRegisterCount = 0
end

function tbTop3:CheckTime()
	local nTime = tonumber(date("%H%M"))
	if (nTime >= 0000 and nTime <= 0020) then
		return 1
	end
	return 0
end

function tbTop3:GetPhase()
	local nTime = tonumber(date("%Y%m%d%H%M"))
	for i = 1, getn(self.tbPhase) do
		if nTime >= self.tbPhase[i][1] and nTime <= self.tbPhase[i][2] then
			return i
		end
	end
	return 0
end

function tbTop3:IsActive()
	local nTime = tonumber(date("%Y%m%d%H%M"))
	if nTime < self.nStartDate or nTime > self.nEndDate then
		return 0
	end
	return 1
end

function tbTop3:GiveItem(key, strTongName, nCount)
	local nPhase = self:GetPhase()
	if nPhase ~= 1 then
		Talk(1, "", "HiÖn t¹i kh«ng ph¶i thêi gian nép vËt phÈm.")
		return
	end
	if self:CheckTime() == 1 then
		Talk(1, "", "HÖ thèng ®ang tiÕn hµnh xÕp h¹ng, xin h·y quay l¹i sau.")
		return
	end
	
	if not self.tbSubcribers then
		self:Init()
	end
	local strTime = GetLocalDate("%Y-%m-%d_%H:%M:%S")
	self.tbSubcribers[key] = {strTongName, nCount,strTime}
	self:Subcribers2File()
	Say("Nép thµnh c«ng LÖnh Bµi TiÕn Cö", 1, "§ãng/OnCancel")
	return 1
end

function tbTop3:Subcribers2File()
	local tbTemp = {}
	tinsert(tbTemp, self.tbFileHeader)
	for key, val in self.tbSubcribers do
		tinsert(tbTemp, {key, val[self.nIDX_TONG_ID], val[self.nIDX_TOTAL_COUNT], val[self.nIDX_LAST_UPDATE]})
	end
	tbVngLib_File:Table2File(self.strFilePath, self.strFileName, "w", tbTemp)		
end

--Load danh s¸ch ®¨ng ký vµ top 3 vµo table
function LoadFromFile()
	--load danh s¸ch ®¨ng ký
	if not tbTop3.tbSubcribers then
		tbTop3.tbSubcribers = {}
	end
	local tb = tbVngLib_File:TableFromFile(tbTop3.strFilePath, tbTop3.strFileName, tbTop3.tbSubcribersPattern)
	if not tb then
		tbTop3.tbSubcribers = nil
		return
	end
	local nLength = 0
	for i = 1, getn(tb) do		
		if tb[i][1] then
			nLength = nLength + 1
			tbTop3.tbSubcribers[tb[i][1]] = {tb[i][2], tb[i][3], tb[i][4]}			
		end
	end
	
	tbTop3.nRegisterCount = nLength
	--load top list
	tbTop3:TopListFromFile()
	
end

function test()
	for key,val in tbTop3.tbSubcribers do
		print(key.."   "..val[1].."   "..val[2])
	end
end
----=========top list==============-----
function tbTop3:UpdateTopList()
	nActiveMapID = SubWorldID2Idx(176)
	if nActiveMapID < 0 then		
		return
	end
	self.tbTopList = {}
	local tbTemp = {}	
	--t¹o table l­u t¹m d÷ liÖu cho viÖc s¾p xÕp	
	for key, val in self.tbSubcribers do		
		tinsert(tbTemp, {key, val[self.nIDX_TONG_ID], val[self.nIDX_TOTAL_COUNT], val[self.nIDX_LAST_UPDATE]})
	end
	--s¾p xÕp table t¹m theo thø tù gi¶m dÇn dùa vµo sè l­îng vËt phÈm ®· nép
	sort(tbTemp, function (a, b) return(a[3] > b[3]) end)
	--Chän 10 ng­êi cã sè l­îng cao nhÊt ®Ó ®­a vµo danh s¸ch toplist dïng cho viÖc l­u vµo file hoÆc hiÓn thÞ t¹i npc
	local nCount = 0
 	if getn(tbTemp) > 10 then
 		nCount = 10
 	else
 		nCount = getn(tbTemp)
 	end
	for i = 1, nCount do
		self.tbTopList[i] = tbTemp[i]
	end
	--save top list vµo file
	self:TopList2File()
end
function tbTop3:TopList2File()
	local tbTemp = {}
	--insert header cña file
	tinsert(tbTemp, self.tbTopListFileHeader)
	for key, val in self.tbTopList do
		tinsert(tbTemp, val)
	end
	tbVngLib_File:Table2File(self.strFilePath, self.strTopListFileName, "w", tbTemp)	
	return 1
end

function tbTop3:TopListFromFile()
	if not self.tbTopList then
		self.tbTopList = {}
	end
	local tb = tbVngLib_File:TableFromFile(tbTop3.strFilePath, tbTop3.strTopListFileName, self.tbToplistPattern)
	if not tb then
		tbTop3.tbTopList = nil
		return
	end
	for i = 1, getn(tb) do
		self.tbTopList[i] = tb[i]
	end
end

function tbTop3:ShowTopList()
	if self:CheckTime() == 1 then
		Talk(1, "", "HÖ thèng ®ang tiÕn hµnh xÕp h¹ng, xin h·y quay l¹i sau.")
		return
	end
	if not self.tbTopList or getn(self.tbTopList) <= 0 then
		CreateNewSayEx("HiÖn t¹i ch­a cã b¶ng xÕp h¹ng",{{"§ãng",OnCancel}})
		return
	end	
	local strTittle = "Danh s¸ch 3 bang cã sè l­îng nép nhiÒu nhÊt\n"
	strTittle = strTittle..format("%-5s%-17s%-12s\n", "H¹ng", "Tªn Bang", "Sè l­îng nép")	
	for nRank = 1, getn(self.tbTopList) do
		strName = self.tbTopList[nRank][2]			
		local strTotalCount  = self.tbTopList[nRank][3]			
		strTittle = strTittle..format("<color=yellow>%-5s%-17s%-12s<color>\n", nRank, strName, strTotalCount)		
	end
	CreateNewSayEx(strTittle,{{"§ãng",OnCancel}})
end
--end top list
function tbTop3:GetCurRank(strName, strAccount)
	local j = 3
	if getn(self.tbTopList) < 3 then
		j = getn(self.tbTopList)
	end
	for i =1, j do
		local name = self.tbTopList[i][1]
		local acc = self.tbTopList[i][2]
		if strName == name and strAccount == acc then
			return i
		end
	end
	return -1
end

if tbTop3:IsActive() == 1 then
	local a = AutoFunctions:Add(LoadFromFile)
end