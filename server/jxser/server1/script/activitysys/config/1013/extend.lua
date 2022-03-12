Include("\\script\\activitysys\\config\\1013\\head.lua")
Include("\\script\\activitysys\\config\\1013\\awardlist.lua");
Include("\\script\\activitysys\\config\\1013\\variables.lua")
Include("\\script\\activitysys\\config\\1013\\writefile.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\log.lua")
IncludeLib("SETTING")

pActivity.nPak = curpack()
pActivity.tbGlobalNumber = {
	["NopTruyenKy"] = 0,
	["NopLamTruyenKy"] = 0,
	["NopVoLamTruyenKy"] = 0,	
	["NopChanKinh"] = 0,
	["NopMachChanKinh"] = 0,
	["NopBatMachChanKinh"] = 0,
}

function pActivity:CheckVatPhamLimit(szGlobalName,nRank, nMax, nTask,nCount)	
	if %tbVNG_BitTask_Lib:isMaxBitTaskValue(nTask) == 1 then
		Talk(1, "", "Ng­¬i tÆng ta nhiÒu råi, sè vËt phÈm nµy xin h·y nhËn l¹i.")
		return nil
	end
	if self.tbGlobalNumber[szGlobalName] < nRank then
		if (self.tbGlobalNumber[szGlobalName] + nCount) <= (nRank +nMax - 1) then
				return 1			
		else
				Msg2Player(format("Sè l­îng v­ît qu¸ giíi h¹n, ng­¬i chØ cã thÓ tÆng <color=yellow>%d <color>n÷a.", nRank + nMax - self.tbGlobalNumber[szGlobalName] -1))
				return nil
		end
	end	
	local nTaskVal = %tbVNG_BitTask_Lib:getBitTask(nTask)
	if (nTaskVal + nCount) > nMax then
		Msg2Player(format("Sè l­îng v­ît qu¸ giíi h¹n, ng­¬i chØ cã thÓ tÆng <color=yellow>%d <color>n÷a.", nMax - nTaskVal))
		return nil
	end
	return 1
end

function pActivity:NopTruyenKy(nCount)
	for i=1, nCount do
		if %tbVNG_BitTask_Lib:isMaxBitTaskValue(%TASK_TRUYENKY) == 1 then
			return nil
		end
		self.tbGlobalNumber["NopTruyenKy"] = self.tbGlobalNumber["NopTruyenKy"]  + 1;
		if self.tbGlobalNumber["NopTruyenKy"] < 501 then
			tbAwardTemplet:Give(%THIENLONG_VCD, 1, {%EVENT_LOG_TITLE, "NopChuTruyenKyDuoi501"})
		else
			%tbVNG_BitTask_Lib:addTask(%TASK_TRUYENKY, 1)
			tbAwardTemplet:Give({szName = "§iÓm kinh nghiÖm", nExp=5e7}, 1, {%EVENT_LOG_TITLE, "NopChuTruyenKyTren500"})	
		end
	end
	%tbLog:PlayerActionLog("GH_2012", "NopTruyenKy","TS"..ST_GetTransLifeCount(),"SLNop"..nCount)
--	print("Nop truyen ky: ", self.tbGlobalNumber["NopTruyenKy"])
	return 1
end
function pActivity:NopLamTruyenKy(nCount)
	for i=1, nCount do
		if %tbVNG_BitTask_Lib:isMaxBitTaskValue(%TASK_LAMTRUYENKY) == 1 then
			return nil
		end
		self.tbGlobalNumber["NopLamTruyenKy"] = self.tbGlobalNumber["NopLamTruyenKy"]  + 1;
		if self.tbGlobalNumber["NopLamTruyenKy"] < 69 then
			tbAwardTemplet:Give({szName="Cµn kh«n song tuyÖt Béi", tbProp={6,1,2219,1,0,0},nExpiredTime=43200}, 1, {%EVENT_LOG_TITLE, "NopChuLamTruyenKyDuoi69"})
		else
			%tbVNG_BitTask_Lib:addTask(%TASK_LAMTRUYENKY, 1)
			tbAwardTemplet:Give({szName = "§iÓm kinh nghiÖm", nExp=2e8}, 1, {%EVENT_LOG_TITLE, "NopChuLamTruyenKyTren69"})	
		end
	end	
	%tbLog:PlayerActionLog("GH_2012", "NopLamTruyenKy","TS"..ST_GetTransLifeCount(),"SLNop"..nCount)
	--print("Nop Lam truyen ky: ", self.tbGlobalNumber["NopLamTruyenKy"])
	return 1
end
function pActivity:NopVoLamTruyenKy(nCount)
	for i=1, nCount do
		if %tbVNG_BitTask_Lib:isMaxBitTaskValue(%TASK_VOLAMTRUYENKY) == 1 then
			return nil
		end
		if tbVNG_BitTask_Lib:getBitTask(%TASK_VLTK) ~= 1 then
			self:RegisterAward(%TASK_VLTK)
		end	
		self.tbGlobalNumber["NopVoLamTruyenKy"] = self.tbGlobalNumber["NopVoLamTruyenKy"]  + 1;
		if self.tbGlobalNumber["NopVoLamTruyenKy"] < 9 then
			tbAwardTemplet:Give(%tbAward_B, 1, {%EVENT_LOG_TITLE, "NopChuVoLamTruyenKyDuoi9"})	
		else
			%tbVNG_BitTask_Lib:addTask(%TASK_VOLAMTRUYENKY, 1)
			tbAwardTemplet:Give({szName = "§iÓm kinh nghiÖm", nExp=1e9}, 1, {%EVENT_LOG_TITLE, "NopChuVoLamTruyenKyTren8"})
		end
		self:RegisterTop("VoLamTruyenKy",i)
	end
	--self:RegisterTop("VoLamTruyenKy",nCount)
	%tbLog:PlayerActionLog("GH_2012", "NopVoLamTruyenKy","TS"..ST_GetTransLifeCount(),"SLNop"..nCount)
	--print("Nop Vo Lam Truyen Ky1: ", self.tbGlobalNumber["NopVoLamTruyenKy"])
	return 1
end
function pActivity:NopChanKinh(nCount)
	for i=1, nCount do
		if %tbVNG_BitTask_Lib:isMaxBitTaskValue(%TASK_CHANKINH) == 1 then
			return nil
		end
		self.tbGlobalNumber["NopChanKinh"] = self.tbGlobalNumber["NopChanKinh"]  + 1;
		if self.tbGlobalNumber["NopChanKinh"] < 501 then
			tbAwardTemplet:Give(%HONNGUYEN_VCD, 1, {%EVENT_LOG_TITLE, "NopChuChanKinh88"})
		else
			%tbVNG_BitTask_Lib:addTask(%TASK_CHANKINH, 1)
			tbAwardTemplet:Give({szName = "§iÓm kinh nghiÖm", nExp=2e7}, 1, {%EVENT_LOG_TITLE, "NopChuChanKinh89"})	
		end
	end	
	%tbLog:PlayerActionLog("GH_2012", "NopChanKinh","TS"..ST_GetTransLifeCount(),"SLNop"..nCount)
	--print("Nop chu Chan Kinh: ", self.tbGlobalNumber["NopChanKinh"])
	return 1
end
function pActivity:NopMachChanKinh(nCount)
	for i=1, nCount do
		if %tbVNG_BitTask_Lib:isMaxBitTaskValue(%TASK_MACHCHANKINH) == 1 then
			return nil
		end
		self.tbGlobalNumber["NopMachChanKinh"] = self.tbGlobalNumber["NopMachChanKinh"]  + 1;
		if self.tbGlobalNumber["NopMachChanKinh"] < 69 then
			tbAwardTemplet:Give({szName="Hång bao An khang",tbProp={6,1,2105,1,0,0},nCount=1}, 1, {%EVENT_LOG_TITLE, "NopChuMachChanKinhDuoi69"})
		else
			%tbVNG_BitTask_Lib:addTask(%TASK_MACHCHANKINH, 1)
			tbAwardTemplet:Give({szName = "§iÓm kinh nghiÖm", nExp=1e8}, 1, {%EVENT_LOG_TITLE, "NopChuMachChanKinhTren68"})	
		end
	end	
	%tbLog:PlayerActionLog("GH_2012", "NopMachChanKinh","TS"..ST_GetTransLifeCount(),"SLNop"..nCount)
	--print("Nop chu M¹ch Chan Kinh: ", self.tbGlobalNumber["NopMachChanKinh"])
	return 1
end
function pActivity:NopBatMachChanKinh(nCount)
	for i=1, nCount do
		if %tbVNG_BitTask_Lib:isMaxBitTaskValue(%TASK_BATMACHCHANKINH) == 1 then
			return nil
		end
		if tbVNG_BitTask_Lib:getBitTask(%TASK_BMCK) ~= 1 then
			self:RegisterAward(%TASK_BMCK)
		end	
		self.tbGlobalNumber["NopBatMachChanKinh"] = self.tbGlobalNumber["NopBatMachChanKinh"]  + 1;
		if self.tbGlobalNumber["NopBatMachChanKinh"] < 9 then
			tbAwardTemplet:Give({szName="Qu¶ Hoµng Kim (100)",tbProp={6,1,30095,1,0,0}}, 1, {%EVENT_LOG_TITLE, "NopChuBatMachChanKinhDuoi9"})
		else
			%tbVNG_BitTask_Lib:addTask(%TASK_BATMACHCHANKINH, 1)
			tbAwardTemplet:Give({szName = "§iÓm kinh nghiÖm", nExp=2e8}, 1, {%EVENT_LOG_TITLE, "NopChuBatMachChanKinhTren8"})	
		end
		self:RegisterTop("BatMachChanKinh",i)	
	end
	--self:RegisterTop("BatMachChanKinh",nCount)
	%tbLog:PlayerActionLog("GH_2012", "NopBatMachChanKinh","TS"..ST_GetTransLifeCount(),"SLNop"..nCount)
	--print("Nop Bat Mach Chan Kinh: ", self.tbGlobalNumber["NopBatMachChanKinh"])
	return 1
end

function pActivity:NopBMCKVLTK()
	if %tbVNG_BitTask_Lib:isMaxBitTaskValue(%TASK_BMCK_VLTK) == 1 then
		return nil
	end
	%tbVNG_BitTask_Lib:addTask(%TASK_BMCK_VLTK, 1)
	tbAwardTemplet:Give({szName = "§iÓm kinh nghiÖm", nExp=1e9}, 1, {%EVENT_LOG_TITLE, "HoanThanhBatMachChanKinhVoLamTruyenKy"})	
end

--function pActivity:LogCharacter(szCharacter,nCount)
--	local szName = GetName()
--	local szAccount = GetAccount()
--	local strTime = GetLocalDate("%Y-%m-%d_%H:%M:%S")
--	self.tbCharacter[strTime] = {szName, szAccount,szCharacter,nCount} 
--	if self:Character2File() == 1 then
--		print("Write !!!!")
--	end
--end
function pActivity:RegisterAward(nTask)
	local szName = GetName()
	local szAccount = GetAccount()
	local stDate = GetLocalDate("%Y-%m-%d")
	local	strTime = GetLocalDate("%H:%M:%S")
	if tbVNG_BitTask_Lib:getBitTask(nTask) ~= 1 then
		tbVNG_BitTask_Lib:setBitTask(nTask, 1)
	end
	if tbVNG_BitTask_Lib:getBitTask(%TASK_BMCK) == 1 and tbVNG_BitTask_Lib:getBitTask(%TASK_VLTK) == 1 then
		if not %tbWriteFile.tbSubcribers then
			 %tbWriteFile:Init()
		end
		%tbWriteFile.tbSubcribers[szName] = {szAccount, stDate,strTime}	
		if %tbWriteFile:Subcribers2File() == 1 then
			print("ghi file thanh cong")
		end
	end
end

function pActivity:CheckAwardLimit()
	if tbVNG_BitTask_Lib:getBitTask(%TASK_BMCK_VLTK) == 1 then
		Talk(1, "", "Trong suèt thêi gian diÔn ra sù kiÖn, chØ ®uîc nhËn 1 lÇn duy nhÊt nÕu n¹p ®ñ 2 bé ch÷.")
		return nil
	end
	if tbVNG_BitTask_Lib:getBitTask(%TASK_BMCK) == 1 and tbVNG_BitTask_Lib:getBitTask(%TASK_VLTK) == 1 then
		return 1
	end
	Talk(1, "", "§¹i hiÖp ch­a n¹p ®ö hai bé ch÷ Bat m¹ch ch©n kinh, Vâ l©m truyÒn kú.")
	return nil
end
--function pActivity:Character2File()
--	local tbTemp = {}
--	tinsert(tbTemp, %tbWriteFile.tbCharacter)
--	for key, val in tbCharacter do
--		tinsert(tbTemp, {key, val[1], val[2], val[3],val[4]})
--	end
--	tbVngLib_File:Table2File(%tbWriteFile.strFilePath, %tbWriteFile.strCharacterFileName, "w", tbTemp)	
--	return 1
--end

function pActivity:Global2File()
	local tbTemp = {}
	tinsert(tbTemp, %tbWriteFile.tbGlobalHeader)
	tinsert(tbTemp, {"GhepChu",self.tbGlobalNumber["NopTruyenKy"],self.tbGlobalNumber["NopLamTruyenKy"],self.tbGlobalNumber["NopVoLamTruyenKy"],self.tbGlobalNumber["NopChanKinh"],self.tbGlobalNumber["NopMachChanKinh"],self.tbGlobalNumber["NopBatMachChanKinh"]})
	tbVngLib_File:Table2File(%tbWriteFile.strFilePath, %tbWriteFile.strGlobalFileName, "w", tbTemp)	
	return 1
end

function pActivity:StartServer()
		%tbWriteFile:LoadFile()
		if not self.tbGlobalNumber then
			self.tbGlobalNumber = {}
		end
		local tb = tbVngLib_File:TableFromFile(%tbWriteFile.strFilePath, %tbWriteFile.strGlobalFileName, %tbWriteFile.tbGlobalPattern)
		if not tb then
			return
		end
		for i = 1, getn(tb) do		
			if tb[i][1] then
				self.tbGlobalNumber = {
					["NopTruyenKy"] = tb[i][2] ,
					["NopLamTruyenKy"] = tb[i][3] ,
					["NopVoLamTruyenKy"] = tb[i][4] ,	
					["NopChanKinh"] = tb[i][5] ,
					["NopMachChanKinh"] = tb[i][6] ,
					["NopBatMachChanKinh"] = tb[i][7] ,
				}	
			end
		end
end
function pActivity:GetAwardEvent(nCount)
	if nCount == 1 then
		local tbAward = %tbAward_A["HuoYueDu_dynamics"];
		tbAwardTemplet:Give(tbAward, 1, {%EVENT_LOG_TITLE, "NhanThuongDoNangDong"})	
	else
		local tbAward = %tbAward_A["HarvestPlants"];
		tbAwardTemplet:Give(tbAward, 1, {%EVENT_LOG_TITLE, "NhanThuongTrongCay"})	
	end	
end
function pActivity:RegisterTop(szNameCharacter,nCount)
	local szName = GetName()
	local szAccount = GetAccount()
	local stDate = GetLocalDate("%Y-%m-%d")
	local	strTime = GetLocalDate("%H:%M:%S")
	local nNumber = 0
	local tbTop10 = DynamicExecuteByPlayer(PlayerIndex, "\\script\\vng_lib\\files_lib.lua",  "tbVngLib_File:TableFromFile", "vng_data/event_ghepchu/", "nametop.txt", {"*w", "*w", "*w","*w","*w","*n"})
	if not tbTop10 then
		tbTop10 = {}
	end
	for i = 1, getn(tbTop10) do
		if tbTop10[i][5]	== szNameCharacter then
			nNumber = nNumber + 1
		end
	end
 	if nNumber > 10 then
 		return
 	end
	local tbSubcriber = {}
	tinsert(tbSubcriber,szName)
	tinsert(tbSubcriber,szAccount)
	tinsert(tbSubcriber,stDate)
	tinsert(tbSubcriber,strTime)
	tinsert(tbSubcriber,szNameCharacter)
	tinsert(tbSubcriber,nCount)
	tinsert(tbTop10,tbSubcriber)
	if (self:Subcribers2File(tbTop10,szNameCharacter) ~= 1) then 
		return
	end
end

function pActivity:Subcribers2File(tbSubcriber,szNameCharacter)
	local tbTemp = {}
	local nCount = 0
	local nNumber = 0
	for i = 1, getn(tbSubcriber) do
		if tbSubcriber[i][5]	== szNameCharacter then
			nNumber = nNumber + 1
		end
	end
 	if nNumber > 10 then
 		return
 	else
 		nCount = getn(tbSubcriber)
 	end
	tinsert(tbTemp, {"Name", "Account","Date","Time","TheWorld", "Count"})
	for i =1 , nCount do
		tinsert(tbTemp, tbSubcriber[i])
	end
	DynamicExecuteByPlayer(PlayerIndex, "\\script\\vng_lib\\files_lib.lua",  "tbVngLib_File:Table2File", "vng_data/event_ghepchu/","nametop.txt","w", tbTemp)
	return 1
end

function pActivity:ShowTop(szNameBoChu,szNameChu)
	local tbTop10 = DynamicExecuteByPlayer(PlayerIndex, "\\script\\vng_lib\\files_lib.lua",  "tbVngLib_File:TableFromFile", "vng_data/event_ghepchu/", "nametop.txt", {"*w", "*w", "*w","*w","*w","*n"})
	if not tbTop10 then
		CreateNewSayEx("HiÖn t¹i ch­a cã ®¹i hiÖp nµo n¹p ®ñ bé ch÷",{{"§ãng",OnCancel}})
		return
	end
	local strTittle = format("10 Cao thñ ®· nép ®ñ Bé 4 ch÷ <color=red>%s<color>\n%-16s%-12s%-12s\n",szNameBoChu," Nh©n VËt","Ngµy","Thêi gian")
	for i = 1, getn(tbTop10) do
		if szNameChu == tbTop10[i][5] then
			strTittle = strTittle..format("<color=yellow>%-16s%-12s%-12s\n<color>",tbTop10[i][1], tbTop10[i][3],tbTop10[i][4])
		end	
	end
	CreateNewSayEx(strTittle,{{"§ãng",OnCancel}})
end

function pActivity:Show_BMCK_VLTK()
	local tbTop10 = DynamicExecuteByPlayer(PlayerIndex, "\\script\\vng_lib\\files_lib.lua",  "tbVngLib_File:TableFromFile", "vng_data/event_ghepchu/", "subcribers.txt", {"*w", "*w", "*w","*w"})
	if not tbTop10 then
		CreateNewSayEx("HiÖn t¹i ch­a cã ®¹i hiÖp nµo n¹p ®ñ bé ch÷",{{"§ãng",OnCancel}})
		return
	end
	local nNumber = getn(tbTop10)
	local strTittle = format("10 Cao thñ ®· nép ®ñ 2 Bé ch÷ <color=red>%s<color>\n%-16s%-12s%-12s\n","B¸t M¹ch Ch©n Kinh - Vâ L©m TruyÒn Kú"," Nh©n VËt","Ngµy","Thêi gian")
	if nNumber > 10 then
		nNumber = 10
	end
	for i = 1, nNumber do
			strTittle = strTittle..format("<color=yellow>%-16s%-12s%-12s\n<color>",tbTop10[i][1], tbTop10[i][3],tbTop10[i][4])
	end
	CreateNewSayEx(strTittle,{{"§ãng",OnCancel}})
end