Include("\\vng_script\\activitysys\\config\\1026\\variables.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\vng_lib\\files_lib.lua")
Include("\\script\\global\\autoexec_head.lua")
Include("\\vng_script\\vng_lib\\bittask_lib.lua")

tbListSaleDaily = {}
tbListSaleDaily.tbAwardCheck = {0,0,0,0,0,0,0,0,0,0}
tbListSaleDaily.tbAwardCheck_SaleDaily = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
tbListSaleDaily.nStartDate = 201507030000
tbListSaleDaily.nEndDate = 202007032400 -- chua co ngay ket thuc tinh nang nay
tbListSaleDaily.strFilePath = "vng_settings/features/shop_thamvantam/"
tbListSaleDaily.strNumSaleFileName = "thamvantam_fix_201506.txt"
tbListSaleDaily.strNumSaleFileName_Daily = "thamvantam_monthly_2015.txt"

function tbListSaleDaily:IsActive()
	local nTime = tonumber(date("%Y%m%d%H%M"))
	if nTime < self.nStartDate or nTime > self.nEndDate then
		return 0
	end
	return 1
end

--Load sè l­îng ®· b¸n trong ngµy
function LoadFromFile()	
	--load file ban trang bi quý hiem
	--tam thoi dong, khi nao ban mo lai
	
--	local strFilePatch = tbListSaleDaily.strFilePath..tbListSaleDaily.strNumSaleFileName	
--	local tb = tbVngLib_File:TableFromFile2(strFilePatch,  {"*n", "*n","*n", "*n","*n", "*n","*n", "*n","*n", "*n"})	
--	if not tb then
--		tbListSaleDaily.tbAwardCheck = {0,0,0,0,0,0,0,0,0,0}
--		print("LoadFromFile tbListSaleDaily.tbAwardCheck is nil value - set 00")
--	else
--		tbListSaleDaily.tbAwardCheck = tb[1]	
--		for i=1, getn(tb[1]) do
--			print(tb[1][i])
--		end				
--	end	
	
	--load file ban item hang ngay
	local strFilePatch = tbListSaleDaily.strFilePath..tbListSaleDaily.strNumSaleFileName_Daily	
	local tb = tbVngLib_File:TableFromFile2(strFilePatch,   {"*n", "*n", "*n","*n", "*n", "*n","*n", "*n", "*n", "*n","*n", "*n", "*n","*n", "*n", "*n","*n", "*n","*n", "*n", "*n","*n","*n"})
	if not tb then		
		tbListSaleDaily.tbAwardCheck_SaleDaily = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}	
	else	
		tbListSaleDaily.tbAwardCheck_SaleDaily = tb[1]				
	end		
end

--ban item quy theo ngay
function tbListSaleDaily:SaleOutItem(nIDSale,nDate,nNum)	
	if not self.tbAwardCheck  then
		tbListSaleDaily.tbAwardCheck = {0,0,0,0,0,0,0,0,0,0}	
	end	
	print("SaleOutItem nIDSale"..nIDSale)
	local nLastNum = self.tbAwardCheck[nIDSale]
	self.tbAwardCheck[nIDSale] =  nLastNum + nNum
	local tbTemp = {}
	--insert header cña file
	tinsert(tbTemp, {"Ngay23/6","Ngay24/6","Ngay25/6","Ngay26/6","Ngay27/6","Ngay28/6","Ngay29/6","Ngay30","Ngay1/7","Ngay2/7"})
	tinsert(tbTemp, self.tbAwardCheck)		
	tbVngLib_File:Table2File(self.strFilePath,self.strNumSaleFileName, "w", tbTemp)	
end
--ban item hang ngay
function tbListSaleDaily:SaleOutItem_Daily(nIDSale, nNum)	
	if not self.tbAwardCheck_SaleDaily  then
		self.tbAwardCheck_SaleDaily = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
	end
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))	
	local nLastNum = self.tbAwardCheck_SaleDaily[nIDSale]
	self.tbAwardCheck_SaleDaily[nIDSale] =  tonumber(nLastNum + nNum)
	if not nLastNum or not self.tbAwardCheck_SaleDaily[nIDSale] then
		return
	end
	local tbTemp = {}
	--insert header cña file
	tinsert(tbTemp, {"Item1","Item2","Item3","Item4","Item5","Item6","Item7","Item8","Item9","Item10","Item11","Item12","Item13","Item14","Item15","Item16","Item17","Item18","Item19","Item20","Item21","Item22","Item23"})	
	tinsert(tbTemp, self.tbAwardCheck_SaleDaily)		
	tbVngLib_File:Table2File(self.strFilePath,self.strNumSaleFileName_Daily, "w", tbTemp)
	return 1
end

--Reset shop hang thang
function tbListSaleDaily:Reset_SaleOutItem_Daily()	
	--reset so luong trong file quan ly
	self.tbAwardCheck_SaleDaily = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}	
	local tbTemp = {}
		--insert header cña file
	tinsert(tbTemp, {"Item1","Item2","Item3","Item4","Item5","Item6","Item7","Item8","Item9","Item10","Item11","Item12","Item13","Item14","Item15","Item16","Item17","Item18","Item19","Item20","Item21","Item22","Item23"})	
	tinsert(tbTemp, self.tbAwardCheck_SaleDaily)		
	tbVngLib_File:Table2File(self.strFilePath,self.strNumSaleFileName_Daily, "w", tbTemp)	
end

function tbListSaleDaily:ResetNumSaleOutItemDaily()
	print("----------Mini event ResetNumSaleOutItemDaily")
end

function tbListSaleDaily:CheckCanSaleOutItem(nIDSale,nDate)
	local nQuantityDaily = %TB_SALE_EQUIP_DATE[nIDSale][nDate].nQuantity
	--print("CheckCanSaleOutItem nQuantityAll: "..nQuantityDaily)
	--print("CheckCanSaleOutItem dang con: "..self.tbAwardCheck[2])
	if not self.tbAwardCheck or self.tbAwardCheck[nIDSale] >= nQuantityDaily then
		return 0
	end
	return 1
end

function tbListSaleDaily:CheckCanSaleOutItem_Daily(IDSale)	
	local nQuantityAll = %TB_SALE_EQUIP_DAILY[IDSale].nQuantity
	--print("CheckCanSaleOutItem_Daily nQuantityAll: "..nQuantityAll)
	--print("CheckCanSaleOutItem_Daily dang con: "..self.tbAwardCheck_SaleDaily[IDSale])
	if not self.tbAwardCheck_SaleDaily or self.tbAwardCheck_SaleDaily[IDSale] >= nQuantityAll then
		return 0
	end	
	return nQuantityAll
end

if tbListSaleDaily:IsActive() == 1 then
	local a = AutoFunctions:Add(LoadFromFile)
end