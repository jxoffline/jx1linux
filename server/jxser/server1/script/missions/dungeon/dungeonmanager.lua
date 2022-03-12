Include("\\script\\missions\\dungeon\\dungeoninfo.lua")
Include("\\script\\missions\\dungeon\\dungeon.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\remoteexc.lua")

if not tbDungeonManager then
	tbDungeonManager = {}
	tbDungeonManager.tbDungeonTempletList = {}
end

function tbDungeonManager:RegDungeon(tbDungeonTemplet)
	if (tbDungeonTemplet.strDungeon == nil or tbDungeonTemplet.nMapTemplet == nil) then
		return 0;
	end
	
	tbDungeonManager.tbDungeonTempletList[tbDungeonTemplet.strDungeon] = tbDungeonTemplet;
	
	WriteLog(format("[%s] Register [%s] dungeon, templet mapid is [%0.f].", GetLocalDate("%Y-%m-%d %H:%M:%S"), tbDungeonTemplet.strDungeon , tbDungeonTemplet.nMapTemplet));
	
	return 1;
end

function tbDungeonManager:UnRegDungeon(strDungeon)
	tbDungeonManager.tbDungeonTempletList[strDungeon] = nil;
	return 1;
end

function tbDungeonManager:_CheckExistCallBack(nPlayerIndex, strDungeon, tbDungeonData, bSaved)
	local nOldPlayer = PlayerIndex;
	PlayerIndex = nPlayerIndex;
	local tbTemplet = self.tbDungeonTempletList[strDungeon];
	local strPlayerName = GetName();

	if (tbDungeonData ~= nil and bSaved ~= 1) then
		if (SubWorldID2Idx(tbDungeonData.nDungeonId) <= 0 and tbDungeonInfo:GetDungeon(tbDungeonData.nDungeonId) == nil) then
			local szTitle = "<npc>Ng­¬i ®· më ra phã b¶n ë mét n¬i kh¸c cã cÇn ®i qua ®ã kh«ng?"
			local tbOpt = 
			{
				{"H·y ®­a ta qua", NewWorld, {tbDungeonData.tbEnterPos.nMapId, tbDungeonData.tbEnterPos.nX, tbDungeonData.tbEnterPos.nY}},
				{"Hñy bá "}
			}
			CreateNewSayEx(szTitle, tbOpt)
		else
			Talk(1,"",format("Khëi ®éng [<color=red>%s<color>] thÊt b¹i, cã thÓ phã b¶n nµy ®· ®ñ ng­êi, xin h·y ®îi thªm chót n÷a.", strDungeon));
		end
		
		return 0;
	end
	
	if (tbTemplet == nil) then
		WriteLog(format("[%s] [%s] create [%s] dungeon failed cause can't find this dungeon templet.", GetLocalDate("%Y-%m-%d %H:%M:%S"), strPlayerName, strDungeon));
		return 0;
	end
	
	if (tbTemplet:CheckOpenDungeonServerLimit() ~= 1) then
		Talk(1,"",format("Khëi ®éng [<color=red>%s<color>] thÊt b¹i, cã thÓ phã b¶n nµy ®· ®ñ ng­êi, xin h·y ®îi thªm chót n÷a.", strDungeon));
		WriteLog(format("[%s] [%s] create [%s] dungeon failed because Game Server Resource Limit.", GetLocalDate("%Y-%m-%d %H:%M:%S"), strPlayerName, strDungeon));
		return 0;
	end
	PreApplyDungeonMap(tbTemplet.nMapTemplet,1, 1)
	local nId = ApplyDungeonMap(tbTemplet.nMapTemplet);
	
	if (nId == 0) then
		Talk(1,"",format("Khëi ®éng [<color=red>%s<color>] thÊt b¹i, cã thÓ phã b¶n nµy ®· ®ñ ng­êi, xin h·y ®îi thªm chót n÷a.", strDungeon));
		WriteLog(format("[%s] [%s] create [%s] dungeon failed because allpy dungeon failed.", GetLocalDate("%Y-%m-%d %H:%M:%S"), strPlayerName, strDungeon));
		return 0;
	end
	
	local tbDungeon = tbTemplet:new(clone(tbTemplet.tbData));
	tbDungeon.nDungeonId = nId;
	tbDungeon.nMapId = nId;
	tbDungeon.nOpenTime = tonumber(GetLocalDate("%Y%m%d%H%M"));
	tbDungeon.strOwner = strPlayerName;
	tbDungeon.tbMember = {};
	tbDungeon.tbApply = {};
	tinsert(tbDungeon.tbMember, {strName = strPlayerName, bInDungeon = 0, bInTrans = 0, nTime = 0, tbTask = {}});
	tbDungeon.nTimerInterval = tbTemplet.nTimerInterval or 1;
	
	if (tbDungeonInfo:AddDungeon(tbDungeon) == 0) then
		Talk(1,"",format("Khëi ®éng [%s] thÊt b¹i, cã thÓ phã b¶n ®· ®ñ ng­êi, xin h·y ®îi thªm chót n÷a.", strDungeon));
		WriteLog(format("[%s] [%s] create [%s] dungeon failed cause add dungeon info failed.", GetLocalDate("%Y-%m-%d %H:%M:%S"), strPlayerName, strDungeon));
		if (ReturnDungenonMap(tbDungeon.nMapTemplet, tbDungeon.nDungeonId) == 1) then
			WriteLog(format("[%s] return [%s]'s dungeon map [%0.f] success.", GetLocalDate("%Y-%m-%d %H:%M:%S"), strPlayerName, tbDungeon.nDungeonId));
		else
			WriteLog(format("[%s] return [%s]'s dungeon map [%0.f] failed.", GetLocalDate("%Y-%m-%d %H:%M:%S"), strPlayerName, tbDungeon.nDungeonId));
		end
		return 0;
	end
	
	if (tbDungeon.OpenDungeon ~= nil and tbDungeon:OpenDungeon(tbDungeonData) ~= 1) then
		WriteLog(format("[%s] [%s] create [%s] dungeon failed cause creator does not meet the open condition.", GetLocalDate("%Y-%m-%d %H:%M:%S"), strPlayerName, strDungeon));
		self:CloseDungeon(tbDungeon.nDungeonId);
		return 0;
	end
	
	local strMemberList = "";
	
	for i = 1, getn(tbDungeon.tbMember) do
		strMemberList = format("%s,%s",strMemberList,tbDungeon.tbMember[i].strName);
	end
	
	WriteLog(format("[%s] [%s]'s [%s] dungeon(id:[%0.f]) opened at [%0.f]. (%d)Members are [%s]", GetLocalDate("%Y-%m-%d %H:%M:%S"), tbDungeon.strOwner, 
					tbDungeon.strDungeon, tbDungeon.nDungeonId, tbDungeon.nOpenTime, getn(tbDungeon.tbMember), strMemberList));
	
	RemoteExc("\\script\\mission\\dungeon\\datamanager.lua", "tbDDManager:OpenDungeon", {tbTemplet.nMapTemplet, tbDungeon.nDungeonId, strPlayerName},
		"\\script\\missions\\dungeon\\dungeonmanager.lua", "tbDungeonManager:_OpenCallBack", {PlayerIndex, tbDungeon.nDungeonId});
	PlayerIndex = nOldPlayer;
end

function tbDungeonManager:_OpenCallBack(nPlayerIndex, nDungeonId, bSuccess)
	local nOldPlayer = PlayerIndex;
	PlayerIndex = nPlayerIndex;
	
	if (bSuccess ~= 1) then
		Talk(1,"","Më Phã B¶n thÊt b¹i, cã thÓ Phã B¶n ®· ®Çy, xin h·y thö l¹i sau.");
		self:CloseDungeon(nDungeonId);
		return 0;
	end
	
	self:EnterDungeon(nDungeonId, PlayerIndex);
	
	PlayerIndex = nOldPlayer;
	
	return 1;
end

function tbDungeonManager:OpenDungeon(strDungeon)
	local tbTemplet = self.tbDungeonTempletList[strDungeon];
	local strPlayerName = GetName();
	
	if (tbTemplet == nil) then
		WriteLog(format("[%s] [%s] create [%s] dungeon failed cause can't find this dungeon templet.", GetLocalDate("%Y-%m-%d %H:%M:%S"), strPlayerName, strDungeon));
		return 0;
	end
	
	local tbDungeonList = tbDungeonInfo:GetDungeonList(strDungeon);
	
	for i,v in tbDungeonList do
		if (i ~= "n" and v ~= nil and v.strOwner == strPlayerName) then
			Talk(1,"",format("§¹i hiÖp ®· më 1 [<color=red>%s<color>], h·y ®ãng c¸i cò tr­íc khi më c¸i míi.", strDungeon));
			return 0;
		end
	end
	
	RemoteExc("\\script\\mission\\dungeon\\datamanager.lua", "tbDDManager:CheckExist", {tbTemplet.nMapTemplet, strPlayerName},
			"\\script\\missions\\dungeon\\dungeonmanager.lua", "tbDungeonManager:_CheckExistCallBack", {PlayerIndex, strDungeon});
	
	return 1;
end

function tbDungeonManager:CloseDungeon(nDungeonId)
	local tbDungeon = tbDungeonInfo:GetDungeon(nDungeonId);
	
	if (tbDungeon ~= nil) then
		if (tbDungeon.CloseDungeon ~= nil) then
			tbDungeon:CloseDungeon();
		end
		
		tbDungeonInfo:DelDungeon(nDungeonId);
		
		if (ReturnDungenonMap(tbDungeon.nMapTemplet, tbDungeon.nDungeonId) == 1) then
			WriteLog(format("[%s] return [%s]'s dungeon map [%0.f] success.", GetLocalDate("%Y-%m-%d %H:%M:%S"), tbDungeon.strOwner, tbDungeon.nDungeonId));
		else
			WriteLog(format("[%s] return [%s]'s dungeon map [%0.f] failed.", GetLocalDate("%Y-%m-%d %H:%M:%S"), tbDungeon.strOwner, tbDungeon.nDungeonId));
		end
		
		local strMemberList = "";
	
		for i = 1, getn(tbDungeon.tbMember) do
			strMemberList = format("%s,%s",strMemberList,tbDungeon.tbMember[i].strName);
		end
		
		WriteLog(format("[%s] [%s]'s [%s] dungeon(id:[%0.f] opened at [%0.f]) closed success. (%d)Members are [%s]", GetLocalDate("%Y-%m-%d %H:%M:%S"), tbDungeon.strOwner, 
					tbDungeon.strDungeon, tbDungeon.nDungeonId, tbDungeon.nOpenTime, getn(tbDungeon.tbMember), strMemberList));
						
		RemoteExc("\\script\\mission\\dungeon\\datamanager.lua", "tbDDManager:CloseDungeon", {tbDungeon.nMapTemplet, tbDungeon.nDungeonId, tbDungeon.strOwner});

		return 1;
	end
	
	return 0;
end

function tbDungeonManager:AddMember(nDungeonId, strMemberName)
	local tbDungeon = tbDungeonInfo:GetDungeon(nDungeonId);
	if (tbDungeon ~= nil) then
		tbDungeon.tbApply[strMemberName] = nil;
		
		if (tbDungeon.OnAddMember ~= nil and tbDungeon:OnAddMember(strMemberName) ~= 1) then
			WriteLog(format("[%s] Add [%s] to [%s]'s [%s] dungeon(id:[%0.f]) failed.", GetLocalDate("%Y-%m-%d %H:%M:%S"), strMemberName, 
					tbDungeon.strOwner, tbDungeon.strDungeon, tbDungeon.nDungeonId));
			return 0;
		end
		
		for i = 1, getn(tbDungeon.tbMember) do
			if (tbDungeon.tbMember[i].strName == strMemberName) then
				WriteLog(format("[%s] [%s] already exist at [%s]'s [%s] dungeon(id:[%0.f]).Add failed", GetLocalDate("%Y-%m-%d %H:%M:%S"), strMemberName, 
					tbDungeon.strOwner, tbDungeon.strDungeon, tbDungeon.nDungeonId));
				return 0;
			end
		end
	
		tinsert(tbDungeon.tbMember, {strName = strMemberName, bInDungeon = 0, bInTrans = 0, nTime = 0, tbTask = {}});
		
		local nNewMemberIdx = SearchPlayer(strMemberName);
		
		if (nNewMemberIdx > 0) then
			doFunByPlayer(nNewMemberIdx, PutMessage, format("§¹i hiÖp ®· tham gia cïng víi [%s] ë [%s]", tbDungeon.strOwner, tbDungeon.strDungeon));
		end
		
		WriteLog(format("[%s] Add [%s] to [%s]'s [%s] dungeon(id:[%0.f]) success.", GetLocalDate("%Y-%m-%d %H:%M:%S"), strMemberName, 
					tbDungeon.strOwner, tbDungeon.strDungeon, tbDungeon.nDungeonId));
		return 1;
	end
	
	return 0;
end

function tbDungeonManager:GetMember(nDungeonId, strMemberName)
	local tbMember = nil;
	local tbDungeon = tbDungeonInfo:GetDungeon(nDungeonId);
	if (tbDungeon ~= nil) then
		for i = 1, getn(tbDungeon.tbMember) do
			if (tbDungeon.tbMember[i].strName == strMemberName) then
				tbMember = tbDungeon.tbMember[i];
				break;
			end
		end
	end
	
	return tbMember;
end

function tbDungeonManager:DelMember(nDungeonId, strMemberName)
	local tbDungeon = tbDungeonInfo:GetDungeon(nDungeonId);
	if (tbDungeon ~= nil) then
		if (tbDungeon.OnDelMember ~= nil and tbDungeon:OnDelMember() ~= 1) then
			WriteLog(format("[%s] Delete [%s] from [%s]'s [%s] dungeon(id:[%0.f]) failed.", GetLocalDate("%Y-%m-%d %H:%M:%S"), strMemberName, 
					tbDungeon.strOwner, tbDungeon.strDungeon, tbDungeon.nDungeonId));
			return 0;
		end
		
		for i = 1, getn(tbDungeon.tbMember) do
			if (tbDungeon.tbMember[i].strName == strMemberName) then
				if (tbDungeon.tbMember[i].bInDungeon == 1) then
					-- °ÑÍæ¼Ò´«³ö¸±±¾
					self:LeaveDungeon(tbDungeon.nDungeonId, tbDungeon.tbMember[i].nIndex);
					doFunByPlayer(tbDungeon.tbMember[i].nIndex, Talk, 1,"",format("§¹i hiÖp ®· bÞ ®Èy ra bëi [%s] ë [%s].", tbDungeon.strOwner, tbDungeon.strDungeon));
				end
				tremove(tbDungeon.tbMember, i);
				-- Èç¹û³ÉÔ±Îª0,Òª¹Ø±Õ¸±±¾
				if (getn(tbDungeon.tbMember) == 0) then
					self:CloseDungeon(nDungeonId);
				end
				
				WriteLog(format("[%s] Delete [%s] from [%s]'s [%s] dungeon(id:[%0.f]) success.", GetLocalDate("%Y-%m-%d %H:%M:%S"), strMemberName, 
					tbDungeon.strOwner, tbDungeon.strDungeon, tbDungeon.nDungeonId));
				return 1;
			end
		end
		
		WriteLog(format("[%s] [%s] does not exist at [%s]'s [%s] dungeon(id:[%0.f]).Delete failed", GetLocalDate("%Y-%m-%d %H:%M:%S"), strMemberName, 
					tbDungeon.strOwner, tbDungeon.strDungeon, tbDungeon.nDungeonId));
	end
	
	return 0;
end

function tbDungeonManager:EnterDungeon(nDungeonId, nPlayerIndex)
	local tbDungeon = tbDungeonInfo:GetDungeon(nDungeonId);
	local nOldPlayer = PlayerIndex;

	if (tbDungeon ~= nil) then
		if (nPlayerIndex ~= nil and nPlayerIndex ~= 0) then
			PlayerIndex = nPlayerIndex
		end
		
		local strPlayerName = GetName();
		local bMember = 0;
		
		for i = 1, getn(tbDungeon.tbMember) do
			if (tbDungeon.tbMember[i].strName == strPlayerName) then
				bMember = 1;
				break;
			end
		end
		
		if (bMember == 1) then
			local nMapId,nX,nY = GetWorldPos();
			local tbDungeon = tbDungeonInfo:GetDungeon(nDungeonId);
			if (tbDungeon ~= nil) then
				RemoteExc("\\script\\mission\\dungeon\\datamanager.lua", "tbDDManager:CallFun", {tbDungeon.nMapTemplet, tbDungeon.nDungeonId, tbDungeon.strOwner, "SetEnterPos", {["nMapId"]=nMapId,["nX"]=nX,["nY"]=nY}});
			end
			tbDungeon:OnPlayerJoin();
			WriteLog(format("[%s] [%s] entered [%s]'s [%s] dungeon(id:[%0.f]).", GetLocalDate("%Y-%m-%d %H:%M:%S"), strPlayerName, 
						tbDungeon.strOwner, tbDungeon.strDungeon, tbDungeon.nDungeonId));
		end
		
		if (nPlayerIndex ~= nil and nPlayerIndex ~= 0) then
			PlayerIndex = nOldPlayer;
		end
	end
end

function tbDungeonManager:LeaveDungeonEx()
	self:LeaveDungeon()
end

function tbDungeonManager:LeaveDungeon(nDungeonId, nPlayerIndex)
	local nOldPlayer = PlayerIndex;
	
	if (nPlayerIndex ~= nil and nPlayerIndex ~= 0) then
		PlayerIndex = nPlayerIndex
	end
	
	local tbDungeon = nil;
	local strPlayerName = GetName();
	local tbList = tbDungeonInfo:GetDungeonList();
	
	if (nDungeonId == nil and tbList ~= nil) then
		for i,v in tbList do
			if (i ~= "n" and v ~= nil) then
				for j,u in v.tbMember do
					if (j ~= "n" and u ~= nil and u.strName == strPlayerName and u.bInDungeon == 1) then
						tbDungeon = v;
						break;
					end
				end
			end
		end
	else
		tbDungeon = tbDungeonInfo:GetDungeon(nDungeonId);
	end
	
	local bMember = 0;
	
	if (tbDungeon ~= nil) then
		for i = 1, getn(tbDungeon.tbMember) do
			if (tbDungeon.tbMember[i].strName == strPlayerName) then
				bMember = 1;
				break;
			end
		end
		
		if (bMember == 1) then
			tbDungeon:OnLeave();
			WriteLog(format("[%s] [%s] leaved [%s]'s [%s] dungeon(id:[%0.f]).", GetLocalDate("%Y-%m-%d %H:%M:%S"), strPlayerName, 
						tbDungeon.strOwner, tbDungeon.strDungeon, tbDungeon.nDungeonId));
		end
	else
		WriteLog(format("[%s] [%s] stuck in dungeon.Transport to (11,3143,5065)", GetLocalDate("%Y-%m-%d %H:%M:%S"), strPlayerName));
		NewWorld(11, 3143, 5065);
	end
	
	if (nPlayerIndex ~= nil and nPlayerIndex ~= 0) then
		PlayerIndex = nOldPlayer;
	end
end

function tbDungeonManager:ApplyJoinDungeon(nDungeonId, strPlayerName)
	local tbDungeon = tbDungeonInfo:GetDungeon(nDungeonId);
	local nOwnerIdx = -1;
	if (tbDungeon ~= nil) then
		if (tbDungeon.OnApplyJoin ~= nil and tbDungeon:OnApplyJoin() ~= 1) then
			return 0;
		end
		
		for i = 1, getn(tbDungeon.tbMember) do
			if (tbDungeon.tbMember[i].strName == strPlayerName) then
				WriteLog(format("[%s] [%s] apply to join [%s]'s [%s] dungeon(id:%0.f) failed cause he is already in member list.",
						 GetLocalDate("%Y-%m-%d %H:%M:%S"), strPlayerName, tbDungeon.strOwner, tbDungeon.strDungeon, tbDungeon.nDungeonId));
				return 0;
			end
			if(tbDungeon.tbMember[i].strName == tbDungeon.strOwner and tbDungeon.tbMember[i].bInDungeon == 1) then
				nOwnerIdx = tbDungeon.tbMember[i].nIndex;
			end
		end
		
		if (nOwnerIdx > 0) then
			doFunByPlayer(nOwnerIdx, PutMessage, format("[%s] mêi gia nhËp ë [%s]", strPlayerName, tbDungeon.strDungeon));
		end
		
		tbDungeon.tbApply[strPlayerName] = strPlayerName;
		WriteLog(format("[%s] [%s] apply to join [%s]'s [%s] dungeon(id:%0.f) success.",
						 GetLocalDate("%Y-%m-%d %H:%M:%S"), strPlayerName, tbDungeon.strOwner, tbDungeon.strDungeon, tbDungeon.nDungeonId));
		return 1;
	end
	return 0;
end

function tbDungeonManager:GetMineDungeon(strDungeon, bIsOwner)
	local tbDungeonList = tbDungeonInfo:GetDungeonList(strDungeon);
	local tbDungeon = nil;
	local strPlayerName = GetName();
	
	for i,v in tbDungeonList do
		if (i ~= "n" and v ~= nil) then		
			for j = 1, getn(v.tbMember) do
				if (v.tbMember[j].strName == strPlayerName and (bIsOwner == 0 or v.strOwner == strPlayerName)) then
					tbDungeon = v;
					break;
				end
			end
		end
	end
	
	return tbDungeon;
end

function tbDungeonManager:GetTemplet(strDungeon)
	return tbDungeonManager.tbDungeonTempletList[strDungeon];
end


function tbDungeonManager:DoTempletFun(strDungeon, szFunName)
	local pTemp =  self:GetTemplet(strDungeon);
	local bRet = 0;
	if (pTemp ~= nil and pTemp[szFunName] ~= nil) then
		bRet = pTemp[szFunName](pTemp);
	end
	
	return bRet;
end