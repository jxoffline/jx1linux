Include("\\script\\lib\\player.lua")
Include("\\script\\lib\\common.lua")
Include("\\script\\global\\login_head.lua")
Include("\\script\\trip\\define.lua")

MAXOFFLINETIME_EVERYDAY = 18		-- Ã¿ÈÕ×î´óÀëÏßÊ±¼ä£¨Ð¡Ê±£©

CHOICE_LIST = {}

LIMIT_LIST = {
	MAX_ADVTIME = 6000000,
}

AWARDTYPE_FREE 				= 1
AWARDTYPE_SIHAIXIAOYAO 		= 2
AWARDTYPE_WUZHOULINGKONG	= 3
AWARDTYPE_JIUTIANYUNYOU		= 4

PILL_LIST = {
	[AWARDTYPE_SIHAIXIAOYAO] = {
		Name = "Tø H¶i Tiªu Diªu §¬n",
		Time = 60,	-- ÏûºÄµÄÀëÏßÊ±¼ä£¨·ÖÖÓ£©
		ID = {6, 1, 2378, 1},
		CallBack = "apply_usesihaixiaoyao",
		},
	[AWARDTYPE_WUZHOULINGKONG] = {
		Name = "Ngò Ch©u L¨ng Kh«ng §¬n",
		Time = 60,	-- ÏûºÄµÄÀëÏßÊ±¼ä£¨·ÖÖÓ£©
		ID = {6, 1, 2397, 1},
		CallBack = "apply_usewuzhoulingkong",
		},
	[AWARDTYPE_JIUTIANYUNYOU] = {
		Name = "Cöu Thiªn V©n Du §¬n",
		Time = 60,	-- ÏûºÄµÄÀëÏßÊ±¼ä£¨·ÖÖÓ£©
		ID = {6, 1, 2379, 1},
		CallBack = "apply_usejiutianyunyou",
		}
}
--add exp award for translife 6 - modified by DinhHQ - 20130531
AWARDEXP_LIST = {
	[AWARDTYPE_FREE				] = {15000,	30000,	40000,	40000,	60000,	72000,	86400,	103680,	103680},
	[AWARDTYPE_SIHAIXIAOYAO		] = {37500,	75000,	100000,	100000,	150000,	180000,	216000,	259200,	259200},
	[AWARDTYPE_WUZHOULINGKONG	] = {50000,	100000,	133333,	133333,	200000,	240000,	288000,	345600,	345600},
	[AWARDTYPE_JIUTIANYUNYOU	] = {62500,	125000,	166667,	166667,	250000,	300000,	360000,	432000,	432000},
}

OfflineAward = {}

-- ¼ÆËãÁ½¸öÊ±¼äµã£¨¸ñÊ½Îªtime_t£©Ö®¼äµÄÀëÏßÊ±¼ä£¨·ÖÖÓ£©£¬time1 <= time2
function OfflineAward:CalcOfflineTime(time1, time2)
	local t1 = Time2Tm(time1)
	local t2 = Time2Tm(time2)
	local date1 = Tm2Time(t1[1], t1[2], t1[3])
	local date2 = Tm2Time(t2[1], t2[2], t2[3])
	if (date1 > date2) then
		return 0
	end	
	if (date1 == date2) then
		local diff = floor((time2 - time1) / 60)
		if (diff > MAXOFFLINETIME_EVERYDAY * 60) then
			diff = MAXOFFLINETIME_EVERYDAY * 60
		end
		return diff
	end
	local minutes = floor((date2 - date1) * MAXOFFLINETIME_EVERYDAY / (60 * 24))
	if (t1[4] >= (24 - MAXOFFLINETIME_EVERYDAY)) then
		local reduce = floor(t1[4] * 60 + t1[5] - (24 - MAXOFFLINETIME_EVERYDAY) * 60)
		minutes = minutes - reduce
	end
	if (t2[4] >= MAXOFFLINETIME_EVERYDAY) then
		minutes = minutes + floor(MAXOFFLINETIME_EVERYDAY * 60)
	else
		local add = floor(t2[4] * 60 + t2[5])
		minutes = minutes + add
	end
	return minutes
end

function OfflineAward:CheckCondition(player)
	if (player:GetLevel() >= 50 or player:IsTransLife() == 1) then
		return 1
	else
		return 0
	end
end

function OfflineAward:Time2String(t)
	local tb = Time2Tm(t)
	return format("%d/%d/%d-%d/%d/%d", tb[3], tb[2], tb[1], tb[4], tb[5], tb[6])
end

TIME_START = Tm2Time(2010, 7, 15, 0, 0, 0)

function OfflineAward:GetLastOfflineTime(player)
	local time_offline = player:GetLastOfflineTime()
	local time_exchange = player:GetLastExchangeTime()
	if (time_offline < time_exchange) then
		time_offline = time_exchange
	end
	if (time_offline < TIME_START) then
		time_offline = TIME_START
	end
	return time_offline
end

function OfflineAward:Login(player)
	local time_offline = self:GetLastOfflineTime(player)
	local time_login = player:GetLoginTime()
	if (time_login < time_offline) then
		time_login = time_offline
	end
	if (time_offline == 0) then
		time_offline = time_login
	end
	local time = self:CalcOfflineTime(time_offline, time_login)
	if (time > 0) then
		player:SetOfflineLowTime(time)
		if (player:GetOfflineAdvTime() + time > LIMIT_LIST.MAX_ADVTIME) then
			player:SetOfflineAdvTime(LIMIT_LIST.MAX_ADVTIME)
		else
			player:AddOfflineAdvTime(time)
		end
	else
		player:SetOfflineLowTime(0)
	end
	if (OfflineAward:CheckCondition(player) == 1) then
		dlg_offlineaward(player)
	end
end

-- ¼ÆËãÃâ·Ñ¾­Ñé
function OfflineAward:CalcExp(type, itr, level, tran_count)
	local tb = AWARDEXP_LIST[type]
	if (itr <= 0 or not tb) then
		return 0
	end
	local index = 1
	if (level >= 151) then
		index = tran_count + 3
	elseif (level >= 131) then
		index = 2
	elseif (level >= 50) then
		index = 1
	else
		return 0
	end
	local exp = tb[index] * itr
	return exp
end

function dlg_menu(player)
	if (OfflineAward:CheckCondition(player) == 1) then
		dlg_offlineaward(player)
	else
		player:Say("<color=red>CÊp 50 trë lªn (bao gåm cÊp 50) <color>hoÆc ng­êi ch¬i <color=red>®· chuyÓn sinh<color> míi cã thÓ nhËn th­ëng rêi m¹ng.")
	end
end

function dlg_offlineaward(player)
	do return end
	local time_offline = OfflineAward:GetLastOfflineTime(player)
	local time_login = player:GetLoginTime()
	if (time_login < time_offline) then
		time_login = time_offline
	end
	if (time_offline == 0) then
		time_offline = time_login
	end
	local line1 = format("Rêi m¹ng lÇn tr­íc: <color=red>%s<color><enter>HiÖn t¹i ®¨ng nhËp vµo: <color=red>%s<color>",
					OfflineAward:Time2String(time_offline),
					OfflineAward:Time2String(time_login))

	local itr_offline = floor((time_login - time_offline) / 60)
	local itr_effective_offline = OfflineAward:CalcOfflineTime(time_offline, time_login)
	local line2 = format("Thêi gian rêi m¹ng: <color=red>%d<color> phót, thêi gian rêi m¹ng cã hiÖu lùc: <color=red>%d<color> phót",
						itr_offline,
						itr_effective_offline)

	local level = player:GetLevel()
	local tran_count = player:GetTransLifeCount()
	local exp = OfflineAward:CalcExp(
						AWARDTYPE_FREE,
						itr_effective_offline,
						level,
						tran_count)
	local line3 = format("MiÔn phÝ nhËn ®­îc ®iÓm kinh nghiÖm <color=red>%d<color> (Chó ý: ChuyÓn b¶n ®å sÏ bÞ mÊt)", exp)

	local itr_advtime = player:GetOfflineAdvTime()
	local line4 = format("Ngoµi ra b¹n cßn tÝch lòy <color=red>%d<color> phót, cã thÓ sö dông tiªn ®¬n ®Ó nhËn kinh nghiÖm:", itr_advtime)
	
	local exp_format = "Sö dông %s nhËn ®­îc <color=red>%.0f<color> kinh nghiÖm."
	local line5 = format(exp_format,
						PILL_LIST[AWARDTYPE_SIHAIXIAOYAO].Name,
						OfflineAward:CalcExp(AWARDTYPE_SIHAIXIAOYAO, itr_advtime, level, tran_count))

	local line6 = format(exp_format,
						PILL_LIST[AWARDTYPE_WUZHOULINGKONG].Name,
						OfflineAward:CalcExp(AWARDTYPE_WUZHOULINGKONG, itr_advtime, level, tran_count))

	local line7 = format(exp_format,
						PILL_LIST[AWARDTYPE_JIUTIANYUNYOU].Name,
						OfflineAward:CalcExp(AWARDTYPE_JIUTIANYUNYOU, itr_advtime, level, tran_count))

	local caption = format("%s<enter>%s<enter>%s<enter>%s<enter>%s<enter>%s<enter>%s",
						line1,
						line2,
						line3,
						line4,
						line5,
						line6,
						line7)
	local option = "Sö dông %s/#action_usepill(%d)"
	player:Describe(caption, 5,
		"MiÔn phÝ nhËn phÇn th­ëng kinh nghiÖm/action_takefreeexp",
		format(option, PILL_LIST[AWARDTYPE_SIHAIXIAOYAO].Name, AWARDTYPE_SIHAIXIAOYAO),
		format(option, PILL_LIST[AWARDTYPE_WUZHOULINGKONG].Name, AWARDTYPE_WUZHOULINGKONG),
		format(option, PILL_LIST[AWARDTYPE_JIUTIANYUNYOU].Name, AWARDTYPE_JIUTIANYUNYOU),
		"Tho¸t ra/Cancel")
end

function action_takefreeexp()
	local player = Player:New(PlayerIndex)
	if (OfflineAward:CheckCondition(player) == 0) then
		player:Say("Kh«ng phï hîp víi ®iÖu kiÖn nhËn th­ëng")
		return
	end
	local lowtime = player:GetOfflineLowTime()
	if (lowtime <= 0) then
		player:Say("§· sö dông hÕt thêi gian rêi m¹ng.")
		return
	end
	local exp = OfflineAward:CalcExp(
					AWARDTYPE_FREE,
					lowtime,
					player:GetLevel(),
					player:GetTransLifeCount())
	player:StackExp(exp)
	player:ClearOfflineLowTime()
end

function action_usepill(type)
	local inf = PILL_LIST[type]
	if (not inf) then
		return
	end
	local player = Player:New(PlayerIndex)
	if (OfflineAward:CheckCondition(player) == 0) then
		player:Say("Kh«ng phï hîp víi ®iÖu kiÖn nhËn th­ëng")
		return
	end
	local advtime = player:GetOfflineAdvTime()
	local item_count = player:CalcEquiproomItemCount(
							inf.ID[1],
							inf.ID[2],
							inf.ID[3],
							inf.ID[4])
	local caption = format("Thêi gian rêi m¹ng: <color=red>%d<color> phót<enter>%s: <color=red>%d<color>",
							advtime,
							inf.Name,
							item_count)
	CHOICE_LIST[PlayerIndex] = {type, advtime, item_count}
	player:Say(caption,
		2,
		"§ång ý!/confirm_usepill",
		"Tho¸t ra/Cancel")
end

function confirm_usepill()
	local tb = CHOICE_LIST[PlayerIndex]
	if (not tb) then
		return
	end
	local type = tb[1]
	local advtime = tb[2]
	local item_count = tb[3]
	local inf = PILL_LIST[type]
	if (not inf) then
		return
	end
	if (item_count == 0) then
		Say(format("Hµnh trang cña c¸c h¹ kh«ng cã <color=red>%s<color>.", inf.Name))
		return
	elseif (advtime < inf.Time) then
		Say(format("Sö dông 1 <color=red>%s<color> cÇn <color=red>%d phót<color> thêi gian rêi m¹ng, thêi gian rêi m¹ng cña c¸c h¹ kh«ng ®ñ.",
			inf.Name,
			inf.Time))
		return
	end
	local count = floor(advtime / inf.Time)
	if (count > item_count) then
		count = item_count
	end
	--Giíi h¹n sè lÇn sö dông Cöu thiªn v©n du ®¬n lµ 99 - Modified by DinhHQ - 20111110 
	AskClientForNumber(inf.CallBack, 1, 99, "Sè l­îng sö dông")
end

function apply_usepill(player, type, count)
--Giíi h¹n sè lÇn sö dông Cöu thiªn v©n du ®¬n lµ 99 - Modified by DinhHQ - 20111110 
if count > 99 then
	Talk(1, "", "NhËp sè l­îng tèi ®a lµ 99.")
	return
end
	local inf = PILL_LIST[type]
	if (not inf or count <= 0) then
		return
	end
	local advtime = player:GetOfflineAdvTime()
	local item_count = player:CalcEquiproomItemCount(
							inf.ID[1],
							inf.ID[2],
							inf.ID[3],
							inf.ID[4])
	if (advtime < count * inf.Time or item_count < count) then
		return
	end
	if (player:ConsumeEquiproomItem(count, inf.ID[1], inf.ID[2], inf.ID[3], inf.ID[4]) ~= 1) then
		WriteLog(format(
			"[ERROR OFFLINEAWARD]failed to consume %s: player(%s), count(%d)",
			inf.Name,
			player:GetName(),
			count))
		return
	end
	local use_time = inf.Time * count
	local exp = OfflineAward:CalcExp(type, use_time, player:GetLevel(), player:GetTransLifeCount())
	player:StackExp(exp)
	player:ReduceOfflineAdvTime(use_time)
	WriteLog(format("[OFFLINEAWARD]%s(%s) use %s(%d), get exp(%d)",
		player:GetAccount(),
		player:GetName(),
		inf.Name,
		count,
		exp))
end

function apply_usesihaixiaoyao(count)
	local player = Player:New(PlayerIndex)
	apply_usepill(player, AWARDTYPE_SIHAIXIAOYAO, count)
end

function apply_usewuzhoulingkong(count)
	local player = Player:New(PlayerIndex)
	apply_usepill(player, AWARDTYPE_WUZHOULINGKONG, count)
end

function apply_usejiutianyunyou(count)
	local player = Player:New(PlayerIndex)
	apply_usepill(player, AWARDTYPE_JIUTIANYUNYOU, count)
end

function login(playerindex, exchange)
	local player = Player:New(playerindex)
	if (exchange == 0) then
		OfflineAward:Login(player)
	else
		player:SetOfflineLowTime(0)
	end
	CHOICE_LIST[playerindex] = nil
end

function logout(playerindex)
	CHOICE_LIST[playerindex] = nil
end

if GetTripMode() ~= TRIP_MODE_SERVER then
	AddLoginFileFunction("\\script\\global\\offlineaward.lua", "login")
end
