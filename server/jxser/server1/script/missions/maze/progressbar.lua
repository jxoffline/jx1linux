Include("\\script\\lib\\player.lua")
Include("\\script\\global\\playerlist.lua")

ProgressBarList = {
	m_AllEvent = GetProgressBarMaskEvent(),
	m_BarList = {}
}

function ProgressBarList:Open(strTitle, pPlayer, nTimeout, pCallBack, param)
	local nId = pPlayer:OpenProgressBar(strTitle, nTimeout * 18, self.m_AllEvent, 0, "OnTimeout", "OnBreak", "\\script\\missions\\maze\\progressbar.lua")
	if (nId > 0) then
		local tb = {}
		tb.pCallBack = pCallBack
		tb.Param = param
		tb.Pack = curpack()
		self.m_BarList[nId] = tb
	end
	return nId
end

function ProgressBarList:Close(nId)
	local tb = self.m_BarList[nId]
	if (tb) then
		DelTimer(nId)
		self.m_BarList[nId] = nil
	end
end

function ProgressBarList:OnTimeout(nId)
	local tb = self.m_BarList[nId]
	if (tb) then
		local player = PlayerList:GetPlayer(PlayerIndex)
		local pack = usepack(tb.Pack)
		tb.pCallBack:OnProgressbarTimeout(nId, tb.Param, player)
		usepack(pack)
		self.m_BarList[nId] = nil
	end
end
 
function ProgressBarList:OnBreak(nId)
	local tb = self.m_BarList[nId]
	if (tb) then
		local player = PlayerList:GetPlayer(PlayerIndex)
		local pack = usepack(tb.Pack)
		tb.pCallBack:OnProgressbarBreak(nId, tb.Param, player)
		usepack(pack)
		self.m_BarList[nId] = nil
	end
end

function OnTimeout(nId)
	ProgressBarList:OnTimeout(nId)
end

function OnBreak(nId)
	ProgressBarList:OnBreak(nId)
end
