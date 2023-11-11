Include("\\script\\lib\\baseclass.lua")
IncludeLib("RELAYLADDER")
IncludeLib("TONG") 
IncludeLib("LEAGUE") 
Include("\\script\\tong\\tong_header.lua")
local _GAMESERVER_ = 1
local _RELAY_ = nil

local nLadderId = 10261


LEAGUETYPE_CITYWAR_SIGN = 508					--挑战令站队类型

LGTSK_QINGTONGDING_COUNT = 1		--挑战令站队记录挑战令个数TaskID



if not citywar_tbLadder then
	citywar_tbLadder = tbBaseClass:new()
end

function citywar_tbLadder:_init(nLadderId)
	self.nLadderId = nLadderId
end

--------------gameserver-------------
if _GAMESERVER_ then
function citywar_tbLadder:AddOneInGameServer(nTongId, szLGName, szTongName, nValue)
	
	local szParam = format("%u,%s,%s,%d", nTongId, szLGName, szTongName, nValue)
	self:DoRelayScript("\\script\\mission\\citywar_global\\ladder.lua", "citywar_tbLadder__AddOne", szParam)
end


function citywar_tbLadder:DoRelayScript(szScriptPath, szFunctionName, szParam)
	LG_ApplyDoScript(1, "", "", szScriptPath, szFunctionName, szParam, "", "")
end




function citywar_tbLadder:GetInfo()
	local szList = {}
	for i = 1, 10 do
		local szName, nValue = Ladder_GetLadderInfo(self.nLadderId, i);
		if (szName ~= nil and szName ~= "") then
			szList[i] = {szName = szName, nValue = nValue}
		end
	end
	return szList
end

end
-----------------------relay--------------

if _RELAY_ then
	
function citywar_tbLadder:AddOneInRelay(nTongId, szLGName, szTongName, nValue)
	
	
	LG_ApplyAppendMemberTask(LEAGUETYPE_CITYWAR_SIGN, szLGName, szTongName, LGTSK_QINGTONGDING_COUNT, nValue, "", "");
	
	local nPoint = LG_GetMemberTask(LEAGUETYPE_CITYWAR_SIGN,szLGName, szTongName, LGTSK_QINGTONGDING_COUNT);
	Ladder_NewLadder(self.nLadderId, szTongName, nPoint, 1);
end



function citywar_tbLadder__AddOne(szParam)
	local tbParam = split(szParam)
	local nTongId = tonumber(tbParam[1])
	local szLGName = tbParam[2]
	local szName = tbParam[3]
	local nValue = tonumber(tbParam[4])
	citywar_tbLadder:AddOneInRelay(nTongId, szLGName, szName, nValue)
end


end


function citywar_tbLadder:Reset()
	Ladder_ClearLadder(self.nLadderId)
end
citywar_tbLadder:_init(nLadderId)