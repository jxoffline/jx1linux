Include("\\script\\missions\\tongcastle\\tongcastle.lua")
CastlePlayer = {}

local tbCity = {
	[1]   = 978,
	[11]  = 979,
	[162] = 980,
	[37] 	= 981,
	[78] 	= 982,
	[80] 	= 983, 
	[176] = 984,
}


function CastlePlayer:OnLeaveMap()
	SetFightState(0)
	DisabledUseTownP(0)
	DisabledStall(0)
	local szName = GetName()
	local nMapId, _, _ = GetWorldPos()
	TongCastle:DelPlayer2List(szName, nMapId)
end

function CastlePlayer:OnEnterMap()
	SetFightState(1)
	DisabledUseTownP(1)--不能回城符
	SetLogoutRV(1)
	DisabledStall(1)	
	local szName = GetName()
	local nMapId, _, _ = GetWorldPos()
	local szTongName = GetTongName()
	TongCastle:AddPlayer2List(szName, nMapId, szTongName)
end