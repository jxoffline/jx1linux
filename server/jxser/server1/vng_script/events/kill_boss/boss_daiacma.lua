Include("\\script\\lib\\log.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\droptemplet.lua")

if not VngBossDaiAcMa then
	VngBossDaiAcMa = {}
end
VngBossDaiAcMa.LOGTITLE = "LOGEVENT_CTC_EVENT_VuLan_Boss"
VngBossDaiAcMa.nStartDate = 201508282000
VngBossDaiAcMa.nEndDate = 201508282400
VngBossDaiAcMa.tbBossInfo = {szName="§¹i Ma §Çu", nBossID=1610, nMapID=37, nX=1576, nY=3250,szScript="\\vng_script\\events\\kill_boss\\boss_daiacma.lua"}
VngBossDaiAcMa.nLifeTimeBoss = 4*60*60*18

VngBossDaiAcMa.tbAwardBossDeath = {
	{szName="Tiªn Th¶o Lé ",tbProp={6,1,71,1,0,0},nCount=10,nExpiredTime=43200},
	{szName="ThiÕt La H¸n",tbProp={6,1,23,1,0,0},nCount=15,nExpiredTime=43200},
	{szName="ThiÕt La H¸n LÔ Bao",tbProp={6,1,1665,1,0,0},nCount=5,nExpiredTime=43200},
	{szName="Tiªn Th¶o Lé ®Æc biÖt",tbProp={6,1,1181,1,0,0},nCount=10,nExpiredTime=43200},
	{szName="Thiªn C¬ LÖnh",tbProp={6,1,4625,1,0,0},nCount=10,nExpiredTime=10080},
	{szName="Dao Quang LÖnh",tbProp={6,1,4626,1,0,0},nCount=10,nExpiredTime=10080},
	{szName="[Cùc phÈm] §Þnh Quèc Thanh Sa Tr­êng Sam",tbProp={0,403},nCount=1,nQuality = 1,},
	{szName="[Cùc phÈm] §Þnh Quèc Thanh Sa Ph¸t Qu¸n",tbProp={0,404},nCount=1,nQuality = 1,},
	{szName="[Cùc phÈm] §Þnh Quèc XÝch Quyªn NhuyÔn Ngoa",tbProp={0,405},nCount=1,nQuality = 1,},
	{szName="[Cùc phÈm] §Þnh Quèc Tö §»ng Hé UyÓn",tbProp={0,406},nCount=1,nQuality = 1,},
	{szName="[Cùc phÈm] §Þnh Quèc Ng©n Tµm Yªu §¸i",tbProp={0,407},nCount=1,nQuality = 1,},
	{szName="An Bang B¨ng Tinh Th¹ch H¹ng Liªn",tbProp={0,164},nCount=1,nQuality = 1,},
	{szName="[Hoµn Mü] An Bang §iÒn Hoµng Th¹ch Ngäc Béi",tbProp={0,212},nCount=1,nQuality = 1,},
	{szName="[Hoµn Mü] An Bang Kª HuyÕt Th¹ch Giíi ChØ",tbProp={0,213},nCount=1,nQuality = 1,},
	{szName="[Hoµn Mü] An Bang Cóc Hoa Th¹ch ChØ Hoµn",tbProp={0,211},nCount=1,nQuality = 1,},
	{szName="Thiªn V­¬ng Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)",tbProp={6,1,4547,1,0,0},nCount=1,tbParam={7,0,0,0,0,0}},
	{szName="Ngò §éc Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)",tbProp={6,1,4548,1,0,0},nCount=1,tbParam={1,0,0,0,0,0}},
	{szName="Thóy Yªn Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)",tbProp={6,1,4549,1,0,0},nCount=1,tbParam={4,0,0,0,0,0}},
	{szName="C«n L«n Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)",tbProp={6,1,4550,1,0,0},nCount=1,tbParam={3,0,0,0,0,0}},
	{szName="Thiªn NhÉn Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)",tbProp={6,1,4551,1,0,0},tbParam={8,0,0,0,0,0}},
}

function VngBossDaiAcMa:Call_Boss()
	local tbInfo = self.tbBossInfo
	local nMapIndex = SubWorldID2Idx(tbInfo.nMapID)	
	if (nMapIndex < 0) then
		print("VngBossDaiAcMa:Call_Boss nMapIndex:"..nMapIndex)
		return
	end
	local tbSeries = {1,3,5}
	local nSeries = tbSeries[random(1,3)]
	local nNpcIndex = AddNpcEx(tbInfo.nBossID, 95, nSeries, nMapIndex, tbInfo.nX*32, tbInfo.nY*32, 1, tbInfo.szName, 1)
	if (nNpcIndex > 0) then
		SetNpcScript(nNpcIndex, tbInfo.szScript)
		SetNpcTimer(nNpcIndex, 4*60*60*18) --4h
		local nTime =tonumber(GetLocalDate("%Y%m%d%H%M"))
		WriteLog("LOGEVENT_CTC_BossDaiAcMa",format("[Boss xuat hien]: %d",nTime))
		local str = "Boss §¹i ¸c ma ®· xuÊt hiÖn ngoµi cæng biÖn kinh, khiÕn giang hå ho¶ng lo¹n, ®ªm nay ¾t lµ mét ®ªm kinh hoµng cña vâ l©m. "
		AddGlobalNews(str)
	end
end

function VngBossDaiAcMa:IsActive()
	local nCurDate = nCurDate or tonumber(GetLocalDate("%Y%m%d%H%M"))
	if self.nStartDate and self.nStartDate ~= 0 and self.nStartDate > nCurDate then
		return nil
	end
	if self.nEndDate and self.nEndDate ~= 0 and self.nEndDate <= nCurDate then
		return nil
	end
	return 1
end

function OnDeath(nNpcIndex)
	if VngBossDaiAcMa:CheckIsBoss(nNpcIndex) ~= 1 then
		return 
	end
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	--phan thuong cho nguoi dung xung quanh
	local tbAwardExpAround = {nExp = 5e6, szName = "§iÓm kinh nghiÖm"}
	local tbRoundPlayer, nCount = GetNpcAroundPlayerList(nNpcIndex, 1024)
	for i=1,nCount do	
		CallPlayerFunction(tbRoundPlayer[i], %tbAwardTemplet.Give, %tbAwardTemplet, tbAwardExpAround, 1, {VngBossDaiAcMa.LOGTITLE, "Phanthuongexp_Around"..szNpcName})
	end
	--phant huong boss roi ra ai cung nhat duoc
	%tbDropTemplet:GiveAwardByList(nNpcIndex, -1, VngBossDaiAcMa.tbAwardBossDeath, VngBossDaiAcMa.LOGTITLE.."- Boss_Death_Drop_item")
	--tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex,%tbDropItem,format("killed_%s",szNpcName))	
end

function VngBossDaiAcMa:CheckIsBoss(nNpcIndex)
	local tbNpcInfo = VngBossDaiAcMa.tbBossInfo
	local nNpcId = GetNpcSettingIdx(nNpcIndex)
	local szNameBoss = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szName = NpcName2Replace(szName)
	end	
	local szNpcName = tbNpcInfo.szName
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end 
	if (szNameBoss == szNpcName) and (nNpcId == tbNpcInfo.nBossID) then
		return 1
	end	
	return 0
end

function OnTimer(nNpcIndex, nTimeOut) 
	if nNpcIndex then 
		DelNpc(nNpcIndex)	
	end
end