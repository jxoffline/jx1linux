Include("\\script\\activitysys\\config\\35\\head.lua")
Include("\\script\\activitysys\\config\\35\\variables.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\activitysys\\config\\35\\produce.lua")

pActivity.nPak = curpack()
pActivity.nTreeCount = 0
pActivity.MAXTREECOUNT = 5000

function pActivity:UseWuguobaiyinpan()
	tbAwardTemplet:Give(tbAwardList["WUGUOBAIYINPAN"], 1, {EVENT_LOG_TITLE, tbAwardLog["WUGUOBAIYINPAN"]})
	tbAwardTemplet:Give(tbAwardList["WUGUOBAIYINPAN_REDBAG"], 1, {EVENT_LOG_TITLE, tbAwardLog["WUGUOBAIYINPAN_REDBAG"]})
	
	self:AddTask(%TSK_USED_WUGUOBAIYINPAN, 1)
	local nCount = self:GetTask(%TSK_USED_WUGUOBAIYINPAN)
	if tbAwardLog["WUGUOBAIYINPAN_USED"][nCount] then
		tbLog:PlayerActionLog(EVENT_LOG_TITLE,tbAwardLog["WUGUOBAIYINPAN_USED"][nCount])
		tbVngTransLog:Write("201201_event_tet/", 22, tbAwardLog["WUGUOBAIYINPAN_USED"][nCount], "N/A", 1)
	end
end

function pActivity:UseWuguohuangjinpan()
	local tbTranslog = {strFolder = "201201_event_tet/", nPromID = 22, nResult = 1}
	tbAwardTemplet:Give(tbAwardList["WUGUOHUANGJINPAN"], 1, {EVENT_LOG_TITLE, tbAwardLog["WUGUOHUANGJINPAN"], tbTranslog})
	tbAwardTemplet:Give(tbAwardList["WUGUOHUANGJINPAN_REDBAG"], 1, {EVENT_LOG_TITLE, tbAwardLog["WUGUOHUANGJINPAN_REDBAG"]})
	
	self:AddTask(%TSK_USED_WUGUOHUANGJINPAN, 1)
	local nCount = self:GetTask(%TSK_USED_WUGUOHUANGJINPAN)
	if tbAwardList["WUGUOHUANGJINPAN_USED"][nCount] then
		tbAwardTemplet:Give(tbAwardList["WUGUOHUANGJINPAN_USED"][nCount], 1, {EVENT_LOG_TITLE, tbAwardLog["WUGUOHUANGJINPAN_USED"][nCount]})
		tbVngTransLog:Write("201201_event_tet/", 22, "TL"..tbAwardLog["WUGUOHUANGJINPAN_USED"][nCount], "N/A", 1)
	end
end

function pActivity:CheckUseZhongzi()
--	print(format("CheckUseZhongzi  &&&& nTreeCount = %d MAXCOUNT = %d",self.nTreeCount, self.MAXTREECOUNT))
	if self.nTreeCount < self.MAXTREECOUNT then
		return 1
	else
		Msg2Player("§¹i hiÖp h·y nghØ ng¬i mét l¸t råi h·y tiÕp tôc trång C©y B¸ch Qu¶ nhÐ")
	end
end

function pActivity:UseZhongzi()
	local nX32, nY32, nMapIndex =  GetPos()
	DynamicExecute("\\script\\activitysys\\config\\35\\tree.lua", "Tree:Create", GetName(), nMapIndex, nX32, nY32)
	tbLog:PlayerActionLog(EVENT_LOG_TITLE, "SuDungHatGiong")
	
--	print(format("UseZhongzi &&&& nTreeCount = %d",self.nTreeCount))
	self.nTreeCount = self.nTreeCount + 1
--	print(format("UseZhongzi  &&&& nTreeCount = %d",self.nTreeCount))
end


function pActivity:DestoryTree()
--	print(format("DestoryTree &&&& nTreeCount = %d",self.nTreeCount))
	self.nTreeCount = self.nTreeCount - 1
--	print(format("DestoryTree  &&&& nTreeCount = %d",self.nTreeCount))
end

function pActivity:SetTreeCount(nCount)
	self.nTreeCount = nCount
--	print(format("SetTreeCount  &&&& nTreeCount = %d", self.nTreeCount))
end

function pActivity:CheckComposeRedEvelopLimit(nCount)
	local nTaskVal = PlayerFunLib:GetTaskDailyCount(2918)	
	if (nTaskVal + nCount) > 2 then
		Msg2Player(format("Sè l­îng v­ît qu¸ giíi h¹n, chØ cã thÓ ®æi <color=yellow>%d <color>Bao L× X× §á n÷a.", 2 - nTaskVal))
		return nil
	end
	local nNowDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	if nNowDate < 201201050000 or nNowDate >= 201201262400 then
		Talk(1, "", "Xin thø lçi, hiÖn t¹i kh«ng ph¶i lµ thêi gian ®æi th­ëng.")
		return nil
	end
	return 1
end

function pActivity:ComposeRedEvelop(strLog, nCount)
	local nUsedCount = PlayerFunLib:GetTaskDailyCount(2918)
	local nCurCount = nCount
	if nUsedCount + nCurCount > 2 then
		nCurCount = 2 - nUsedCount
	end
	local tbAward = {szName="Bao l× x× ®á",tbProp={6,1,30169,1,0,0}, nCount = nCurCount*5,nExpiredTime=20120127, nBindState = -2,}
	PlayerFunLib:AddTaskDaily(2918,nCurCount)
	tbAwardTemplet:Give(tbAward, 1, {EVENT_LOG_TITLE, strLog})
end

function pActivity:CheckTimeGetFreeExp()
	local nNowDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	if nNowDate < 201201160000 or nNowDate >= 201201172400 then
		Talk(1, "", "Xin thø lçi, hiÖn t¹i kh«ng ph¶i lµ thêi gian nhËn th­ëng")
		return nil
	end
	return 1
end

function pActivity:CheckComposeDragonMask(nCount)
	local nTaskVal = PlayerFunLib:GetTaskDailyCount(2919)	
	if (nTaskVal + nCount) > 5 then
		Msg2Player(format("Sè l­îng v­ît qu¸ giíi h¹n, chØ cã thÓ ®æi <color=yellow>%d <color>lÇn n÷a.", 5 - nTaskVal))
		return nil
	end
	return 1
end

function pActivity:ComposeDragonMask(nCount)
	local nUsedCount = PlayerFunLib:GetTaskDailyCount(2919)
	local nCurCount = nCount
	if nUsedCount + nCurCount > 5 then
		nCurCount = 5 - nUsedCount
	end
	local tbAward = {nExp=10000000*nCurCount,}
	PlayerFunLib:AddTaskDaily(2919,nCurCount)
	tbAwardTemplet:Give(tbAward, 1, {EVENT_LOG_TITLE, "DoiMatNaRongNhanKinhNghiem"})
	for i = 1, nCurCount do
		tbVngTransLog:Write("201201_event_tet/", 22, "DoiMatNaRongNhanKinhNghiem", "10000000 §iÓm kinh nghiÖm", 1)
	end
end