Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\vng_lib\\extpoint.lua")
Include("\\script\\activitysys\\config\\1005\\tongsupport.lua")
Include("\\script\\activitysys\\config\\1005\\check_func.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\lib\\log.lua")
--Include("\\script\\vng_event\\tanthu\\giveskill60.lua")

tbPVLBActive = {}

function tbPVLBActive:AddDialog(tbDailog)	
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))	
	if nCurDate >= %nSTART_DATE_GET_ITEM and nCurDate < %nEND_DATE_GET_ITEM then		
		--tbDailog:AddOptEntry("NhÀn Cˆu Ni™n TrÔng PhÔng L÷nh Bµi", tbPVLBActive.main, {tbPVLBActive})
		--tbDailog:AddOptEntry("ßÊi B∏t Ni™n L÷nh Bµi l y Cˆu Ni™n TrÔng PhÔng L÷nh Bµi", tbPVLBActive.ExchangeNewCard, {tbPVLBActive})
		--tbDailog:AddOptEntry("NhÀn th≠Îng Cˆu Ni™n L÷nh Bµi dµnh cho nh©n vÀt cÚ", tbPVLBActive.GetExtItem_Dlg, {tbPVLBActive})	
		--tbDailog:AddOptEntry("NhÀn K‹ N®ng sau Khi Gia NhÀp M´n Ph∏i", tbGiveSkill60.main, {tbGiveSkill60})	
			
	end
--	if nCurDate >= %nSTART_DATE and nCurDate < %nEND_DATE then		
--		tbDailog:AddOptEntry("Ph«n th≠Îng bang hÈi ti’p nhÀn t©n thÒ", tbTongSupport.main, {tbTongSupport})
--	end	
end

function tbPVLBActive:main()
	if CalcFreeItemCellCount() < 10 then
		Talk(1, "", "Y™u c«u ph∂i c„ ›t nh t 10 ´ trËng trong hµnh trang rÂi mÌi nhÀn vÀt ph»m.")
		return
	end
	if self:ActiveCondition() ~= 1 then
		return
	end
	if tbExtPointLib:SetBitValue(nEXT_POINT_ID, nEXT_POINT_BIT_USER_ACTIVE_IN_GAME, 1) ~= 1 then
		Talk(1, "", "D˜ li÷u kh´ng cÀp nhÀt, xin vui lﬂng li™n h÷ ban qu∂n trﬁ Æ” Æ≠Óc gi∂i quy’t.")
		return
	end
	if tbExtPointLib:GetBitValue(nEXT_POINT_ID, nEXT_POINT_BIT_USER_ACTIVE_IN_GAME) ~= 1 then
		Talk(1, "", "D˜ li÷u kh´ng cÀp nhÀt, xin vui lﬂng li™n h÷ ban qu∂n trﬁ Æ” Æ≠Óc gi∂i quy’t.")
		return
	end	
	local tbItem = {szName="Cˆu Ni™n TrÔng PhÔng L÷nh Bµi",tbProp={6,1,30439,1,0,0},nCount=1,nExpiredTime=129600,nBindState=-2};
	local strActionLog = ""
	if tbExtPointLib:GetBitValue(nEXT_POINT_ID, nEXT_POINT_BIT_NEW_ACCOUNT) == 1 then
		strActionLog = "NewUserActive"
	elseif tbExtPointLib:GetBitValue(nEXT_POINT_ID, nEXT_POINT_BIT_OLD_ACCOUNT) == 1 then
		strActionLog = "OldUserActive"
	end	
	tbAwardTemplet:Give(tbItem, 1, {"CuuNienHoiNgoLenhBai", strActionLog})
end
--ßi“u chÿnh Æi“u ki÷n nhÀn PVLB tr™n server mÌi - Modified By DinhHQ - 20111117
function tbPVLBActive:ActiveCondition()
	local nBitVal1 = tbExtPointLib:GetBitValue(nEXT_POINT_ID, nEXT_POINT_BIT_NEW_ACCOUNT) --nπp code tµi kho∂n mÌi
	local nBitVal2 = tbExtPointLib:GetBitValue(nEXT_POINT_ID, nEXT_POINT_BIT_OLD_ACCOUNT)--nπp code tµi kho∂n cÚ
	if nBitVal1 == 0 and nBitVal2 == 0 then
		Talk(1, "", "C∏c hπ ch≠a nπp code kh´ng th” nhÀn th≠Îng, xin h∑y ki”m tra lπi!")
		return nil
	end
	local nBitVal3 = tbExtPointLib:GetBitValue(nEXT_POINT_ID, nEXT_POINT_BIT_USER_ACTIVE_IN_GAME)--Æ∑ nhÀn th≠Îng
	if nBitVal3 ~= 0 then
		Talk(1, "", "Xin th¯ lÁi, c∏c hπ Æ∑ nhÀn ph«n th≠Îng nµy rÂi.")
		return nil
	end
	
	if GetRoleCreateDate() >= 20130611 then		
		return 1
	end
	local nTranLife = ST_GetTransLifeCount()	
	if nTranLife == 0 or nTranLife == 1 or nTranLife == 2 or nTranLife == 3 then
		return 1
	end
	if nTranLife == 4 and GetLevel() < 190 then
		return 1
	end
	Talk(1, "", "Xin th¯ lÁi, c∏c hπ kh´ng ÆÒ Æi“u ki÷n tham gia ch≠¨ng tr◊nh, h∑y gh– th®m trang chÒ cÒa trﬂ ch¨i Æ” bi’t th™m th´ng tin.")
end

function tbPVLBActive:ExchangeNewCard()
	if CalcFreeItemCellCount() < 10 then
		Talk(1, "", "Y™u c«u ph∂i c„ ›t nh t 10 ´ trËng trong hµnh trang rÂi mÌi nhÀn vÀt ph»m.")
		return
	end
	if CalcItemCount(3, 6, 1, 30141, -1)  == 0 or ConsumeItem(3, 1, 6, 1, 30141, -1) ~= 1 then
		Talk(1, "", "N’u kh´ng c„ B∏t Ni™n HÈi NgÈ L÷nh Bµi th◊ Æıng lµm phi“n ta")
		return
	end
	tbExtPointLib:SetBitValue(nEXT_POINT_ID, nEXT_POINT_BIT_USER_ACTIVE_IN_GAME, 1)
	tbExtPointLib:SetBitValue(nEXT_POINT_ID, nEXT_POINT_BIT_NEW_ACCOUNT, 0)
	tbExtPointLib:SetBitValue(nEXT_POINT_ID, nEXT_POINT_BIT_OLD_ACCOUNT, 1)
	local tbItem = {szName="Cˆu Ni™n TrÔng PhÔng L÷nh Bµi",tbProp={6,1,30439,1,0,0},nCount=1,nExpiredTime=129600,nBindState=-2};
	local strActionLog = "OldItem2New"	
	tbAwardTemplet:Give(tbItem, 1, {"CuuNienHoiNgoLenhBai", strActionLog})
end

---NhÀn ch©n phong thu˚ t∏c nghi÷p vµ Ch©n gi∏c kinh vÚ t∏c cho account cÚ
tbExtendAward = {
	[1] = {
		strTittle = "Ch©n Phong ThÒy T∏c Nghi÷p dµnh cho nh©n vÀt tπo tr≠Ìc ngµy 9 th∏ng 6", 
		tbTSK_Condition = {nTaskID = 3087,nStartBit = 26,nBitCount = 1,nMaxValue = 1}, 
		tbTSK_Limit = tbBITTASK_GET_EXT_ITEM_1_LIMIT, 
		tbAward = {szName="Ch©n Phong ThÒy T∏c Nghi÷p",tbProp={6,1,30440,1,0,0},nCount=1,nExpiredTime=86400},
		strActionLog = "NhanThuongChanPhongThuyTacNghiep",
	},
	[2] = {
		strTittle = "Ch©n Gi∏c Kinh T∏c VÚ dµnh cho nh©n vÀt tπo tr≠Ìc ngµy 9 th∏ng 6", 
		tbTSK_Condition = {nTaskID = 3083,nStartBit = 10,nBitCount = 1,nMaxValue = 1}, 
		tbTSK_Limit = tbBITTASK_GET_EXT_ITEM_2_LIMIT, 
		tbAward = {szName="Ch©n Gi∏c Kinh T∏c VÚ",tbProp={6,1,30441,1,0,0},nCount=1,nExpiredTime=86400},
		strActionLog = "NhanThuongChanGiacKinhVuTac",
	},
	[3] = {
		strTittle = "Trang bﬁ X›ch L©n cho nh©n vÀt cÚ hﬂan thµnh nhi÷m vÙ TS 4 c p 170", 
		tbTSK_Condition = {nTaskID = 3098,nStartBit = 30,nBitCount = 1,nMaxValue = 1}, 
		tbTSK_Limit = tbBITTASK_GET_EXT_ITEM_3_LIMIT, 
		tbAward = {szName = "Cˆu ni™n trÔng phÔng l÷nh bµi - X›ch L©n B∂o R≠¨ng", tbProp={6,1,30388,1,0,0}, nCount = 1, nBindState = -2,tbParam = {0,7,0,0,0,0}, nExpiredTime=10080},
		strActionLog = "ThuongBoSungRoleCuTS4170",
	},
	[4] = {
		strTittle = "Trang bﬁ X›ch L©n cho nh©n vÀt cÚ hﬂan thµnh nhi÷m vÙ TS 4 c p 175", 
		tbTSK_Condition = {nTaskID = 3083,nStartBit = 5,nBitCount = 1,nMaxValue = 1}, 
		tbTSK_Limit = tbBITTASK_GET_EXT_ITEM_4_LIMIT, 
		tbAward = {szName = "Cˆu ni™n trÔng phÔng l÷nh bµi - X›ch L©n B∂o R≠¨ng", tbProp={6,1,30388,1,0,0}, nCount = 1, nBindState = -2,tbParam = {0,7,0,0,0,0}, nExpiredTime=10080},
		strActionLog = "ThuongBoSungRoleCuTS4175",
	},
	[5] = {
		strTittle = "Trang bﬁ X›ch L©n cho nh©n vÀt cÚ hﬂan thµnh nhi÷m vÙ TS 4 c p 180", 
		tbTSK_Condition = {nTaskID = 3083,nStartBit = 10,nBitCount = 1,nMaxValue = 1}, 
		tbTSK_Limit = tbBITTASK_GET_EXT_ITEM_5_LIMIT, 
		tbAward = {szName = "Cˆu ni™n trÔng phÔng l÷nh bµi - X›ch L©n B∂o R≠¨ng", tbProp={6,1,30388,1,0,0}, nCount = 1, nBindState = -2,tbParam = {0,7,0,0,0,0}, nExpiredTime=10080},
		strActionLog = "ThuongBoSungRoleCuTS4180",
	},
	[6] = {
		strTittle = "Trang bﬁ X›ch L©n cho nh©n vÀt cÚ hﬂan thµnh nhi÷m vÙ TS 4 c p 185", 
		tbTSK_Condition = {nTaskID = 3083,nStartBit = 15,nBitCount = 1,nMaxValue = 1}, 
		tbTSK_Limit = tbBITTASK_GET_EXT_ITEM_6_LIMIT, 
		tbAward = {szName = "Cˆu ni™n trÔng phÔng l÷nh bµi - X›ch L©n B∂o R≠¨ng", tbProp={6,1,30388,1,0,0}, nCount = 1, nBindState = -2,tbParam = {0,7,0,0,0,0}, nExpiredTime=10080},
		strActionLog = "ThuongBoSungRoleCuTS4185",
	},
	[7] = {
		strTittle = "Trang bﬁ X›ch L©n cho nh©n vÀt cÚ Æπt c p TS 4 c p 190", 
		tbTSK_Condition = nil, 
		tbTSK_Limit = tbBITTASK_GET_EXT_ITEM_7_LIMIT, 
		tbAward = {szName = "Cˆu ni™n trÔng phÔng l÷nh bµi - X›ch L©n B∂o R≠¨ng", tbProp={6,1,30388,1,0,0}, nCount = 1, nBindState = -2,tbParam = {0,7,0,0,0,0}, nExpiredTime=10080},
		strActionLog = "ThuongBoSungRoleCuTS4190",
	},
}

function tbPVLBActive:GetExtItem_Dlg()
	if CalcItemCount(-1, 6, 1, 30439, -1) < 1 then
		Say("C∏c hπ kh´ng tham gia ch≠¨ng tr◊nh Cˆu Ni™n HÈi NgÈ L÷nh Bµi n™n kh´ng th” nhÀn th≠Îng.", 1, "ß„ng/OnCancel")
		return
	end	
	local tbDlg = {}
	for i = 1, getn(tbExtendAward) do
		tinsert(tbDlg, tbExtendAward[i].strTittle..format("/#tbPVLBActive:GetExtItem(%d)", i))
	end
	tinsert(tbDlg, "ß„ng/OnCancel")
	Describe("C∏c ph«n th≠Îng nµy chÿ dµnh cho nh©n vÀt tπo tr≠Ìc ngµy 9 th∏ng 6 n®m 2013 vµ hﬂan thµnh nhi÷m vÙ Î mËc t≠¨ng ¯ng", getn(tbDlg), tbDlg)
	
end

function tbPVLBActive:GetExtItem(nIndex)
	if CalcItemCount(-1, 6, 1, 30439, -1) < 1 then
		Say("C∏c hπ kh´ng tham gia ch≠¨ng tr◊nh Cˆu Ni™n HÈi NgÈ L÷nh Bµi n™n kh´ng th” nhÀn th≠Îng.", 1, "ß„ng/OnCancel")
		return
	end
	if CalcFreeItemCellCount() < 2 then
		Say("C«n chıa 2 ´ trËng trong hµnh trang rÂi mÌi nhÀn th≠Îng", 1, "ß„ng/OnCancel")
		return
	end
	local tbTmpDesc = tbExtendAward[nIndex]
	if tbVNG_BitTask_Lib:getBitTask(tbTmpDesc.tbTSK_Limit) == 1 then
		Say("C∏c hπ Æ∑ nhÀn ph«n th≠Îng nµy rÂi.", 1, "ß„ng/OnCancel")
		return
	end
	if nIndex == 7 then
		if ST_GetTransLifeCount() < 4 or (ST_GetTransLifeCount() == 4 and GetLevel() < 190) then
			Say("C∏c hπ kh´ng ÆÒ Æi“u ki÷n nhÀn th≠Îng", 1, "ß„ng/OnCancel")
			return
		end
	else
		local tbTSK_Quest = tbTmpDesc.tbTSK_Condition
		if tbVNG_BitTask_Lib:getBitTask(tbTSK_Quest) ~= 1 then
			Say("C∏c hπ ch≠a hﬂan thµnh nhi÷m vÙ Î mËc t≠¨ng ¯ng.", 1, "ß„ng/OnCancel")
			return
		end
	end
	if GetRoleCreateDate() > 20130609 then		
		Say("Chÿ c„ nh©n vÀt tπo tr≠Ìc ngµy 9 th∏ng 6 n®m 2013 mÌi Æ≠Óc ph–p nhÀn th≠Îng.", 1, "ß„ng/OnCancel")
		return
	end
	if nIndex == 1 or nIndex == 2 then
		nLastTranslifeTime = tonumber(FormatTime2String("%Y%m%d", GetTask(2580)))
		if ST_GetTransLifeCount() < 4 or nLastTranslifeTime < 20130610 then
			Say("Chÿ c„ nh©n vÀt trÔng sinh 4 sau ngµy10 th∏ng 6 n®m 2013 mÌi Æ≠Óc ph–p nhÀn th≠Îng.", 1, "ß„ng/OnCancel")
			return
		end
	end
	tbVNG_BitTask_Lib:setBitTask(tbTmpDesc.tbTSK_Limit, 1)
	local tbItem = tbTmpDesc.tbAward
	local strActionLog = tbTmpDesc.strActionLog
	tbAwardTemplet:Give(tbItem, 1, {"CuuNienHoiNgoLenhBai", strActionLog})
end
