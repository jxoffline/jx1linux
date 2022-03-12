Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\remoteexc.lua");
Include("\\script\\lib\\log.lua")

tbzhongqiu = tbzhongqiu or {}
tbzhongqiu.nStartDate = 20120927
tbzhongqiu.nEndDate = 20121101
tbzhongqiu.tbNpcID = 
{
	nNpcRabbitId = 1124,
	tbNpcTempId = {
		[1] = 1594,
		[2] = 1595,
		[3] = 1596,
	},
};
tbzhongqiu.tbInfoPos = 
	{
		-- Thµnh §«
		{
			tbPos = {11, 3121, 4997},
			nNpcIndex = nil,
			tbRabbitPos = {11, 3123, 4996},
			nRabbitIndex = nil,
		},
		-- D­¬ng Ch©u
		{
			tbPos = {80, 1750, 3000},
			nNpcIndex = nil,
			tbRabbitPos = {80, 1752, 3000},
			nRabbitIndex = nil,			
		},
		-- T­¬ng D­¬ng
		{
			tbPos = {78, 1532, 3241},
			nNpcIndex = nil,
			tbRabbitPos = {78, 1534, 3242},
			nRabbitIndex = nil,			
		},
		-- §¹i Lý
		{
			tbPos = {162, 1591, 3214},
			nNpcIndex = nil,
			tbRabbitPos = {162, 1593, 3213},
			nRabbitIndex = nil,			
		},	
}
tbzhongqiu.tbFireworks = 
{
	-- Thµnh §«
	{
		tbPos = {11,  3124, 5002},
		nNpcIndex = nil,
		nLeftCount = 0,
	},
	-- D­¬ng Ch©u
	{
		tbPos = {80, 1750, 3004},
		nNpcIndex = nil,
		nLeftCount = 0,
	},
	-- T­¬ng D­¬ng
	{
		tbPos = {78, 1534, 3238},
		nNpcIndex = nil,
		nLeftCount = 0,
	},
	-- §¹i Lý
	{
		tbPos = {162, 1592, 3218},
		nNpcIndex = nil,
		nLeftCount = 0,
	},		
};

function tbzhongqiu:IsActivityTime()
	local nCruDate = tonumber(GetLocalDate("%Y%m%d"));
	if (self.nStartDate <= nCruDate and nCruDate < self.nEndDate) then
		return 1;
	end
	return 0;
end

function tbzhongqiu:TaskNpcChangeShape(nShape)
	local nNpcTempId = self.tbNpcID.tbNpcTempId[nShape]
	local nRabitTempId = self.tbNpcID.nNpcRabbitId
	local tbNpcInfo  = self.tbInfoPos;
	if nNpcTempId == nil or tbNpcInfo == nil then 
		return 
	end
	for i = 1,getn(tbNpcInfo) do
		if tbNpcInfo[i].nNpcIndex ~= nil then
			DelNpc(tbNpcInfo[i].nNpcIndex);
			tbNpcInfo[i].nNpcIndex = nil;
		end
		if tbNpcInfo[i].nRabbitIndex ~= nil then
			DelNpc(tbNpcInfo[i].nRabbitIndex);
			tbNpcInfo[i].nRabbitIndex = nil;
		end
		local tbPos = tbNpcInfo[i].tbPos;
		local nSubWorldIdx = SubWorldID2Idx(tbPos[1]);
		if nSubWorldIdx >= 0 then
			local nNpcIdx = AddNpc(nNpcTempId, 90, nSubWorldIdx, tbPos[2]*32, tbPos[3]*32, 0, "H»ng Nga");
			if nNpcIdx > 0 then
				SetNpcScript(nNpcIdx, "\\script\\activitysys\\npcdailog.lua");
				tbNpcInfo[i].nNpcIndex = nNpcIdx;
			end
			local nRabbitIdx = AddNpc(nRabitTempId, 90, nSubWorldIdx, tbNpcInfo[i].tbRabbitPos[2]*32, tbNpcInfo[i].tbRabbitPos[3]*32, 0, " ");
			if nRabbitIdx > 0 then
				tbNpcInfo[i].nRabbitIndex = nRabbitIdx;
			end			
		end
	end	
end

function tbzhongqiu:Fireworks(nCount)
	for i = 1,getn(self.tbFireworks) do
		local tbPos = self.tbFireworks[i].tbPos;
		local nSubWorldIdx = SubWorldID2Idx(tbPos[1]);
		if nSubWorldIdx >= 0 then
			local nNpcIdx = AddNpc(1575, 90, nSubWorldIdx, tbPos[2]*32, tbPos[3]*32, 0, "");
			if nNpcIdx > 0 then
				self.tbFireworks[i].nNpcIndex = nNpcIdx;
				self.tbFireworks[i].nLeftCount = 60;			
				AddTimer(15 * 18, "FireworksOnTimeout", i);
			end
		end
	end		
end

function FireworksOnTimeout(nIndex)
	local tbNpc = tbzhongqiu.tbFireworks[nIndex];
	if tbNpc == nil then
		return 0;
	end
	if tbNpc.nNpcIndex == nil then
		tbNpc.nLeftCount = 0;
		return 0;
	end
	if tbNpc.nLeftCount <= 0 then
		DelNpc(tbNpc.nNpcIndex);
		tbNpc.nNpcIndex = nil;
		tbNpc.nLeftCount = 0;
		return 0;
	end
	local nOldPlayer = PlayerIndex;	
	local tbAllPlayer, nPlayerCount = GetNpcAroundPlayerList(tbNpc.nNpcIndex, 16);
	for i = 1, nPlayerCount do
		PlayerIndex = tbAllPlayer[i];
		if PlayerFunLib:CheckTotalLevel(150,"default",">=") ~= 1 then
			return 0
		else
			tbAwardTemplet:Give({nExp = 1e6}, 1, {"TRUNGTHU_2012","NhanDiemKinhNghiemDat40000LongDenKQ"})
		end
	end	
	PlayerIndex = nOldPlayer;
	tbNpc.nLeftCount = tbNpc.nLeftCount - 1;
	return 15 * 18, nIndex;
end

--Npc H»ng Nga sÏ thay ®æi kÝch thøíc
function tbzhongqiu:GiveItem2HengE()
	RemoteExc("\\script\\event\\zhongqiu_jieri\\2012\\head.lua", "tbzhongqiu:AddCount", {GetName()}, "\\script\\event\\zhongqiu_jieri\\201209\\zhongqiu.lua", "tbzhongqiu:GiveItem2HengE_CallBack", {});
end
--Trao phÇn th­ëng ®¹t mèc 1000,2000,3000
function tbzhongqiu:GiveItem2HengE_CallBack(szName, nCount)
	local nPlayerIndex = SearchPlayer(szName);
	if nPlayerIndex <= 0 then
		return
	end
	local nOldPlayerIndex = PlayerIndex;	
	PlayerIndex = nPlayerIndex;
	Msg2Player(format("§¹i hiÖp lµ ng­êi thø %d nép lång ®Ìn kÐo qu©n.", nCount));
	if mod(nCount, 1000) == 0 then --PhÇn th­ëng ®¹t mèc
		Msg2Player("Chóc mõng ®¹i hiÖp nhËn ®­îc phÇn th­ëng t¨ng thªm!")
		Msg2Player(format("[%s]NhanThuongDatMoc%d",szName,nCount))
		tbAwardTemplet:Give({nExp = 10e6}, 1, {"TRUNGTHU_2012", format("[%s]NhanThuongDatMoc%d",szName,nCount)})
		%tbLog:PlayerActionLog("TRUNGTHU_2012",format("Nop%dLanLongDenKeoQuan",nCount))
	end
	PlayerIndex = nOldPlayerIndex;
end

function tbzhongqiu:AddTaskNpc()
	RemoteExc("\\script\\event\\zhongqiu_jieri\\2012\\head.lua", "tbzhongqiu:SynShape", {}, "", "", {});
end


