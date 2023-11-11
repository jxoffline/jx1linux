Include("\\script\\lib\\awardtemplet.lua")
Include("\\vng_script\\vng_lib\\extpoint.lua")
Include("\\script\\event\\tongwar\\head.lua")  
Include("\\script\\global\\titlefuncs.lua")

VngToolAward = {}
VngToolAward.tbSeasons ={}
LOG_TITLE = "LOG_TRAOTHUONG_CTC"

function VngToolAward:AddSeason(tbAward)
		tinsert(self.tbSeasons, tbAward)
		print("Add season finish")
end

function VngToolAward:AddDialog(tbDialog, strNpcName)
 	if getn(self.tbSeasons) <= 0 then
 		return
 	end
	local tbSeason = {}
	for i = 1, getn(self.tbSeasons) do		
		tbSeason = self.tbSeasons[i]		
		if tbSeason:IsActive() == 1 and self.tbSeasons[i].tbAccList[GetAccount()] then
			if tbDialog.szNpcName and tbDialog.szNpcName == tbSeason.strNPC then
				tbDialog:AddOptEntry(tbSeason.strName, VngToolAward.Show, {VngToolAward, i})
			elseif strNpcName and tbSeason.strNPC == strNpcName then
				tinsert(tbDialog, format("%s/#VngToolAward:Show(%d)", tbSeason.strName, i))
			end
		end
	end
end

function VngToolAward:Show(nSeasonID)
	local tbCurActive = self.tbSeasons[nSeasonID]
	if not tbCurActive.tbAccList[GetAccount()] or tbCurActive:IsActive() ~= 1 then
		return
	end
	local tbTemp = tbCurActive.tbAccList[GetAccount()]
	
	local strDesc = "Danh s¸ch phÇn th­ëng nh­ sau:"
	
	local tbDiag = {}
	local nOption = 0
	for i = 1, getn(tbTemp) do		
		if tbTemp[i] then
			nOption = nOption + 1
			strDesc = strDesc..format("\n%s %-26d%s", "PhÇn th­ëng", nOption,"\nSè l­îng: ")			
			local tbExtPoint = tbCurActive.tbExtPointBit[i]
			if  VngExtPointLib:GetBitValueByVersion(tbExtPoint) == 1 then			
				for j = 1, getn(tbTemp[i]) do
					local nAwardID = tbTemp[i][j].nAwardID
					local nAwardCount = tbTemp[i][j].nCount
					strDesc = strDesc..format("\n\t\t<color=yellow>%-36s: %s<color>", tbCurActive.tbPrizeList[nAwardID].szName, nAwardCount)	--tbCurActive.tbPrizeList[nAwardID].szName.."\t"..nAwardCount					
				end
				tinsert(tbDiag, format("NhËn phÇn th­ëng %d/#VngToolAward:GetAward(%d, %d)", nOption, nSeasonID, i))
			else
				strDesc = strDesc.."\n<color=red>§· nhËn th­ëng<color>"
			end
		end
	end
	tinsert(tbDiag, "§ãng/OnCancel")
	Describe(strDesc, getn(tbDiag), tbDiag)
end

function VngToolAward:GetAward(nSeasonID, nPart)
	local tbCurActive = self.tbSeasons[nSeasonID]
	if tbCurActive:IsActive() ~= 1 then
		Talk(1, "", "Xin ®¹i hiÖp thø lçi, ®· qu¸ h¹n nhËn th­ëng!")
		return
	end

	local tbAwardList = tbCurActive.tbAccList[GetAccount()][nPart]
	if tbCurActive.nFreeCellRequire then
		local nCellReq = tbCurActive.nFreeCellRequire
		local nRet = 0
		--Kiem tra khoang trong yeu cau
		for i = 1, getn(tbAwardList) do
			local tbItem = tbCurActive:GetSingleItem(tbAwardList[i].nAwardID)
			if tbItem.tbProp then 
				nRet = 1 
				break 
			end	
		end
		if nRet == 0 then nCellReq = 0 end		
		if CalcFreeItemCellCount() < nCellReq then
			Talk(1, "", format("Xin h·y chõa %d « trèng hµnh trang råi míi nhËn th­ëng.",  tbCurActive.nFreeCellRequire))
			return
		end
	elseif tbCurActive.tbFreeBagRequireByWH then
		local tbWH = tbCurActive.tbFreeBagRequireByWH
		if CountFreeRoomByWH(tbWH.nW, tbWH.nH) < tbWH.nCount then
			Talk(1, "", format("Xin h·y chõa %d %dx%d « trèng hµnh trang råi míi nhËn th­ëng.",  tbWH.nCount, tbWH.nW, tbWH.nH))
			return
		end 
	else
		if CalcFreeItemCellCount() < 60 then
			Talk(1, "", format("Xin h·y chõa %d « trèng hµnh trang råi míi nhËn th­ëng.",  60))
			return
		end
	end
	local tbExtPoint = tbCurActive.tbExtPointBit[nPart]
	if (VngExtPointLib:SetBitValueByVersion(tbExtPoint, 0) ~= 1)then
		return
	end
	if (VngExtPointLib:GetBitValueByVersion(tbExtPoint) ~= 0)then
		return
	end
	 for i = 1, getn(tbAwardList) do
	 	local tbItem = tbCurActive:GetSingleItem(tbAwardList[i].nAwardID)
	 	if tbItem[1] and type(tbItem[1]) == "table" then
	 		for i = 1, tbAwardList[i].nCount do
	 			tbAwardTemplet:Give(tbItem, 1, tbCurActive.tbLog)
	 		end
	 	elseif tbItem.nTittleID then
	 		self:Active_Title(tbItem.nTittleID,tbItem.nExpiredTime)
	 	else
	 			tbItem.nCount = tbAwardList[i].nCount
	 			tbAwardTemplet:Give(tbItem, 1, tbCurActive.tbLog)
	 	end	 	
	 end
end
function VngToolAward:Active_Title(nTittleID, nExpiredTime)
	nExpiredTime = nExpiredTime or 0;
	local nServerTime = GetCurServerTime()+ nExpiredTime*60;
	local nDate	= FormatTime2Number(nServerTime);
	local nDay	= floor(mod(nDate,1000000) / 10000);
	local nMon	= mod(floor(nDate / 1000000) , 100)
	local nTime	= nMon * 1000000 + nDay * 10000
	print("VngToolAward:Active_Title nDay: "..nDay)
	print("VngToolAward:Active_Title nMon: "..nMon)
	print("VngToolAward:Active_Title nTime: "..nTime)
	Title_AddTitle(nTittleID, 2, nTime);
	Title_ActiveTitle(nTittleID);
	SetTask(TASK_ACTIVE_TITLE,nTittleID);
 	local sz_title = Title_GetTitleName(nTittleID);		
	Msg2Player(format("Chóc mõng b¹n ®· nhËn ®­îc danh hiÖu <color=yellow>%s<color>", sz_title));
end