-- ¾«Á¦ÏµÍ³ wangbin 2010-4-7
Include("\\script\\lib\\common.lua")
Include("\\script\\lib\\player.lua")
Include("\\script\\global\\playerlist.lua")

MAXCOUNT_EVERYDAY				= 8						-- Ã¿ÌìĞŞÁ¶ÁéÂ¶µÄ´ÎÊıÏŞÖÆ
MIN_LEVEL						= 90
TIMEOUT_REFINING				= 30					-- Á¶ÖÆÒ»¸ö»ìÔªÁéÂ¶ĞèÒªµÄÊ±¼ä£¨·ÖÖÓ£©
TOTALENERGY_LIMIT_PERMONTH		= 80000					-- Ã¿¸öÔÂ×î¶àÖ»ÄÜÔö¼Ó80000µÄ¾«Á¦
POTION_ENERGY					= 100					-- Ê¹ÓÃ»ìÔªÁéÂ¶¿É»ñµÃµÄ¾«Á¦Öµ
ITEM_YUGUAN						= {6, 1, 2311, 1, 0, 0}	-- Óñ¹Ş
ITEM_HUNYUANLINGLU 				= {6, 1, 2312, 1, 0, 0}	-- »ìÔªÁéÂ¶
TASK_HUNYUANLINGLU_STARTDATE	= 2673					-- µ±ÈÕÒÑĞŞÁ¶´ÎÊı * 1000000 + »ìÔªÁéÂ¶¿ªÊ¼ĞŞÁ¶ÈÕÆÚ£¨YYMMDD£©
TASK_HUNYUANLINGLU_REFINING		= 2674					-- »ìÔªÁéÂ¶ĞŞÁ¶Íê³ÉÊıÁ¿ * 100000 + ÊÇ·ñÕıÔÚĞŞÁ¶ * 10000 + »ìÔªÁéÂ¶ÀÛ¼ÆĞŞÁ¶Ê±¼ä£¨·ÖÖÓ£©
TASK_HUNYUANLINGLU_USEDATE		= 2675					-- ÉÏÒ»´ÎÊ¹ÓÃ»ìÔªÁéÂ¶µÄÈÕÆÚ£¨YYYYMMDD£©
TASK_HUNYUANLINGLU_TOTALENERGY	= 2676					-- µ±Ç°Ê¹ÓÃ»ìÔªÁéÂ¶Ôö¼ÓÁË¶àÉÙ¾«Á¦
TASK_REFININGCOUNT				= 2793					-- ´ıĞŞÁ¶µÄ»ìÔªÁéÂ¶ÊıÄ¿

HunyuanPotion = {}

function HunyuanPotion:New(player)
	local tb = clone(HunyuanPotion)
	tb.m_Player = player
	return tb
end

function HunyuanPotion:EncodeDateTask(count, date)
	local task = count * 1000000 + date
	self.m_Player:SetTask(TASK_HUNYUANLINGLU_STARTDATE, task)
end

function HunyuanPotion:DecodeDateTask()
	local task = self.m_Player:GetTask(TASK_HUNYUANLINGLU_STARTDATE)
	local count = floor(task / 1000000)
	local time = mod(task, 1000000)
	return count, time
end

function HunyuanPotion:EncodeRefiningTask(count, flag, time)
	local task = count * 100000 + flag * 10000 + time
	self.m_Player:SetTask(TASK_HUNYUANLINGLU_REFINING, task)
end

function HunyuanPotion:DecodeRefiningTask()
	local task = self.m_Player:GetTask(TASK_HUNYUANLINGLU_REFINING)
	local count = floor(task / 100000)
	local left = mod(task, 100000)
	local flag = floor(left / 10000)
	local time = mod(left, 10000)
	return count, flag, time
end

-- ²éÑ¯ÊÇ·ñÕıÔÚĞŞÁ¶
function HunyuanPotion:GetRefiningFlag()
	local _, flag, _ = self:DecodeRefiningTask()
	return flag
end

-- ÉèÖÃÊÇ·ñÕıÔÚĞŞÁ¶
function HunyuanPotion:SetRefiningFlag(flag)
	local count, _, time = self:DecodeRefiningTask()
	self:EncodeRefiningTask(count, flag, time)
end

-- ²éÑ¯½ñÈÕÒÑĞŞÁ¶´ÎÊı
function HunyuanPotion:GetCurrentDateRefineCount(curr_date)
	if (not curr_date) then
		curr_date = tonumber(GetLocalDate("%y%m%d"))
	end
	local count, date = self:DecodeDateTask()
	if (curr_date ~= date) then
		return 0
	else
		return count
	end
end

-- Çå³ı½ñÈÕÒÑĞŞÁ¶´ÎÊı
function HunyuanPotion:ClearCurrentDateRefineCount()
	local _, date = self:DecodeDateTask()
	self:EncodeDateTask(0, date)
end

-- Ôö¼Ó½ñÈÕÒÑĞŞÁ¶´ÎÊı
function HunyuanPotion:AddCurrentDateRefineCount(curr_date)
	if (not curr_date) then
		curr_date = tonumber(GetLocalDate("%y%m%d"))
	end
	local count, date = self:DecodeDateTask()
	if (curr_date ~= date) then
		date = curr_date
		count = 1
	else
		count = count + 1
	end
	self:EncodeDateTask(count, date)
end

-- »ñÈ¡¿ªÊ¼ĞŞÁ¶ÈÕÆÚ
function HunyuanPotion:GetRefineDate()
	local count, date = self:DecodeDateTask()
	return date
end

-- ÉèÖÃ¿ªÊ¼ĞŞÁ¶ÈÕÆÚ
function HunyuanPotion:SetRefineDate(date)
	local count, _ = self:DecodeDateTask()
	self:EncodeDateTask(count, date)
end

-- »ñÈ¡ÒÑ¾­ĞŞÁ¶Íê³ÉµÄÁéÂ¶ÊıÁ¿
function HunyuanPotion:GetFinishedCount()
	local count, flag, time = self:DecodeRefiningTask()
	return count
end

-- Ôö¼ÓÒÑ¾­ĞŞÁ¶Íê³ÉµÄÁéÂ¶ÊıÁ¿
function HunyuanPotion:AddFinishedCount()
	local count, flag, time = self:DecodeRefiningTask()
	self:EncodeRefiningTask(count + 1, flag, time)
end

-- Çå³ıÒÑ¾­ĞŞÁ¶Íê³ÉµÄÁéÂ¶ÊıÁ¿
function HunyuanPotion:ClearFinishedCount()
	local count, flag, time = self:DecodeRefiningTask()
	self:EncodeRefiningTask(0, flag, time)
end

-- ¼õÉÙÒÑ¾­ĞŞÁ¶Íê³ÉµÄÁéÂ¶ÊıÁ¿
function HunyuanPotion:ReduceFinishedCount(count)
	local count_now, flag, time = self:DecodeRefiningTask()
	if (count_now <= count) then
		count_now = 0
	else
		count_now = count_now - count
	end
	self:EncodeRefiningTask(count_now, flag, time)
end

-- ²éÑ¯ĞŞÁ¶Ê±¼ä£¨·ÖÖÓ£©
function HunyuanPotion:GetRefiningTime()
	local _, _, time = self:DecodeRefiningTask()
	return time
end

-- Ôö¼ÓĞŞÁ¶Ê±¼ä£¨·ÖÖÓ£©
function HunyuanPotion:AddRefiningTime(minutes)
	local count, flag, time = self:DecodeRefiningTask()
	time = time + minutes
	self:EncodeRefiningTask(count, flag, time)
	local msg = format("Hçn nguyªn linh lé cña ®¹i hiÖp ®· luyÖn ®­îc %d phót.", time)
	self.m_Player:Msg2Player(msg)
end

-- Çå³ıĞŞÁ¶Ê±¼ä£¨·ÖÖÓ£©
function HunyuanPotion:ClearRefiningTime()
	local count, flag, time = self:DecodeRefiningTask()
	if (time > 0) then
		self:EncodeRefiningTask(count, flag, 0)
	end
end

-- ÏûºÄÓñ¹Ş
function HunyuanPotion:ConsumeYuguan(count)
	if (count <= 0 or
		self.m_Player:CalcEquiproomItemCount(
			ITEM_YUGUAN[1],
			ITEM_YUGUAN[2],
			ITEM_YUGUAN[3],
			ITEM_YUGUAN[4]) < count) then
		return 0
	end
	local result = self.m_Player:ConsumeEquiproomItem(
		count,
		ITEM_YUGUAN[1],
		ITEM_YUGUAN[2],
		ITEM_YUGUAN[3],
		ITEM_YUGUAN[4])
	if (result == 1) then
		return 1
	else
		return 0
	end
end

-- Ê¹ÓÃ»ìÔªÁéÂ¶
-- Ôö¼Ó¾«Á¦µÄ²ÎÊı	by wangjingjun
function HunyuanPotion:Use(nEnergy)
	-- ÈônEnergyÎª¿Õ£¬ÔòÓÃÄ¬ÈÏµÄ»ìÔªÁéÂ¶µÄÖµ£¬·ñÔòÎªĞÂÔö¼ÓµÄÖµ
	nEnergy = nEnergy or POTION_ENERGY	 
	local player = self.m_Player
	local old_energy = player:GetEnergy()
	local nToday = GetLocalDate("%Y%m%d")
	local nLastDate = player:GetTask(TASK_HUNYUANLINGLU_USEDATE)
	local nCurAddEnergy = player:GetTask(TASK_HUNYUANLINGLU_TOTALENERGY)
	local nCurMonth = floor(nToday/100)
	local nLastMonth = floor(nLastDate/100)
	
	if (nCurMonth ~= nLastMonth) then
		nLastDate = nToday;
		nCurAddEnergy = 0;
	end
	
	if (old_energy + nEnergy > 2000000000) then
		player:Say("§iÓm tinh lùc ®¹t ®Õn møc cao nhÊt, kh«ng thÓ tiÕp tôc sö dông hçn nguyªn linh lé.")
		return 0
	elseif (nCurAddEnergy + nEnergy > TOTALENERGY_LIMIT_PERMONTH) then
		player:Say(format("Mçi nh©n vËt mçi th¸ng nhiÒu nhÊt chØ ®­îc %d tinh lùc", TOTALENERGY_LIMIT_PERMONTH))
		return 0
	elseif (self.m_Player:AddEnergy(nEnergy) ~= 1) then
		player:Say("T¨ng ®iÓm tinh lùc thÊt b¹i.")
		return 0
	else
		nCurAddEnergy = nCurAddEnergy + nEnergy
		player:SetTask(TASK_HUNYUANLINGLU_USEDATE, nLastDate)
		player:SetTask(TASK_HUNYUANLINGLU_TOTALENERGY, nCurAddEnergy)
		
		local account = player:GetAccount()
		local name = player:GetName()
		local new_energy = player:GetEnergy()
		WriteLog(format("%s(%s) use hunyuanlinglu to add enery(%d=>%d) cur month energy (%d)",
			player:GetAccount(),
			player:GetName(),
			old_energy,
			self.m_Player:GetEnergy(),
			nCurAddEnergy))
		player:Msg2Player(format("T¨ng %d ®iÓm tinh lùc. Th¸ng nµy ®· nhËn ®­îc %d tinh lùc.", nEnergy, nCurAddEnergy))
		return 1
	end
end

JingliList = {m_List = {}}

function JingliList:Add(index, item)
	self.m_List[index] = item
end

function JingliList:Del(index)
	self.m_List[index] = nil
end

function JingliList:GetCount()
	local count = 0
	for key, value in self.m_List do
		if (value) then
			count = count + 1
		end
	end
	return count
end

function JingliList:Find(index)
	return self.m_List[index]
end

function JingliList:OnTime(player, id)
	local jingli = self:Find(player)
	if (not jingli) then
		return 0
	else
		local result = jingli:OnTime()
		if (result == 0) then
			jingli:Destroy()
			return 0
		else
			return result, player
		end
	end
end

Jingli = {}

function Jingli:New(player, potion)
	local tb = clone(Jingli)
	tb.m_Timeout = 18 * 60
	tb.m_Player = player
	if (not potion) then
		tb.m_Potion = HunyuanPotion:New(player)
		tb.m_Potion:AddCurrentDateRefineCount(nil)
	else
		tb.m_Potion = potion
	end
	tb.m_TimerId = AddTimer(18 * 60, "JingliList:OnTime", player.m_PlayerIndex)
	JingliList:Add(player.m_PlayerIndex, tb)
	tb.m_Potion:SetRefiningFlag(1)
	tb.m_OwnerName = player:GetName()
	
	player:Msg2Player("B¾t ®Çu tu luyÖn hçn nguyªn linh lé")
	WriteLog(format("%s(%s) begin hunyunlnglu refining",
		player:GetAccount(),
		player:GetName()))
	return tb
end

function Jingli:Destroy()
	if (self.m_TimerId > 0) then
		DelTimer(self.m_TimerId)
		self.m_TimerId = 0
		JingliList:Del(self.m_Player.m_PlayerIndex)
		self.m_Player = nil
		self.m_OwnerName = ""
	end
end

function Jingli:GetTime()
	return self.m_Potion:GetRefiningTime()
end

function Jingli:ClearRefining()
	self.m_Potion:ClearRefiningTime()
	self.m_Potion:SetRefiningFlag(0)
end

function Jingli:OnTime()
	local player = self.m_Player
	local potion = self.m_Potion
	local name = player:GetName()
	if (self.m_OwnerName ~= name) then
		WriteLog(format("[ERROR JINGLI]owner chanage: %s => %s", self.m_OwnerName, name))
		return 0
	end
	potion:AddRefiningTime(1)
	if (potion:GetRefiningTime() < TIMEOUT_REFINING) then
		return self.m_Timeout
	end
	self:Success()
	potion:ClearRefiningTime()
	local count = player:GetTask(TASK_REFININGCOUNT)
	if (count > 0) then
		-- ¼ÌĞøÁ¶ÖÆÏÂÒ»¸ö»ìÔªÁéÂ¶
		player:SetTask(TASK_REFININGCOUNT, count - 1)
		potion:AddCurrentDateRefineCount(nil)
		return self.m_Timeout
	else
		-- ½áÊøÁ¶ÖÆ
		potion:SetRefiningFlag(0)
		player:SetTask(TASK_REFININGCOUNT, 0)
		return 0
	end
end

function Jingli:Success()
	local account = self.m_Player:GetAccount()
	local name = self.m_Player:GetName()
	local item = self.m_Player:AddItemIntoEquipmentBox(
		ITEM_HUNYUANLINGLU[1],
		ITEM_HUNYUANLINGLU[2],
		ITEM_HUNYUANLINGLU[3],
		ITEM_HUNYUANLINGLU[4],
		ITEM_HUNYUANLINGLU[5],
		ITEM_HUNYUANLINGLU[6])
	if (item > 0) then
		WriteLog(format("%s(%s) refine hunyuanlinglu ok", account, name))
		self.m_Player:Msg2Player("§¹i hiÖp ®· chÕ thµnh c«ng 1 hçn nguyªn linh lé")

		Jiluhunyuan(1)
	else
		self.m_Potion:AddFinishedCount()
		WriteLog(format("%s(%s) add stored hunyuanlinglu(%d)",
			account,
			name,
			self.m_Potion:GetFinishedCount()))
		self.m_Player:Msg2Player("§¹i hiÖp ®· chÕ t¹o thµnh c«ng 1 hçn nguyªn linh lé, xin h·y ®Õn <color=red>®µo hoa Èn sü<color> hoÆc <color=red>thÊt ®¹i thµnh thŞ d­îc ®iÕm <color> ®Ó nhËn.")
	end
end

-- NPC¶Ô»°Èë¿Ú
function dlg_entrance(playerindex)
	local player = PlayerList:GetPlayer(playerindex)
	-- player:Say("´Ë¹¦ÄÜÔİÎ´¿ª·Å¡£")
	JingliDlg:Main(player)
end

-- Á¶ÖÆ»ìÔªÁéÂ¶
function dlg_refine()
	local player = PlayerList:GetPlayer(PlayerIndex)
	return JingliDlg:Refine(player)
end

-- ÁìÈ¡»ìÔªÁéÂ¶
function dlg_get()
	local player = PlayerList:GetPlayer(PlayerIndex)
	JingliDlg:Draw(player)
end

-- ÉèÖÃĞŞÁ¶ÊıÁ¿
function dlg_inputcount()
	local player = PlayerList:GetPlayer(PlayerIndex)
	local potion = HunyuanPotion:New(player)
	local count = JingliDlg:Check(player, potion, 0)
	if (count > 0) then
		player:AskClientForNumber(
			"callback_inputcount",
			1,
			count,
			"Ng­¬i muèn chÕ luyÖn bao nhiªu c¸i?")
	end
end

function callback_inputcount(count)
	if (count > 0) then
		local player = PlayerList:GetPlayer(PlayerIndex)
		local potion = HunyuanPotion:New(player)
		JingliDlg:Refine(player, potion, count)
	end
end

JingliDlg = {}

function JingliDlg:Check(player, potion, count_input)
	if (player:GetLevel() < MIN_LEVEL) then
		local fmt = "ChÕ luyÖn hçn nguyªn linh lé cÇn ®¹t ®Õn mét tr×nh ®é vâ c«ng nhÊt ®Şnh, ®¹i hiÖp %s h·y luyÖn ®Õn cÊp <color=red>%d<color> råi míi ®Õn ®©y nhĞ"
		local msg = nil
		if (player:GetSex() == 1) then
			msg = format(fmt, "N÷ hiÖp", MIN_LEVEL)
		else
			msg = format(fmt, "ThiÕu hiÖp", MIN_LEVEL)
		end
		player:Say(msg)
		return 0
	elseif (player:IsCharged() == 0) then
		player:Say("ChØ cã nh©n vËt ®· nép thÎ míi cã thÓ chÕ luyÖn 'hçn nguyªn linh lé'")
		return 0
	elseif (potion:GetFinishedCount() > 0) then
		player:Say("Xin h·y nhËn lÊy hçn nguyªn linh lé ®· chÕ luyÖn hoµn tÊt.")
		return 0
	end
	local count_day = potion:GetCurrentDateRefineCount(nil)	-- µ±ÌìÒÑĞŞÁ¶µÄ´ÎÊı
	local count_cur = player:GetTask(TASK_REFININGCOUNT)	-- Á¬ĞøĞŞÁ¶µÄ´ÎÊı
	if (count_day >= MAXCOUNT_EVERYDAY) then
		player:Say(
			format("H«m nay c¸c h¹ ®· chÕ luyÖn qua <color=red>%d<color> lÇn råi, xin h·y ®îi ngµy mai quay l¹i.",
			MAXCOUNT_EVERYDAY))
		return 0
	end
	local count_ok = MAXCOUNT_EVERYDAY - count_day - count_cur
	if (count_ok <= 0) then
		player:Say("Sè lÇn tu luyÖn ®· ®ñ, xin h·y ®îi ngµy mai ®Ó chÕ luyÖn hçn nguyªn linh lé")
		return 0
	elseif (count_ok < count_input) then
		player:Say(format("H«m nay nhiÒu nhÊt chØ ®­îc luyÖn thªm %d hçn nguyªn linh lé, xin h·y nhËp sè l­îng cÇn chÕ luyÖn.", count_ok))
		return 0
	else
		return count_ok
	end
end

function JingliDlg:Main(player)
	player:Say(
		"V¹n vËt trªn thÕ gian ®Òu chøa linh khİ thiªn ®Şa, nÕu nh­ ng­¬i cã 'ngäc qu¸n' th× cã thÓ tiÕn hµnh thu thËp linh khİ ®­îc, sau khi thu thÊp 30 phót linh khİ cã thÓ chÕ luyÖn thµnh 'hçn nguyªn linh lé'! Sau khi sö dông linh lé nµy cã thÓ gia t¨ng tinh khİ néi lùc!? ",
		3,
		"B¾t ®Çu luyÖn hçn nguyªn linh lé/dlg_inputcount",
		"NhËn hçn nguyªn linh lé ®· göi./dlg_get",
		"KÕt thóc ®èi tho¹i/Cancel")
end

function JingliDlg:Refine(player, potion, count)
	if (count <= 0 or self:Check(player, potion, count) == 0) then
		return 0
	elseif (potion:ConsumeYuguan(count) ~= 1) then
		player:Say(format(
			"Kh«ng bét ®è gét nªn hå, ng­¬i vÉn ch­a cã <color=red>%d<color> ngäc qu¸n th× l·o phu còng ®µnh bã tay<enter><color=yellow><Ngäc qu¸n còng ®­îc b¸n ë Kú Tr©n C¸c ®ã, xin h·y bÊm vµo « trßn trßn ë bªn gãc d­íi ph¶i mµn h×nh><color>",
			count))
		return 0
	end
	if (potion:GetRefiningFlag() == 0) then	
		Jingli:New(player)
		player:AddTask(TASK_REFININGCOUNT, count - 1)
	else
		player:AddTask(TASK_REFININGCOUNT, count)
	end
	WriteLog(format("%s(%s) start hunyuanlinglu refining, count(%d)",
		player:GetAccount(),
		player:GetName(),
		count))
	player:Say(format("Ngäc qu¸n ë t¹i ®©y cã d¸n bïa chó, ng­¬i h·y mau ®i thu thËp, sau <color=red>%d phót<color> cã thÓ hoµn thµnh!", TIMEOUT_REFINING))
	return 1
end

function JingliDlg:Draw(player)
	local potion = HunyuanPotion:New(player)
	local count = potion:GetFinishedCount()
	if (count <= 0) then
		player:Say("Ng­¬i vÉn ch­a göi cho ta hçn nguyªn linh lé.")
		return
	end
	local item_count = 0
	for i = 1, count do
		local idx = player:AddItemIntoEquipmentBox(
						ITEM_HUNYUANLINGLU[1],
						ITEM_HUNYUANLINGLU[2],
						ITEM_HUNYUANLINGLU[3],
						ITEM_HUNYUANLINGLU[4],
						ITEM_HUNYUANLINGLU[5],
						ITEM_HUNYUANLINGLU[6])
		if (idx <= 0) then
			break
		else
			item_count = item_count + 1
		end
	end
	if (item_count == 0) then
		player:Say("Xin h·y s¾p xÕp l¹i hµnh trang.")
		return
	end
	potion:ReduceFinishedCount(item_count)
	WriteLog(format("%s(%s) receive stored hunyuanlinglu, count(%d)",
		player:GetAccount(),
		player:GetName(),
		item_count))
	Jiluhunyuan(item_count)
	if (item_count < count) then
		player:Say(format("§©y lµ hçn nguyªn linh lé <color=red>%d<color> mµ nhµ ng­¬i ®· göi ta, h·y chuÈn bŞ hµnh trang ®Ó nhËn <color=red>%d<color> hçn nguyªn linh lé",
			item_count,
			count - item_count))
	else
		player:Say(format("§©y lµ <color=red>%d<color> hçn nguyªn linh lé mµ ng­¬i ®· göi, xin h·y nhËn lÊy.", item_count))
	end
end

-- ½øÈë»òÕßÀë¿ªÓÎÏ·ÊÀ½ç
function WorldEntranceLogin(nPlayerIndex, bExchangeIn)
	WorldEntrance(nPlayerIndex, 1)
end

function WorldEntranceLogout(nPlayerIndex)
	WorldEntrance(nPlayerIndex, 0)
end

function WorldEntrance(playerindex, in)
	if (in == 1) then
		local player = PlayerList:GetPlayer(playerindex)
		local potion = HunyuanPotion:New(player)
		Enter(player, potion)
	else
		local obj = JingliList:Find(playerindex)
		if (obj) then
			obj:Destroy()
		end
	end
end

function Enter(player, potion)
	if (potion:GetRefiningFlag() == 1) then
		Jingli:New(player, potion)
	end
end


function Jiluhunyuan(nCount)
	if nCount <= 0 then
		return
	end
	AddStatData("linluchanchu_lianzhilinlu", nCount)	--Êı¾İÂñµãµÚÒ»ÆÚ
end