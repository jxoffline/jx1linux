-------------------------------------
-- description 	: ÐÂÄêÃ·Ê÷
-- author		: wangbin
-- date			: 2010.1.10
-------------------------------------
Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\global\\judgeoffline_limit.lua")
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\lib\\pay.lua")

SCRIPT_TREE = "\\script\\event\\chunjie_jieri\\201001\\tree.lua"
TASKGROUP_WINTERSWEET	= 3
TASKINDEX_DATE			= 1
TASKINDEX_COUNT			= 2
LOG_HEAD				= "EVENT201001"

-- ÔÊÐíÖÖÃ·Ê÷µÄµØÍ¼
tbTreeMap = {
	20,		-- ½­½ò´å
	53,		-- °ÍÁêÏØ
	174,	-- ÁúÈª´å
	121,	-- ÁúÃÅÕò
	153,	-- Ê¯¹ÄÕò
	101,	-- µ¾Ïã´å
	99,		-- ÓÀÀÖÕò
	100,	-- ÖìÏÉÕò
	1,		-- ·ïÏè
	11,		-- ³É¶¼
	37,		-- ãê¾©
	78,		-- ÏåÑô
	80,		-- ÑïÖÝ
	162,	-- ´óÀí
	176,	-- ÁÙ°²
}

-- Ã·»¨ÖÖÀà±í
tbTreeName = {
	[1] = "Mai Tr­êng Thä",
	[2] = "Mai An Khang",
	[3] = "Mai ThÞnh V­îng",
	[4] = "Mai H¹nh Phóc",
	[5] = "Mai Tµi Phó"
}
-- Ã·Ê÷ÖÖÀà¸ÅÂÊ
tbTreeRate = {
	[1] = 8,
	[2] = 15,
	[3] = 34,
	[4] = 35,
	[5] = 8,
}

-- ½±Àø±í
tbAwardList = {
	-- 		25»ý·Ö		15->24»ý·Ö	1->14»ý·Ö	0»ý·Ö
	[1] = {30000000,	25000000,	20000000,	0},		-- ³¤ÊÙÃ·
	[2]	= {20000000,	15000000,	10000000,	0},		-- °²¿µÃ·
	[3] = {10000000,	8000000,	6000000,	0},		-- ÍúÊ¢Ã·
	[4] = {8000000,		6000000,	4000000,	0},		-- ÐÒ¸£Ã·
	[5] = {6000000,		4000000,	3000000,	0},		-- ²Æ¸»Ã·
}


tbTreeList = {}
tbSeed = {}
tbTree = {}
tbTeam = {}
tbMaintainState = {}
tbAwardState = {}
tbShowState = {}

function clone(obj)
	local otype = type(obj)
	if (otype == "number") then
		return obj
	elseif (otype == "string") then
		local ret = obj
		return ret
	elseif (otype == "nil") then
		return obj
	elseif (otype == "table") then
		local ret = {}
		for key, val in obj do
			ret[clone(key)] = clone(val)
		end
		return ret
	else
		return obj
	end
end

function dialog_tree()
	local npc = GetLastDialogNpc()
	local tree = tbTreeList[npc]
	if (tree) then
		tree:Dialog()
	end
end

function select_tree()
	local npc = GetLastDlgNpc()
	if (npc > 0) then
		local tree = tbTreeList[npc]
		if (tree) then
			tree:Select()
		end
	end
end

function ontime(npcidx)
	local tree = tbTreeList[npcidx]
	if (tree) then
		return tree:Upgrade()
	else
		return 0, 0
	end
end

function tbSeed:InMapList(MapList)
	local MapId, _, _ = GetWorldPos()
	for i = 1, getn(MapList) do
		if (MapId == MapList[i]) then
			return 1
		end
	end
	return 0
end

-- DEBUG
function getplantcount()
	return tbSeed:GetPlantCount()
end

function setplantcount(Count)
	tbSeed:SetPlantCount(Count)
end

function addplantcount()
	tbSeed:AddPlantCount()
end

function tbSeed:GetPlantCount()
	local curr_date = tonumber(GetLocalDate("%y%m%d"))
	local task_date = TaskManager:GetTask(TASKGROUP_WINTERSWEET, TASKINDEX_DATE)
	if (task_date == 0 or task_date ~= curr_date) then
		return 0
	end
	local count = TaskManager:GetTask(TASKGROUP_WINTERSWEET, TASKINDEX_COUNT)
	return count
end

function tbSeed:AddPlantCount()
	local curr_date = tonumber(GetLocalDate("%y%m%d"))
	local task_date = TaskManager:GetTask(TASKGROUP_WINTERSWEET, TASKINDEX_DATE)
	if (curr_date ~= task_date) then
		TaskManager:SetTask(TASKGROUP_WINTERSWEET, TASKINDEX_DATE, curr_date)
		TaskManager:SetTask(TASKGROUP_WINTERSWEET, TASKINDEX_COUNT, 1)
	else
		local count = TaskManager:GetTask(TASKGROUP_WINTERSWEET, TASKINDEX_COUNT)
		TaskManager:SetTask(TASKGROUP_WINTERSWEET, TASKINDEX_COUNT, count + 1)
	end
end

-- DEBUG
function tbSeed:SetPlantCount(Count)
	local curr_date = tonumber(GetLocalDate("%y%m%d"))
	TaskManager:SetTask(TASKGROUP_WINTERSWEET, TASKINDEX_DATE, curr_date)
	TaskManager:SetTask(TASKGROUP_WINTERSWEET, TASKINDEX_COUNT, Count)
end

function tbSeed:Check()
	-- ¼ì²éµØÍ¼ºÍÕ½¶·×´Ì¬
	if (tbSeed:InMapList(tbTreeMap) == 0 or GetFightState() == 1) then
		Say("ChØ ®­îc trång c©y mai t¹i n¬i phi chiÕn ®Êu thµnh thÞ, t©n thñ th«n!")
		return 0
	end
	-- ¼ì²é¶ÓÎéÈËÊý
	local member_count = GetTeamSize()
	if (member_count ~= 2) then
		Say("Tæ ®éi hai ng­êi míi cã thÓ trång ®­îc c©y mai!")
		return 0
	end
	-- ¼ì²éÊÇ·ñÔÚ³µ·ò¡¢ÉÌµê¸½½ü
	if (offlineCheckPermitRegion() == 0) then
		Say("Kh«ng ®­îc trång c©y mai t¹i nh÷ng n¬i gÇn xa phu hoÆc xung quanh nh÷ng n¬i ®«ng ng­êi")
		return 0
	end
	-- ¼ì²éÊÇ·ñ³äÖµÓÃ»§¡¢¼¶±ðºÍÖÖÊ÷´ÎÊýÏÞÖÆ
	local player = PlayerIndex
	local self_name = GetName()
	local sex = {}
	for i = 1, member_count do
		PlayerIndex = GetTeamMember(i)
		local mate_name = GetName()
		if (IsCharged() == 0) then
			PlayerIndex = player
			Say(format("%s kh«ng ph¶i lµ tµi kho¶n ®· n¹p thÎ!", mate_name))
			return 0
		elseif (GetLevel() < 50) then
			PlayerIndex = player
			Say(format("Nh©n vËt %s ch­a ®ñ cÊp 50!", mate_name))
			return 0
		-- ¼ì²éÖÖÊ÷´ÎÊý
		elseif (tbSeed:GetPlantCount() >= 4) then
			PlayerIndex = player
			Say(format("H«m nay %s ®· tham gia ®ñ 4 lÇn råi!", mate_name))
			return 0
		end
		sex[i] = GetSex()
	end
	PlayerIndex = player
	-- ¼ì²éÐÔ±ð
	if (GetSex() == 1) then
		Say("Nh©n vËt nam trong tæ ®«i míi cã thÓ trång c©y!")
		return 0
	elseif (sex[1] == sex[2]) then
		Say("Yªu cÇu ph¶i 1 nh©n vËt nam 1 nh©n vËt n÷ tæ ®éi míi cã thÓ trång c©y mai!")
		return 0
	end
	return 1
end

function tbSeed:RandomKind()
	local num = floor(random(1, 100))
	local sum = 0
	local count = getn(tbTreeRate)
	for i = 1, count do
		sum = floor(sum + tbTreeRate[i])
		if (num <= sum) then
			return i
		end
	end
	return count
end

function tbSeed:Grow(Kind)
	local membercount = GetTeamSize()
	if (membercount == 0) then
		Say("Ph¶i tæ ®éi míi cã thÓ trång c©y!")
		return 0
	end
	local player = PlayerIndex
	local self_name = GetName()
	local members = {self_name}
	for i = 1, membercount do
		PlayerIndex = GetTeamMember(i)
		local mate_name = GetName()
		if (mate_name ~= self_name) then
			tinsert(members, mate_name)
		end
	end
	PlayerIndex = player
	local tree = tbTree:New(Kind, members)
	if (not tree) then
		return 0
	end
	-- ÀÛ¼ÓÖÖÊ÷´ÎÊý
	player = PlayerIndex
	for i = 1, membercount do
		PlayerIndex = GetTeamMember(i)
		tbSeed:AddPlantCount()
	end
	PlayerIndex = player
	-- Èç¹ûÊÇ"°²¿µÃ·"»ò"³¤ÊÙÃ·"£¬¾ÍÈ«²¿ÆµµÀÍ¨¸æ
	if (Kind == 1 or Kind == 2) then
		local handle = OB_Create()
		local msg = format("Chóc mõng %s ®· trong thµnh c«ng %s!", GetName(), tbTreeName[Kind])
		ObjBuffer:PushObject(handle, msg)
		RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
		OB_Release(handle)
	end
	
	return 1
end

function tbTeam:New(Members)
	local tb = clone(tbTeam)
	tb.MemberList = Members
	tb.Score = 0
	return tb
end

function tbTeam:FindMember(Name)
	for i = 1, getn(self.MemberList) do
		if (self.MemberList[i] == Name) then
			return 1
		end
	end
	return 0
end

function tbTeam:BroadCast(Msg)
	local player = PlayerIndex
	for i = 1, getn(self.MemberList) do
		local member = SearchPlayer(self.MemberList[i])
		if (member > 0) then
			PlayerIndex = member
			Msg2Player(Msg)
		end
	end
	PlayerIndex = player
end

function tbTree:New(Kind, Members)
	local tb = clone(tbTree)
	tb.Team = tbTeam:New(Members)
	local pos = {}
	pos[1] = SubWorld
	_, pos[2], pos[3] = GetWorldPos()
	pos[2] = pos[2] * 32
	pos[3] = pos[3] * 32
	tb.Pos = pos
	tb.Kind = Kind
	tb.Name = format("%s[%s]", tbTreeName[Kind], GetName())
	tb.Npc = AddNpc(tbMaintainInfo[1].Npc, 1, pos[1], pos[2], pos[3], 1, tb.Name)
	if (tb.Npc > 0) then
		SetNpcScript(tb.Npc, SCRIPT_TREE)		
	else
		return nil
	end

	local state = tbMaintainState:New(tb)
	state:NotifyTeam(tb.Team)
	tb.State = state

	tbTreeList[tb.Npc] = tb
	-- ¼ÓÈë¶¨Ê±Æ÷
	AddTimer(state.Timeout * 18, "ontime", tb.Npc)
	return tb
end

function tbTree:Dialog()
	local name = GetName()
	if (self.Team:FindMember(name) == 0) then
		Say("§©y kh«ng ph¶i lµ c©y mai cña c¸c h¹.")
	else
		self.State:Dialog()
	end
end

function tbTree:Select()
	local name = GetName()
	if (self.Team:FindMember(name) == 1) then
		self.State:Process(self, self.Team, name)
	end
end

function tbTree:Upgrade()
	local oldnpc = self.Npc
	local state = self.State:NextState(self, self.Team)
	if (not state) then
		DelNpc(self.Npc)
		tbTreeList[self.Npc] = nil
		return 0, 0
	else
		state:NotifyTeam(self.Team)
		self.State = state
		local newnpc = self.Npc
		if (oldnpc ~= newnpc) then
			tbTreeList[oldnpc] = nil
			tbTreeList[newnpc] = self
		end
		return state.Timeout * 18, self.Npc
	end
end

tbMaintainInfo = {
	[1] = {
		Dlg = "Bãn ph©n cho c©y mai",
		Msg = "H·y tiÕn hµnh bãn ph©n cho c©y mai",
		Err = "§¹i hiÖp ®· bãn ph©n cho c©y råi",
		Npc = 1529,
		},
	[2] = {
		Dlg = "T­íi n­íc cho c©y mai",
		Msg = "H·y tiÕn hµnh t­íi n­íc cho c©y mai",
		Err = "§¹i hiÖp ®· t­íi n­íc cho c©y råi.",
		Npc = 1530,
		},
	[3] = {
		Dlg = "DiÖt cá d¹i cho c©y",
		Msg = "H·y tiÕn hµnh diÖt cá d¹i cho c©y",
		Err = "§¹i hiÖp ®· diÖt cá cho c©y råi",
		Npc = 1531,
		},
	[4] = {
		Dlg = "B¾t s©u cho c©y",
		Msg = "H·y tiÕn hµnh b¾t s©u cho c©y",
		Err = "§¹i hiÖp ®· b¾t s©u cho c©y råi",
		Npc = 1532,
		},
	[5] = {
		Dlg = "TrÈy l¸ cho c©y",
		Msg = "H·y tiÕn hµnh trÈy l¸ cho c©y",
		Err = "§¹i hiÖp ®· trÈy l¸ råi",
		Npc = 1533,
		}
}

function tbMaintainState:New(Tree)
	local tb = clone(tbMaintainState)
	tb.Turn = 1
	tb.Step = 1
	tb.OpFlag = {}
	tb.Time = tbMaintainState:Now()
	tb.Timeout = 60
	print(format("[%s]Tree[%d] begin to maintain",
		GetLocalDate("%Y-%m-%d %H:%M:%S"),
		Tree.Npc))
	return tb
end

function tbMaintainState:Dialog()
	Say("§©y lµ 1 c©y mai thËt ®Ñp",
		2,
		format("%s/select_tree", tbMaintainInfo[self.Step].Dlg),
		"Ta chØ ®Õn ch¬i/Cancel")
end

function tbMaintainState:NotifyTeam(Team)
	local msg = tbMaintainInfo[self.Step].Msg
	Team:BroadCast(msg)
end

function tbMaintainState:Now()
	-- ·µ»Øµ±Ç°Ê±¼ä£¨ÃëÊý£©
	return GetLocalTime()
end

function tbMaintainState:CaculateScore(Seconds)
	if (Seconds >= 46) then
		return 2
	elseif (Seconds >= 36) then
		return 4
	elseif (Seconds >= 26) then
		return 5
	elseif (Seconds >= 16) then
		return 3
	else
		return 1
	end
end

function tbMaintainState:Process(Tree, Team, Name)
	if (Team.MemberList[self.Turn] ~= Name) then
		Say("VÉn ch­a ®Õn l­ît, xin ®îi mét lóc n÷a")
		return
	elseif (self.OpFlag[Name] == 1) then
		Say(tbMaintainInfo[self.Step].Err)
		return
	end
	self.OpFlag[Name] = 1
	local current = tbMaintainState:Now()
	-- LOG
	WriteLog(format("[%s %s]%s maintain Tree[%d]",
		LOG_HEAD,
		GetLocalDate("%Y-%m-%d %H:%M:%S"),
		Name,
		Tree.Npc))
	-- ¸ø¶ÓÎé¼Ó·Ö
	local add = tbMaintainState:CaculateScore(current - self.Time)
	Team.Score = Team.Score + add
	local msg = format("Tæ ®éi cã %d ®iÓm, hiÖn t¹i tæng ®iÓm lµ %d!", add, Team.Score)
	Team:BroadCast(msg)
	-- LOG
	WriteLog(format("[%s %s]Tree[%d] add score(%d), total(%d)",
		LOG_HEAD,
		GetLocalDate("%Y-%m-%d %H:%M:%S"),
		Tree.Npc,
		add,
		Team.Score))
end

function tbMaintainState:NextState(Tree, Team)
	if (self.Step >= 5) then
		return tbAwardState:New()
	else
		self.OpFlag = {}
		self.Time = tbMaintainState:Now()
		self.Step = self.Step + 1
		local count = getn(Team.MemberList)
		self.Turn = mod(self.Turn, count) + 1
		-- ´´½¨ÐÂµÄNPC
		DelNpc(Tree.Npc)
		local npc = AddNpc(tbMaintainInfo[self.Step].Npc, 1, Tree.Pos[1], Tree.Pos[2], Tree.Pos[3], 1, Tree.Name)
		if (npc > 0) then
			-- LOG
			WriteLog(format("[%s %s]Tree[%d] upgrade to Tree[%d]",
				LOG_HEAD,
				GetLocalDate("%Y-%m-%d %H:%M:%S"),
				Tree.Npc,
				npc))
			SetNpcScript(npc, SCRIPT_TREE)
			Tree.Npc = npc
		end
		return self
	end
end

function tbAwardState:New()
	local tb = clone(tbAwardState)
	tb.AwardFlag = {}
	tb.Timeout = 300
	return tb
end

function tbAwardState:Dialog()
	Say("§©y lµ 1 c©y mai thËt ®Ñp",
		2,
		"Ta muèn nhËn th­ëng/select_tree",
		"Ta chØ ®Õn ch¬i/Cancel")
end

function tbAwardState:Process(Tree, Team, Name)
	if (self.AwardFlag[Name] == 1) then
		Say("§¹i hiÖp ®· nhËn th­ëng råi")
		return
	end
	local exp = tbAwardState:CalculateExp(Team.Score, Tree.Kind)
	if (exp > 0) then
		AddOwnExp(exp)
		Team:BroadCast(format("Thµnh viªn tæ ®éi %s ®· nhËn ®­îc phÇn th­ëng kinh nghiÖm lµ %d!", Name, exp))
	else
		Say("Thµnh thËt ®¸ng tiÕc, ®¹i hiÖp kh«ng cã phÇn th­ëng nµo. Xin h·y nç lùc lÇn tíi!")
	end
	self.AwardFlag[Name] = 1
end

function tbAwardState:CalculateExp(score, kind)
	if (kind < 1) then
		kind = 1
	elseif (kind > 5) then
		kind = 5
	end
	local index = 4
	if (score >= 25) then
		index = 1
	elseif (score >= 15) then
		index = 2
	elseif (score >= 1) then
		index = 3
	end
	return tbAwardList[kind][index]
end

function tbAwardState:NotifyTeam(Team)
	Team:BroadCast("Chóc mõng ®¹i hiÖp vµ n÷ hiÖp, 2 vÞ ®· cã 1 C©y mai thËt ®Ñp ®Ó ®ãn TÕt")
end

function tbAwardState:NextState(Tree, Team)
	return tbShowState:New()
end

function tbShowState:New()
	local tb = clone(tbShowState)
	tb.Timeout = 3600
	return tb
end

function tbShowState:Dialog()
	Say("§©y lµ 1 c©y mai thËt ®Ñp")
end

function tbShowState:Process(Tree, Team, Name)
	-- Do nothing
end

function tbShowState:NotifyTeam(Team)
	Team:BroadCast("Thêi gian nhËn th­ëng kÕt thóc")
end

function tbShowState:NextState(Tree, Team)
	return nil
end

TaskManager:AddUseGroup(TASKGROUP_WINTERSWEET)
