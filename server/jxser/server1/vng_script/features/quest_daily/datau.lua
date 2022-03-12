Include("\\script\\activitysys\\npcdailog.lua")
Include("\\vng_script\\features\\quest_daily\\mainfuc.lua")
Include("\\vng_script\\vng_lib\\reset_daily_task.lua")

tbQuestDaily = tbQuestDaily or {}

function main(nItemIdx)	
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)	
	--kiem tra reset daily
	tbCheckTaskDaily2ReSet:OnLogin()
	
	local nQuestID, nStateQ =  tbQuestDaily:CheckStateQuest()
	local nCheckPoint, nTotalQ = tbQuestDaily:CheckQuestPoint()	
	local nCurCount, nMaxCount= tbQuestDaily:CountTodayQuest()
	
	tbDailog.szTitleMsg =  format("<npc>Chuçi nhiÖm vô <color=yellow>D· TÈu<color>  nhanh chãng gióp c¸c nh©n sÜ trë thµnh cao thñ ®Ó b«n tÈu giang hå!\n Sè nhiÖm vô h«m nay ®· nhËn: <color=yellow>%d/%d<color>.\n\n",nCurCount,nMaxCount)
	if nStateQ == 0 and nQuestID == 0 then
		tbDailog:AddOptEntry("NhËn nhiÖm vô", tbQuestDaily.GetQuestDaily, {tbQuestDaily} )
	elseif nStateQ == 1 then
		local tbQuestInfo = tbQuestDaily:GetQuestInfo(nQuestID)		
		tbDailog.szTitleMsg = tbDailog.szTitleMsg..format("NhiÖm vô hiÖn t¹i: %s",tbQuestInfo.szDlg)
		tbDailog:AddOptEntry("Hoµn thµnh nhiÖm vô", tbQuestDaily.CompleteQuest, {tbQuestDaily, nQuestID} )
		tbDailog:AddOptEntry("Hñy nhiÖm vô", tbQuestDaily.CancelQuest, {tbQuestDaily, nQuestID} )
	elseif  nStateQ == 2 then
		tbDailog:AddOptEntry("Hoµn thµnh nhiÖm vô", tbQuestDaily.GiveAwardQuest, {tbQuestDaily, nQuestID} ) 
	end
	if nCheckPoint > 0 then
		tbDailog:AddOptEntry(format("NhËn th­ëng mèc %d nhiÖm vô",tbQuestDaily.TB_GET_POINT[nCheckPoint]), tbQuestDaily.GetAwardQuestPoint, {tbQuestDaily} )
	else
		tbDailog:AddOptEntry("Xem t×nh h×nh chuçi nhiÖm vô", tbQuestDaily.ShowAllInfoQuest, {tbQuestDaily} )
	end
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	tbDailog:Show()	
end
