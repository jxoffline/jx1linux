Include("\\script\\activitysys\\config\\1017\\head.lua");
Include("\\script\\activitysys\\config\\1017\\variables.lua");
Include("\\script\\activitysys\\config\\1017\\awardlist.lua");
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\awardtemplet.lua");
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\flipcard\\flipcard_gs.lua")
IncludeLib("SETTING")
pActivity.nPak = curpack()
tbKeyOpenChest = {
		["chiakhoadong"] = {6, 1, 30389,"Ch×a khãa ®ång"},
		["chiakhoabac"] = {6, 1, 30390,"Ch×a khãa b¹c"},
		["chiakhoangusac"] = {6, 1, 30391,"Ch×a khãa ngò s¾c"},
	}
	
function pActivity:PlayerOnLogin()
	if tbVNG_BitTask_Lib:getBitTask(%TSK_RESET_OLD_TASK) == 0 then
		tbVNG_BitTask_Lib:setBitTask(%TSK_RESET_OLD_TASK, 1)
		tbVNG_BitTask_Lib:setBitTask(%TSK_USE_AWARD1, 0)
		tbVNG_BitTask_Lib:setBitTask(%TSK_USE_AWARD2, 0)
		tbVNG_BitTask_Lib:setBitTask(%TSK_USE_AWARD3, 0)
		SetTask(2981, 0)
	end	
end

function pActivity:FlipCardCallBack(nIndex)
	if PlayerFunLib:CheckTaskDaily(%TSK_FLIPCARD_DAILY_LIMIT,%FLIPCARD_MAX_DAILY,"H«m nay ®¹i hiÖp ®· më 200 « råi, ngµy mai l¹i tiÕp tôc nhÐ.","<") and
	PlayerFunLib:CheckCash(%FLIPCARD_CASH_REQUIRE,"TiÒn ®¹i hiÖp mang theo kh«ng ®ñ råi, mang tiÒn ®Çy ®ñ råi h½ng ®Õn.") and
	PlayerFunLib:CheckFreeBagCell(%FLIPCARD_FREE_BAG_REQUIRE,"Hµnh trang cña c¸c h¹ kh«ng ®ñ « trèng, h·y s¾p xÕp l¹i råi h·y ®Õn.") then
		local funCallBack = function(nItemIndex)
			local nCount = GetItemStackCount(nItemIndex)
			local nG, nD, nP = GetItemProp(nItemIndex)
			%tbFlipCard:SetItem(%nIndex, {nCount, nG, nD, nP})
		end
		local tbAward = {
			[1]={szName=%ITEM_MATERIAL_3.szName, tbProp=%ITEM_MATERIAL_3.tbProp, nExpiredTime=%ITEM_MATERIAL_3.nExpiredTime, nRate = 10, nCount = 2,CallBack=funCallBack},
			[2]={szName=%ITEM_MATERIAL_3.szName, tbProp=%ITEM_MATERIAL_3.tbProp, nExpiredTime=%ITEM_MATERIAL_3.nExpiredTime, nRate = 7, nCount = 4,CallBack=funCallBack},
			[3]={szName=%ITEM_MATERIAL_3.szName, tbProp=%ITEM_MATERIAL_3.tbProp, nExpiredTime=%ITEM_MATERIAL_3.nExpiredTime, nRate = 6, nCount = 6,CallBack=funCallBack},
			[4]={szName=%ITEM_MATERIAL_3.szName, tbProp=%ITEM_MATERIAL_3.tbProp, nExpiredTime=%ITEM_MATERIAL_3.nExpiredTime, nRate = 5, nCount = 8,CallBack=funCallBack},			
			[5]={szName=%ITEM_MATERIAL_3.szName, tbProp=%ITEM_MATERIAL_3.tbProp, nExpiredTime=%ITEM_MATERIAL_3.nExpiredTime, nRate = 5, nCount = 10,CallBack=funCallBack},			
			[6]={szName=%ITEM_MATERIAL_2.szName, tbProp=%ITEM_MATERIAL_2.tbProp, nExpiredTime=%ITEM_MATERIAL_2.nExpiredTime, nRate = 10, nCount = 2,CallBack=funCallBack},
			[7]={szName=%ITEM_MATERIAL_2.szName, tbProp=%ITEM_MATERIAL_2.tbProp, nExpiredTime=%ITEM_MATERIAL_2.nExpiredTime, nRate = 7, nCount = 4,CallBack=funCallBack},
			[8]={szName=%ITEM_MATERIAL_2.szName, tbProp=%ITEM_MATERIAL_2.tbProp, nExpiredTime=%ITEM_MATERIAL_2.nExpiredTime, nRate = 6, nCount = 6,CallBack=funCallBack},
			[9]={szName=%ITEM_MATERIAL_2.szName, tbProp=%ITEM_MATERIAL_2.tbProp, nExpiredTime=%ITEM_MATERIAL_2.nExpiredTime, nRate = 5, nCount = 8,CallBack=funCallBack},
			[10]={szName=%ITEM_MATERIAL_2.szName, tbProp=%ITEM_MATERIAL_2.tbProp, nExpiredTime=%ITEM_MATERIAL_2.nExpiredTime, nRate = 5, nCount = 10,CallBack=funCallBack},			
			[11]={szName=%ITEM_AWARD_2.szName, tbProp=%ITEM_AWARD_2.tbProp, nExpiredTime=%ITEM_AWARD_2.nExpiredTime, nRate = 10, nCount = 2,CallBack=funCallBack},
			[12]={szName=%ITEM_AWARD_2.szName, tbProp=%ITEM_AWARD_2.tbProp, nExpiredTime=%ITEM_AWARD_2.nExpiredTime, nRate = 7, nCount = 4,CallBack=funCallBack},
			[13]={szName=%ITEM_AWARD_2.szName, tbProp=%ITEM_AWARD_2.tbProp, nExpiredTime=%ITEM_AWARD_2.nExpiredTime, nRate = 6, nCount = 6,CallBack=funCallBack},
			[14]={szName=%ITEM_AWARD_2.szName, tbProp=%ITEM_AWARD_2.tbProp, nExpiredTime=%ITEM_AWARD_2.nExpiredTime, nRate = 5, nCount = 8,CallBack=funCallBack},
			[15]={szName=%ITEM_AWARD_2.szName, tbProp=%ITEM_AWARD_2.tbProp, nExpiredTime=%ITEM_AWARD_2.nExpiredTime, nRate = 6, nCount = 10,CallBack=funCallBack},			
		} 	
		self:OpenBox(tbAward)
	end
end

--NÕu quay vao « kh«ng tróng th× sao(cã mÊt tiÒn, cã tinh 1 lÇn quay kh«ng)
function pActivity:OpenBox(tbAward)
	PlayerFunLib:AddTaskDaily(%TSK_FLIPCARD_DAILY_LIMIT,1) -- T¨ng thªm 1 lÇn më «
	Pay(%FLIPCARD_CASH_REQUIRE)  -- Trõ tiÒn khi më «
	PlayerFunLib:AddExp(%FLIPCARD_EXP_AWARD, 1)
	tbAwardTemplet:Give(tbAward, 1, {%EVENT_LOG_TITLE, "MoOnhanphanthuong"})
	if PlayerFunLib:GetTaskDailyCount(%TSK_FLIPCARD_DAILY_LIMIT) == %FLIPCARD_MAX_DAILY then 
		Msg2Player(format("H«m nay ®¹i hiÖp ®· më %d «, ngµy mai l¹i ®Õn nhÐ", %FLIPCARD_MAX_DAILY))
	end
end

function pActivity:OpenUI()
	%tbFlipCard:OpenUI(self.FlipCardCallBack, {self})
end



function pActivity:CheckUseItem(szIndex)
	if not tbKeyOpenChest[szIndex] then return end
	local tbKey = tbKeyOpenChest[szIndex]
	local nCount = CalcItemCount(3, tbKey[1], tbKey[2], tbKey[3], -1) 
	if nCount <= 0 then
		lib:ShowMessage(format("CÇn ph¶i cã <color=yellow>1 %s<color>", tbKey[4]))
		return nil
	end
	return 1
end

function pActivity:UseItem(szIndex,Task_ID,Exp_Award)
	local tbKey = tbKeyOpenChest[szIndex]
	if ConsumeItem(3, 1, tbKey[1], tbKey[2], tbKey[3], -1) ~= 1 then
		Msg2Player(format("CÇn ph¶i cã %s míi cã thÓ më ®­îc B¶o R­¬ng",tbKey[4]))
		return
	end
	local nCnt_Award3 = tbVNG_BitTask_Lib:getBitTask(Task_ID)
	if (nCnt_Award3 < 0) then return 	end
	%tbVNG_BitTask_Lib:addTask(Task_ID, 1)	
	nCnt_Award3 = nCnt_Award3 + 1;
	tbAwardTemplet:Give(Exp_Award, 1, {%EVENT_LOG_TITLE, format("SuDungLanThu%sNhanExpkhidung_%s",nCnt_Award3,szIndex)});
	if %tbAward_A and %tbAward_A[szIndex] then
		local tbMoc = %tbAward_A["datmocevent"]
		if (mod(nCnt_Award3, 30) == 0) then
				--NhËn phÇn th­ëng ®¹t mèc 30,60,90
			tbAwardTemplet:Give(%tbAward_A[szIndex][2], 1, {%EVENT_LOG_TITLE, format("SuDung%sChiaKhoaNguSacNhanPhanThuong", nCnt_Award3)})	
		else
			--NhËn phÇn th­ëng bt víi r­¬ng ngò s¾c
			tbAwardTemplet:Give(%tbAward_A[szIndex][1], 1, {%EVENT_LOG_TITLE, format("SuDung%sChiaKhoaNguSacNhanPhanThuong", nCnt_Award3)})	
		end	
		if tbMoc and tbMoc[nCnt_Award3] then
			tbAwardTemplet:Give(tbMoc[nCnt_Award3], 1, {%EVENT_LOG_TITLE, format("SuDung%sChiaKhoaNguSacNhanPhanThuongDatMoc", nCnt_Award3)})	
		end
	end
end