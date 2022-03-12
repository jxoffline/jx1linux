Include("\\script\\lib\\log.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\progressbar.lua")
Include("\\script\\activitysys\\npcdailog.lua")

if not tbNpcCardNoel then
	tbNpcCardNoel = {}
end
tbNpcCardNoel.LOGTITLE = "LOGEVENT_CTC_Event_NOEL"
tbNpcCardNoel.nStartDate = 201512160000
tbNpcCardNoel.nEndDate = 201512312400
tbNpcCardNoel.nLifeTimeNpc = 10*60*18 --10phut
DATE_END = 20160101
tbNpcCardNoel.TotalAward = 0
tbNpcCardNoel.tbBossInfo ={ szName="Thiªn Sø Gi¸ng Sinh", nNpcID=1135, szScript="\\vng_script\\events\\get_award_npc\\get_card_noel.lua"}
tbNpcCardNoel.tbNpcPos = {
	{322,2000,3328}, {322,1984,3568}, {322,1872,3840}, {322,1764,4056}, {322,1631,3982}, {322,1720,3665},
	{322,1618,3487}, {322,1797,3341}, {321,1136,2480}, {321,1378,2572}, {321,1544,2722}, {321,1464,3008},
	{321,1067,2960}, {321,1176,2720}, {321,1006,2629},{321,1256,2360},
}			
							

tbNpcCardNoel.tbAwardCardNoel = {
	{szName="ThiÖp gi¸ng sinh", tbProp={6,1,30375,1,0,0},nCount=2, nExpiredTime=DATE_END},
}

--Main
function main()
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)	
	tbDailog.szTitleMsg =  format("<npc>Sè l­îng <color=yellow>ThiÖp Gi¸ng Sinh<color> ®ît nµy ®· ph¸t: <color=yellow>%d/%d<color>.\n\n",tbNpcCardNoel.TotalAward,500)
	if (tbNpcCardNoel:IsActive() ==1) then		
		tbDailog:AddOptEntry("NhËn ThiÖp Gi¸ng Sinh", tbNpcCardNoel.GetAwardCardNoel, {tbNpcCardNoel} )
	end	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	tbDailog:Show()
end
--Nhan thiep
local _SuccessGetAward = function()	
	local nCurNumAward = tbNpcCardNoel.TotalAward
	if nCurNumAward >= 500 then
		return Talk(1,"",format("§ît nµy ®· ph¸t hÕt 500 thiÖp gi¸ng sinh råi, b»ng h÷u h·y ®îi ®ît sau nhÐ!"))
	end
	local nNumAward = 2 --moi lan nhan dc 2 thiep
	tbNpcCardNoel.TotalAward = nCurNumAward + nNumAward
	tbAwardTemplet:Give(tbNpcCardNoel.tbAwardCardNoel, 1, {EVENT_LOG_TITLE,"NhanThiepGSThanhCong"})	
end
function tbNpcCardNoel:GetAwardCardNoel()
	local nCurNumAward = tbNpcCardNoel.TotalAward
	if nCurNumAward >= 500 then
		return Talk(1,"",format("§ît nµy ®· ph¸t hÕt 500 thiÖp gi¸ng sinh råi, b»ng h÷u h·y ®îi ®ît sau nhÐ!"))
	end
	if PlayerFunLib:CheckFreeBagCell(1,"Ph¶i cã Ýt nhÊt 1 « trèng míi cã thÓ nhËn th­ëng.") ~= 1 then
		return
	end
	if GetLevel() < 50 then
		return Talk(1,"",format("§¼ng cÊp kh«ng ®ñ 50 ®Ó nhËn thiÖp, h·y cè g¾ng luyÖn tËp."))
	end
	tbProgressBar:OpenByConfig(19, %_SuccessGetAward, {}, %_OnBreak)
end

local _OnBreak = function()
end

function tbNpcCardNoel:AddNpcPhatThiepNoel()	
	if (tbNpcCardNoel:IsActive() ~=1) then		
		return
	end
	local szNpcName =  self.tbBossInfo.szName
	local nNpcId = self.tbBossInfo.nNpcID
	local szNpcScript = self.tbBossInfo.szScript	
	
	--add npc ngau nhien toa do
	local nRand = random(1,getn(self.tbNpcPos))
		local tbInfo =  self.tbNpcPos[nRand]			
		local nMapID = tbInfo[1]	
		local nMapIndex = SubWorldID2Idx(nMapID)
		if (nMapIndex < 0) then
			print("Error !!! tbNpcCardNoel:Call_Boss nMapIndex:"..nMapIndex)
			return
		end
		print("======Toa do Npc phat thiep :"..tbInfo[1].."-"..tbInfo[2].."-"..tbInfo[3])		
		local nNpcIndex = AddNpcEx(nNpcId, 1, 1, nMapIndex, tbInfo[2]*32, tbInfo[3]*32, 1, szNpcName, 0)
		if (nNpcIndex > 0) then
			SetNpcScript(nNpcIndex, szNpcScript)
			SetNpcTimer(nNpcIndex, self.nLifeTimeNpc) 
			local nTime =tonumber(GetLocalDate("%Y%m%d%H%M"))
			WriteLog(self.LOGTITLE,format("[ThienSuGiangSinh xuat hien]:  %d",nTime))			
		end
	
	local str = "Thiªn Sø Gi¸ng Sinh ®· xuÊt hiÖn, c¸c b»ng h÷u h·y nhanh chãng ®i t×m v× sè l­îng quµ cã h¹n. "
	AddGlobalNews(str)
end

function tbNpcCardNoel:IsActive()
	local nCurDate = nCurDate or tonumber(GetLocalDate("%Y%m%d%H%M"))
	if nCurDate >= self.nStartDate  and nCurDate <= self.nEndDate  then
		return 1
	end	
	return 0
end

function OnTimer(nNpcIndex, nTimeOut) 
	tbNpcCardNoel.TotalAward = 0	
	if nNpcIndex then 
		DelNpc(nNpcIndex)	
	end
end