
IncludeLib("RELAYLADDER")

Include("\\script\\lib\\common.lua")
Include("\\script\\lib\\string.lua")
Include("\\script\\activitysys\\functionlib.lua")


LadderFunLib = {}


function LadderFunLib:GetInfo(nLadderId, szColName1,szColName2,szColName3)
	
	local tbColName = {szColName1,szColName2,szColName3}
	
	
	local szMsg = format("%s%s%s<enter>", strfill_center(tbColName[1],6, " "), strfill_center(tbColName[2], 20, " "), strfill_center(tbColName[3], 20, " "))
	for i = 1, 10 do
		local szName, nValue = Ladder_GetLadderInfo(nLadderId, i);
		if (szName ~= nil and nValue ~= "") then
			local szRank = format("H¹ng %d", i)
			szMsg = szMsg..format("%s%s%s<enter>", strfill_center(szRank,6, " "), strfill_center(szName, 20, " "), strfill_center(nValue, 20, " "))		

		end
	end
	return szMsg
end


function LadderFunLib:CheckPlayerRank(nLadderId, szRank, szFailMsg)
	local szPlayerName = GetName()
	
	for i = 1, 10 do
		local szName, nValue = Ladder_GetLadderInfo(nLadderId, i);
		if (szName ~= nil and nValue ~= "" and szName == szPlayerName) then
			if lib:CheckInList(szRank, i) then
				return 1
			end

		end
	end
	if szFailMsg and szFailMsg ~= "" then
		Talk(1, "", szFailMsg)
	end
	return nil
end

function LadderFunLib:UpdatePlayer(nLadderId, nTaskId)
	local szName = GetName()
	local nValue = GetTask(nTaskId)
	Ladder_NewLadder(nLadderId, szName, nValue, 0);	
end



function LadderFunLib:GiveRankItem(nLadderId, szRank, szBuff, nCount, szLogTitle, nTaskId, nValue)
	if self:CheckPlayerRank(nLadderId, szRank, "") then
		PlayerFunLib:GetItem(szBuff, nCount, szLogTitle)
		SetTask(nTaskId, nValue)
	end
end

function LadderFunLib:GiveRankAward(nLadderId, szRank, nAwardTableId, nCount, szLogTitle, nTaskId, nValue)
	if self:CheckPlayerRank(nLadderId, szRank, "") then
		PlayerFunLib:GetAward(nAwardTableId, nCount, szLogTitle)
		SetTask(nTaskId, nValue)
		
	end
end