Include("\\script\\activitysys\\config\\1004\\data.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\task\\metempsychosis\\task_func.lua")
Include("\\script\\lib\\log.lua")
IncludeLib("SETTING")
tbMainQuest = {
	tbMaterial = {
		{strName = "TÈy Tñy §¬n", nG = 6, nD = 1, nP = 30133},
		{strName = "Tói Linh §¬n", nG = 6, nD = 1, nP = 30134},
		{strName = "§«ng Trïng Th¶o", nG = 6, nD = 1, nP = 30135},
	}
}
function tbMainQuest:SelectTypePoint(nStage)
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex);
	if NpcName2Replace then szNpcName = NpcName2Replace(szNpcName); end
	local tbDailog = DailogClass:new(szNpcName);
	
	local nLevel,_ = zhuansheng_get_gre(nStage)
	local strTittle = "<color=orange>B¾c §Èu L·o Nh©n: <color>"
	local tbOpt = {}
	local nTransCount = ST_GetTransLifeCount()
	if nTransCount < nStage then
		strTittle = strTittle.."HiÖn t¹i c¸c h¹ míi chØ trïng sinh "..nTransCount..", kh«ng cÇn ph¶i lµm nhiÖm vô giai ®o¹n nµy."
	else
		if nLevel == 200 then
			strTittle = strTittle..format("C¸c h¹ trïng sinh lÇn <color=yellow>%d<color> ë ®¼ng cÊp <color=yellow>200<color>, kh«ng cÇn ph¶i lµm nhiÖm vô nµy.", nStage)
		else
			strTittle = strTittle..format("C¸c h¹ trïng sinh lÇn <color=yellow>%d<color> ë cÊp <color=yellow>%d<color>, hoµn thµnh <color=yellow>1<color> lÇn nhiÖm vô §«ng Trïng H¹ Th¶o <color=yellow>giai ®o¹n %d<color> sÏ gióp c¸c h¹ bæ sung mét trong c¸c lo¹i ®iÓm sau:\n\n", nStage, nLevel, nStage)
			local tbStage = %tbDTT_Data.tbStages[nStage]
			strTittle = strTittle..format("%-4s%-20s%-14s%s\n", "", "§iÓm", "Sè l­îng", "TiÕn ®é")
			for nType = 1, getn(tbStage) do
				if tbStage[nType][nLevel] then
					local tbBTask = tbStage[nType].tbBitTask
					if not tbBTask then
						return
					end
					local strProccess = ""
					if tbVNG_BitTask_Lib:getBitTask(tbBTask[1]) == 0 then
						strProccess = "<color=red>Ch­a nhËn"
					else
						if tbVNG_BitTask_Lib:getBitTask(tbBTask[2]) == 0 then
							strProccess = "<color=red>Ch­a hoµn thµnh"
						else
							strProccess = "<color=green>§· hoµn thµnh"
						end
					end
					if tbStage[nType].strType == "Kh¸ng tÝnh" then					
						local n_translevel, n_transresist = zhuansheng_get_gre(nStage);
						if not TB_BASE_RESIST[n_transresist] then
							return
						end
						strTittle = strTittle..format("<color=yellow>%-4s%-20s%-14s%s<color>\n", "", TB_BASE_RESIST[n_transresist], tbStage[nType][nLevel][1], strProccess)	
						tbDailog:AddOptEntry(TB_BASE_RESIST[n_transresist], self.SelectTypeDialog, {self, nStage, nType, nLevel})
					else
						strTittle = strTittle..format("<color=yellow>%-4s%-20s%-14s%s<color>\n", "", tbStage[nType].strType, tbStage[nType][nLevel][1], strProccess)	
						tbDailog:AddOptEntry(tbStage[nType].strType, self.SelectTypeDialog, {self, nStage, nType, nLevel})
					end
				end				
			end
		end
	end		
	tbDailog.szTitleMsg = strTittle
	tbDailog:Show();
end

function tbMainQuest:SelectTypeDialog(nStage, nType, nLevel)
	local tbStage = %tbDTT_Data.tbStages[nStage]
	local strTypePoint = tbStage[nType].strType
	local tbTemp = tbStage[nType][nLevel]
	if not tbTemp then
		return
	end
	local tbMaterialCount = {tbTemp[2], tbTemp[3],tbTemp[4]}	
	local nCount1, nCount2, nCount3 = self:CalcItems()
	local strTittle = format("<color=orange>B¾c §Èu L·o Nh©n<color>: NhiÖm vô <color=yellow>%s<color> giai ®o¹n <color=yellow>%d<color> yªu cÇu:\n\n", strTypePoint, nStage)
	strTittle = strTittle..format("%-4s%-24s%s\n", "", "Nguyªn liÖu", "Sè l­îng")
	if nCount1 < tbMaterialCount[1] then
		strTittle = strTittle..format("<color=yellow>%-4s%-24s<color=red>%d/%d<color>\n", "", self.tbMaterial[1].strName, nCount1, tbMaterialCount[1])
	else
		strTittle = strTittle..format("<color=yellow>%-4s%-24s<color=green>%d/%d<color>\n", "", self.tbMaterial[1].strName, nCount1, tbMaterialCount[1])
	end
	if nCount2 < tbMaterialCount[2] then
		strTittle = strTittle..format("<color=yellow>%-4s%-24s<color=red>%d/%d<color>\n", "", self.tbMaterial[2].strName, nCount2, tbMaterialCount[2])
	else
		strTittle = strTittle..format("<color=yellow>%-4s%-24s<color=green>%d/%d<color>\n", "", self.tbMaterial[2].strName, nCount2, tbMaterialCount[2])
	end
	if nCount3 < tbMaterialCount[3] then
		strTittle = strTittle..format("<color=yellow>%-4s%-24s<color=red>%d/%d<color>\n", "", self.tbMaterial[3].strName, nCount3, tbMaterialCount[3])
	else
		strTittle = strTittle..format("<color=yellow>%-4s%-24s<color=green>%d/%d<color>\n", "", self.tbMaterial[3].strName, nCount3, tbMaterialCount[3])
	end	
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex);
	if NpcName2Replace then szNpcName = NpcName2Replace(szNpcName); end
	local tbDailog = DailogClass:new(szNpcName);
	tbDailog.szTitleMsg = strTittle
	tbDailog:AddOptEntry("NhËn nhiÖm vô", self.AcceptQuest, {self, nStage, nType, nLevel})
	tbDailog:AddOptEntry("Hoµn thµnh nhiÖm vô", self.CompleteQuest, {self, nStage, nType, nLevel})
	tbDailog:AddOptEntry("Hñy nhiÖm vô", self.CancelQuest, {self, nStage, nType, nLevel})
	tbDailog:Show();
end

function tbMainQuest:CalcItems()
	local n1, n2, n3
	n1 = CalcItemCount(3, self.tbMaterial[1].nG, self.tbMaterial[1].nD, self.tbMaterial[1].nP, -1)
	n2 = CalcItemCount(3, self.tbMaterial[2].nG, self.tbMaterial[2].nD, self.tbMaterial[2].nP, -1)
	n3 = CalcItemCount(3, self.tbMaterial[3].nG, self.tbMaterial[3].nD, self.tbMaterial[3].nP, -1)
	return n1, n2, n3
end

function tbMainQuest:ConsumeItems(tbMateRequire, strLog)
	for i = 1, getn(self.tbMaterial) do	
		if ConsumeItem(3, tbMateRequire[i], self.tbMaterial[i].nG, self.tbMaterial[i].nD, self.tbMaterial[i].nP, -1) ~= 1 then
			Talk(1, "", format("Giao nép %s thÊt b¹i, tiªu hao mét sè nguyªn liÖu.", self.tbMaterial[i].strName))
			tbLog:PlayerActionLog("DongTrungHaThao", "GiaoNopThatBai", tbMateRequire[i].." "..self.tbMaterial[i].strName, strLog)
			return 0
		else
			tbLog:PlayerActionLog("DongTrungHaThao", "GiaoNopThanhCong", tbMateRequire[i].." "..self.tbMaterial[i].strName, strLog)
		end
	end
	return 1
end

function tbMainQuest:AcceptQuest(nStage, nType, nLevel)
	local tbBTask = %tbDTT_Data.tbStages[nStage][nType].tbBitTask
	if not tbBTask then
		return
	end
	if tbVNG_BitTask_Lib:getBitTask(tbBTask[1]) ~= 0 then
		Talk(1, "", "C¸c h¹ ®· nhËn nhiÖm vô nµy råi, ®©u cÇn nhËn l¹i.")
		return
	end
	if tbVNG_BitTask_Lib:getBitTask(tbBTask[2]) ~= 0 then
		Talk(1, "", "C¸c h¹ ®· hoµn thµnh nhiÖm vô nµy råi, h·y lµm nhiÖm vô kh¸c ®i.")
		return
	end
	if nStage == 1 then
		if GetLevel() <150 and ST_GetTransLifeCount() <= 1 then
			Talk(1, "", "Yªu cÇu ®¼ng cÊp trªn 150 vµ ®· trïng sinh 1 lÇn míi ®­îc phÐp nhËn nhiÖm vô nµy!")
			return nil
		end
		local nLvlST1,_ = zhuansheng_get_gre(1)
		if nLvlST1 == 200 then
			Talk(1, "", "C¸c h¹ ®· trïng sinh lÇn 1 ë ®¼ng cÊp 200 kh«ng cÇn ph¶i lµm nhiÖm vô nµy.")
			return nil
		end
	elseif nStage == 2 then
		local nLvlST1,_ = zhuansheng_get_gre(1)
		if nLvlST1 ~= 200 then
			--ph¶i hoµn thµnh nhiÖm vô kü n¨ng vµ tiÒm n¨ng gd 1 míi dc nhËn nhiÖm vô gd2
			local tbPreBTask1 = %tbDTT_Data.tbStages[1][1].tbBitTask
			local tbPreBTask2 = %tbDTT_Data.tbStages[1][2].tbBitTask
			if tbVNG_BitTask_Lib:getBitTask(tbPreBTask1[2]) ~= 1 or tbVNG_BitTask_Lib:getBitTask(tbPreBTask2[2]) ~= 1 then
				Talk(1, "", "Yªu cÇu ph¶i hoµn thµnh <color=red>nhiÖm vô kü n¨ng vµ tiÒm n¨ng giai ®o¹n 1<color> míi ®­îc phÐp nhËn tiÕp nhiÖm vô giai ®o¹n 2. Khi nµo hoµn thµnh h·y quay l¹i t×m ta.")
				return
			end
		end
	elseif nStage == 3 then
		local nLevel1,_ = zhuansheng_get_gre(1)
		if nLevel1 ~= 200 then
			--ph¶i hoµn thµnh nhiÖm vô kü n¨ng vµ tiÒm n¨ng gd 1 míi dc nhËn nhiÖm vô gd3
			local tbPreBTask1 = %tbDTT_Data.tbStages[1][1].tbBitTask
			local tbPreBTask2 = %tbDTT_Data.tbStages[1][2].tbBitTask
			if tbVNG_BitTask_Lib:getBitTask(tbPreBTask1[2]) ~= 1 or tbVNG_BitTask_Lib:getBitTask(tbPreBTask2[2]) ~= 1 then
				Talk(1, "", "Yªu cÇu ph¶i hoµn thµnh <color=red>nhiÖm vô kü n¨ng vµ tiÒm n¨ng giai ®o¹n 1<color> míi ®­îc phÐp nhËn tiÕp nhiÖm vô giai ®o¹n 2. Khi nµo hoµn thµnh h·y quay l¹i t×m ta.")
				return
			end
		end
		local nLevel2,_ = zhuansheng_get_gre(2)
		if nLevel2 ~= 200 then
			--ph¶i hoµn thµnh nhiÖm vô kü n¨ng vµ tiÒm n¨ng gd 2 míi dc nhËn nhiÖm vô gd3
			local tbPreBTask1 = %tbDTT_Data.tbStages[2][1].tbBitTask
			local tbPreBTask2 = %tbDTT_Data.tbStages[2][2].tbBitTask
			if tbVNG_BitTask_Lib:getBitTask(tbPreBTask1[2]) ~= 1 or tbVNG_BitTask_Lib:getBitTask(tbPreBTask2[2]) ~= 1 then
				Talk(1, "", "Yªu cÇu ph¶i hoµn thµnh <color=red>nhiÖm vô kü n¨ng vµ tiÒm n¨ng giai ®o¹n 2<color> míi ®­îc phÐp nhËn tiÕp nhiÖm vô giai ®o¹n 3. Khi nµo hoµn thµnh h·y quay l¹i t×m ta.")
				return
			end
		end
	end
	if tbVNG_BitTask_Lib:setBitTask(tbBTask[1], 1) ~= 1 then
		Talk(1, "", "<color=red>NhËn nhiÖm vô kh«ng thµnh c«ng, xin h·y thö l¹i!<color>")
		return
	end
	local strTypePoint = %tbDTT_Data.tbStages[nStage][nType].strType 
	local strLogTittle = %tbDTT_Data.tbStages[nStage][nType].strLog
	tbLog:PlayerActionLog("DongTrungHaThao", "Nhan"..strLogTittle)
	Msg2Player(format("<color=green>C¸c h¹ ®· tiÕp nhËn nhiÖm vô §«ng Trïng H¹ Th¶o (%s) giai ®o¹n <color=yellow>%d<color=green>, h·y mau ®i thu thËp nguyªn liÖu mang vÒ ®©y.<color>", strTypePoint, nStage))
end

function tbMainQuest:CompleteQuest(nStage, nType, nLevel)
	local tbStage = %tbDTT_Data.tbStages[nStage]
	if not tbStage or not tbStage[nType] or not tbStage[nType][nLevel] then		
		return
	end
	local strTypePoint = tbStage[nType].strType
	local tbTemp = tbStage[nType][nLevel]	
	--KiÓm tra ®· nhËn nv ch­a
	local tbBTask = tbStage[nType].tbBitTask
	if not tbBTask then	
		return
	end
	if tbVNG_BitTask_Lib:getBitTask(tbBTask[1]) ~= 1 then
		Talk(1, "", "<color=red>NhiÖm vô ch­a nhËn kh«ng thÓ hoµn thµnh.<color>")
		return
	end
	if tbVNG_BitTask_Lib:getBitTask(tbBTask[2]) ~= 0 then
		Talk(1, "", "<color=red>C¸c h¹ ®· hoµn thµnh nhiÖm vô nµy råi, h·y lµm nhiÖm vô kh¸c ®i.<color>")
		return
	end
	--KiÓm tra nguyªn liÖu
	local tbMaterialCount = {tbTemp[2], tbTemp[3],tbTemp[4]}
	local nCount1, nCount2, nCount3 = self:CalcItems()
	if nCount1 < tbMaterialCount[1] or nCount2 < tbMaterialCount[2] or nCount3 < tbMaterialCount[3] then
		Talk(1, "", "<color=red>C¸c h¹ ®em nguyªn liÖu kh«ng ®ñ råi, cè g¾ng thu thËp thªm råi quay l¹i t×m ta.<color>")
		return
	end
	local strLogTittle = tbStage[nType].strLog
	if self:ConsumeItems(tbMaterialCount, strLogTittle) ~= 1 then
		return
	end
	--Add task
	if tbVNG_BitTask_Lib:setBitTask(tbBTask[2], 1) ~= 1 then
		Talk(1, "", "<color=red>NhiÖm vô ch­a hoµn thµnh, xin h·y liªn l¹c ban ®iÒu hµnh ®Ó ®­îc gi¶i quyÕt!<color>")
		return
	end
	--Add phÇn th­ëng
	local nPointCount = tbTemp[1]
	if strTypePoint == "§iÓm kü n¨ng" then
		AddMagicPoint(nPointCount)
		local str = nPointCount.." "..strTypePoint
		Msg2Player(format("<color=green>Chóc mõng b¹n ®· hoµn thµnh nhiÖm vô §«ng Trïng H¹ Th¶o (%s) giai ®o¹n <color=yellow>%d<color=green>, nhËn ®­îc <color=yellow>%s.<color>", strTypePoint, nStage, str))
		tbLog:PlayerActionLog("DongTrungHaThao", "HoanThanh"..strLogTittle, "TS"..nStage.."Level"..nLevel, str)
	elseif strTypePoint == "§iÓm tiÒm n¨ng" then
		AddProp(nPointCount)
		local str = nPointCount.." "..strTypePoint
		Msg2Player(format("<color=green>Chóc mõng b¹n ®· hoµn thµnh nhiÖm vô §«ng Trïng H¹ Th¶o (%s) giai ®o¹n <color=yellow>%d<color=green>, nhËn ®­îc <color=yellow>%s.<color>", strTypePoint, nStage, str))
		tbLog:PlayerActionLog("DongTrungHaThao", "HoanThanh"..strLogTittle, "TS"..nStage.."Level"..nLevel, str)
	elseif strTypePoint == "Kh¸ng tÊt c¶" then
		for i = 0, 4 do
			AddMaxResist(i, nPointCount);
		end
		local str = nPointCount.." "..strTypePoint
		Msg2Player(format("<color=green>Chóc mõng b¹n ®· hoµn thµnh nhiÖm vô §«ng Trïng H¹ Th¶o (%s) giai ®o¹n <color=yellow>%d<color=green>, nhËn ®­îc <color=yellow>%s.<color>", strTypePoint, nStage, str))
		tbLog:PlayerActionLog("DongTrungHaThao", "HoanThanh"..strLogTittle, "TS"..nStage.."Level"..nLevel, str)
	elseif strTypePoint == "Kü n¨ng tèi ®a" then
		SetSkillMaxLevelAddons(GetSkillMaxLevelAddons() + nPointCount)
		local str = nPointCount.." "..strTypePoint
		Msg2Player(format("<color=green>Chóc mõng b¹n ®· hoµn thµnh nhiÖm vô §«ng Trïng H¹ Th¶o (%s) giai ®o¹n <color=yellow>%d<color=green>, nhËn ®­îc <color=yellow>%s.<color>", strTypePoint, nStage, str))
		tbLog:PlayerActionLog("DongTrungHaThao", "HoanThanh"..strLogTittle, "TS"..nStage.."Level"..nLevel, str)
	elseif strTypePoint == "Kh¸ng tÝnh" then
		local n_translevel, n_transresist = zhuansheng_get_gre(nStage);
		if n_transresist >= 0 and n_transresist <= 4 then
			AddMaxResist(n_transresist, nPointCount);
			local str = nPointCount.." "..TB_BASE_RESIST[n_transresist]
			Msg2Player(format("<color=green>Chóc mõng b¹n ®· hoµn thµnh nhiÖm vô §«ng Trïng H¹ Th¶o (%s) giai ®o¹n <color=yellow>%d<color=green>, nhËn ®­îc <color=yellow>%s.<color>", strTypePoint, nStage, str))
			tbLog:PlayerActionLog("DongTrungHaThao", "HoanThanh"..strLogTittle, "TS"..nStage.."Level"..nLevel, str)
		end
	end
	KickOutSelf()
end

function tbMainQuest:CancelQuest(nStage, nType, nLevel)
	local tbBTask = %tbDTT_Data.tbStages[nStage][nType].tbBitTask
	if not tbBTask then
		return
	end
	if tbVNG_BitTask_Lib:getBitTask(tbBTask[1]) ~= 1 then
		Talk(1, "", "Kh«ng thÓ huû nhiÖm vô ch­a nhËn.")
		return
	end
	if tbVNG_BitTask_Lib:getBitTask(tbBTask[2]) ~= 0 then
		Talk(1, "", "C¸c h¹ ®· hoµn thµnh nhiÖm vô nµy råi.")
		return
	end
	tbVNG_BitTask_Lib:setBitTask(tbBTask[1], 0) 
	Msg2Player("Huû bá nhiÖm vô §«ng Trïng H¹ Th¶o thµnh c«ng.")
end