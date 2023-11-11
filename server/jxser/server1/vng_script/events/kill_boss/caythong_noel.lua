Include("\\script\\lib\\log.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\droptemplet.lua")

if not tbCayThongNoel then
	tbCayThongNoel = {}
end
tbCayThongNoel.LOGTITLE = "LOGEVENT_CTC_Event_NOEL"
tbCayThongNoel.nStartDate = 201512160000
tbCayThongNoel.nEndDate = 201512312400
tbCayThongNoel.tbBossInfo ={
											 {szName="C©y Gi∏ng Sinh Th«n B› ", nBossID=1322, nMapID=37, nX=1525, nY=3288,szScript="\\vng_script\\events\\kill_boss\\caythong_noel.lua"},
											 {szName="C©y Gi∏ng Sinh Th«n B› ", nBossID=1322, nMapID=37, nX=1576, nY=3258,szScript="\\vng_script\\events\\kill_boss\\caythong_noel.lua"},
											 {szName="C©y Gi∏ng Sinh Th«n B› ", nBossID=1322, nMapID=37, nX=1603, nY=3414,szScript="\\vng_script\\events\\kill_boss\\caythong_noel.lua"},
										}
										
tbCayThongNoel.nLifeTimeBoss = 10*60*18 --10phut
DATE_END = 20160101
tbCayThongNoel.tbAwardBossDeath = {
	{szName="Thi÷p gi∏ng sinh", tbProp={6,1,30375,1,0,0},nCount=250, nExpiredTime=DATE_END},
	{szName="Cµnh th´ng", tbProp={6,1,30372,1,0,0},nCount=250,nExpiredTime=DATE_END},
}

function tbCayThongNoel:AddThongThanBi()	
	for i=1, getn(self.tbBossInfo) do
		local tbInfo =  self.tbBossInfo[i]	
		local nMapIndex = SubWorldID2Idx(tbInfo.nMapID)	
		if (nMapIndex < 0) then
			print("Error !!! tbCayThongNoel:Call_Boss nMapIndex:"..nMapIndex)
			return
		end
		local nNpcIndex = AddNpcEx(tbInfo.nBossID, 95, random(0,4), nMapIndex, tbInfo.nX*32, tbInfo.nY*32, 1, tbInfo.szName, 1)
		if (nNpcIndex > 0) then
			SetNpcDeathScript (nNpcIndex, tbInfo.szScript)
			SetNpcTimer(nNpcIndex, self.nLifeTimeBoss) 
			local nTime =tonumber(GetLocalDate("%Y%m%d%H%M"))
			WriteLog(self.LOGTITLE..(format("[CayThongThanBi xuat hien] thu %d: %d",i,nTime)))		
		end
	end
	local str = "C©y Th´ng Th«n B› Æ∑ xu t hi÷n Î thµnh Bi÷n kinh, c∏c ÆÂng Æπo h∑y nhanh ch©n ra hπ gÙc vµ nhÀn th≠Îng. "
	AddGlobalNews(str)
end

function tbCayThongNoel:IsActive()
	local nCurDate = nCurDate or tonumber(GetLocalDate("%Y%m%d%H%M"))
	if nCurDate >= self.nStartDate  and nCurDate <= self.nEndDate  then
		return 1
	end	
	return 0
end

function OnDeath(nNpcIndex)
--	if tbCayThongNoel:CheckIsBoss(nNpcIndex) ~= 1 then
--		print("=====OnDeath: Khong phai cay thong noel")
--		return 
--	end
	%tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex,tbCayThongNoel.tbAwardBossDeath, tbCayThongNoel.LOGTITLE.."- Boss_Death_Drop_item")
end

function tbCayThongNoel:CheckIsBoss(nNpcIndex)
	local tbNpcInfo = tbCayThongNoel.tbBossInfo
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