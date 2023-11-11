Include("\\script\\vng_feature\\thdnb\\head.lua")

function tbTHDNBReg:IsActive()
	local nCurDate = tonumber(date("%Y%m%d%H%M"))
	if nCurDate < self.nStartDate or nCurDate >= self.nEndDate then
		return nil
	end
	return 1
end

function tbTHDNBReg:AddDialog()
	if not self:IsActive() then
		return
	end
	if GetWorldPos() ~= self.nMapID then
		return
	end	
	CreateTaskSay({"<dec><npc>Ho¹t ®éng ®¨ng ký chiÕn ®éi Thiªn H¹ §Ö NhÊt Bang ®ang tiÕn hµnh, ng­¬i t×m ta cã viÖc g×: ",
					"Xem danh s¸ch thµnh viªn/#tbTHDNBReg:ShowMemList(0)",
					"B¸o danh tham gia Thiªn H¹ §Ö NhÊt Bang/#tbTHDNBReg:SignUpMem()",					
					"KÕt thóc ®èi tho¹i/OnCancel"});
end

function tbTHDNBReg:ShowMemList(nPage)
	local strMasterAccount = GetAccount()
	if not self.tbTongMaster[strMasterAccount] or self.tbTongMaster[strMasterAccount] ~= 1 then
		CreateTaskSay({"<dec><npc>Tµi kho¶n kh«ng hîp lÖ.", "KÕt thóc ®èi tho¹i/OnCancel"});
		return
	end
	local tbOpt = {}
	local nMinOpt = nPage*10 + 1
	local nMaxOpt = nMinOpt + 9	
	local nCurMemCount = self:GetCurMemCount(strMasterAccount) 
	if nCurMemCount < nMinOpt  then
		return
	end
	if nCurMemCount < nMaxOpt then
		nMaxOpt = nCurMemCount
	end
	for i = nMinOpt, nMaxOpt do
		tinsert(tbOpt, format("%s/#tbTHDNBReg:SelectMember(%d)", self.tbMemList[strMasterAccount][i][2], i))
	end
	if nPage > 0 then
		tinsert(tbOpt, format("Trang tr­íc/#tbTHDNBReg:ShowMemList(%d)", nPage - 1))
	end
	if nCurMemCount >= ((nPage + 1)*10 + 1) then
		tinsert(tbOpt, format("Trang sau/#tbTHDNBReg:ShowMemList(%d)", nPage + 1))
	end
	tinsert(tbOpt, "KÕt thóc ®èi tho¹i/OnCancel")
	tinsert(tbOpt, 1, "<dec><npc>Danh s¸ch thµnh viªn: ");
	CreateTaskSay(tbOpt)
end

function tbTHDNBReg:SelectMember(nIdx)
	local strMemName = self.tbMemList[GetAccount()][nIdx][2]
	CreateTaskSay({format("<dec><npc> Thµnh viªn %s", strMemName), format("Lo¹i bá thµnh viªn/#tbTHDNBReg:DelMember(%d)", nIdx), "KÕt thóc ®èi tho¹i/OnCancel"})
end

function tbTHDNBReg:DelMember(nIdx)
	local strMaster = GetAccount()
	local strMemAcc = self.tbMemList[strMaster][nIdx][1]
	local strMemName = self.tbMemList[strMaster][nIdx][2]
	tremove(self.tbMemList[strMaster], nIdx)
	Msg2Player(format("§· lo¹i bá ng­êi ch¬i <color=yellow>%s<color> ra khái danh s¸ch thi ®Êu.", strMemName))
	tbLog:PlayerActionLog("DangKyTHDNB", "LoaiBoThanhVien", strMemAcc, strMemName)
	self:WriteMemList(strMaster)	
end

function tbTHDNBReg:SignUpMem()
	local strMasterAccount = GetAccount()
	if not self.tbTongMaster[strMasterAccount] or self.tbTongMaster[strMasterAccount] ~= 1 then
		CreateTaskSay({"<dec><npc>Tµi kho¶n kh«ng hîp lÖ.", "KÕt thóc ®èi tho¹i/OnCancel"});
		return
	end	
	local nTeamSize = GetTeamSize();	
	if (nTeamSize < 2) then
		CreateTaskSay({"<dec><npc>H·y tæ ®éi víi thµnh viªn tr­íc råi míi b¸o danh tham gia.", "KÕt thóc ®èi tho¹i/OnCancel"});
		return
	elseif (nTeamSize > 2) then
		CreateTaskSay({"<dec><npc>Mçi lÇn b¸o danh cÇn tæ ®éi víi 1 thµnh viªn.", "KÕt thóc ®èi tho¹i/OnCancel"});
		return
	end;
	if (IsCaptain() == 0) then
		CreateTaskSay({"<dec><npc>ChØ cã ®éi tr­ëng míi cã thÓ tiÕn hµnh b¸o danh.", "KÕt thóc ®èi tho¹i/OnCancel"});
		return 0;
	end;
	if self:GetCurMemCount(strMasterAccount) >= self.nMaxMemCount then
		CreateTaskSay({"<dec><npc>Danh s¸ch thµnh viªn Thiªn H¹ §Ö NhÊt Bang ®· ®ñ sè, kh«ng thÓ tiÕp tôc b¸o danh.", "KÕt thóc ®èi tho¹i/OnCancel"});
		return
	end
	
	local strMemName = "";
	local strMemAcc = ""
	local nIsExist = 0;
	local nfact = -1;
	local oldPlayer = PlayerIndex;
	for i = 1, 2 do
		local nplayer = GetTeamMember(i);
		PlayerIndex = nplayer;
		
		if (GetAccount() ~= strMasterAccount) then
			strMemName = GetName();
			strMemAcc = GetAccount()
			nfact = GetLastFactionNumber();
			local nMemIdx = self:GetMemIndex(strMasterAccount, strMemAcc, strMemName)
			if nMemIdx >= 1 and nMemIdx <= 74 then
				nIsExist = 1;				
			end;
			break
		end;
	end;
	PlayerIndex = oldPlayer;
	if (nIsExist == 1) then		
		CreateTaskSay({format("<dec><npc>Ng­êi ch¬i <color=yellow>%s<color> hiÖn ®· cã tªn trong danh s¸ch!",strMemName), "KÕt thóc ®èi tho¹i/OnCancel"});
	else
		if (nfact ~= -1) then
			CreateTaskSay({format("<dec><npc>Ng­¬i x¸c nhËn muèn b¸o danh cho <color=yellow>%s<color> kh«ng?",strMemName), format("Ta ®ång ý/#tbTHDNBReg:SureReg('%s', '%s', '%s')", strMasterAccount, strMemAcc, strMemName),"KÕt thóc ®èi tho¹i/OnCancel"});
		else
			CreateTaskSay({"<dec><npc>Thµnh viªn ch÷ tr¾ng kh«ng thÓ b¸o danh tham gia!", "KÕt thóc ®èi tho¹i/OnCancel"});
		end;	
	end;
end

function tbTHDNBReg:SureReg(strMaster, strMemAcc, strMemName)
	local tbCurMemList = self.tbMemList[strMaster]
	tinsert(tbCurMemList, {strMemAcc, strMemName})
	tbLog:PlayerActionLog("DangKyTHDNB", "DangKyThanhVien", strMemAcc, strMemName)
	CreateTaskSay({"<dec><npc>§¨ng ký thµnh c«ng.", "KÕt thóc ®èi tho¹i/OnCancel"});
	self:WriteMemList(strMaster)
end

function tbTHDNBReg:WriteMemList(strMaster)
	local tbTemp = {}	
	tinsert(tbTemp, {"Account", "Role Name"})
	tinsert(tbTemp, {strMaster, self.tbMasterName[strMaster]})
	local nCurMemCount = self:GetCurMemCount(strMaster)
	local tbCurMemList = self.tbMemList[strMaster]
	for i = 1, nCurMemCount do
		tinsert(tbTemp, {tbCurMemList[i][1], tbCurMemList[i][2]})
	end
	tbVngLib_File:Table2File(self.strFilePath, format(self.strFileName, strMaster), "w", tbTemp)	
end

function tbTHDNBReg:GetMemIndex(strMaster, strMemAcc, strMemName)	
	local nCurMemCount = self:GetCurMemCount(strMaster)
	local tbCurMemList = self.tbMemList[strMaster]
	for i = 1, nCurMemCount do
		if tbCurMemList[i][1] == strMemAcc and tbCurMemList[i][2] == strMemName then
			return i
		end
	end
	return -1	
end

function tbTHDNBReg:GetCurMemCount(strMaster)
	return getn(self.tbMemList[strMaster])
end

function LoadMemberList()
	for key, val in tbTHDNBReg.tbTongMaster do
		local tb = tbVngLib_File:TableFromFile2("\\vng_data\\130416_baodanh_thdnb13\\memlist_"..key..".txt", {"*w", "*w"})
		if not tb then
			tbTHDNBReg.tbMemList[key] = {}
		else
			for i = 2, getn(tb) do		
				if tb[i][1] and tb[i][2] and tb[i][1] ~= "" and tb[i][2] ~= "" then					
					tinsert(tbTHDNBReg.tbMemList[key], {tb[i][1], tb[i][2]})
				end
			end
		end
	end
end

if tbTHDNBReg:IsActive() == 1 then
	local a = AutoFunctions:Add(LoadMemberList)
end