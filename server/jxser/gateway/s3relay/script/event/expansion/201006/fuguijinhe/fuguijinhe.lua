Include("\\script\\lib\\remoteexc.lua")
Include("\\script\\sharedata_key.lua")
Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\lib\\baseclass.lua")
Include("\\script\\lib\\common.lua")

tbBetInfo = {}

tbBetInfo.nTotalBet = 0;
tbBetInfo.tbNormalNum = {};
tbBetInfo.tbSpecNum = {};

function AddBetCount(ParamHandle, ResultHandle)
	tbBetInfo:AddBetCount(1)
	--OutputMsg( format("BET NUMBER COUNT :  %d",tbBetInfo:GetBetCount()));
end

function tbBetInfo:AddBetCount(nCount)
	--OutputMsg(format("tbBetInfo:AddBetCount:%d %s", nCount, type(self.nTotalBet)))
	local nAddCount = nCount or 1;
	self.nTotalBet = self.nTotalBet + nAddCount;
	RemoteExc("\\script\\event\\expansion\\201006\\fuguijinhe\\fuguijinhe.lua", "tbBetInfo:AddBetCount", {nAddCount});
	SaveBetInfo();
	--GlobalExecute(format("dwf \\script\\event\\expansion\\201006\\fuguijinhe\\fuguijinhe.lua tbBetInfo:AddBetCount(%d)",nAddCount));
end

function tbBetInfo:SetTotalBetCount(nCount)
	self.nTotalBet = nCount;
end

function tbBetInfo:GetBetCount()
	return self.nTotalBet;
end

function tbBetInfo:ClearNumInfo()
	self.tbNormalNum = {};
	self.tbSpecNum = {};
end

function tbBetInfo:IsNumExist(nValue)
	local bExsit = 0;
	local bSpec = 0;
	for i=1,getn(self.tbNormalNum) do
		if (self.tbNormalNum[i] == nValue) then
			bExsit = 1;
			break;
		end
	end
	
	if (bExsit == 0) then
		for i=1,getn(self.tbSpecNum) do
			if (self.tbSpecNum[i] == nValue) then
				bExsit = 1;
				bSpec = 1;
				break;
			end
		end
	end
	
	return bExsit, bSpec;
end

function tbBetInfo:GenNumber()
	local nCount = 0;
	while (nCount < 10) do
		local nValue = random(10,99);
		if (self:IsNumExist(nValue) == 0) then
			if (nCount < 9) then
				tinsert(self.tbNormalNum,nValue);
			else
				tinsert(self.tbSpecNum,nValue);
			end
			nCount = nCount + 1;
		end
	end
end

function LoadBetInfo()
	local handle = OB_Create();
	if OB_LoadShareData(handle, SDKEY_EXP_FUGUIJINHE, 0,0) ~= 1 then
		OB_Release(handle);
		return
	end
	local tbInfo = ObjBuffer:PopObject(handle);
	if (tbInfo ~= nil and type(tbInfo) == "table") then
		tbBetInfo.nTotalBet = tbInfo[1];
		tbBetInfo.tbNormalNum = clone(tbInfo[2]);
		tbBetInfo.tbSpecNum = clone(tbInfo[3]);
	end
	
	OB_Release(handle);

	OutputMsg("LOAD 2010 EXPANSION FUGUIJINHE BET NUMBER");
	local szLog = "[2010 expansion fuguijinhe bet number] ";
	szLog = format("%s  BetCount:%d Normal Number:",szLog, tbBetInfo.nTotalBet);
	for i=1,getn(tbBetInfo.tbNormalNum) do
		szLog = format("%s %d",szLog, tbBetInfo.tbNormalNum[i]);
	end
	
	szLog = format("%s Special Number:",szLog);
	for i=1,getn(tbBetInfo.tbSpecNum) do
		szLog = format("%s %d",szLog, tbBetInfo.tbSpecNum[i]);
	end
	OutputMsg(szLog);
end

function SendBetCount()
	RemoteExc("\\script\\event\\expansion\\201006\\fuguijinhe\\fuguijinhe.lua", "tbBetInfo:ClearNumInfo");
	RemoteExc("\\script\\event\\expansion\\201006\\fuguijinhe\\fuguijinhe.lua", "tbBetInfo:SetTotalBetCount", {tbBetInfo.nTotalBet});
end

function SendBetNumber()
	for i=1,getn(tbBetInfo.tbNormalNum) do
		RemoteExc("\\script\\event\\expansion\\201006\\fuguijinhe\\fuguijinhe.lua", "tbBetInfo:AddNormalNum", {tbBetInfo.tbNormalNum[i]});
	end
	
	for i=1,getn(tbBetInfo.tbSpecNum) do
		RemoteExc("\\script\\event\\expansion\\201006\\fuguijinhe\\fuguijinhe.lua", "tbBetInfo:AddSpecNum", {tbBetInfo.tbSpecNum[i]});
	end
end

function SaveBetInfo()
	ClearRecordOnShareDB(SDKEY_EXP_FUGUIJINHE);
	local tbInfo = 
	{
		[1] = tbBetInfo.nTotalBet,
		[2] = tbBetInfo.tbNormalNum,
		[3] = tbBetInfo.tbSpecNum,
	}
	
	local handle = OB_Create();
	ObjBuffer:PushObject(handle, tbInfo);
	OB_SaveShareData(handle, SDKEY_EXP_FUGUIJINHE, 0, 0);
	OB_Release(handle);
	
	--OutputMsg("SAVE 2010 EXPANSION FUGUIJINHE BET NUMBER");
end

LoadBetInfo();