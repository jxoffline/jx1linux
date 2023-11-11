if racegame_tbMission then
	return 
end

Include("\\script\\missions\\racegame\\base\\head.lua")
Include("\\script\\missions\\racegame\\lib.lua")
Include("\\script\\lib\\mem.lua")
Include("\\script\\event\\jiefang_jieri\\200804\\taskctrl.lua")
Include("\\script\\lib\\gb_taskfuncs.lua")
racegame_tbMission = new(tbMission)

racegame_tbMission.nMissionId	= 53
racegame_tbMission.tbTimer		=  { {91, 18*10}}
racegame_tbMission.nLatencyTime	= 60*14     -- µÈ´ıÊ±¼ä14·ÖÖÓ

racegame_tbMission.nMapId		= 863     -- µØÍ¼Id

racegame_tbMission.tbNpcList = 
{
	[1] = {szName = "¤ng chñ ®­êng ®ua", nNpcId = 228, szScriptPath = "\\script\\missions\\racegame\\npcsaichanglaoban.lua"},
	[2] = {szName = "§¹o cô hç trî", nNpcId = 1288,szScriptPath = "\\script\\missions\\racegame\\npctoolitem.lua"},
}

racegame_tbMission.tbItemList = 
{
	{szName="Gia Tèc hoµn", tbProp={6, 1, 978, 1, 0, 0} },
	{szName="L«i Tèc hoµn", tbProp={6, 1, 990, 1, 0, 0} },
	{szName="HuyÒn Thiªn H·m TÜnh", tbProp={6, 1, 982, 1, 0, 0} },
	{szName="B¨ng Phong H·m TÜnh", tbProp={6, 1, 984, 1, 0, 0} },
	{szName="HuyÔn Hu©n H·m TÜnh", tbProp={6, 1, 981, 1, 0, 0} },
	{szName="S­¬ng Gi¸ng H·m TÜnh", tbProp={6, 1, 983, 1, 0, 0} },
	{szName="B¨ng S­¬ng HiÖu gi¸c ", tbProp={6, 1, 979, 1, 0, 0} },
	{szName="B¹o L«i HiÖu gi¸c", tbProp={6, 1, 980, 1, 0, 0}},
	{szName="§én §Şa phï ", tbProp={6, 1, 987, 1, 0, 0} },
}



racegame_tbMission.G_TSK_NAME			= "racegame"
racegame_tbMission.ReadyMissionState	= 1
racegame_tbMission.MissionState			= 2




racegame_tbMission.tbSignUpPos = {1592+4,3264+8}
racegame_tbMission.tbMissionV =
{
	MISSION_STATE	= 1,
	SECOND_COUNTER	= 2,
	RANK_COUNTER	= 3,	
}

racegame_tbMission.tbMissionS =
{
	
}





function racegame_tbMission:OnInit()
	SetMissionV(self.tbMissionV.MISSION_STATE, 1)

	gb_SetTask(self.G_TSK_NAME, self.MissionState, 1)
	self:AddGoalNpc()
end



function racegame_tbMission:OnPlayerJoin()
	ForbitSkill(1);
	SetMoveSpeed(5);
	jiefang_0804_ResetTask()
	SetTask(jiefang_0804_TSK_AwardState, 0)
	--ÉèÖÃÓë°ï»áÓĞ¹ØµÄ±äÁ¿£¬²»ÔÊĞíÔÚ¾º¼¼³¡Õ½¸Ä±äÄ³¸ö°ï»áÕóÓªµÄ²Ù×÷
	SetTaskTemp(200,1);
	--ÉèÖÃÕ½¶·×´Ì¬
--		SetFightState(1);
	--Íæ¼ÒÍË³öÊ±£¬±£´æRV²¢£¬ÔÚÏÂ´ÎµÈÈëÊ±ÓÃRV(³ÇÊĞÖØÉúµã£¬·ÇÍË³öµã)
	SetLogoutRV(1);
	
	--½ûÖ¹¹â»·
	ForbitAura(1)
	SetFightState(1);
	--ÎŞËÀÍö³Í·£
	SetPunish(0);
	--¹Ø±Õ×é¶Ó¹¦ÄÜ
	SetCreateTeam(0);
	--´ò¿ªPK¿ª¹Ø 

	--ÉèÖÃ³ğÉ±
	ForbidEnmity( 1 )
	--¿ªÊ¼Ó¦¸Ã¶¼²»ÄÜPK
	SetPKFlag(1)
	--½ûÖ¹½»Ò×;
	DisabledStall(1);
	ForbitTrade(0);
	
	ForbidChangePK(1);
	SetCurCamp(4);	--ÉèÖÃÁÙÊ±ÕóÓª
	DisabledUseTownP(1);	--½ûÖ¹Ê¹ÓÃ»Ø³Ì£»
	
	local nTimerCount = GetMissionV(self.tbMissionV.SECOND_COUNTER)
	local szMsg	= format("Cuéc ®ua b¾t ®Çu, thêi gian cßn l¹i lµ <color=yellow>%d<color> gi©y.", self.nLatencyTime - nTimerCount)
	Msg2Player(szMsg)
	return 1
end

function racegame_tbMission:OnLeave()
	self:DelItem()

	ForbitSkill(0);
	SetMoveSpeed(-1);
	
	--¹Ø±Õ½ûÖ¹¹â»·
	ForbitAura(0)
	--¹Ø±ÕÉèÖÃÓë°ï»áÓĞ¹ØµÄ±äÁ¿£¬²»ÔÊĞíÔÚ¾º¼¼³¡Õ½¸Ä±äÄ³¸ö°ï»áÕóÓªµÄ²Ù×÷
	SetTaskTemp(200,0);
	--ÉèÖÃÕ½¶·×´Ì¬
	SetFightState(0);
	--Íæ¼ÒÍË³öÊ±£¬±£´æRV²¢£¬ÔÚÏÂ´ÎµÈÈëÊ±ÓÃRV(³ÇÊĞÖØÉúµã£¬·ÇÍË³öµã)
	--SetLogoutRV(0);
	--ËÀÍö³Í·£
	SetPunish(1);
	--¿ªÆô×é¶Ó¹¦ÄÜ
	SetCreateTeam(0);
	--´ò¿ªPK¿ª¹Ø 
	
	--ÉèÖÃ³ğÉ±
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

function racegame_tbMission:OnClose()
	gb_SetTask(self.G_TSK_NAME, self.MissionState, 0)
	Msg2MSAll(self.nMissionId, "Thêi gian ®ua ®· hÕt, cuéc ®ua kÕt thóc.")
	self:ClearGoalNpc()
	self:ClearItemNpc()
	local nPlayerCount	= GetMSPlayerCount(self.nMissionId, 0)
	local tbPlayer = {}
	if (nPlayerCount <= 0) then
		return
	end;
	local idx, pidx = 0, 0;
	for i = 1, nPlayerCount do
		idx, pidx = GetNextPlayer(self.nMissionId, idx, 0);
		if (pidx > 0) then
			tinsert(tbPlayer, pidx)
		end;
		
		if (idx == 0) then
			break;
		end;
	end
	
	for i = 1, getn(tbPlayer) do
		doFunByPlayer(tbPlayer[i], jiefang_0804_ResetTask)
		local nPlayerMapId = doFunByPlayer(tbPlayer[i], GetTask, jiefang_0804_TSK_MapId)
		if nPlayerMapId == 0 then
			nPlayerMapId = 524
		end
		doFunByPlayer(tbPlayer[i], NewWorld, nPlayerMapId, self.tbSignUpPos[1], self.tbSignUpPos[2])
	end
	
end

function racegame_tbMission:AddGoalNpc()
	local nX, nY = 1568*32, 2507*32
	racegame_CallNpc(self.tbNpcList[1], self.nMapId, nX, nY)
end

function racegame_tbMission:ClearGoalNpc()

	ClearMapNpcWithName(self.nMapId, self.tbNpcList[1].szName);
end

function racegame_tbMission:ClearItemNpc()

	ClearMapNpcWithName(self.nMapId, self.tbNpcList[2].szName);
end

function racegame_tbMission:AddItemNpc()

	local tbPosList = getndata("\\settings\\battles\\maps\\river\\outside.txt", 400)
	for i = 1, getn(tbPosList) do
		racegame_CallNpc(self.tbNpcList[2], self.nMapId, tbPosList[i][1], tbPosList[i][2])
	end
end

function racegame_tbMission:OnTimer()
	local nTimerCount = GetMissionV(self.tbMissionV.SECOND_COUNTER)
	nTimerCount = nTimerCount + 10
	local szMsg	= format("Thêi gian cßn l¹i lµ <color=yellow>%d<color> gi©y.", self.nLatencyTime - nTimerCount)
	
	if mod(nTimerCount, 100) == 10 then
		self:AddItemNpc()
		
	end
	
	if mod(nTimerCount, 100) == 20 then
		self:ClearItemNpc()
	end
	if mod(nTimerCount, 60) == 0 or nTimerCount == self.nLatencyTime - 10 then
		Msg2MSAll(self.nMissionId, szMsg)
	end
	if nTimerCount >= self.nLatencyTime then
		self:CloseGame()
		return 
	end
	
	SetMissionV(self.tbMissionV.SECOND_COUNTER, nTimerCount)
end

function racegame_tbMission:DelItem()
	for i= 1, getn(self.tbItemList) do
		local tbProp = self.tbItemList[i].tbProp
		local nItemCount = CalcItemCount(-1,tbProp[1],tbProp[2],tbProp[3],-1)
		ConsumeItem(-1,nItemCount,tbProp[1],tbProp[2],tbProp[3],-1)	
	end
	
end