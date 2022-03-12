Include("\\script\\misc\\rank\\rank.lua")
Include("\\script\\sharedata_key.lua")

tbRankClass:LoadRank(SDKEY_RANK);

function DataToString(tbRankData)
	local szDataString = "";
	if (tbRankData ~= nil and type(tbRankData) == "table" and 
	tbRankData.tbData ~= nil and type(tbRankData.tbData) == "table") then
		if (tbRankData.tbData.nSect ~= nil) then
			szDataString = format("%s%d", szDataString, tbRankData.tbData.nSect);
		end
		if (tbRankData.tbData.nGender ~= nil) then
			szDataString = format("\t%s%d", szDataString, tbRankData.tbData.nGender);
		end
	end
	return szDataString;
end

function FilterRank(tbRankList)
	if (tbRankList ~= nil and type(tbRankList) == "table") then
		local nNow = GetSysCurrentTime();
		local nDeltaLimit = 604800; -- 7天
		for i=getn(tbRankList),1,-1 do
			if (tbRankList[i] == nil or tbRankList[i].nValue == 0 or 
				tbRankList[i].tbData == nil or tbRankList[i].tbData.nLastCheck == nil or
				(nNow - tbRankList[i].tbData.nLastCheck) > nDeltaLimit) then
					
					--删除
					for j=i+1,getn(tbRankList) do
						tbRankList[j-1] = tbRankList[j];
					end
					tremove(tbRankList, getn(tbRankList));
			end
		end
	end
	
	return tbRankList;
end

tbRankClass.tbDBRank[SDKEY_RANK].pToStringFun = DataToString;
tbRankClass.tbDBRank[SDKEY_RANK].pFilterFun = FilterRank;

function AddRoleValueToRank(nPlayerIdx)
	local oldIdx = PlayerIdx;
	if (nPlayerIdx ~= nil and nPlayerIdx > 0) then
		PlayerIdx = nPlayerIdx;
	end
	
	local tbRankData = clone(tbRankDataClass);
	tbRankData.szTitle = GetName();
	_,tbRankData.nValue = GetRoleEquipValue();
	tbRankData.tbData.nSect = GetLastFactionNumber();
	tbRankData.tbData.nGender = GetSex();
	tbRankData.tbData.nLastCheck = GetLocalTime();
	
	local nRank;
	local tbCurData;
	nRank, tbCurData = tbRankClass:FindRankData(SDKEY_RANK, tbRankClass.emDynamicRank, tbRankData.szTitle);
	
	if (nRank <= 0 or tbCurData == nil or 
			tbCurData.nValue ~= tbRankData.nValue or 
			tbCurData.tbData == nil or  type(tbRankData) ~= "table" or
			tbCurData.tbData.nLastCheck ~= tbRankData.tbData.nLastCheck) then
			
			tbRankClass:AddRankData(SDKEY_RANK, tbRankData);
	end
	
	PlayerIdx = oldIdx;
end

function PrintRank()
	local szDBKey = SDKEY_RANK;
	OutputMsg(format("Stable %s rank", SDKEY_RANK));
	for i=1,getn(tbRankClass.tbDBRank[szDBKey][tbRankClass.emStableRank]) do
		-- 排名自定义数据如果可以取得
		local tbRankData = tbRankClass.tbDBRank[szDBKey][tbRankClass.emStableRank][i];
		local szDataString = "";
		if (tbRankClass.tbDBRank[szDBKey].pToStringFun ~= nil and type(tbRankClass.tbDBRank[szDBKey].pToStringFun) == "function") then
			szDataString = tbRankClass.tbDBRank[szDBKey].pToStringFun(tbRankData);
		end
		
		szDataString = format("%0.f\t\t%0.f\t\t%s\t\t%s\n", i, tbRankData.nValue, tbRankData.szTitle, szDataString);
		OutputMsg(szDataString);
	end
	OutputMsg(format("Dynamic %s rank", SDKEY_RANK));
	for i=1,getn(tbRankClass.tbDBRank[szDBKey][tbRankClass.emDynamicRank]) do
		-- 排名自定义数据如果可以取得
		local tbRankData = tbRankClass.tbDBRank[szDBKey][tbRankClass.emDynamicRank][i];
		local szDataString = "";
		if (tbRankClass.tbDBRank[szDBKey].pToStringFun ~= nil and type(tbRankClass.tbDBRank[szDBKey].pToStringFun) == "function") then
			szDataString = tbRankClass.tbDBRank[szDBKey].pToStringFun(tbRankData);
		end
		
		szDataString = format("%0.f\t\t%0.f\t\t%s\t\t%s\n", i, tbRankData.nValue, tbRankData.szTitle, szDataString);
		OutputMsg(szDataString);
	end
end