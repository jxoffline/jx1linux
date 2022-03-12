--H÷ thËng ti’p nhÀn Æ®ng k˝ vµ x’p hπng 10 ng≠Íi level cao nh t server - Created by DinhHQ - 20110614
IncludeLib("RELAYLADDER");
Include("\\script\\worldrank\\vngglobalvar.lua")
IncludeLib("FILESYS")
Include("\\script\\vng_lib\\files_lib.lua")
Include("\\script\\global\\autoexec_head.lua")

function tbTop10:Init()
	self.tbSubcribers = {}
	self.nRegisterCount = 0
end
--=======================Ph«n Æ®ng k˝ vµ cÀp nhÀt===========================
function tbTop10:LuuDSNhanVat()
	if GetLevel()>=10 or ST_GetTransLifeCount()>0 then

	if not self.tbSubcribers then
		self:Init()
	end
	local strName = GetName()
	local lv = GetLevel() 
	if (not self.tbSubcribers[strName]) then
		self.tbSubcribers[strName] = {}
		local tbSubcriber = self.tbSubcribers[strName]
		tinsert(tbSubcriber, ST_GetTransLifeCount())			--level hi÷n tπi
		tinsert(tbSubcriber, lv)			--level hi÷n tπi
		tinsert(tbSubcriber, GetExp()/1e9)		--kinh nghi÷m hi÷n tπi
		tinsert(tbSubcriber, GetExpPercent())		--% hi÷n tπi
	end
	if (self.tbSubcribers[strName]) then
		local tbSubcriber = self.tbSubcribers[strName]
		tbSubcriber[self.nST1_LVL] =  ST_GetTransLifeCount()
		tbSubcriber[self.nCUR_LVL] = lv			--level hi÷n tπi
		tbSubcriber[self.nCUR_EXP] = GetExp()/1e9		--kinh nghi÷m hi÷n tπi
		tbSubcriber[self.nCUR_EXP_PERCENT] = GetExpPercent()	--% hi÷n tπi	
	end
	self:Subcribers2File()
	end
end
function tbTop10:Subcribers2File()
	local tbTemp = {}
	tinsert(tbTemp, self.tbFileHeader)
	for key, val in self.tbSubcribers do
		if (val[self.nCUR_EXP] < 0 ) then
			return
		else
			tinsert(tbTemp, {key, val[self.nST1_LVL], val[self.nCUR_LVL], val[self.nCUR_EXP], val[self.nCUR_EXP_PERCENT]})
		end
	end
	tbVngLib_File:Table2File(self.strFilePath, self.strFileName, "w", tbTemp)	
	return 1
end

--=======================Top list===========================
Trungsinh={
	[0]={0},
	[1]={200},
	[2]={400},
	[3]={600},
	[4]={800},
	[5]={1000},
	[6]={1200},
	[7]={1400},
}
function CheckTop10(zName)
	for i = 1, 10 do
		local nten, ncap,nphai = Ladder_GetLadderInfo(10270, i)
		if (nten == zName) then
			return 1
		end
	end
	return 0
end

--Tinh luc cach 1
function tbTop10:TinhLucXH(zName)
	if CheckTop10(zName) == 1 then
		return
	end

	--local tl =GetEnergy()
	--if tl>0 and tl<=10 then
	--	tbTop10:SapXepDSXepHang()
	--end

	if not self.tbTopList then
		return
	end
	
	local nCount = getn(self.tbTopList)

	if nCount > 1000 then
		nCount=1000
	end
	for i = 1, nCount do
		if self.tbTopList[i][1] == zName then
			--SetEnergy(self.tbTopList[i][6])
			--SetRank(self.tbTopList[i][6])
			return
		end
	end
	--SetEnergy(0)
end
function tbTop10:SapXepDSXepHang()
	self.tbTopList = {}
	local tbTemp = {}
	local strTime = GetLocalDate("%Y-%m-%d_%H:%M:%S")
	--tπo table l≠u tπm d˜ li÷u cho vi÷c sæp x’p

	if not self.tbSubcribers then
		return
	end

	for key, val in self.tbSubcribers do
		--Chi them nguoi choi khong nam trong ds top 10
		if CheckTop10(key) == 0 then
		nExp=((Trungsinh[val[self.nST1_LVL]][1]+val[self.nCUR_LVL])*2)+(val[self.nCUR_EXP_PERCENT]/100)
		tinsert(tbTemp, {key,val[self.nST1_LVL],val[self.nCUR_LVL], val[self.nCUR_EXP_PERCENT],nExp,0, strTime})
		end
	end

	if not tbTemp then
		return
	end

	--sæp x’p table tπm theo th¯ t˘ gi∂m d«n d˘a vµo sË exp tÊng
	sort(tbTemp, function (a, b) return(a[5] > b[5]) end)

	local nCount = getn(tbTemp)
	local dem = 1
	for i = 1, nCount do
		self.tbTopList[i] = tbTemp[i]
		self.tbTopList[i][6] = dem+10
		dem = dem + 1
	end
	--save top list vµo file
	self:TopList2File()
end

function tbTop10:TopList2File()
	local tbTemp = {}
	local rankList = {}
	--insert header file
	--tinsert(tbTemp, self.tbTopListFileHeader)
	tinsert(rankList, {"[Rank]"})
	for key, val in self.tbTopList do
		tinsert(tbTemp, val)
	end
	
	for i=1,10 do
	local nten, ncap,nphai = Ladder_GetLadderInfo(10270, i)
		--print("Gia Tri"..nten)
		tinsert(rankList,{nten,"="..i})
	end
	--Lay nguoi thu 11 trong toplist ghi vao ranklist
	local nCount = getn(tbTemp)
	if nCount > 999 then
		nCount=999 
	end
	for i=1,nCount do
		tinsert(rankList,{tbTemp[i][1],"="..i + 10})
	end
	tbVngLib_File:Table2File("dulieu/", "ranklist.txt", "w", rankList)
	tbVngLib_File:Table2File(self.strFilePath, self.strTopListFileName, "w", tbTemp)	
	return 1
end

function tbTop10:TopListFromFile()
	if not self.tbTopList then
		self.tbTopList = {}
	end
	local tb = tbVngLib_File:TableFromFile(tbTop10.strFilePath, tbTop10.strTopListFileName, {"*w", "*n", "*n", "*n","*n", "*n", "*w"})
	if not tb then
		tbTop10.tbTopList = nil
		return
	end
	for i = 1, getn(tb) do
		self.tbTopList[i] = tb[i]
	end
end

--=======================Top list===========================
--Load danh s∏ch Æ®ng k˝ vµ top 10 vµo table
function LoadFromFile()
	--load danh s∏ch Æ®ng k˝
	if not tbTop10.tbSubcribers then
		tbTop10.tbSubcribers = {}
	end
	local tb = tbVngLib_File:TableFromFile(tbTop10.strFilePath, tbTop10.strFileName, {"*w", "*n", "*n", "*n", "*n"})
	if not tb then
		tbTop10.tbSubcribers = nil
		return
	end
	local nLength = 0
	for i = 1, getn(tb) do		
		if tb[i][1] then
			nLength = nLength + 1
			tbTop10.tbSubcribers[tb[i][1]] = {tb[i][2], tb[i][3], tb[i][4], tb[i][5]}			
		end
	end
	
	tbTop10.nRegisterCount = nLength
	--load top list
	tbTop10:TopListFromFile()
end
--======================================================
local a = AutoFunctions:Add(LoadFromFile)