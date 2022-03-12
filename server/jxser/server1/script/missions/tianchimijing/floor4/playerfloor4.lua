PlayerFloor4 = {}

function PlayerFloor4:OnLeaveMap()
	SetFightState(0) --非战斗状态
	DisabledUseTownP(0) --可以使用回城符
	SetDeathScript("")
end

function PlayerFloor4:OnEnterMap()
	SetLogoutRV(1)
	SetFightState(0) --非战斗状态
	DisabledUseTownP(1) --不能使用回城符
	SetDeathScript("\\script\\missions\\tianchimijing\\floor4\\playerdeath.lua")		
end