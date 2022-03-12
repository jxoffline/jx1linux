Include("\\script\\mission\\dungeon\\dungeondata.lua")
Include("\\script\\mission\\dungeon\\datamanager.lua")

if not sltData then
	sltData = tbDungeonData:new({});
end

function sltData:Initialize(nDungeonId, nSaveId)
	self:_Initialize(925, nDungeonId, nSaveId)
end

function sltData:SetShooterCount(nCount)
	return self:SetData("nShooterCount", nCount);
end

function sltData:AddShooterCount(nCount)
	local nTotal = self:GetData("nShooterCount") or 0;
	
	return self:SetData("nShooterCount", nTotal + nCount);
end

function sltData:SetKillCount(nCount)
	return self:SetData("nKillCount", nCount);
end

function sltData:AddkillCount(nCount)
	local nTotal = self:GetData("nKillCount") or 0;
	
	return self:SetData("nKillCount", nTotal + nCount);
end

function sltData:SetMedalCount(nCount)
	return self:SetData("nMedalCount", nCount);
end

function sltData:AddMedalCount(nCount)
	local nTotal = self:GetData("nMedalCount") or 0;
	
	return self:SetData("nMedalCount", nTotal + nCount);
end

function sltData:SetMonsterCount(nCount)
	return self:SetData("nMonsterCount", nCount);
end

function sltData:AddMonsterCount(nCount)
	local nTotal = self:GetData("nMonsterCount") or 0;
	
	return self:SetData("nMonsterCount", nTotal + nCount);
end

function sltData:SetAwardMark(tbMarkArg)
	local tbMark = self:GetData("tbAwardMark") or {};
	tbMark[tbMarkArg[1]] = tbMarkArg[2];
	return self:SetData("tbAwardMark", tbMark);
end
