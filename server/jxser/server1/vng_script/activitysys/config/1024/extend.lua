Include("\\vng_script\\activitysys\\config\\1024\\head.lua")
Include("\\vng_script\\activitysys\\config\\1024\\variables.lua")
Include("\\vng_script\\activitysys\\config\\1024\\awardlist.lua")
Include("\\vng_script\\features\\huynhdelenhbai\\mainfuc.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\vng_feature\\getskills.lua")
Include("\\script\\global\\vipsys\\head.lua") --check actived the hao hiep
Include("\\script\\lib\\log.lua")

pActivity.nPak = curpack()

function pActivity:DropItemNpcInMap(nNpcIndex)
	local nSettingIdx = GetNpcSettingIdx(nNpcIndex)
	local nTeamSize = GetTeamSize()	
	--khong co to doi danh quai
	if nTeamSize == 0 then
		local nCheck = self:CheckInMapThapNien(nNpcIndex)
		if nCheck == 1 then
			local nEventId = tbVNG_BitTask_Lib:getBitTask(tbHuynhdelenhbai.TASK_INFOR_HD_LB)
			tbVNG_BitTask_Lib:addTask(tbHuynhdelenhbai.TASK_ID_MAP[nEventId][nSettingIdx], 1)			
		end
		return
	end
	--to doi danh quai
	local oldPlayer = PlayerIndex	
	for i = 1, nTeamSize do		
		local nplayer = GetTeamMember(i)		
		PlayerIndex = nplayer	
		local nCheck = self:CheckInMapThapNien(nNpcIndex)
		if nCheck == 1 then
			local nEventId = tbVNG_BitTask_Lib:getBitTask(tbHuynhdelenhbai.TASK_INFOR_HD_LB)
			tbVNG_BitTask_Lib:addTask(tbHuynhdelenhbai.TASK_ID_MAP[nEventId][nSettingIdx], 1)		
		end
	end
	PlayerIndex = oldPlayer
end

function pActivity:CheckLevel_ShowDlg(nCheck)
	local nLevel = GetLevel()
	if nCheck == 1 and nLevel >= 50 then
		return
	end
	if nCheck == 2 and nLevel < 50 then
		return
	end
	return 1
end

--KiÓm tra nhiÖm vô nÕu cã míi kiÓm tra map
function pActivity:CheckInMapThapNien(nNpcIndex)
	--KiÓm tra level	
--	if (GetLevel() < 50) then
--		return
--	end
	--KiÓm tra nhiÖm vô nhËn vµ nhiÖm vô cã thÓ nhËn cã gièng nhau kh«ng
	local nEventId = tbHuynhdelenhbai:GetEventIdInfo(1)
	local nCurTskVal = tbVNG_BitTask_Lib:getBitTask(tbHuynhdelenhbai.TASK_INFOR_HD_LB)
	if(nEventId ~= nCurTskVal) then
		return
	end
	--KiÓm tra Npc cã ®óng trªn map ch­a
	local tbAward = tbHuynhdelenhbai:GetAwardInfo(nEventId)
	--KiÓm tra table víi npc cã tån t¹i kh«ng
	local nSettingIdx = GetNpcSettingIdx(nNpcIndex)
	if(not tbHuynhdelenhbai.TASK_ID_MAP or not tbHuynhdelenhbai.TASK_ID_MAP[nCurTskVal] or 
		not tbHuynhdelenhbai.TASK_ID_MAP[nCurTskVal][nSettingIdx]) then
		return
	end
	if (NpcFunLib:CheckInMap(tbAward[1].szMapList, nNpcIndex) ~= 1) then
		return
	end
	--KiÓm tra Task id ®· full ch­a
	if tbVNG_BitTask_Lib:isMaxBitTaskValue(tbHuynhdelenhbai.TASK_ID_MAP[nCurTskVal][nSettingIdx]) == 1 then
		return
	end
	return 1
end

function pActivity:CheckFeatHuynhDe(Idx,nRet)
	
	--KiÓm tra nhiÖm vô nhËn vµ nhiÖm vô cã thÓ nhËn cã gièng nhau kh«ng
	local nEventId = tbHuynhdelenhbai:GetEventIdInfo(1)
	local nCurTskVal = tbVNG_BitTask_Lib:getBitTask(tbHuynhdelenhbai.TASK_INFOR_HD_LB)
	if(not nEventId or nEventId ~= nCurTskVal) then
		if(nRet == 0) then
			lib:ShowMessage("§¹i hiÖp ch­a nhËn nhiÖm vô kh«ng thÓ sö dông vËt phÈm")
		end
		return
	end
	
	--KiÓm tra Npc cã ®óng trªn map ch­a
	local tbAward = tbHuynhdelenhbai:GetAwardInfo(nEventId)
	if(not tbHuynhdelenhbai.TASK_INFOR_ABOUNT[nCurTskVal] or not tbHuynhdelenhbai.TASK_INFOR_ABOUNT[nCurTskVal][Idx]) then
		if(nRet == 0) then
			lib:ShowMessage("§¹i hiÖp ch­a nhËn nhiÖm vô kh«ng thÓ sö dông vËt phÈm.")
		end	
		return
	end
	
	--KiÓm tra Task id ®· full ch­a
	if tbVNG_BitTask_Lib:isMaxBitTaskValue(tbHuynhdelenhbai.TASK_INFOR_ABOUNT[nCurTskVal][Idx]) == 1 then
		if(nRet == 0) then
			lib:ShowMessage("NhiÖm vô ®· ®¹t giíi h¹n kh«ng thÓ sö dông vËt phÈm")
		end
		return
	end
	return 1
end

function pActivity:GiveFeatHuynhDe(Idx,nValue)
	local nEventId = tbVNG_BitTask_Lib:getBitTask(tbHuynhdelenhbai.TASK_INFOR_HD_LB)
	local nCurTskVal = tbVNG_BitTask_Lib:getBitTask(tbHuynhdelenhbai.TASK_INFOR_ABOUNT[nEventId][Idx])
	local nMaxValue = tbHuynhdelenhbai.TASK_INFOR_ABOUNT[nEventId][Idx].nMaxValue
	if(nCurTskVal + nValue > nMaxValue) then
		nValue = nMaxValue - nCurTskVal
	end
	--ghi log su dung tk hoan thanh lenh bai
	tbLog:PlayerActionLog(EVENT_LOG_TITLE,"HoanThanh1NVTK",format("IDNhienVu: %d - Gia tri hien tai: %d - Gia tri them vao: %d",nEventId,nCurTskVal,nValue))	
	tbVNG_BitTask_Lib:addTask(tbHuynhdelenhbai.TASK_INFOR_ABOUNT[nEventId][Idx], nValue)	
end

function pActivity:CheckActiveCondition(nId)
	if GetLevel() > 110 then
			lib:ShowMessage("Ng­¬i ®· quÊ ®¼ng cÊp, Huynh §Ö T­¬ng Phïng lÖnh bµi chØ cã t¸c dông ®Õn ®¼ng cÊp 110.")
			return
	end
	--kich hoat code
	if(self:IsNewPlayer() == 0) then
		lib:ShowMessage("Ch­a kÝch ho¹t m· code t¹i trang chñ, kh«ng thÓ nhËn Huynh §Ö T­¬ng Phïng lÖnh bµi")
		return
	end
	--kich hoat the hao hiep
	local nActieved, szMsg = VipSys:IsActived()
	if 	nActieved ~= 1 then
		lib:ShowMessage("Ch­a kÝch ho¹t ThÎ Hµo HiÖp, kh«ng thÓ nhËn Huynh §Ö T­¬ng Phïng lÖnh bµi")
		return
	end
	
	if(nId == 2 and self:IsNewPlayer() == 1) then		
		lib:ShowMessage("Hµnh trang ®· cã Huynh §Ö T­¬ng Phïng LÖnh Bµi, kh«ng thÓ nhËn thªm  ")
		return
	end
	return 1
end

--Function kiÓm tra ng­êi ch¬i míi
--Cã thËp niªn lÖnh bµi & KÝch ho¹t m· code
function pActivity:IsNewPlayer()
	if (VngExtPointLib:GetBitValueByVersion(EXT_POINT_ID_LBHD) == 0) then
		return 0
	end
	local tbProp = ITEM_HDTP_LB.tbProp
	if(CalcItemCount(-1, tbProp[1],  tbProp[2],  tbProp[3], -1) < 1) then
		return 2
	end
	return 1
end
function pActivity:Check_ItemHDLB()
	local tbProp = ITEM_HDTP_LB.tbProp
	if(CalcItemCount(-1, tbProp[1],  tbProp[2],  tbProp[3], -1) < 1) then
		Talk(1,"","Ng­¬i ch­a nhËn hoÆc kh«ng cã Huynh §Ö T­¬ng Phïng LÖnh Bµi, kh«ng thÓ nhËn nhiÖm vô")
		return 
	end
	return 1
end
--Function t¾t Bit ExtPoint khi ®· nhËn thÎ HLLB
function pActivity:ResetBitCodeHDLB()		
	if (VngExtPointLib:SetBitValueByVersion(EXT_POINT_ID_LBHD,0) ~= 1) then
		return Talk(1,"","Cã lçi khi nhËn thÎ hµo hiÖp, vui lßng b¸o bæn trang ®Ó ®­îc gióp ®ì.")
	end
	Msg2Player("Mçi Code Huynh §Ö T­¬ng Phïng LÖnh Bµi, chØ kÝch ho¹t cho 1 nhËn vËt.")
end
--Reset giíi h¹n sö dông lÖnh bµi hoµn thµnh
function pActivity:ResetTaskDaily_LenhBai()
	if PlayerFunLib:GetTaskDailyCount(%TASK_DAILY_RESET) == 0 then
		PlayerFunLib:AddTaskDaily(%TASK_DAILY_RESET, 1)
	 	for i = 1, 9 do --khong duoc reset bit 30
	 		tbVNG_BitTask_Lib:setBitTask({nTaskID = %TSK_DAILY_LIMIT,nStartBit = i,nBitCount = 1,nMaxValue = 1}, 0)
	 	end
	 end
	 return 1
end

function pActivity:CheckFeatHuynhDe_KilNpc(nRet)
	
	--KiÓm tra nhiÖm vô nhËn vµ nhiÖm vô cã thÓ nhËn cã gièng nhau kh«ng
	local nEventId = tbHuynhdelenhbai:GetEventIdInfo(1)
	local nCurTskVal = tbVNG_BitTask_Lib:getBitTask(tbHuynhdelenhbai.TASK_INFOR_HD_LB)
	if(not nEventId or nEventId ~= nCurTskVal) then
		if(nRet == 0) then
			lib:ShowMessage("§¹i hiÖp ch­a nhËn nhiÖm vô kh«ng thÓ sö dông vËt phÈm")
		end
		return
	end
	
	--KiÓm tra Npc cã ®óng trªn map ch­a
	local tbAward = tbHuynhdelenhbai:GetAwardInfo(nEventId)
	if(not tbHuynhdelenhbai.TASK_ID_MAP[nCurTskVal] ) then
		if(nRet == 0) then
			lib:ShowMessage("§¹i hiÖp ch­a nhËn nhiÖm vô kh«ng thÓ sö dông vËt phÈm")
		end	
		return
	end
	
	--KiÓm tra Task id ®· full ch­a
	for k,v in  tbHuynhdelenhbai.TASK_ID_MAP[nCurTskVal] do
		if tbVNG_BitTask_Lib:isMaxBitTaskValue(tbHuynhdelenhbai.TASK_ID_MAP[nCurTskVal][k]) == 1 then
			if(nRet == 0) then
				lib:ShowMessage("NhiÖm vô ®· ®¹t giíi h¹n kh«ng thÓ sö dông vËt phÈm")
			end
			return
		end
	end
	return 1
end

function pActivity:GiveFeatHuynhDe_KillNpc(nValue)
	local nEventId = tbVNG_BitTask_Lib:getBitTask(tbHuynhdelenhbai.TASK_INFOR_HD_LB)		
	for k,v in  tbHuynhdelenhbai.TASK_ID_MAP[nEventId] do
		local nCurTskVal = tbVNG_BitTask_Lib:getBitTask(tbHuynhdelenhbai.TASK_ID_MAP[nEventId][k])
		local nMaxValue = tbHuynhdelenhbai.TASK_ID_MAP[nEventId][k].nMaxValue
		if(nCurTskVal + nValue > nMaxValue) then
			nValue = nMaxValue - nCurTskVal
		end		
		--ghi log su dung danh quai hoan thanh lenh bai
		if nValue == NUM_ADD_KILL then
			tbLog:PlayerActionLog(EVENT_LOG_TITLE,"Use_ITEM_KILL_500_NPC_LB",format("IDNhienVu: %d - Gia tri hien tai: %d - Gia tri them vao: %d",nEventId,nCurTskVal,nValue))
		end
		tbVNG_BitTask_Lib:addTask(tbHuynhdelenhbai.TASK_ID_MAP[nEventId][k], nValue)
	end
end