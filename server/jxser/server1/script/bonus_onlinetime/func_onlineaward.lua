do return end
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\bonus_onlinetime\\head.lua")
Include("\\script\\task\\random\\task_head.lua");
Include("\\script\\baoruongthanbi\\head.lua");

--tbRandomTask =
--{
--	211,
--	212,
--	213,
--	214,
--	215,
--	216,
--	222,
--	224,
--	225,
--	226,
--	227,
--	228,
--}
--
--
--tbOnlineAwardExp =
--{
--	{szName = "ßi”m kinh nghi÷m", nExp_tl = 15000000},
--}
--
--tbOnlineAwardHuyenTinh =
--{
--	{szName="Huy“n Tinh Kho∏ng Thπch ", tbProp={6,1,147,2,0,0}, nCount=10},
--	{szName="Huy“n Tinh Kho∏ng Thπch ", tbProp={6,1,147,3,0,0}, nCount=10},
--	{szName="Huy“n Tinh Kho∏ng Thπch ", tbProp={6,1,147,4,0,0}, nCount=10},
--}
--
--function IsActiveGetHuyenTinh()
--	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
--	if (nCurDate <= 20101110) then
--		return 1
--	else
--		return 0
--	end
--end

function OnlineAward()
	do return end
	 OnlineAward_ResetStillOnlineNewDay()
	
	local tbOpt = {};
		local szTitle = format("ßπi hi÷p, xin h∑y ch‰n ph«n th≠Îng:");
		tbOpt = 
		{
			"NhÀn ph«n th≠Îng thÍi gian Online/OnlineAward_GetBonus",
			"Ki”m tra thÍi gian Online/OnlineAward_ShowTimeNow",
			"K’t thÛc/Cancel",
		}
	tinsert(tbOpt, 1, szTitle)
	CreateTaskSay(tbOpt);
end

function OnlineAward_GetBonus()
	do return end
--	if CheckIPBonus() == 0 then
--		Say("Hi÷n tπi Æπi hi÷p ch≠a th” nhÀn th≠Îng, h∑y thˆ lπi sau!",0)
--		return
--	end
	if OnlineAward_Check_TransferLife() ~= 1 then
		Say("Hi÷n tπi Æπi hi÷p ch≠a th” xem tin t¯c, h∑y thˆ lπi sau!",0)
		return		
	end

	OnlineAward_SummaryOnlineTime()
	OnlineAward_StartTime()
	
	local nHour, nMin, nSec = OnlineAward_ShowTime()
	if nHour < 1 then
		Say("ßπi hi÷p ch≠a ÆÒ 1 giÍ tr™n mπng!",0)
		return
	end
	
	if (PlayerFunLib:CheckTaskDaily(BNCQ_TASKID_GET_TIMES,6,"H´m nay Æπi hi÷p Æ∑ nhÀn th≠Îng 6 l«n rÂi. Ngµy mai quay lπi nh–!","<") ~= 1) then
			return
	end
	
	if CalcFreeItemCellCount() < 1 then
		Say("Kh´ng ÆÒ 1 ´ trËng trong hµnh trang cÒa Æπi hi÷p!",0)
		return
	end
	
	local tbOpt = {};
		local szTitle = format("ßπi hi÷p, xin h∑y ch‰n ph«n th≠Îng:");
		tbOpt = 
		{
			"NhÀn ph«n th≠Îng B∏nh ch≠ng Æ∆c bi÷t/#OnlineAward_ConfirmBonus()",
--			"NhÀn ph«n th≠Îng loπi 2/#OnlineAward_ConfirmBonus(2)",
			"K’t thÛc/Cancel",
		}
	tinsert(tbOpt, 1, szTitle)
	CreateTaskSay(tbOpt);
	
	
--	if OnlineAward_PayTime(1*60*60) == 1 then	
--		PlayerFunLib:AddTaskDaily(BNCQ_TASKID_GET_TIMES,1)
--		for i = 1, 10 do AddLenhBaiBH() end
--		for i = 1, 10 do AddMocNhan() end
--		tbAwardTemplet:GiveAwardByList({szName = "Huy“n Thi™n ChÔy", tbProp={6,1,2348,1,0,0}, nExpiredTime = 10080, nBindState = -2, nCount = 2}, "Online nhÀn th≠Îng");
--	end
	
end


function OnlineAward_ConfirmBonus()
	do return end
--	if (nType == 1) then
		if OnlineAward_PayTime(1*60*60) == 1 then	
			PlayerFunLib:AddTaskDaily(BNCQ_TASKID_GET_TIMES,1)
--			for i = 1, 10 do AddLenhBaiBH() end
--			for i = 1, 10 do AddMocNhan() end
--			if (IsActiveGetHuyenTinh() == 1) then
--				tbAwardTemplet:GiveAwardByList(tbOnlineAwardHuyenTinh, "Online nhÀn th≠Îng");
--			end
			local tbAward = {szName="B∏nh Ch≠ng",tbProp={6,1,30086,1,0,0},nCount=10,nExpiredTime=20110220}
			tbAwardTemplet:GiveAwardByList(tbAward, "[VNG][Lunar Year 2011][Online nhÀn th≠Îng]");
		end
--	else
--		if OnlineAward_PayTime(1*60*60) == 1 then	
--			PlayerFunLib:AddTaskDaily(BNCQ_TASKID_GET_TIMES,1)
--			tbAwardTemplet:GiveAwardByList(tbOnlineAwardExp[1], "Online nhÀn th≠Îng");
--			if (IsActiveGetHuyenTinh() == 1) then
--				tbAwardTemplet:GiveAwardByList(tbOnlineAwardHuyenTinh, "Online nhÀn th≠Îng");
--			end
--		end
--	end
end


function OnlineAward_ShowTimeNow()
	do return end
	if OnlineAward_Check_TransferLife() ~= 1 then
		Say("Hi÷n tπi Æπi hi÷p ch≠a th” xem tin t¯c, h∑y thˆ lπi sau!",0)
		return		
	end
	OnlineAward_SummaryOnlineTime()	
	local nHour, nMin, nSec = OnlineAward_ShowTime()
	local strMsg = format("ThÍi gian tr™n mπng cÒa Æπi hi÷p lµ:\n\t<color=yellow> %d <color> giÍ <color=yellow> %d <color> phÛt <color=yellow> %d <color> gi©y.",nHour, nMin, nSec)
	OnlineAward_StartTime()
	Talk(1,"Online NhÀn Th≠Îng",strMsg)
end

function AddLenhBaiBH()
do return end
	--local nRandomTaskID = createRandomTask();
	local nRandomIndex = random(1, getn(tbRandomTask))
	local nRandomTaskID = tbRandomTask[nRandomIndex]
	
	nRandomItemIndex = AddItem(6, 2, 1020, 0, 1, 0, 0);
	SetItemMagicLevel(nRandomItemIndex, 1, nRandomTaskID);
	nExpiredTime = BNCQ_OneDayTime
	ITEM_SetExpiredTime(nRandomItemIndex, nExpiredTime);
	SetItemBindState(nRandomItemIndex, -2);
	SyncItem(nRandomItemIndex);
	local strItem = GetItemName(nRandomItemIndex)
	Msg2Player("Bπn nhÀn Æ≠Óc "..strItem)
	WriteLog(date("%Y%m%d %H%M%S").."\t".." Online nhÀn th≠Îng "..GetAccount().."\t"..GetName().."\t".." Online nhÀn th≠Îng nhÀn Æ≠Óc "..strItem)
end

function AddMocNhan()
do return end
		local ndx = AddItem(6,1,1085,1,0,0)
		SetSpecItemParam(ndx, 2, 9)
		nExpiredTime = BNCQ_OneDayTime
		ITEM_SetExpiredTime(ndx, nExpiredTime);
		SetItemBindState(ndx, -2);
		SyncItem(ndx)
		local strItem = GetItemName(ndx)
		Msg2Player("Bπn nhÀn Æ≠Óc "..strItem)
		WriteLog(date("%Y%m%d %H%M%S").."\t".." Online nhÀn th≠Îng "..GetAccount().."\t"..GetName().."\t".." Online nhÀn th≠Îng "..strItem)
end

function Cancel()
end
