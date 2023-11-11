Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\vng_feature\\checkinmap.lua")
Include("\\script\\activitysys\\config\\1005\\check_func.lua")
Include("\\script\\vng_lib\\VngTransLog.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
IncludeLib("SETTINGS")
PhongVanLenhBai2011 = {}
--PhongVanLenhBai2011.TASK_DAILY_AWARD_TIMES1 = 3090
--PhongVanLenhBai2011.TASK_DAILY_AWARD_TIMES2 = 3091
--PhongVanLenhBai2011.TASK_DAILY_WEEKEND_AWARD = 3092
--PhongVanLenhBai2011.TASK_COUNT_DAILY_AWARD_TIMES1 = 3093
--PhongVanLenhBai2011.TASK_COUNT_DAILY_AWARD_TIMES2 = 3094
--PhongVanLenhBai2011.TASK_COUNT_WEEKEND_AWARD = 3095
PhongVanLenhBai2011.TASK_DAILY_RESET = 3090
PhongVanLenhBai2011.tbBitTsk_Daily_Award_Time1 = {nTaskID = 3091,nStartBit = 1,nBitCount = 1,nMaxValue = 1}	
PhongVanLenhBai2011.tbBitTsk_Daily_Award_Time2 = {nTaskID = 3091,nStartBit = 2,nBitCount = 1,nMaxValue = 1}
PhongVanLenhBai2011.tbBitTsk_Weekend_Award = 	{nTaskID = 3091,nStartBit = 3,nBitCount = 1,nMaxValue = 1}

PhongVanLenhBai2011.tbAwardDaily1 = 
{
	-- [1]  =
	-- {
	-- 	{szName = "S¸t thñ gi¶n (cÊp 90)", tbProp = {6, 1, 400, 90,0,0}, nCount = 1, nExpiredTime = 20160, nBindState = -2},
	-- 	{szName = "Anh Hïng ThiÕp", tbProp = {6, 1, 1604,1,0,0}, nCount = 1, nExpiredTime = 20160, nBindState = -2},
	-- 	{szName="Phong V©n Chiªu Binh LÖnh",tbProp={6,1,30083,1,0,0},nCount=1,nExpiredTime=20160, nBindState = -2},
	-- 	{szName = "Qu¶ Huy Hoµng (cao) ", tbProp = {6, 1, 906,1,0,0}, nCount = 3, nExpiredTime = 20160, nBindState = -2},
	-- 	{szName = "Tèng Kim Phi Tèc hoµn", tbProp = {6, 1, 190,1,0,0}, nCount = 20, nExpiredTime = 43200, nBindState = -2},
	-- 	{szName = "LÖnh bµi ", tbProp = {6, 1, 157,1,0,0}, nCount = 20, nExpiredTime = 43200, nBindState = -2},
	-- },
	-- [2] = {
	-- 	{szName="Hé M¹ch §¬n",tbProp={6,1,3203,1,0,0},nCount=10,nRate=40, nBindState = -2},
	-- 	{szName="Hé M¹ch §¬n",tbProp={6,1,3203,1,0,0},nCount=20,nRate=35, nBindState = -2},
	-- 	{szName="Hé M¹ch §¬n",tbProp={6,1,3203,1,0,0},nCount=30,nRate=25, nBindState = -2},
	-- },
	-- [3] =
	-- {
	-- 	{szName = "Tiªn Th¶o Lé ", tbProp = {6,1,71,1,0,0}, nCount = 5, nRate = 50, nBindState = -2, nExpiredTime = 43200},
	-- 	{szName = "Tiªn Th¶o Lé ®Æc biÖt", tbProp = {6,1,1181,1,0,0}, nCount = 5, nRate = 50, nBindState = -2, nExpiredTime = 43200},
	-- },
	-- [4] =
	-- {
	-- 	{szName = "B¸ch Niªn Tr©n Lé", tbProp = {6,1,2266,1,0,0}, nCount = 1, nRate =34, nExpiredTime = 43200, nBindState = -2},
	-- 	{szName = "Thiªn Niªn Tr©n Lé", tbProp = {6,1,2267,1,0,0}, nCount = 1, nRate =33, nExpiredTime = 43200, nBindState = -2},
	-- 	{szName = "V¹n Niªn Tr©n Lé", tbProp = {6,1,2268,1,0,0}, nCount = 1, nRate =33, nExpiredTime = 43200, nBindState = -2},
	-- },
	-- [5] =
	-- {
	-- 	{szName="Ch©n Nguyªn §¬n (trung)",tbProp={6,1,30228,1,0,0},nCount=5,nRate=40,nExpiredTime=20160, nBindState = -2},
	-- 	{szName="Ch©n Nguyªn §¬n (trung)",tbProp={6,1,30228,1,0,0},nCount=10,nRate=35,nExpiredTime=20160, nBindState = -2},
	-- 	{szName="Ch©n Nguyªn §¬n (trung)",tbProp={6,1,30228,1,0,0},nCount=15,nRate=25,nExpiredTime=20160, nBindState = -2},
	-- },	
}

PhongVanLenhBai2011.tbAwardDaily2 =
{
	-- [1] =
	-- {
	-- 	{szName = "Phó Quý CÈm H¹p", tbProp = {6, 1, 2402,1,0,0}, nCount = 1, nExpiredTime = 20160, nBindState = -2},
	-- 	{szName = "Ngäc Qu¸n", tbProp = {6, 1, 2311,1,0,0}, nCount = 1, nExpiredTime = 20160, nBindState = -2},
	-- 	{szName = "LÖnh bµi ", tbProp = {6, 2, 1020,1,0,0}, nCount = 40, nExpiredTime = 20160, nBindState = -2, CallBack = function (nItemIndex) SetItemMagicLevel(nItemIndex, 1, random(211,216)) end},
	-- 	{szName = "Méc nh©n", tbProp = {6, 1, 2969,1,0,0}, nCount = 40, nExpiredTime = 20160, nBindState = -2},
	-- 	{szName="Phong V©n Chiªu Binh LÖnh",tbProp={6,1,30083,1,0,0},nCount=1,nExpiredTime=20160, nBindState = -2},
	-- },	
	-- [2] = {
	-- 	{szName = "Long HuyÕt Hoµn", tbProp = {6,1,2117,1,0,0}, nCount = 1, nRate =20, nExpiredTime = 20160, nBindState = -2},
	-- 	{szName = "H¶i Long Ch©u", tbProp = {6,1,2115,1,0,0}, nCount = 1, nRate =20, nExpiredTime = 20160, nBindState = -2},
	-- 	{szName = "LÖnh Bµi Thñy TÆc", tbProp = {6,1,2745,1,0,0}, nCount = 1, nRate =20, nExpiredTime = 20160, nBindState = -2},
	-- 	{szName="Thiªn Tr× MËt LÖnh",tbProp={6,1,30194,1,0,0},nCount=1,nRate=20,nExpiredTime=20160, nBindState = -2},
	-- 	{szName = "Viªm §Õ LÖnh", tbProp = {6,1,1617,1,0,0}, nCount = 1, nRate =20, nExpiredTime = 20160, nBindState = -2},
	-- },
	-- [3] =
	-- {
	-- 	{szName="Hé M¹ch §¬n",tbProp={6,1,3203,1,0,0},nCount=10,nRate=40, nBindState = -2},
	-- 	{szName="Hé M¹ch §¬n",tbProp={6,1,3203,1,0,0},nCount=20,nRate=35, nBindState = -2},
	-- 	{szName="Hé M¹ch §¬n",tbProp={6,1,3203,1,0,0},nCount=30,nRate=25, nBindState = -2},
	-- },
	-- [4] =
	-- {
	-- 	{szName="Ch©n Nguyªn §¬n (trung)",tbProp={6,1,30228,1,0,0},nCount=5,nRate=40,nExpiredTime=20160, nBindState = -2},
	-- 	{szName="Ch©n Nguyªn §¬n (trung)",tbProp={6,1,30228,1,0,0},nCount=10,nRate=35,nExpiredTime=20160, nBindState = -2},
	-- 	{szName="Ch©n Nguyªn §¬n (trung)",tbProp={6,1,30228,1,0,0},nCount=15,nRate=25,nExpiredTime=20160, nBindState = -2},
	-- },	
}

PhongVanLenhBai2011.tbWeekendAward = 
{
	-- [1] =
	-- {		
	-- 	{szName = "Hoµng Kim Ên CÊp 5 (C­êng hãa)", tbProp = {0,3209}, nRate = 25, nQuality = 1, nExpiredTime = 10080, nBindState = -2},		
	-- 	{szName = "Hoµng Kim Ên CÊp 5 (Nh­îc hãa)", tbProp = {0,3219}, nRate = 25, nQuality = 1, nExpiredTime = 10080, nBindState = -2},
	-- 	{szName = "Hoµng Kim Ên CÊp 6 (C­êng hãa)", tbProp = {0,3210}, nRate = 25, nQuality = 1, nExpiredTime = 10080, nBindState = -2},		
	-- 	{szName = "Hoµng Kim Ên CÊp 6 (Nh­îc hãa)", tbProp = {0,3220}, nRate = 25, nQuality = 1, nExpiredTime = 10080, nBindState = -2},
	-- },
	-- [2] =
	-- {
	-- 	{szName = "Qu¶ Hoµng Kim", tbProp = {6, 1,907,1,0,0}, nCount = 1, nExpiredTime = 10080, nBindState = -2},
	-- 	{szName = "Hçn Nguyªn Linh Lé", tbProp = {6, 1,2312,1,0,0}, nCount = 1, nExpiredTime = 10080, nBindState = -2},		
	-- 	{szName = "MÆt n¹ Nguyªn so¸i", tbProp = {0, 11,447,1,0,0}, nCount = 1, nExpiredTime = 10080, nBindState = -2},
	-- 	{szName="Tèc HiÖu B¹ch C©u Hoµn cÊp 150",tbProp={6,1,2975,1,0,0},nCount=1,nExpiredTime=10080, nBindState = -2},
	-- },
	-- [3] =
	-- {
	-- 	{szName = "B¹ch C©u hoµn", tbProp = {6, 1, 74, 1, 0, 0}, nCount = 1, nExpiredTime = 20160, nRate = 34, nBindState = -2},
	-- 	{szName = "§¹i B¹ch C©u hoµn", tbProp = {6, 1, 130, 1, 0, 0}, nCount = 1, nExpiredTime = 20160, nRate = 33, nBindState = -2},
	-- 	{szName = "B¹ch C©u Hoµn ®Æc biÖt", tbProp = {6, 1, 1157, 1, 0, 0}, nCount = 1, nExpiredTime = 20160, nRate = 33, nBindState = -2},
	-- },
	-- [4] =
	-- {
	-- 	{szName = "B¹ch C©u Hoµn kü n¨ng", tbProp = {6, 1, 1372,1,0,0}, nRate = 34, nCount = 1, nExpiredTime = 20160, nBindState = -2},
	-- 	{szName = "§¹i B¹ch C©u hoµn (Kü n¨ng) ", tbProp = {6, 1, 977,1,0,0}, nRate = 33, nCount = 1, nExpiredTime = 20160, nBindState = -2},
	-- 	{szName = "B¹ch C©u Hoµn kü n¨ng ®Æc biÖt", tbProp = {6, 1, 1182,1,0,0}, nRate = 33, nCount = 1, nExpiredTime = 20160, nBindState = -2},
	-- },
	-- [5] =
	-- {
	-- 	{szName = "Tø H¶i Tiªu Diªu §¬n LÔ Hép", tbProp = {6, 1, 2398,1,0,0}, nCount = 1, nRate = 34, nExpiredTime = 20160, nBindState = -2},
	-- 	{szName = "Cöu Thiªn V©n Du §¬n LÔ Hép", tbProp = {6, 1, 2400,1,0,0}, nCount = 1, nRate = 33, nExpiredTime = 20160, nBindState = -2},
	-- 	{szName = "Ngò Ch©u L¨ng Kh«ng §¬n LÔ Hép", tbProp = {6, 1, 2399,1,0,0}, nCount = 1, nRate = 33, nExpiredTime = 20160, nBindState = -2},
	-- },
	-- [6] =
	-- {
	-- 	{szName = "B¸ch Niªn Huy Hoµng qu¶", tbProp = {6, 1, 2269,1,0,0}, nCount = 1, nRate = 34, nExpiredTime = 10080, nBindState = -2},
	-- 	{szName = "Thiªn Niªn Huy Hoµng qu¶", tbProp = {6, 1, 2270,1,0,0}, nCount = 1, nRate = 33, nExpiredTime = 10080, nBindState = -2},
	-- 	{szName = "V¹n Niªn Huy Hoµng qu¶", tbProp = {6, 1, 2271,1,0,0}, nCount = 1, nRate = 33, nExpiredTime = 10080, nBindState = -2},

	-- },
	-- [7] =
	-- 	{
	-- 		{szName="Hé M¹ch §¬n",tbProp={6,1,3203,1,0,0},nCount=20,nRate=40, nBindState = -2},
	-- 		{szName="Hé M¹ch §¬n",tbProp={6,1,3203,1,0,0},nCount=30,nRate=35, nBindState = -2},
	-- 		{szName="Hé M¹ch §¬n",tbProp={6,1,3203,1,0,0},nCount=40,nRate=25, nBindState = -2},
	-- 	},
	-- [8] =
	-- {
	-- 	{szName="Ch©n Nguyªn §¬n (trung)",tbProp={6,1,30228,1,0,0},nCount=10,nRate=40,nExpiredTime=20160, nBindState = -2},
	-- 	{szName="Ch©n Nguyªn §¬n (trung)",tbProp={6,1,30228,1,0,0},nCount=20,nRate=35,nExpiredTime=20160, nBindState = -2},
	-- 	{szName="Ch©n Nguyªn §¬n (trung)",tbProp={6,1,30228,1,0,0},nCount=30,nRate=25,nExpiredTime=20160, nBindState = -2},
	-- },
	-- [9] = {
	-- 	{szName="Vò §· Hµ",tbProp={0,3880},nCount=1,nRate=10,nQuality = 1,nExpiredTime=10080, nBindState = -2},
	-- 	{szName="Thanh B×nh L¹c",tbProp={0,3881},nCount=1,nRate=10,nQuality = 1,nExpiredTime=10080, nBindState = -2},
	-- 	{szName="Håi Xu©n",tbProp={0,3882},nCount=1,nRate=10,nQuality = 1,nExpiredTime=10080, nBindState = -2},
	-- 	{szName="Kh« Méc",tbProp={0,3883},nCount=1,nRate=10,nQuality = 1,nExpiredTime=10080, nBindState = -2},
	-- 	{szName="L­u V©n ",tbProp={0,3884},nCount=1,nRate=10,nQuality = 1,nExpiredTime=10080, nBindState = -2},
	-- 	{szName="Nª Tr¹ch",tbProp={0,3885},nCount=1,nRate=10,nQuality = 1,nExpiredTime=10080, nBindState = -2},
	-- 	{szName="L«i Háa KiÕp",tbProp={0,3886},nCount=1,nRate=10,nQuality = 1,nExpiredTime=10080, nBindState = -2},
	-- 	{szName="Mª Tóy Thiªn H­¬ng",tbProp={0,3887},nCount=1,nRate=10,nQuality = 1,nExpiredTime=10080, nBindState = -2},
	-- 	{szName="§iÖp Vò Hoa Phi",tbProp={0,3888},nCount=1,nRate=10,nQuality = 1,nExpiredTime=10080, nBindState = -2},
	-- 	{szName="Long §¶m",tbProp={0,3499},nCount=1,nRate=10,nQuality = 1,nExpiredTime=10080, nBindState = -2},
	-- },
} 

function PhongVanLenhBai2011:ShowDialogDaily()
	--KiÓm tra nhËp m· code Phong Van Lenh Bai
	if tbPVLB_Check:IsNewPlayer() ~= 1 then
		Talk(1, "", "C¸c h¹ kh«ng ®ñ ®iÒu kiÖn tham gia ch­¬ng tr×nh.")
		return
	end
	local nTransCount = ST_GetTransLifeCount()
	if nTransCount < 3 or (nTransCount >= 4 and GetLevel() >= 190) then
		Talk(1, "", "Ph¶i lµ nh©n vËt chuyÓn sinh lÇn 3 trë lªn vµ chuyÓn sinh lÇn 4 cÊp d­íi 190 míi nhËn ®­îc phÇn th­ëng nµy")
		return
	end	
	self:ResetTask()
	local nDay = tonumber(date("%w"))
	local nTime =tonumber(GetLocalDate("%H%M"))
	local szTitle = "PhÇn th­ëng hµng ngµy"
	local tbOpt = {}
	
	if (nTime >= 0 and nTime <= 1400) then
		tinsert(tbOpt,  "NhËn phÇn th­ëng hµng ngµy/#PhongVanLenhBai2011:GetDailyAwardTimes1()")
	else
		tinsert(tbOpt,  "NhËn phÇn th­ëng hµng ngµy/#PhongVanLenhBai2011:GetDailyAwardTimes2()")
	end
	
	if ( nDay == 6 or nDay == 0) then
		tinsert(tbOpt,  "NhËn phÇn th­ëng cuèi tuÇn/#PhongVanLenhBai2011:GetWeekendAward()")
	end
	tinsert(tbOpt,  "Kh«ng cÇn g×/Cancel")
	
	Say(szTitle, getn(tbOpt), tbOpt)
end

function PhongVanLenhBai2011:GetDailyAwardTimes1()
	if PlayerFunLib:VnCheckInCity () ~= 1 then
		return
	end	
	
	if tbVNG_BitTask_Lib:getBitTask(self.tbBitTsk_Daily_Award_Time1) == 1 then
		Talk(1, "", "H«m nay ®¹i hiÖp ®· nhËn phÇn th­ëng nµy råi!")
		return
	end
	
	if CalcFreeItemCellCount() < 58 then
		Talk(1, "", "Hµnh trang §¹i hiÖp kh«ng ®ñ 58 « trèng!")
		return
	end
		
	if CalcItemCount(3, 6, 1, 30280, -1) <= 0 or ConsumeItem(3, 1, 6, 1, 30280, -1) ~= 1 then
		Talk(1, "", "CÇn ph¶i cã 1 vËt phÈm NhËt Th«ng LÖnh ®Ó nhËn th­ëng.")
		return					
	end	
	
	tbVNG_BitTask_Lib:setBitTask(self.tbBitTsk_Daily_Award_Time1, 1)
	local tbAward = self.tbAwardDaily1
	tbAwardTemplet:Give(tbAward, 1, {"BatNienHoiNgoLenhBai", "NhanThuongHangNgayLan1"})	
end

function PhongVanLenhBai2011:GetDailyAwardTimes2()
	if PlayerFunLib:VnCheckInCity () ~= 1 then
		return
	end	
	
	if tbVNG_BitTask_Lib:getBitTask(self.tbBitTsk_Daily_Award_Time2) == 1 then
		Talk(1, "", "H«m nay ®¹i hiÖp ®· nhËn phÇn th­ëng nµy råi!")
		return
	end	 
	
	if CalcFreeItemCellCount() < 58 then
		Talk(1, "", "Hµnh trang §¹i hiÖp kh«ng ®ñ 58 « trèng!")
		return
	end
	
	if CalcItemCount(3, 6, 1, 30280, -1) <= 0 or ConsumeItem(3, 1, 6, 1, 30280, -1) ~= 1 then
		Talk(1, "", "CÇn ph¶i cã 1 vËt phÈm NhËt Th«ng LÖnh ®Ó nhËn th­ëng.")
		return					
	end
	
	tbVNG_BitTask_Lib:setBitTask(self.tbBitTsk_Daily_Award_Time2, 1)
	
	local _ , nTongID = GetTongName()
	if (nTongID > 0) then
		AddContribution(2000)
		Msg2Player("B¹n nhËn ®­îc 2000 ®iÓm cèng hiÕn bang héi")
		tbLog:PlayerActionLog("BatNienHoiNgoLenhBai", "NhanThuongHangNgayLan2", "2000 ®iÓm cèng hiÕn bang héi")
	end
	local tbAward = self.tbAwardDaily2
	tbAwardTemplet:Give(tbAward, 1, {"BatNienHoiNgoLenhBai", "NhanThuongHangNgayLan2"})	
end

function PhongVanLenhBai2011:GetWeekendAward()
	if PlayerFunLib:VnCheckInCity () ~= 1 then
		return
	end	
	
	if tbVNG_BitTask_Lib:getBitTask(self.tbBitTsk_Weekend_Award) == 1 then
		Talk(1, "", "H«m nay ®¹i hiÖp ®· nhËn phÇn th­ëng nµy råi!")
		return
	end	 
	
	if CalcFreeItemCellCount() < 57 then
		Talk(1, "", "Hµnh trang §¹i hiÖp kh«ng ®ñ 57 « trèng!")
		return
	end
	
	if CalcItemCount(3, 6, 1, 30280, -1) < 2 or ConsumeItem(3, 2, 6, 1, 30280, -1) ~= 1 then
		Talk(1, "", "CÇn ph¶i cã 2 vËt phÈm NhËt Th«ng LÖnh ®Ó nhËn th­ëng.")
		return
	else
		
	end
		
	tbVNG_BitTask_Lib:setBitTask(self.tbBitTsk_Weekend_Award, 1)
	tbAwardTemplet:Give(self.tbWeekendAward, 1, {"BatNienHoiNgoLenhBai", "NhanThuongCuoiTuan"})	
end

function PhongVanLenhBai2011:ResetTask()
	if PlayerFunLib:GetTaskDailyCount(self.TASK_DAILY_RESET) == 0 then
		PlayerFunLib:AddTaskDaily(self.TASK_DAILY_RESET, 1)
	 	for i = 1, 3 do
	 		tbVNG_BitTask_Lib:setBitTask({nTaskID = 3091,nStartBit = i,nBitCount = 1,nMaxValue = 1}, 0)
	 	end	 	
	 end 
end