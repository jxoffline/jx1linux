if huashanqunzhan_tbReady then
--	return 
end

Include("\\script\\missions\\huashanqunzhan\\huashanqunzhan.lua")

local tbMissionData = 
{
	nLatencyTime		= 15,
}
tbMissionData.tbMissionV =
{
	MISSION_STATE	= 1,
	SECOND_COUNTER	= 2,
	RANK_COUNTER	= 3,	
}
tbMissionData.tbMissionS = 
{
	
}
huashanqunzhan_tbReady = huashanqunzhan:new(tbMissionData, huashanqunzhan) --´Ó»ùÀà¼Ì³ÐÏÂÀ´




huashanqunzhan_tbReady.tbWaitPos = 
{
	{1589, 3029},
	{1595, 2964},
	{1582, 2972},
	{1562, 2946},
	{1560, 2965},
	{1558, 2989},
	{1569, 3029},
}

function huashanqunzhan_tbReady:OnInit()
	SetMissionV(self.tbMissionV.MISSION_STATE, 1)	
end

function huashanqunzhan_tbReady:OnRun()
	SetMissionV(self.tbMissionV.MISSION_STATE, 2)
end

function huashanqunzhan_tbReady:OnPlayerJoin()
	--´«ËÍµ½×¼±¸³¡
	local nMissionState = GetMissionV(self.tbMissionV.MISSION_STATE)
	
	local nPlayerCount = GetMSPlayerCount(self.nMissionId, 0)
	
	if nMissionState ~=1 and nMissionState ~= 2 then
		self:GotoSignUpPlace()
		Msg2Player("TrËn ®Êu vÉn ch­a b¾t ®Çu.")
		return Say("TrËn ®Êu vÉn ch­a b¾t ®Çu.", 0)
	end 
	
	

	if nPlayerCount >= self.nPlayerCountLimit then
		self:GotoSignUpPlace()
		Msg2Player("Sè ng­êi tham gia ho¹t ®éng nµy ®· ®ñ, b¹n h·y tham gia ®ît sau!")
		return Say("Sè ng­êi tham gia ho¹t ®éng nµy ®· ®ñ, b¹n h·y tham gia ®ît sau!", 0)
	end
	
	if GetLevel() < self.tbLevelLimit[1] then
		self:GotoSignUpPlace()
		Msg2Player(format("Ch­a ®ñ cÊp %s, kh«ng thÓ tham gia l«i ®µi cÊp bËc nµy.", self.tbLevelLimit[1]))
		return Say(format("Ch­a ®ñ cÊp %s, kh«ng thÓ tham gia l«i ®µi cÊp bËc nµy.", self.tbLevelLimit[1]), 0)
	elseif self.tbLevelLimit[2] and GetLevel() > self.tbLevelLimit[2] then
		self:GotoSignUpPlace()
		Msg2Player(format("B¹n ®· v­ît cÊp %s, kh«ng thÓ tham gia l«i ®µi cÊp bËc nµy.", self.tbLevelLimit[2]))
		return Say(format("B¹n ®· v­ît cÊp %s, kh«ng thÓ tham gia l«i ®µi cÊp bËc nµy.", self.tbLevelLimit[2]), 0)
	end
	if GetCash() < self.nMoney then
		self:GotoSignUpPlace()
		Msg2Player("Kh«ng ®ñ ng©n l­îng.")
		return Say("Kh«ng ®ñ ng©n l­îng.", 0)
	end
	--ÉèÖÃÓë°ï»áÓÐ¹ØµÄ±äÁ¿£¬²»ÔÊÐíÔÚ¾º¼¼³¡Õ½¸Ä±äÄ³¸ö°ï»áÕóÓªµÄ²Ù×÷
	SetTaskTemp(200,1);
	--ÉèÖÃ·ÇÕ½¶·×´Ì¬ 
	SetFightState(0);
	--Íæ¼ÒÍË³öÊ±£¬±£´æRV²¢£¬ÔÚÏÂ´ÎµÈÈëÊ±ÓÃRV(³ÇÊÐÖØÉúµã£¬·ÇÍË³öµã)
	SetLogoutRV(1);
	--ÎÞËÀÍö³Í·£
	SetPunish(0);
	--¹Ø±Õ×é¶Ó¹¦ÄÜ
	SetCreateTeam(0);
	LeaveTeam()
	--½ûÖ¹³ðÉ±
	ForbidEnmity( 1 )
	--´ò¿ªPK¿ª¹Ø 
	--¿ªÊ¼Ó¦¸Ã¶¼²»ÄÜPK
	SetPKFlag(0)
	--½ûÖ¹½»Ò×;
	DisabledStall(1);
	ForbitTrade(0);
	ForbidChangePK(1);
	DisabledUseTownP(1);	--½ûÖ¹Ê¹ÓÃ»Ø³Ì£»
	SetCurCamp(4);	--ÉèÖÃÁÙÊ±ÕóÓª
	return 1;
end

function huashanqunzhan_tbReady:OnLeave()
	
	--¹Ø±ÕÉèÖÃÓë°ï»áÓÐ¹ØµÄ±äÁ¿£¬²»ÔÊÐíÔÚ¾º¼¼³¡Õ½¸Ä±äÄ³¸ö°ï»áÕóÓªµÄ²Ù×÷
	SetTaskTemp(200,0);
	--ÉèÖÃÕ½¶·×´Ì¬
	SetFightState(0);
	--Íæ¼ÒÍË³öÊ±£¬±£´æRV²¢£¬ÔÚÏÂ´ÎµÈÈëÊ±ÓÃRV(³ÇÊÐÖØÉúµã£¬·ÇÍË³öµã)
	--SetLogoutRV(0);
	--ËÀÍö³Í·£
	SetPunish(1);
	--¿ªÆô×é¶Ó¹¦ÄÜ
	SetCreateTeam(0);
	--´ò¿ªPK¿ª¹Ø 
	
	--ÉèÖÃ³ðÉ±
	ForbidEnmity( 0 )
	--¿ªÊ¼Ó¦¸Ã¶¼²»ÄÜPK
	SetPKFlag(0)
	--¹Ø±Õ½ûÖ¹½»Ò×;
	DisabledStall(0);
	ForbitTrade(0);
	
	local nCamp = GetCamp();
	SetCurCamp(nCamp);
	
	ForbidChangePK(0);
	DisabledUseTownP(0);	--¹Ø±Õ½ûÖ¹Ê¹ÓÃ»Ø³Ì£»
	
end

function huashanqunzhan_tbReady:OnTimer()
	local nTimerCount = GetMissionV(self.tbMissionV.SECOND_COUNTER)
	
	nTimerCount = nTimerCount + 1
	SetMissionV(self.tbMissionV.SECOND_COUNTER, nTimerCount)
	local szMsg = format("Cßn <color=yellow>%d<color> phót n÷a trËn ®Êu sÏ b¾t ®Çu.", self.nLatencyTime - nTimerCount)
	
	
	if nTimerCount == self.nLatencyTime then
		return self:CloseGame()
	end
	Msg2MSAll(self.nMissionId, szMsg)
	
end

function huashanqunzhan_tbReady:OnClose()
	SetMissionV(self.tbMissionV.MISSION_STATE, 3)
	local pidx			= 0
	local idx			= 0
	local tbPlayer		= {}
	local nPlayerCount	= GetMSPlayerCount(self.nMissionId, 0)
	if (nPlayerCount <= 0) then
		return
	end;
	local bIsOpen = -1
	if nPlayerCount >= self.nMinPlayerCountLimit then
		bIsOpen = self.tbRef:StartGame()
	end
	
	
	for i = 1, nPlayerCount do
		idx, pidx = GetNextPlayer(self.nMissionId, idx, 0);
		if (pidx > 0) then
			tinsert(tbPlayer, pidx)
		end;
		
		if (idx == 0) then
			break;
		end;
	end
	--self.tbRef:SetMissionV(self.tbRef.tbMissionV.PLAYER_COUNT, getn(tbPlayer));²»ÔÚÕâÀïÉèÖÃ£¬¿ÉÄÜ³öÏÖÎÊÌâ
	for i = 1, getn(tbPlayer) do
		if bIsOpen ~= 1 then
			doFunByPlayer(tbPlayer[i], self.GotoSignUpPlace, self)
			if nPlayerCount >= self.nMinPlayerCountLimit then
				doFunByPlayer(tbPlayer[i], Msg2Player, "§­êng ®i phÝa tr­íc kh«ng th«ng, h·y ®îi cuéc ®ua sau.")
			else
				doFunByPlayer(tbPlayer[i], Msg2Player, format("Sè ng­êi tham gia Ýt h¬n %d, tr©n ®Êu kh«ng thÓ b¾t ®Çu.",self.nMinPlayerCountLimit))
			end
		else
			local nX, nY = getadata("\\settings\\maps\\huashanqunzhan\\huashanjingji.txt")
			doFunByPlayer(tbPlayer[i], NewWorld, self.tbRef.nMapId, nX, nY)	
		end
		
	end
end

function huashanqunzhan_tbReady:GotoReadyPlace()
	local nRandId = random(1, getn(self.tbWaitPos))
	NewWorld(self.nMapId, self.tbWaitPos[nRandId][1], self.tbWaitPos[nRandId][2])
end


function huashanqunzhan_tbReady:CheckMathState()
	local nReadyState = self:GetMissionState()
	local nState = self.tbRef:GetMissionState()
	if (nReadyState ~= 1 and nReadyState ~= 2) then
		return  0 - nState
	else
		return 1
	end
end