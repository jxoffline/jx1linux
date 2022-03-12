-- 17.	≥ˆœ÷2∏ˆ“ª—˘µƒNPC£¨“ª∏ˆΩ–œ‡…˙◊”£¨“ª∏ˆΩ–œ‡øÀ◊”£¨µÿ…œ≥ˆœ÷5∏ˆ≤ªÕ¨ŒÂ––µƒµÒœÒ£¨
-- œ»∫Õœ‡…˙◊”∂‘ª∞£¨À˚ª·Àµ“ª∏ˆŒÂ––∫Õ“ª∏ˆ∂””—µƒ√˚◊÷£¨»ª∫Û“™’‚∏ˆ∂””—»•ø™∆Ù”Î’‚∏ˆŒÂ––œ‡…˙µƒµÒœÒ£¨ø™¥Ì’‚∏ˆ∂””—æÕª·À¿µÙ°£
-- »ª∫ÛµΩœ‡øÀ◊”∂‘ª∞£¨ø™∆Ùœ‡øÀµƒŒÂ––°£µÒœÒø™∆ÙÕÍ∫Û≤ªœ˚ ß£¨2∏ˆNPC“™¬÷¡˜∂‘ª∞£¨◊‹π≤’˝»∑ø™∆Ù20¥Œπ˝πÿ°£
Include("\\script\\missions\\maze\\task.lua")
Include("\\script\\global\\dlgnpc_list.lua")
Include("\\script\\global\\fightnpc_list.lua")
Include("\\script\\missions\\maze\\progressbar.lua")
Include("\\script\\lib\\player.lua")
Include("\\script\\global\\playerlist.lua")

pTask = Task:New(17)
pTask.m_MaxFinishCount = 20

tbTASK17_JOSS = {	-- TODO
	{1647,	"ßi™u T≠Óng ( Kim)"},
	{1648,	"ßi™u T≠Óng (MÈc)"},
	{1649,	"ßi™u T≠Óng ( thÒy )"},
	{1650,	"ßi™u T≠Óng ( H·a )"},
	{1651,	"ßi™u T≠Óng ( ThÊ)"},
}

tbTASK17_SERIES = {0, 1, 2, 3, 4}

tbTASK17_SERIESNAME = {
	[0] = "Kim",
	[1] = "MÈc",
	[2] = "ThÒy ",
	[3] = "H·a",
	[4] = "ThÊ ",
}

function pTask:OnStart()
	local mapid = self:GetMapId()
	local pos = self:GetPosition()
	self.m_AccrueIndex = DlgNpcManager:AddNpc("T≠¨ng Sinh Tˆ", 1645, mapid, pos.t17_accrue.x, pos.t17_accrue.y, self, 1)
	self.m_ConquerIndex = DlgNpcManager:AddNpc("T≠¨ng Khæc Tˆ", 1646, mapid, pos.t17_conquer.x, pos.t17_conquer.y, self, 2)
	self.m_Statuary = {}
	self.m_TalkIndex = 1
	self.m_AppointPlayer = nil
	self.m_AppointSeries = 0
	self.m_BarId = 0
	self.m_FinishCount = 0
	for i = 1, 5 do
		local nNpcIndex = DlgNpcManager:AddNpc(tbTASK17_JOSS[i][2], tbTASK17_JOSS[i][1], mapid, pos.t12_joss[i].x, pos.t12_joss[i].y, self, i + 2)
		tinsert(self.m_Statuary, nNpcIndex)
	end
end

function pTask:OnDestroy()
	if (self.m_AccrueIndex > 0) then
		DlgNpcManager:DelNpc(self.m_AccrueIndex)
		self.m_AccrueIndex = 0
	end
	if (self.m_ConquerIndex > 0) then
		DlgNpcManager:DelNpc(self.m_ConquerIndex)
		self.m_ConquerIndex = 0
	end
	if (self.m_Statuary) then
		for i = 1, getn(self.m_Statuary) do
			DlgNpcManager:DelNpc(self.m_Statuary[i])
		end
		self.m_Statuary = nil
	end
	if (self.m_BarId > 0) then
		ProgressBarList:Close(self.m_BarId)
		self.m_BarId = 0
	end
end

function pTask:Say(player, nIndex)
	if (nIndex == 1) then
		return self:Say_Accrue(player, nIndex)
	elseif (nIndex == 2) then
		return self:Say_ConquerIndex(player, nIndex)
	else
		return self:Say_Statuary(player, nIndex)
	end
end

function pTask:Say_Accrue(player, nIndex)
	if (self.m_BarId > 0) then
		player:Say("Xin h∑y mÎ ßi™u T≠Óng ra rÂi lπi g∆p ta.")
		return
	elseif (self.m_TalkIndex == 2) then
		player:Say("TrÀn nµy Æ’n l≠Ót T≠¨ng Khæc Tˆ xu t Æ“, ta nghÿ ng¨i mÈt l∏t.")
		return
	end
	if (not self.m_AppointPlayer) then
		self.m_AppointPlayer = self:RandomPlayerName() or player:GetName()
		self.m_QuestionSeries = random(0, 4)
		self.m_AppointSeries = GetAccrueSeries(self.m_QuestionSeries)
	end
	local msg = format("%s, Xin h∑y mÎ %s ßi™u T≠Óng NgÚ Hµnh", self.m_AppointPlayer, tbTASK17_SERIESNAME[self.m_QuestionSeries])
	player:Say(msg)
	self:BroadCast(msg)
end

function pTask:Say_ConquerIndex(player, nIndex)
	if (self.m_BarId > 0) then
		player:Say("Xin h∑y mÎ ßi™u T≠Óng ra rÂi lπi g∆p ta.")
		return
	elseif (self.m_TalkIndex == 1) then
		player:Say("TrÀn nµy Æ’n l≠Ót T≠¨ng Khæc Tˆ xu t Æ“, ta nghÿ ng¨i mÈt l∏t.")
		return
	end
	if (not self.m_AppointPlayer) then
		self.m_AppointPlayer = self:RandomPlayerName() or player:GetName()
		self.m_QuestionSeries = random(0, 4)
		self.m_AppointSeries = GetConquerSeries(self.m_QuestionSeries)
	end
	local msg = format("%s, Xin h∑y mÎ %s t t c∂ ßi™u T≠Óng NgÚ Hµnh", self.m_AppointPlayer, tbTASK17_SERIESNAME[self.m_QuestionSeries])
	player:Say(msg)
	self:BroadCast(msg)
end

function pTask:Say_Statuary(player, nIndex)
	if (self.m_BarId > 0) then
		return
	end
	self.m_BarId = ProgressBarList:Open("ßang mÎ", player, 3, self, nIndex - 2)
end

function pTask:OnProgressbarTimeout(nId, nIndex, player)
	self.m_BarId = 0
	if (tbTASK17_SERIES[nIndex] == self.m_AppointSeries and self.m_AppointPlayer == player:GetName()) then
		self:BroadCast("MÎ thµnh c´ng.")
		self.m_FinishCount = self.m_FinishCount + 1
		if (self.m_FinishCount >= self.m_MaxFinishCount) then
			self:Proceed()
		elseif (self.m_TalkIndex == 1) then
			self.m_TalkIndex = 2
		else
			self.m_TalkIndex = 1
		end
	else
		self:BroadCast("MÎ th t bπi.")
		self:KickPlayer(self.m_AppointPlayer)
		self.m_AppointSeries = 0
		self.m_TalkIndex = 1
	end
	self.m_AppointPlayer = nil
end

function pTask:OnProgressbarBreak(nId, nIndex)
	self:BroadCast("MÎ th t bπi.")
	self.m_BarId = 0
end
