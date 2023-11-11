-- ´³¹Øµ÷Õû 2011.03.01
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\misc\\eventsys\\eventsys.lua")
Include("\\script\\missions\\challengeoftime\\npc.lua")
Include("\\script\\missions\\challengeoftime\\include.lua")

Include("\\script\\item\\heart_head.lua")
Include("\\script\\item\\forbiditem.lua")

Include("\\script\\activitysys\\g_activity.lua")

ChuangGuan30 = 
{
	tbGroup = {},
	tbPlayer = {},
	tbRegist = {},
	tbMapList = {[CHUANGGUAN30_MAP_ID] = 1,},
	nCount = 0,
	bActive = 0,			-- bossÊÇ·ñ³öÏÖ
	nChuangguan30Timeid = nil
} 

ChuangGuan30.tbForbitItemType = --ÖØÔØ Î¥½ûµÀ¾ß
{
	"TRANSFER","MATE"
}
ChuangGuan30.szMapType = "MËt Phßng cöa ¶i" --¸Ä±äµØÍ¼±íÊ¾
--Give message to all player in map about the lucky award - Modifed by DinhHQ - 20110510
function AnnounceLuckyAward(strAwardName)		
	local strMsg = format("Tæ ®éi cña <color=yellow>%s<color> ®· tiªu diÖt thµnh c«ng boss %s, giµnh ®­îc phÇn th­ëng ®Æc biÖt lµ <color=yellow>%s<color>", GetName(), "trong MËt Phßng Cöa ¶i", strAwardName)
	Msg2Team(strMsg)			
	Msg2SubWorld(strMsg)
	AddGlobalNews(strMsg)	
end

--Modifiled by:ThanhLD - 20140226 - change award from  Boss cuèi tÝnh n¨ng V­ît ¶i
tbVnItemAwardEx = {
	[1] = {--PhÇn 1
		-- {szName="Tinh Tinh Kho¸ng",tbProp={6,1,3811,1,0,0},nCount=1,nRate=20},
		-- {szName="Tinh ThiÕt Kho¸ng",tbProp={6,1,3810,1,0,0},nCount=1,nRate=10},
				{szName="Phi Tèc hoµn",tbProp={6,0,6,1,0,0},nCount=1,nRate=15},
	},
	[2] = {--PhÇn 2
		-- {szName="Tói D­îc PhÈm",tbProp={6,1,30557,1,0,0},nCount=1,nRate=30},
		-- {szName="Cµn Kh«n T¹o Hãa §an (®¹i)",tbProp={6,1,215,1,0,0},nCount=50,nRate=40},
		{szName="§¹i Lùc hoµn",tbProp={6,0,3,1,0,0},nCount=1,nRate=15},
		{szName="Phi Tèc hoµn",tbProp={6,0,6,1,0,0},nCount=1,nRate=15},
	},
	[3] = {--PhÇn 3
		-- {szName = "§å Phæ §»ng Long H¹ng Liªn", tbProp = {6, 1, 30533,1,0,0}, nRate = 0.3,},
		-- {szName = "§»ng Long Th¹ch - H¹", tbProp = {6, 1, 30538,1,0,0}, nRate = 6,nCount=5},
		-- {szName = "§å Phæ Tinh S­¬ng Hé UyÓn", tbProp = {6, 1, 30009,1,0,0}, nRate = 0.4,},
		-- {szName = "§å Phæ Tinh S­¬ng H¹ng Liªn", tbProp = {6, 1, 30010,1,0,0}, nRate = 0.4,},
				{szName="Phi Tèc hoµn",tbProp={6,0,6,1,0,0},nCount=1,nRate=15},

	},
}

function ChuangGuan30:Init()
	self.tbGroup = {}
	self.tbPlayer = {}
	self.tbRegist = {}
	self.bActive = 0
end

function ChuangGuan30:Regist(szType, pFun, ...)
	local nRegId = EventSys:GetType(szType):Reg(CHUANGGUAN30_MAP_ID, pFun, unpack(arg))
	self.tbRegist[szType] = self.tbRegist[szType] or {}
	tinsert(self.tbRegist[szType], nRegId)
end

function ChuangGuan30:RegistAll()
	self:Regist("EnterMap", self.OnEnterMap, self)
	self:Regist("LeaveMap", self.OnLeaveMap, self)
end

function ChuangGuan30:Unregist()
	if self.tbRegist then
		for szType, tbId in self.tbRegist do
			for i=1, getn(tbId) do
				EventSys:GetType(szType):UnReg(CHUANGGUAN30_MAP_ID, tbId[i])
			end
		end
	end
end

function ChuangGuan30:SetState()
	SetTaskTemp(200,1)
	SetFightState(0)
	SetLogoutRV(1)
	SetPunish(0)
	SetCreateTeam(1)
	SetPKFlag(1)
	ForbidChangePK(1)
	DisabledUseTownP(1)
	ForbidEnmity(1)
end

function ChuangGuan30:OnEnterMap()
	
	-- Èç¹ûbossÒÑ¾­³öÏÖÁË£¬Ôò½«Íæ¼ÒÌß»Ø±¨Ãûµã
	if self.bActive == 1 then
		self.KickOut()
	end
	
	-- ½øÐÐ·Ö×é
	-- todo£ºµÃµ½½ÇÉ«ÆðÊ¼µØÍ¼£¬¾ßÌåµÄ½Ó¿ÚÊÇÉ¶»¹²»ÖªµÀ wangjingjun
	local nMapId = GetTask(PLAYER_MAP_TASK)
	local szName = GetName()
	self.tbGroup[nMapId] = self.tbGroup[nMapId] or {}
	tinsert(self.tbGroup[nMapId],szName)
	self.tbPlayer = self.tbPlayer or {}
	self.tbPlayer[szName] = 1
	self.nCount = self.nCount + 1
	SetDeathScript("\\script\\missions\\challengeoftime\\chuangguang30.lua")
	WriteLog("TiÕn vµo b¶n ®å, ng­êi ch¬i lµ" .. szName)
	SetTmpCamp(nMapId) -- ÉèÖÃplayerµÄÕóÓª
	self:SetState()
end

function ChuangGuan30:GiveAward(nGroupId, nCount)
	if GetTask(PLAYER_MAP_TASK) == nGroupId then
		local tbPro = {			
			{szName="§iÓm Kinh NghiÖm",nExp = 20e6},
		}
		tbAwardTemplet:GiveAwardByList(tbPro, "jixuchuangguang award", 1)
		tbAwardTemplet:GiveAwardByList(tbVnItemAwardEx, "jixuchuangguang item award", 1)
	end
end

function ChuangGuan30:KickOut()
	-- Ìß»Ø±¨Ãûµã
	SetLogoutRV(0)
	NewWorld(11,3207,4978) -- ³É¶¼Äôß±³¾
end

function ChuangGuan30:OnLeaveMap()
	local szName = GetName()
	self.tbPlayer[szName] = 0
	self.nCount = self.nCount - 1
	SetCurCamp(GetCamp())
	SetTmpCamp(0)							--È¡ÏûÁÙÊ±ÕóÓª
	SetTaskTemp(200,0)
	SetFightState(0)
	SetPunish(1)
	SetCreateTeam(1)
	SetPKFlag(0)
	ForbidChangePK(0)
	SetTask(PLAYER_MAP_TASK,0)
	SetDeathScript("")
	ForbidEnmity(0)
	
end

function OnDeath(nPlayerIndex)
	ChuangGuan30:KickOut()
end
function ChuangGuan30:OnNpcDeath(nNpcIndex, nPlayerIndex)
	local _,_, nMapIndex = GetNpcPos(nNpcIndex)
	local nMapId = SubWorldIdx2ID(nMapIndex)
	if nMapId ~= CHUANGGUAN30_MAP_ID then
		return 
	end
	local nNpcId = GetNpcSettingIdx(nNpcIndex)
	if nNpcId < map_new_Ncp[2].nNpcId and nNpcId > map_new_Ncp[11].nNpcId then
		return 
	end

	local nGroup = CallPlayerFunction(nPlayerIndex, GetTask, PLAYER_MAP_TASK)
	-- ·¢½±£¬ÌßÈË
	local nCount = AWARD_COUNT	
	
	for _, szName in(self.tbGroup[nGroup]) do
		if self.tbPlayer[szName] == 1 then
			local nPlayerIndex = SearchPlayer(szName)
			if nPlayerIndex > 0 then
				--Adjust number of awards to 2 - Modified by DinhHQ - 20110504
				CallPlayerFunction(nPlayerIndex, self.GiveAward, self, nGroup, 2)
			end
		end
	end
	
	self:OnMessage(nGroup)
	self:KickOutAll()
end


function ChuangGuan30:OnMessage(nGroup)
	local tbAllPlayer = {}
	local batch = 30
	local n_level = 1
	for _, szName in(self.tbGroup[nGroup]) do
		if self.tbPlayer[szName] == 1 then
			local nPlayerIndex = SearchPlayer(szName)
			if nPlayerIndex > 0 then
				tbAllPlayer[getn(tbAllPlayer)+1] = nPlayerIndex;
			end
		end
	end
	G_ACTIVITY:OnMessage("Chuanguan", batch, tbAllPlayer, n_level);
end

function ChuangGuan30:KickOutAll()
	for szName, bFlag in self.tbPlayer do
		if bFlag == 1 then
			local nPlayerIndex = SearchPlayer(szName)
			CallPlayerFunction(nPlayerIndex, self.KickOut, self)
		end
	end
	-- ½«×´Ì¬ÉèÖÃÎªbossÎ´³öÏÖ
	self.bActive = 0
	self.tbGroup = {}
end

function ChuangGuan30:OnAddBoss()
	local nBossid = random(2,11)
	-- ´³¹Øµ÷Õû by wangjingjun 2011.03.02
	-- Ìí¼ÓÐÂµÄnpc£¬¾ßÌåÎ»ÖÃµÄ×ø±ê»¹²»ÖªµÀ
	local szFile = "\\settings\\maps\\liandandong\\npc_3.txt"
	local x,y = get_file_pos(szFile, random(2,50), 1)
	basemission_CallNpc(map_new_Ncp[nBossid], CHUANGGUAN30_MAP_ID, x, y)
	local Msg = format("%s xuÊt hiÖn råi, c¸c ch­ vÞ anh hïng h·y nhanh chãng hµnh ®éng !",map_new_Ncp[nBossid].szName)
	Msg2Player(Msg)
	self.bActive = 1
end

function ChuangGuan30:FightState()
	for szName, bFlag in self.tbPlayer do
		if bFlag == 1 then
			local nPlayerIndex = SearchPlayer(szName)
			CallPlayerFunction(nPlayerIndex, SetFightState, 1)
		end
	end
end

function ChuangGuan30:GameTime()
	if self.nCount == 0 then
--		WriteLog("µ±Ç°µØÍ¼Ã»ÓÐÍæ¼Ò")
		return 0
	end
	self:OnAddBoss()
	self:FightState()
	return 0
end

function ChuangGuan30:SetForbitItem()
	local szMapType = self.szMapType
	set_MapType(CHUANGGUAN30_MAP_ID, szMapType)
	
	for i=1, getn(self.tbForbitItemType) do
		if self.tbForbitItemType[i] == "MATE" then
			FORBITMAP_LIST[CHUANGGUAN30_MAP_ID] = 1
		end
		
		tb_MapType[szMapType] = tb_MapType[szMapType] or {}
		tinsert(tb_MapType[szMapType], self.tbForbitItemType[i])
	end
end

function ChuangGuan30:AddTime()
--	WriteLog("ÉèÖÃ¼ÆÊ±Æ÷******************")
	local nTimeOut = CHUANGGUAN30_TIME_LIMIT + LIMIT_SIGNUP + 60;
	local nId = SubWorldID2Idx(CHUANGGUAN30_MAP_ID)
	if (SubWorldID2Idx(CHUANGGUAN30_MAP_ID) >= 0) then
		if self.nChuangguan30Timeid then
			DelTimer(self.nChuangguan30Timeid)		
		end
		self.nChuangguan30Timeid = AddTimer(nTimeOut * 18,"ChuangGuan30:GameTime",0)
		 
--		 WriteLog("id = " .. tostring(id) .. "################")
	end
end


ChuangGuan30:Unregist()
ChuangGuan30:SetForbitItem()
ChuangGuan30:Init()
ChuangGuan30:RegistAll()
