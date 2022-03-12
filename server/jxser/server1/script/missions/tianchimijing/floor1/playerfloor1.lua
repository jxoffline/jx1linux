Include("\\script\\missions\\tianchimijing\\floor_templet\\game.lua")

PlayerFloor1 = {}

function PlayerFloor1:OnLeaveMap()
	SetAForbitSkill(210, 0)
	SetDeathScript("")
	DisabledUseTownP(0)
	self:DestroyItem()
	DisabledStall(0)	--摆摊
	SetFightState(0)
end

function PlayerFloor1:OnEnterMap()
	SetDeathScript("\\script\\missions\\tianchimijing\\floor1\\playerdeath.lua")
	SetAForbitSkill(210, 1) --禁止使用轻功
	DisabledUseTownP(1)--不能回城符
	SetLogoutRV(1);
	DisabledStall(1)	--摆摊
	SetFightState(1)
end

function PlayerFloor1:OnDeath()
end

function PlayerFloor1:DestroyItem()
		-- CalcItemCount( roomtype, nItemGenre, nItemDetailType, nItemParticular, nItemLevel, nSeries, nQuality )
	local tbDestroyItem = 
	{
		{tbProp = {6, 1, 2592}},
		{tbProp = {6, 1, 2593}},
		{tbProp = {6, 1, 2594}},
	}
	for key, tbTmp in tbDestroyItem do
		local nCount = CalcItemCount(-1, tbTmp.tbProp[1], tbTmp.tbProp[2], tbTmp.tbProp[3], -1)
		ConsumeItem(-1, nCount, tbTmp.tbProp[1], tbTmp.tbProp[2], tbTmp.tbProp[3], -1)
	end
end