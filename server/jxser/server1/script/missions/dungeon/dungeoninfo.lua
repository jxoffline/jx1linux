
if not tbDungeonInfo then
	tbDungeonInfo = {}
	tbDungeonInfo.tbDungeonInfo = {}
	tbDungeonInfo.tbDungeonNameMap = {}
	tbDungeonInfo.tbDungeonIDMap = {}
end

function tbDungeonInfo:AddDungeon(tbDungeon)
	if (tbDungeon.strDungeon == nil or tbDungeon.strDungeon == "" or 
		tbDungeon.nMapTemplet == nil or tbDungeon.nDungeonId == nil or 
		self.tbDungeonIDMap[tbDungeon.nDungeonId] ~= nil ) then
		return 0;
	end
	
	tinsert(self.tbDungeonInfo, tbDungeon);
	
	self.tbDungeonIDMap[tbDungeon.nDungeonId] = getn(self.tbDungeonInfo);
	
	if (self.tbDungeonNameMap[tbDungeon.strDungeon] == nil) then
		self.tbDungeonNameMap[tbDungeon.strDungeon] = {};
	end
	
	tinsert(self.tbDungeonNameMap[tbDungeon.strDungeon], tbDungeon);
	
	return 1;
end

function tbDungeonInfo:DelDungeon(nDungeonId)
	if (self.tbDungeonIDMap[nDungeonId] ~= nil) then
		local tbDungeon = self.tbDungeonInfo[self.tbDungeonIDMap[nDungeonId]];
		if (tbDungeon ~= nil and self.tbDungeonNameMap[tbDungeon.strDungeon] ~= nil) then
			for i = 1, getn(self.tbDungeonNameMap[tbDungeon.strDungeon]) do
				if (self.tbDungeonNameMap[tbDungeon.strDungeon][i] ~= nil and 
					self.tbDungeonNameMap[tbDungeon.strDungeon][i].nDungeonId == nDungeonId) then
					tremove(self.tbDungeonNameMap[tbDungeon.strDungeon],i);
					break;
				end
			end
		end
		
		self.tbDungeonInfo[self.tbDungeonIDMap[nDungeonId]] = nil;
		
		self.tbDungeonIDMap[nDungeonId] = nil;
		
		return 1;
	end
	
	return 0;
end

function tbDungeonInfo:GetDungeonList(strDungeon)
	if (strDungeon ~= nil) then
		if (self.tbDungeonNameMap[strDungeon] == nil) then
			return {};
		end
		
		return self.tbDungeonNameMap[strDungeon];
	end
	
	return self.tbDungeonInfo;
end

function tbDungeonInfo:GetDungeon(nDungeonId)
	if (self.tbDungeonIDMap[nDungeonId] == nil) then
		return nil;
	end
	
	return self.tbDungeonInfo[self.tbDungeonIDMap[nDungeonId]];
end

function tbDungeonInfo:GetDungeonMember(nDungeonId)
	if (self.tbDungeonIDMap[nDungeonId] == nil) then
		return nil;
	end
	
	return self.tbDungeonInfo[self.tbDungeonIDMap[nDungeonId]].tbMember;
end