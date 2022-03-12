Include("\\script\\tong\\tong_header.lua");
IncludeLib("TONG")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\activitysys\\config\\1005\\variables.lua")
Include("\\script\\vng_lib\\tong_task.lua")

tbTongSupport = {}
tbTongSupport.tbRank = {
	[1] = 20e6,
	[2] = 30e6,
	[3] = 50e6,
	[4] = 100e6,
	[5] = 150e6,
	[6] = 200e6,
}
tbTongSupport.tbTong_TSK_Item_Count = tbTS_TONG_TASK_ITEM_COUNT
tbTongSupport.nMinTongJoinTime = nTS_MIN_TONG_JOIN_TIME
tbTongSupport.nTSK_Daily_Award_Count = nTS_TASK_DAILY_AWARD_COUNT
tbTongSupport.nTSK_Exp = nTS_TASK_EXP_AWARD
tbTongSupport.nMaxExp = nTS_MAX_EXP_AWARD

function tbTongSupport:GetRank()
	local szTongName, nTongID = GetTongName();	
	if szTongName == nil or szTongName == "" then
		Talk(1, "", "C¸c h¹ ch­a gia nhËp bang héi kh«ng thÓ nhËn phÇn th­ëng nµy!")
		return 0
	end
	local nItemCount = tbTongTSK:GetTongTask(nTongID, self.tbTong_TSK_Item_Count)
	if nItemCount < 10 then
		Talk(1, "", "Sè l­îng <color=red>T©n Thñ Kim Bµi<color> n¹p vµo kh«ng ®ñ, h·y cè g¾ng gióp ®ì c¸c t©n thñ ®Ó nhËn ®­îc phÇn th­ëng lín nhÐ!")
		return 0
	end
	if nItemCount >= 10 and nItemCount <= 49 then
		return 1
	end
	if nItemCount >= 50 and nItemCount <= 99 then
		return 2
	end
	if nItemCount >= 100 and nItemCount <= 199 then
		return 3
	end
	if nItemCount >= 200 and nItemCount <= 299 then
		return 4
	end
	if nItemCount >= 300 and nItemCount <= 399 then
		return 5
	end
	if nItemCount >= 400 then
		return 6
	end
end

function tbTongSupport:CheckCondition()
	local szTongName, nTongID = GetTongName();	
	if szTongName == nil or szTongName == "" then
		Talk(1, "", "C¸c h¹ ch­a gia nhËp bang héi kh«ng thÓ nhËn phÇn th­ëng nµy!")
		return nil
	end
	local nTongTime = GetJoinTongTime()
	if nTongTime < self.nMinTongJoinTime then
		Talk(1, "", "Thêi gian gia nhËp bang ch­a ®ñ <color=red>1 ngµy<color>, kh«ng thÓ nhËn th­ëng.")
		return 0
	end
	local nTaskDailyCount = PlayerFunLib:GetTaskDailyCount(self.nTSK_Daily_Award_Count)
	if nTaskDailyCount >= 1 then
		Talk(1, "", "Mçi ngµy chØ nhËn ®­îc phÇn th­ëng nµy <color=red>1 <color>lÇn, mai råi h·y quay l¹i.")
		return 0
	end
	local nTaskExp = GetTask(self.nTSK_Exp)*1e6
	if nTaskExp >= self.nMaxExp then
		Talk(1, "", "C¸c h¹ ®· ®¹t giíi h¹n phÇn th­ëng nµy, kh«ng thÓ nhËn thªm.")
		return 0
	end
	return 1
end

function tbTongSupport:main()
	local szTongName, nTongID = GetTongName();	
	local strCurrentCount = ""
	if szTongName == nil or szTongName == "" then
		strCurrentCount = "HiÖn t¹i: <color=red>Ch­a gia nhËp bang héi<color>\n"
	else
		local nItemCount = tbTongTSK:GetTongTask(nTongID, self.tbTong_TSK_Item_Count)
		strCurrentCount = format("Sè l­îng <color=red>T©n Thñ Kim Bµi<color> hiÖn t¹i: <color=yellow>%d<color>\n", nItemCount)
	end
	
	local strTittle = format("Bang héi tiÕp nhËn cµng nhiÒu t©n thñ, phÇn th­ëng cµng lín. %s", strCurrentCount)
	strTittle = strTittle..format("\t\t\t\t%-16s%26s\n", "Sè l­îng", "Kinh nghiÖm")
	strTittle = strTittle..format("\t\t\t\t<color=yellow>%-16s%26s\n", "10 - 49", "10,000,000")
	strTittle = strTittle..format("\t\t\t\t%-16s%26s\n", "50 - 99", "15,000,000")
	strTittle = strTittle..format("\t\t\t\t%-16s%26s\n", "100 - 199", "20,000,000")
	strTittle = strTittle..format("\t\t\t\t%-16s%26s\n", "200 - 299", "50,000,000")
	strTittle = strTittle..format("\t\t\t\t%-16s%26s\n", "300 - 399", "100,000,000")
	strTittle = strTittle..format("\t\t\t\t%-16s%26s<color>", "Trªn 400", "150,000,000")
	local tbOpt = {}
	tinsert(tbOpt, {"NhËn", tbTongSupport.GetAward, {tbTongSupport}})
	tinsert(tbOpt, {"§ãng"})	
	CreateNewSayEx(strTittle, tbOpt)
end

function OnCancel()end

function tbTongSupport:GetAward()
	if self:CheckCondition() ~= 1 then
		return
	end
	local nTskExp = GetTask(self.nTSK_Exp) * 1e6
	local nRank = self:GetRank()
	if nRank <= 0 or nRank > 6 then
		return
	end
	local nExp = self.tbRank[nRank]	
	if not nExp then
		return
	end
	local nExpAward = nExp
	if (nExp + nTskExp) > self.nMaxExp then
		nExpAward = self.nMaxExp - nTskExp
	end
	PlayerFunLib:AddTaskDaily(self.nTSK_Daily_Award_Count, 1)
	SetTask(self.nTSK_Exp, floor((nExpAward + nTskExp)/1e6))
	--print(GetTask(self.nTSK_Exp))
	local tbAward = {szName = "§iÓm Kinh NghiÖm", nExp=nExpAward}
	tbAwardTemplet:Give(tbAward, 1, {strLOG_HEAD, "PhanThuongBangHoiTiepNhanTanThu"})
end